*** Settings ***
Library         Browser
Library         resources\\get_variables.py

Suite Setup     Suite setup


*** Variables ***
${target_config}    targetconfig.json
${version_info}     ${EMPTY}


*** Keywords ***
Suite setup
    # args=['–-start-maximized', '--prevent-resizing-contents-for-testing', ]
    # devtools=true
    #    args=[–-start-maximized]
    New Browser
    ...    browser=chromium
    ...    headless=false
    ...    slowMo=1ms
    New Context    viewport={'width': 1920, 'height': 1000}    screen={'width': 1600, 'height': 900}
    # New Context    viewport={'width': 1920, 'height': 1000}    deviceScaleFactor=0.5    # screen={'width': 1900, 'height': 896}
    # New Browser    chromium    headless=false
    # desktop
    # New Context    viewport=${None}
    # New Context    deviceScaleFactor=2    viewport={'width': 2500, 'height': 1000}
    ## New Context    viewport={'width': 1920, 'height': 1000}
    # tablet
    # New Context    viewport={'width': 1024, 'height': 768}
    # mobile
    # New Context    viewport={'width': 360, 'height': 800}
    Populate environment

Populate environment
    # Set Global Variable    ${RESOURCES}    ${CURDIR}/../resources
    Set Global Variable    ${RESOURCES}    ${CURDIR}\\..\\resources


    Log To Console    Setting global variables from ${target_config}
    # ${items}=    Get Variables From File    ${CURDIR}/../../${target_config}
    ${items}=    Get Variables From File    c:\\QA\\fx-gui-11\\targetconfig.json
    FOR    ${key}    ${value}    IN    &{items}
        Set Global Variable    ${${key}}    ${value}
        Log To Console    ${key} = ${value}
    END
