version 17.0
clear all
set more off

do "code/00_globals.do"

local d = subinstr("`c(current_date)'", " ", "_", .)
local t = subinstr("`c(current_time)'", ":", "-", .)
local runlog "${LOGS}/pipeline_`d'_`t'.log"

capture log close _all
log using "`runlog'", replace text

display as text "Starting CNLSY pipeline at `c(current_date)' `c(current_time)'"

do "code/00_assert_inputs.do"

local steps ///
    "01_extract_child" ///
    "02_extract_ya" ///
    "03_extract_mother" ///
    "04_harmonize_ids_waves" ///
    "05_build_growth_panel" ///
    "06_build_dev_measures" ///
    "07_merge_outcomes_ses" ///
    "08_qc_missingness" ///
    "09_qc_outliers_units" ///
    "10_qc_attrition_weights" ///
    "11_model_dev_vs_ses" ///
    "12_model_outcomes_vs_dev" ///
    "13_make_figures_tables"

foreach step of local steps {
    display as text "Running step: `step'"
    capture noisily do "code/`step'.do"
    if _rc {
        display as error "Pipeline failed at `step' with rc = " _rc
        log close
        exit _rc
    }
}

display as result "Pipeline finished successfully."
log close
