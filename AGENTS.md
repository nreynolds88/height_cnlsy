# AGENTS Guide

## Purpose
This repository is organized as an applied-economics replication package for CNLSY growth/development analyses.

Primary planning docs:
- `docs/cnlsy_plan.md`
- `docs/cnlsy_variable_map.md`
- `docs/cnlsy_implementation_plan.md`

## Replication Package Conventions
Use this structure:
- `code/` Stata scripts (`00_master.do` as entry point)
- `data/raw/` source data not committed to git
- `data/intermediate/` generated temporary/intermediate files
- `data/derived/` final analysis-ready datasets
- `results/` generated tables, figures, and logs
- `docs/` documentation, assumptions, and variable mapping

## Current Status
- Variable and wave mapping is still incomplete (`TBD` entries remain).
- Do not guess variable names or wave coverage.
- Resolve `docs/cnlsy_variable_map.md` before implementing domain-specific transformations.

## Working Rules
1. Write modular Stata scripts with numeric prefixes and clear inputs/outputs.
2. Keep a single reproducible entry point in `code/00_master.do`.
3. Add fail-fast checks for missing inputs, invalid units, impossible ages, and empty key cohorts.
4. Preserve source IDs, sampling weights, and universe restrictions through all merges.
5. Record dataset lineage and key assumptions in docs whenever transformations change.

## Git and Documentation Rules
1. Commit code and documentation; do not commit raw data or routine generated artifacts.
2. Keep logs, temporary files, and ad hoc exploratory outputs out of git.
3. Keep commit scope narrow and messages specific.
4. Update `README.md` when run order, dependencies, or expected outputs change.

## Definition of Done
- No core `TBD` entries remain in `docs/cnlsy_variable_map.md`.
- `code/00_master.do` runs end-to-end and generates expected derived data/results.
- Key checks and assumptions are documented well enough for third-party rerun.
