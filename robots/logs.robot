*** Settings ***
Resource        resources\\logs.resource
Resource        resources\\navigate.resource
Library         Browser

Test Setup      Go to main view


*** Test Cases ***
Logs page Features Walkthrough
    [Documentation]
    ...    Navigating to each log, searching for username and pointname

    Events Log Features    username=system    point_name=MBUS_50015147_COMM_ALM
    Debug Log Features
    Alarm Log Features    username=system    point_name=MBUS_50015147_COMM_ALM


*** Keywords ***
Log page will load template
    [Arguments]    ${keyword}    ${selector}    ${click_selector}
    Run Keyword    ${keyword}
    Wait For Elements State    selector=${selector}    state=visible
    # Second time
    Click    ${click_selector}
    Wait For Elements State    selector=${selector}    state=visible
