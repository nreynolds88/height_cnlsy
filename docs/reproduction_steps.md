# Reproduction Steps

## 1. Clone Repository
Clone this repository to a local machine with Stata installed.

## 2. Obtain Data
Download and place these files in `data/raw/`:
- `nlscya_all_1979-2020.zip`
- `nlsy79_all_1979-2022.zip`

## 3. Verify Variable Map
Review `docs/cnlsy_variable_map.md` and ensure all required variables are finalized.

## 4. Run Master Script
From repository root:

```powershell
& "C:\Program Files\StataNow19\StataMP-64.exe" /e do "code/00_master.do"
```

## 5. Validate Outputs
Check for:
- derived data in `data/derived/`
- tables in `results/tables/`
- figures in `results/figures/`
- log files in `results/logs/`
