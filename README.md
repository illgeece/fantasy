# Fantasy Helper

Retrieve NFL player statistics using nflreadpy.

## Dependencies:
- nflreadpy>=0.3.0 - NFL data retrieval library
- polars>=0.19.0 - Fast DataFrame library for data processing


## Setup

```bash
pip install -r requirements.txt
```

## Usage

```python
from player_stats import get_player_stats

players = ["Patrick Mahomes", "Christian McCaffrey"]
stats = get_player_stats(players)
print(stats)
```


