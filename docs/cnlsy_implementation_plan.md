# CNLSY Analysis Implementation Plan (Codebook-Driven)

## Scope
Implement the CNLSY growth/development analysis as a reproducible applied-economics project with:
- Stata code in `code/`
- raw/intermediate/derived data under `data/`
- tables/figures/logs under `results/`
- methods and mapping docs under `docs/`

Planned core outputs:
- `data/derived/cnlsy_panel_long.dta`
- `data/derived/cnlsy_dev_measures.dta`
- `data/derived/cnlsy_analysis_ready.dta`
- `results/figures/fig_c1_dev_vs_ses.pdf`
- `results/figures/fig_c2_outcomes_vs_dev.pdf`
- regression tables in `results/tables/`

## What We Can Start Immediately
1. Build the full project skeleton and Stata pipeline runner.
2. Implement codebook-based variable discovery scripts.
3. Build merge/QC/model scripts with variable lists loaded from a central crosswalk.

## Blocking Input
Raw CNLSY/NLSY79 data files must be present locally in `data/raw/`.

In this terminal session, outbound web fetches are blocked by environment proxy settings (`HTTP_PROXY` and `HTTPS_PROXY` set to `127.0.0.1:9`), so direct in-terminal download is currently not working.

Direct official download endpoints:
- `https://nlsinfo.org/cohort-data/nlscya_all_1979-2020.zip`
- `https://nlsinfo.org/cohort-data/nlsy79_all_1979-2022.zip`

## Source-Backed Coverage Targets
Use official NLS pages to set wave targets before extracting variables:

1. Child anthropometrics:
- Asterisk tables list "Child Height and Body Weight" as available 1986 to 2012 (biannual years in this range). Confirm exact variable IDs in Investigator/codebook extract.

2. Menarche/puberty:
- Asterisk tables list "Menstruation and Menarche" as available 1986 to 2010 (biannual years in this range). Confirm exact variable IDs and universe flags.

3. Child assessments:
- Asterisk tables list PIAT and PPVT series as 1986 to 2008 in the topical table.
- Child Assessments documentation and Appendix G include detailed score/reference documentation through later rounds; reconcile this discrepancy at the variable level and record final coverage decisions in the variable map.

4. Young Adult outcomes:
- YA asterisk tables list key schooling and health variables (including height/weight and highest grade completed) through 1994 to 2020.

5. Mother controls (NLSY79):
- Pull maternal education, family income/income-to-needs/poverty, and AFQT/ASVAB from NLSY79 files and document exact years/construct choices in the variable map.

## Implementation Phases

### Phase 1: Project Scaffolding
Create directories:
- `code/`
- `data/raw/`
- `data/intermediate/`
- `data/derived/`
- `results/tables/`
- `results/figures/`
- `results/logs/`
- `docs/notes/`

Create pipeline entry scripts:
- `code/00_master.do`
- `code/00_globals.do`
- `code/00_assert_inputs.do`

Exit criteria:
- Running `code/00_master.do` creates log files and fails fast if required inputs are missing.

### Phase 2: Variable Crosswalk Finalization
Complete `docs/cnlsy_variable_map.md` with exact names and waves:
- IDs and linkage keys (child, mother, interview/year keys)
- sex, race/ethnicity, DOB components
- child height/weight, menarche, PIAT/PPVT
- YA schooling/health outcomes
- mother education, income/poverty, AFQT
- all required weights and universe flags

Add machine-readable crosswalk:
- `docs/variable_crosswalk.csv` with columns:
`domain, source_file, variable_name, first_year, last_year, universe, notes`

Exit criteria:
- No core `TBD` entries remain.
- Crosswalk has complete extraction instructions for all model variables.

### Phase 3: Extraction and Harmonization
Implement scripts:
1. `code/01_extract_child.do`
2. `code/02_extract_ya.do`
3. `code/03_extract_mother.do`
4. `code/04_harmonize_ids_waves.do`

