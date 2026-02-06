version 17.0

* Run this project from repository root.
global PROJECT_ROOT "`c(pwd)'"
global CODE "${PROJECT_ROOT}/code"
global DATA_RAW "${PROJECT_ROOT}/data/raw"
global DATA_INT "${PROJECT_ROOT}/data/intermediate"
global DATA_DER "${PROJECT_ROOT}/data/derived"
global RESULTS "${PROJECT_ROOT}/results"
global TABLES "${PROJECT_ROOT}/results/tables"
global FIGURES "${PROJECT_ROOT}/results/figures"
global LOGS "${PROJECT_ROOT}/results/logs"

capture mkdir "${PROJECT_ROOT}/data"
capture mkdir "${DATA_RAW}"
capture mkdir "${DATA_INT}"
capture mkdir "${DATA_DER}"
capture mkdir "${RESULTS}"
capture mkdir "${TABLES}"
capture mkdir "${FIGURES}"
capture mkdir "${LOGS}"

display as text "PROJECT_ROOT: ${PROJECT_ROOT}"
