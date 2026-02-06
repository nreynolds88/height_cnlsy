# CNLSY Growth and Development Replication Package

## Project Status
This repository is set up as an applied economics replication package scaffold.

Current state:
- Pipeline structure is implemented.
- Data extraction and analysis scripts are stubbed and sequenced.
- Variable-level mapping remains pending in `docs/cnlsy_variable_map.md`.

## Repository Layout
- `code/`: Stata do-files (single entry point: `00_master.do`)
- `data/raw/`: input files (not tracked)
- `data/intermediate/`: intermediate files (not tracked)
- `data/derived/`: analysis-ready outputs (not tracked)
- `results/tables/`: generated tables
- `results/figures/`: generated figures
- `results/logs/`: run logs
- `docs/`: plan, variable map, reproducibility notes

## Required Inputs
Place these files in `data/raw/`:
- `nlscya_all_1979-2020.zip`
- `nlsy79_all_1979-2022.zip`

Official download page:
- `https://www.nlsinfo.org/content/access-data-investigator/accessing-data-cohorts`

## Software Requirements
- Stata 17+ (StataMP 19 currently configured on this machine)
- Windows PowerShell for local run commands

## Run
From repo root:

```powershell
& "C:\Program Files\StataNow19\StataMP-64.exe" /e do "code/00_master.do"
```

The master script:
1. Initializes globals and paths.
2. Asserts required raw inputs exist.
3. Runs numbered pipeline steps in order.
4. Writes logs to `results/logs/`.

## Notes for Reproduction
- Raw data are restricted and not included in this repository.
- Generated data and results are git-ignored by default.
- `docs/cnlsy_variable_map.md` is authoritative for variable selection once finalized.
