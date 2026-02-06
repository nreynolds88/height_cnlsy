# No-Data Workplan (Executable Now)

## Objective
Make maximum progress on CNLSY analysis infrastructure while waiting for data access.

## Workstreams

1. Pipeline scaffolding
- Create and validate `code/00_master.do` orchestration.
- Add `00_globals.do` and `00_assert_inputs.do`.
- Add placeholders for steps `01` through `13` with standardized input/output comments.

2. Variable architecture
- Finalize variable domains and naming conventions.
- Add machine-readable `docs/variable_crosswalk.csv` template.
- Define required merge keys and weight-selection logic in docs.

3. QC framework
- Define fail-fast assertions to be implemented in QC scripts:
`missing inputs`, `duplicate keys`, `invalid ages/units`, `missing weights`.
- Predefine QC output filenames and expected schemas in `results/tables/`.

4. Replication-package documentation
- Maintain run instructions in `README.md`.
- Add reproducibility docs:
`docs/reproduction_steps.md`,
`docs/computational_requirements.md`,
`docs/data_availability.md`.

## Immediate Deliverables
- Runnable master pipeline skeleton that fails cleanly when data are absent.
- Numbered script files ready for implementation.
- Replication-ready folder structure and documentation baseline.

## Exit Criteria for No-Data Phase
- A new collaborator can clone the repo and understand:
1. where to place raw data,
2. how to run the pipeline,
3. which scripts are responsible for each stage,
4. what outputs are expected.