Design rules:
- Preserve source IDs and interview timing variables.
- Keep raw unit indicators and measured-vs-reported flags.
- Standardize units only in harmonization stage.

Exit criteria:
- Harmonized intermediate files written to `data/intermediate/` with clear row counts by year.

### Phase 4: Construct Analysis Measures
Implement scripts:
1. `code/05_build_growth_panel.do`
2. `code/06_build_dev_measures.do`
3. `code/07_merge_outcomes_ses.do`

Construction rules:
- Compute exact age in months at each measurement.
- Growth-tempo proxy sample: ages 12 to 16, requiring at least two valid heights.
- Menarche sample: plausible menarche ages only; exclude invalid/imputed values per codebook flags.

Exit criteria:
- Core derived datasets produced in `data/derived/`.

### Phase 5: Diagnostics and QC
Implement scripts:
1. `code/08_qc_missingness.do`
2. `code/09_qc_outliers_units.do`
3. `code/10_qc_attrition_weights.do`

Required QC outputs:
- `results/tables/qc_missingness.csv`
- `results/tables/qc_outlier_flags.csv`
- `results/tables/qc_weight_coverage.csv`

Pipeline-stopping assertions:
- impossible age/height/weight values
- duplicate primary keys after merges
- empty cells in required sex-by-age strata
- missing required weight for weighted models

### Phase 6: Estimation and Output Generation
Implement scripts:
1. `code/11_model_dev_vs_ses.do`
2. `code/12_model_outcomes_vs_dev.do`
3. `code/13_make_figures_tables.do`

Required outputs:
- `results/figures/fig_c1_dev_vs_ses.pdf`
- `results/figures/fig_c2_outcomes_vs_dev.pdf`
- model tables in CSV and LaTeX in `results/tables/`

### Phase 7: Replication-Package Documentation
Create/update:
- `README.md` (one-command run, software versions, runtime expectations)
- `docs/data_availability.md` (restricted/public components and access steps)
- `docs/computational_requirements.md`
- `docs/reproduction_steps.md`
- `docs/assumptions_and_limits.md`

Exit criteria:
- A third party can run from local raw data placement through final tables/figures without manual code edits.

## Minimum Viable Order (What To Do First)
1. Build Phase 1 scaffolding and `00_master.do`.
2. Finalize Phase 2 variable crosswalk from official documentation.
3. Implement Phases 3 and 4 for one vertical slice (height/weight only) end-to-end.
4. Add QC for that slice, then extend to menarche and assessments.
5. Add YA outcomes and final models last.

## Risks and Mitigations
1. Coverage discrepancies across docs:
- Treat asterisk tables as coverage guide, then lock final years from variable-level codebook entries.

2. Weight misuse:
- Enforce explicit model-specific weight assignment and log chosen weight variable per model.

3. Silent harmonization errors:
- Add assertions after every merge and unit transformation.

4. Reproducibility drift:
- Keep all transformations in numbered scripts called only from `00_master.do`.

## Official Links Used
- NLS cohorts and downloads: `https://www.nlsinfo.org/content/accessing-nls-data/cohorts`
- NLSCYA ZIP: `https://nlsinfo.org/cohort-data/nlscya_all_1979-2020.zip`
- NLSY79 ZIP: `https://nlsinfo.org/cohort-data/nlsy79_all_1979-2022.zip`
- Children data overview: `https://www.nlsinfo.org/content/cohorts/nlsy79-children/using-and-understanding-the-data/children-of-the-nlsy79-data`
- Children asterisk tables: `https://www.nlsinfo.org/content/cohorts/nlsy79-children/using-and-understanding-the-data/asterisk-tables`
- Young Adult data overview: `https://www.nlsinfo.org/content/cohorts/nlsy79-children/using-and-understanding-the-data/young-adult-data`
- Child assessments topical guide: `https://www.nlsinfo.org/content/cohorts/nlsy79-children/topical-guide/education/child-assessments`
- NLSY79 asterisk tables: `https://www.nlsinfo.org/content/cohorts/nlsy79/using-and-understanding-the-data/asterisk-tables`
