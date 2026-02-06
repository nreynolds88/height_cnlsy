# CNLSY Variable Map (NLS Investigator Review)

> **Status:** Pending completion because the NLS Investigator/codebook site is currently inaccessible from this environment (HTTP 403). No variable names are guessed below. Once access is restored, replace the placeholders with **exact** file names and **exact** variable names from the codebooks.

## Children & Young Adult Files

### Sample identifiers / weights
- **Source file:** _TBD after codebook review_
- **Variables (exact names):** _TBD_
- **Notes:** Identify child ID, mother ID, sampling weights (child assessment and/or panel weights), and universe flags.

### Child demographics
- **Source file:** _TBD after codebook review_
- **Variables (exact names):** _TBD_
- **Notes:** Sex, race/ethnicity, birth year/month.

### Anthropometrics (height/weight)
- **Source file(s):** _TBD after codebook review_
- **Variables (exact names):** _TBD_
- **Notes:** Include units (inches vs cm; pounds vs kg), measured vs reported, and assessment year.

### Puberty / menarche
- **Source file(s):** _TBD after codebook review_
- **Variables (exact names):** _TBD_
- **Notes:** Question wording, universe, age coverage.

### Test scores
- **Source file(s):** _TBD after codebook review_
- **Variables (exact names):** _TBD_
- **Notes:** PIAT Math, Reading Recognition, Reading Comprehension; PPVT; assessment ages.

### Schooling outcomes
- **Source file(s):** _TBD after codebook review_
- **Variables (exact names):** _TBD_
- **Notes:** Highest grade completed, HS completion, enrollment status in YA.

### Health outcomes
- **Source file(s):** _TBD after codebook review_
- **Variables (exact names):** _TBD_
- **Notes:** BMI, self-rated health, etc. if available.

## Mother (NLSY79) Files

### Maternal education
- **Source file:** _TBD after codebook review_
- **Variables (exact names):** _TBD_

### Family income / income-to-needs / poverty
- **Source file(s):** _TBD after codebook review_
- **Variables (exact names):** _TBD_
- **Notes:** Include deflator or CPI series if needed.

### Maternal AFQT
- **Source file:** _TBD after codebook review_
- **Variables (exact names):** _TBD_
- **Notes:** Confirm scale/standardization.

## Action Required
1. Re-attempt access to **NLS Investigator** and the **CNLSY/YA codebooks** when network allows.
2. Replace all `_TBD_` entries with **exact file and variable names**.
3. Add citation links/URLs for each set of variables used.

## Alternative Documentation & Replication File Cross-Checks (Pending)
> **Goal:** Identify “old-fashioned” codebooks and recent replication files to triangulate variables and wave coverage **without treating them as authoritative**. All replication-based details will be flagged as provisional until the NLS Investigator review is complete.

### Attempts in this environment (blocked)
- `https://www.nlsinfo.org/content/cohorts/nlsy79-children` (CNLSY cohort page): **HTTP 403**.
- `https://www.nlsinfo.org/` (general NLS site): **HTTP 403**.

### Next steps (once web access is restored)
1. Locate and download **CNLSY79 Children & Young Adult codebook PDFs** from NLS/NLS Investigator pages.
2. Identify **1–2 replication packages (3–5 years old)** that use CNLSY:
   - Prefer **AEA Data and Code** / **openICPSR** repositories, or journal-hosted replication archives.
   - Extract only **variable lists, code comments, and wave coverage**; do **not** treat as ground truth.
3. Add a short **“Replication cross-check”** subsection under each domain above noting:
   - Where replication packages **agree** with codebooks.
   - Any **inconsistencies** (e.g., variable naming, wave availability).
