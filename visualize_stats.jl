using DataFrames
using CSV
using StatsPlots
using Statistics


function load_player_stats(filepath::String)::DataFrame
    CSV.read(filepath, DataFrame)
end


function visualize_player_stats(df::DataFrame)
    key_stats = [:passing_yards, :rushing_yards, :receiving_yards, 
                 :passing_tds, :rushing_tds, :receiving_tds, :receptions]
    
    available_stats = filter(s -> s in names(df), key_stats)
    player_col = :player_display_name
    
    aggregated = combine(groupby(df, player_col), 
                        [s => sum => s for s in available_stats]...)
    
    stats_long = stack(aggregated, Not(player_col))
    
    @df stats_long groupedbar(
        :player_display_name,
        :value,
        group = :variable,
        xlabel = "Player",
        ylabel = "Season Total",
        title = "Player Statistics Overview",
        legend = :topright,
        bar_width = 0.7,
        size = (1000, 600)
    )
end


function display_summary_table(df::DataFrame)
    summary_stats = describe(df, :mean, :std, :min, :max)
    println("\n", summary_stats)
    return summary_stats
end


function visualize_compact(filepath::String)
    df = load_player_stats(filepath)
    display_summary_table(df)
    visualize_player_stats(df)
end

