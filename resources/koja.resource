*** Settings ***
Library     Browser
Library     DateTime
Resource    navigate.resource
Resource    login.resource
Resource    koja_locators.resource
Resource    global_variables.resource


*** Variables ***
${DATE_FORMAT}      %B %d, %Y
${INPUT_FORMAT}     %d.%m.%Y %H:%M


*** Keywords ***
Koja Main Page Walkthrough
    Sleep    20s
    ${processpicture_visible}=    Run Keyword And Return Status
    ...    Wait for Elements State
    ...    ${selector_koja_alarmicon}
    ...    visible
    ...    timeout=10s
    IF    ${processpicture_visible}
        Log To Console    processpicture visible
    ELSE
        Log To Console    processpicture NOT visible
    END

    ${KOJA_TE01_M_visible}=    Run Keyword And Return Status
    ...    Wait for Elements State
    ...    ${selector_koja_KOJA_TE01_M}
    ...    visible
    ...    timeout=10s
    IF    ${KOJA_TE01_M_visible}
        Log To Console    TE01 visible
    ELSE
        Log To Console    TE01 NOT visible
    END

    # Sleep    10s
    # Browser.Click    ${selector_koja_alarmicon}
    # Sleep    10s
    # Browser.Click    ${selector_koja_navigation_processpicture}
    # Sleep    10s
    # Browser.Click    ${selector_koja_navigation_parameterlist}
    # Sleep    10s
    # Browser.Click    ${selector_koja_navigation_configurationlist}
    # Sleep    10s
