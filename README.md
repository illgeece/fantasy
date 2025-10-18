# Fantasy Helper

Fetch NFL player statistics and visualize them efficiently across Python and Julia.

## Setup

### Python
```bash
pip install -r requirements.txt
```

### Julia
```bash
julia --project=. -e 'using Pkg; Pkg.instantiate()'
```

## Usage

### Fetch Stats (Python)
```python
from player_stats import get_player_stats, export_stats

players = ["Patrick Mahomes", "Christian McCaffrey"]
stats = get_player_stats(players)
export_stats(stats)
```

### Visualize (Julia)
```julia
include("visualize_stats.jl")
visualize_compact("player_stats.csv")
```

### Complete Workflow
```python
from workflow_example import fetch_and_visualize
fetch_and_visualize(["Patrick Mahomes", "Tyreek Hill"])
```

## Design

- **Minimal complexity**: Core functions are 3-5 lines
- **Expandable**: Multi-season support, extensible stat selection
- **Efficient**: Polars (Python) + DataFrames.jl for performance
- **Cross-language**: CSV bridge between Python and Julia
