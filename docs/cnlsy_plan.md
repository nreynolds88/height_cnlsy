# CNLSY Growth & Development Module Plan

> **Status:** Draft plan prepared without direct access to NLS Investigator/codebooks due to HTTP 403 from this environment. All year/wave- and variable-specific items marked **TBD** will be finalized after codebook review.

## 1. Survey Components to Use
- **Children (CNLSY) assessments**: anthropometrics, child assessments (PIAT, PPVT), and youth self-reports (as applicable). **TBD (confirm exact assessment years and file names).**
- **Young Adult (YA) surveys**: schooling outcomes, health outcomes, and later outcomes not in child assessments. **TBD.**
- **NLSY79 Mothers**: baseline and time-varying SES (maternal education, family income/poverty, AFQT). **TBD.**

## 2. Coverage Years / Waves (TBD after codebook review)
- **Height/Weight modules**: _TBD (list exact years/waves)._
- **Menarche / puberty questions**: _TBD (list exact years/waves)._
- **Child assessments (PIAT/PPVT)**: _TBD (list exact years/waves)._
- **YA outcomes (schooling/health)**: _TBD (list exact years/waves)._

## 3. Primary Samples & Age Windows (Proposed)
- **Growth tempo proxies:** ages **12–16** (sex-specific if needed); require ≥2 height measures in this window.
- **Menarche analyses:** girls with valid menarche age; restrict to plausible age range (e.g., 8–17) and non-imputed values.
- **Outcome analyses:** use earliest post-development assessment window (test scores during childhood; schooling/health during YA).

## 4. Weights Strategy (TBD after codebook review)
- Use **child assessment weights** for analyses tied to assessment years.
- Use **YA weights** for YA outcomes.
- Use **panel weights** where appropriate for pooled cross-cohort analysis.

## 5. Key Pitfalls & Mitigations
- **Recall timing** for menarche: document question wording and universe; flag retrospective vs contemporaneous reporting.
- **Measurement units**: confirm inches/cm and pounds/kg; standardize units; drop or flag outliers.
- **Selective assessment participation**: check missingness by SES and age; document attrition.
- **Age alignment**: compute exact age in months at measurement; avoid pooling across wide age ranges.

## 6. Core Deliverables (Planned)
- **Datasets**
  - `outputs/cnlsy_panel_long.dta` (child-age panel)
  - `outputs/cnlsy_dev_measures.dta` (menarche + tempo proxies)
  - `outputs/cnlsy_analysis_ready.dta` (merged SES + outcomes)
- **Figures (PDF)**
  - `outputs/figs/fig_c1_dev_vs_ses.pdf`
  - `outputs/figs/fig_c2_outcomes_vs_dev.pdf`
- **Tables**
  - `outputs/tables/` regression outputs (CSV/LaTeX)

## 7. Next Step
- **Complete the codebook/variable review** and update `docs/cnlsy_variable_map.md` with exact file/variable names before writing any Stata pipeline scripts.

## 8. Replication Files as Secondary Validation (Pending)
> **Purpose:** Use recent CNLSY replication packages to **triangulate** variable coverage and panel structure, while clearly labeling them as **non-authoritative**. All replication-based notes will be verified against NLS Investigator once access is restored.

### Planned sources (once web access is restored)
- **AEA Data and Code** / **openICPSR** / journal replication archives (target papers from the last 3–5 years).
- Criteria: uses CNLSY Children/YA data, includes codebooks or Stata do-files, and documents variable construction.

### Cross-check workflow
1. Extract candidate variable lists (anthropometrics, menarche, test scores, SES, outcomes).
2. Compare to official NLS Investigator codebooks; log **agreements vs discrepancies**.
3. Keep a short audit note in the docs indicating which items are **replication-derived** and **awaiting official confirmation**.

### Current status
- Web access to NLS/NLS Investigator is blocked in this environment (**HTTP 403**), so replication sources are not yet retrieved.
