# CNLSY Growth and Development Analysis Plan

## Status
Draft plan. Variable-level mappings remain pending until codebook review is fully completed.

## Survey Components
- Children (CNLSY): anthropometrics, child assessments (PIAT, PPVT), youth self-reports as relevant.
- Young Adult (YA): schooling and health outcomes.
- NLSY79 mothers: SES controls (education, income/poverty, AFQT).

## Coverage Windows
- Height/weight modules: `TBD` after variable-level mapping.
- Menarche/puberty: `TBD`.
- Child assessments (PIAT/PPVT): `TBD`.
- YA outcomes (schooling/health): `TBD`.

## Primary Samples
- Growth-tempo proxies: ages 12 to 16 with at least two valid height observations.
- Menarche analyses: girls with plausible, non-imputed menarche age.
- Outcome analyses: earliest post-development windows for child and YA outcomes.

## Weights
- Use child assessment weights for child assessment analyses.
- Use YA weights for YA outcomes.
- Use panel weights where pooled design requires it.

## Known Risks
- Menarche recall timing and wording differences across rounds.
- Unit inconsistency (inches/cm, pounds/kg).
- Selective participation and attrition by SES.
- Age misalignment if exact month-level age is not used.

## Deliverables
- `data/derived/cnlsy_panel_long.dta`
- `data/derived/cnlsy_dev_measures.dta`
- `data/derived/cnlsy_analysis_ready.dta`
- `results/figures/fig_c1_dev_vs_ses.pdf`
- `results/figures/fig_c2_outcomes_vs_dev.pdf`
- regression tables in `results/tables/`

## Immediate Next Step
Finalize `docs/cnlsy_variable_map.md` with exact source file and variable names before writing domain transformations.
