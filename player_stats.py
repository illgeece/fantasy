import nflreadpy as nfl
import polars as pl


def get_player_stats(player_names: list[str]) -> pl.DataFrame:
    """
    Retrieve current season statistics for specified NFL players.
    
    Args:
        player_names: List of player display names
        
    Returns:
        Polars DataFrame with filtered player statistics
    """
    current_season = nfl.get_current_season()
    all_stats = nfl.load_player_stats(seasons=[current_season])
    return all_stats.filter(pl.col("player_display_name").is_in(player_names))


def get_player_stats_multi_season(player_names: list[str], seasons: list[int]) -> pl.DataFrame:
    """Extended function for multiple seasons."""
    all_stats = nfl.load_player_stats(seasons=seasons)
    return all_stats.filter(pl.col("player_display_name").is_in(player_names))


def export_stats(df: pl.DataFrame, filepath: str = "player_stats.csv") -> None:
    """Export DataFrame to CSV for Julia visualization."""
    df.write_csv(filepath)

