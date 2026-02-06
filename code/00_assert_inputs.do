version 17.0

local missing 0

capture confirm file "${DATA_RAW}/nlscya_all_1979-2020.zip"
if _rc {
    display as error "Missing required file: ${DATA_RAW}/nlscya_all_1979-2020.zip"
    local missing = 1
}

capture confirm file "${DATA_RAW}/nlsy79_all_1979-2022.zip"
if _rc {
    display as error "Missing required file: ${DATA_RAW}/nlsy79_all_1979-2022.zip"
    local missing = 1
}

if `missing' {
    display as error "Input assertion failed. Download required raw files into data/raw/."
    exit 601
}
