*** Settings ***
Library     Browser
Library     RPA.JavaAccessBridge
Resource    navigate.resource
Resource    login.resource
Resource    point_locators.resource
Resource    global_variables.resource
Resource    automation_locators_id.resource


*** Keywords ***
Add New AO Point
    [Documentation]
    ...    Creates a new AO Point object using arguments.
    ...    Requires active position at: Main navigation view -> Automation -> Points -> AO points

    [Arguments]
    ...    ${POINT_ID_INPUT_VALUE}
    ...    ${POINT_DESCRIPTION_INPUT_VALUE}
    ...    ${ACCESS_LEVEL_VIEW_INPUT_VALUE}
    ...    ${ACCESS_LEVEL_MANUAL_INPUT_VALUE}
    ...    ${ACCESS_LEVEL_PROGRAMMING_INPUT_VALUE}
    ...    ${GLOBAL_POINT}
    ...    ${GLOBAL_SUBSTATION_NAME}
    ...    ${GLOBAL_POINT_NAME}
    ...    ${MODULE_PORT_INPUT_VALUE}
    ...    ${MODULE_NUMBER_INPUT_VALUE}
    ...    ${MODULE_POINT_VALUE}
    ...    ${MIN_VOLTAGE}
    ...    ${MAX_VOLTAGE}
    ...    ${DEFAULT_VALUE_OLD_FIXED}
    ...    ${DEFAULT_VALUE}
    ...    ${TREND_TOLERANCE}
    ...    ${TREND_SAMPLE_TIME}
    ...    ${PICTURE}

    Wait For Elements State    ${SELECTOR_AUTOMATION_TOOLBAR_ADD_NEW_BUTTON}    visible    timeout=2s
    Browser.Click    ${SELECTOR_AUTOMATION_TOOLBAR_ADD_NEW_BUTTON}

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_EDIT_POINT_ID_INPUT}    visible    timeout=2s
    Fill Text    ${SELECTOR_AUTOMATION_POINT_EDIT_POINT_ID_INPUT}    ${POINT_ID_INPUT_VALUE}

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_EDIT_POINT_DESCRIPTION_INPUT}    visible    timeout=2s
    Fill Text    ${SELECTOR_AUTOMATION_POINT_EDIT_POINT_DESCRIPTION_INPUT}    ${POINT_DESCRIPTION_INPUT_VALUE}

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_EDIT_ACCESS_LEVEL_VIEW_INPUT}    visible    timeout=2s
    Fill Text    ${SELECTOR_AUTOMATION_POINT_EDIT_ACCESS_LEVEL_VIEW_INPUT}    ${ACCESS_LEVEL_VIEW_INPUT_VALUE}

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_EDIT_ACCESS_LEVEL_MANUAL_INPUT}    visible    timeout=2s
    Fill Text    ${SELECTOR_AUTOMATION_POINT_EDIT_ACCESS_LEVEL_MANUAL_INPUT}    ${ACCESS_LEVEL_MANUAL_INPUT_VALUE}

    Wait For Elements State
    ...    ${SELECTOR_AUTOMATION_POINT_EDIT_ACCESS_LEVEL_PROGRAMMING_INPUT}
    ...    visible
    ...    timeout=2s
    Fill Text
    ...    ${SELECTOR_AUTOMATION_POINT_EDIT_ACCESS_LEVEL_PROGRAMMING_INPUT}
    ...    ${ACCESS_LEVEL_PROGRAMMING_INPUT_VALUE}

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_EDIT_TYPE_GLOBAL_BUTTON}    visible    timeout=2s
    Browser.Click    ${SELECTOR_AUTOMATION_POINT_EDIT_TYPE_GLOBAL_BUTTON}

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_EDIT_TYPE_LOCAL_BUTTON}    visible    timeout=2s
    Browser.Click    ${SELECTOR_AUTOMATION_POINT_EDIT_TYPE_LOCAL_BUTTON}

    Module Selector    ${MODULE_PORT_INPUT_VALUE}    ${MODULE_NUMBER_INPUT_VALUE}    ${MODULE_POINT_VALUE}

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_EDIT_PICTURE_SELECT}    visible    timeout=2s
    Browser.Click    ${SELECTOR_AUTOMATION_POINT_EDIT_PICTURE_SELECT}
    ${option2}=    Set Variable    xpath=//mat-option[@data-qa-id='automation-point-edit-picture-option2']
    Browser.Click    ${option2}

    IF    ${GLOBAL_POINT} != 0
        Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_EDIT_TYPE_GLOBAL_BUTTON}    visible    timeout=2s
        Browser.Click    ${SELECTOR_AUTOMATION_POINT_EDIT_TYPE_GLOBAL_BUTTON}
        Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_EDIT_GLOBAL_SUBSTATION_SELECT}    visible    timeout=2s
        ${option2}=    Set Variable
        ...    xpath=//mat-option[@data-qa-id='automation-point-edit-global-info-substation-option2']
        ${option2_visible}=    Run Keyword And Return Status
        ...    Wait For Elements State
        ...    @{option2}
        ...    visible
        ...    timeout=2s
        IF    ${option2_visible}    Browser.Click    ${option2}
        Fill Text    ${SELECTOR_AUTOMATION_POINT_EDIT_GLOBAL_POINTNAME_INPUT}    ${GLOBAL_POINT_NAME}
    END

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_AO_EDIT_MIN_VOLTAGE_INPUT}    visible    timeout=2s
    Fill Text    ${SELECTOR_AUTOMATION_POINT_AO_EDIT_MIN_VOLTAGE_INPUT}    ${MIN_VOLTAGE}
    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_AO_EDIT_MAX_VOLTAGE_INPUT}    visible    timeout=2s
    Fill Text    ${SELECTOR_AUTOMATION_POINT_AO_EDIT_MAX_VOLTAGE_INPUT}    ${MAX_VOLTAGE}

    Browser.Click    ${SELECTOR_AUTOMATION_POINT_AO_EDIT_DEFAULT_FIXED_BUTTON}

    Browser.Click    ${SELECTOR_AUTOMATION_POINT_AO_EDIT_DEFAULT_OLD_VALUE_BUTTON}

    IF    ${DEFAULT_VALUE_OLD_FIXED} != 0
        Browser.Click    ${SELECTOR_AUTOMATION_POINT_AO_EDIT_DEFAULT_FIXED_BUTTON}
        Wait For Elements State
        ...    ${SELECTOR_AUTOMATION_POINT_AO_EDIT_DEFAULT_FIXED_VALUE_INPUT}
        ...    visible
        ...    timeout=2s
        Fill Text    ${SELECTOR_AUTOMATION_POINT_AO_EDIT_DEFAULT_FIXED_VALUE_INPUT}    ${DEFAULT_VALUE}
    END

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_AO_EDIT_TREND_TOLERANCE_INPUT}    visible    timeout=2s
    Fill Text    ${SELECTOR_AUTOMATION_POINT_AO_EDIT_TREND_TOLERANCE_INPUT}    ${TREND_TOLERANCE}

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_AO_EDIT_TREND_SAMPLE_TIME_INPUT}    visible    timeout=2s
    Fill Text    ${SELECTOR_AUTOMATION_POINT_AO_EDIT_TREND_SAMPLE_TIME_INPUT}    ${TREND_SAMPLE_TIME}

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_AO_EDIT_PICTURE_SELECT}    visible    timeout=2s
    ${option2}=    Set Variable    xpath=//mat-option[@data-qa-id='automation-point-edit-picture-option2']
    ${option2_visible}=    Run Keyword And Return Status
    ...    Wait For Elements State
    ...    @{option2}
    ...    visible
    ...    timeout=2s
    IF    ${option2_visible}    Browser.Click    ${option2}

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_EDIT_ADD_BUTTON}    visible    timeout=2s
    Browser.Click    ${SELECTOR_AUTOMATION_POINT_EDIT_ADD_BUTTON}

    Snack-bar Visibility And Content

Delete AO Point
    [Documentation]
    ...    Removes a new AO Point object using arguments.
    ...    Requires active position at: Main navigation view -> Automation -> Points -> AO points

    [Arguments]
    ...    ${POINT_ID_INPUT_VALUE}

    ${compiled_text}=    Set Variable    xpath=//td[contains(., '${POINT_ID_INPUT_VALUE}')]

    Wait For Elements State    ${compiled_text}    visible    timeout=2s
    Browser.Click    ${compiled_text}

    Wait For Elements State    ${SELECTOR_AUTOMATION_TOOLBAR_DELETE_BUTTON}    visible    timeout=2s
    Browser.Click    ${SELECTOR_AUTOMATION_TOOLBAR_DELETE_BUTTON}

    ${point_xpath_variable}=    Set Variable
    ...    //app-confirm-dialog[@class="ng-star-inserted"]//p[text()='${POINT_ID_INPUT_VALUE}']
    Wait For Elements State    ${point_xpath_variable}    visible    timeout=2s
    Wait For Elements State    ${SELECTOR_CONFIRM_DIALOG_CONFIRM_BUTTON}    visible    timeout=2s
    Browser.Click    ${SELECTOR_CONFIRM_DIALOG_CONFIRM_BUTTON}
    Snack-bar Visibility And Content
    Wait For Elements State    ${compiled_text}    hidden    timeout=2s

Duplicate AO Point
    [Documentation]
    ...    Makes a copy of AO Point object using arguments.
    ...    Requires active position at: Main navigation view -> Automation -> Points -> AO points

    [Arguments]
    ...    ${POINT_ID_INPUT_VALUE}
    ...    ${POINT_NEW_NAME}

    ${compiled_text}=    Set Variable    xpath=//td[contains(., '${POINT_ID_INPUT_VALUE}')]

    Wait For Elements State    ${compiled_text}    visible    timeout=2s
    Browser.Click    ${compiled_text}

    Wait For Elements State    ${SELECTOR_AUTOMATION_TOOLBAR_DUPLICATE_BUTTON}    visible    timeout=2s
    Browser.Click    ${SELECTOR_AUTOMATION_TOOLBAR_DUPLICATE_BUTTON}
    Wait For Elements State    ${SELECTOR_AUTOMATION_COPY_POINT_DIALOG_CLOSE_ICON}    visible    timeout=2s
    Wait For Elements State    ${SELECTOR_AUTOMATION_COPY_POINT_DIALOG_POINT_ID_INPUT}    visible    timeout=2s
    Fill Text    ${SELECTOR_AUTOMATION_COPY_POINT_DIALOG_POINT_ID_INPUT}    ${POINT_NEW_NAME}

    Browser.Click    ${SELECTOR_AUTOMATION_COPY_POINT_DIALOG_CANCEL_BUTTON}

    Wait For Elements State    ${SELECTOR_AUTOMATION_TABLE_MASTER_TOGGLE_CHECKBOX}    visible    timeout=2s
    Browser.Click    ${SELECTOR_AUTOMATION_TABLE_MASTER_TOGGLE_CHECKBOX}
    Browser.Click    ${SELECTOR_AUTOMATION_TABLE_MASTER_TOGGLE_CHECKBOX}

    Wait For Elements State    ${compiled_text}    visible    timeout=2s
    Browser.Click    ${compiled_text}

    Wait For Elements State    ${SELECTOR_AUTOMATION_TOOLBAR_DUPLICATE_BUTTON}    visible    timeout=2s
    Browser.Click    ${SELECTOR_AUTOMATION_TOOLBAR_DUPLICATE_BUTTON}
    Wait For Elements State    ${SELECTOR_AUTOMATION_COPY_POINT_DIALOG_CLOSE_ICON}    visible    timeout=2s
    Wait For Elements State    ${SELECTOR_AUTOMATION_COPY_POINT_DIALOG_POINT_ID_INPUT}    visible    timeout=2s
    Fill Text    ${SELECTOR_AUTOMATION_COPY_POINT_DIALOG_POINT_ID_INPUT}    ${POINT_NEW_NAME}

    Browser.Click    ${SELECTOR_AUTOMATION_COPY_POINT_DIALOG_CREATE_BUTTON}
    Snack-bar Visibility And Content
    Go to automation ao points

    ${xpath_variable}=    Set Variable    xpath=//td[contains(., '${POINT_NEW_NAME}')]

    Wait For Elements State    ${xpath_variable}    visible    timeout=2s

Print AO Pointlist
    [Documentation]
    ...    Tries to print a list of AO points.
    ...    Requires active position at: Main navigation view -> Automation -> Points -> AO points

    Wait For Elements State    ${SELECTOR_AUTOMATION_TOOLBAR_PRINT_BUTTON}    visible    timeout=2s
    Browser.Click    ${SELECTOR_AUTOMATION_TOOLBAR_PRINT_BUTTON}
    Sleep    3s
    Keyboard Key    press    Escape

    Wait For Elements State    ${SELECTOR_AUTOMATION_TOOLBAR_PRINT_BUTTON}    visible    timeout=2s

Edit AO Point
    [Documentation]
    ...    Opens  AO Point object for editing and changes parameters using arguments.
    ...    Requires active position at: Main navigation view -> Automation -> Points -> AO points

    [Arguments]
    ...    ${POINT_ID_INPUT_VALUE}
    ...    ${POINT_ID_NEW_VALUE}
    ...    ${POINT_DESCRIPTION_INPUT_VALUE}
    ...    ${ACCESS_LEVEL_VIEW_INPUT_VALUE}
    ...    ${ACCESS_LEVEL_MANUAL_INPUT_VALUE}
    ...    ${ACCESS_LEVEL_PROGRAMMING_INPUT_VALUE}
    ...    ${MODULE_PORT_INPUT_VALUE}
    ...    ${MODULE_NUMBER_INPUT_VALUE}
    ...    ${MODULE_POINT_VALUE}
    ...    ${GLOBAL_POINT}
    ...    ${GLOBAL_SUBSTATION_NAME}
    ...    ${GLOBAL_POINT_NAME}

    ${compiled_text}=    Set Variable    xpath=//td[contains(., '${POINT_ID_INPUT_VALUE}')]

    Wait For Elements State    ${compiled_text}    visible    timeout=2s
    Browser.Click    ${compiled_text}

    ${copy_dialog_visible}=    Run Keyword And Return Status
    ...    Wait For Elements State
    ...    ${SELECTOR_AUTOMATION_POINT_CELL_COPY_BUTTON}
    ...    visible
    ...    timeout=2s
    IF    ${copy_dialog_visible}
        Browser.Click    ${SELECTOR_AUTOMATION_POINT_CELL_COPY_BUTTON}
        Snack-bar Visibility And Content
    END

    Wait For Elements State    ${SELECTOR_AUTOMATION_TOOLBAR_EDIT_BUTTON}    visible    timeout=2s
    Browser.Click    ${SELECTOR_AUTOMATION_TOOLBAR_EDIT_BUTTON}

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_EDIT_POINT_ID_INPUT}    visible    timeout=2s
    Fill Text    ${SELECTOR_AUTOMATION_POINT_EDIT_POINT_ID_INPUT}    ${POINT_ID_NEW_VALUE}

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_EDIT_POINT_DESCRIPTION_INPUT}    visible    timeout=2s
    Fill Text    ${SELECTOR_AUTOMATION_POINT_EDIT_POINT_DESCRIPTION_INPUT}    ${POINT_DESCRIPTION_INPUT_VALUE}

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_EDIT_ACCESS_LEVEL_VIEW_INPUT}    visible    timeout=2s
    Fill Text    ${SELECTOR_AUTOMATION_POINT_EDIT_ACCESS_LEVEL_VIEW_INPUT}    ${ACCESS_LEVEL_VIEW_INPUT_VALUE}

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_EDIT_ACCESS_LEVEL_MANUAL_INPUT}    visible    timeout=2s
    Fill Text    ${SELECTOR_AUTOMATION_POINT_EDIT_ACCESS_LEVEL_MANUAL_INPUT}    ${ACCESS_LEVEL_MANUAL_INPUT_VALUE}

    Wait For Elements State
    ...    ${SELECTOR_AUTOMATION_POINT_EDIT_ACCESS_LEVEL_PROGRAMMING_INPUT}
    ...    visible
    ...    timeout=2s
    Fill Text
    ...    ${SELECTOR_AUTOMATION_POINT_EDIT_ACCESS_LEVEL_PROGRAMMING_INPUT}
    ...    ${ACCESS_LEVEL_PROGRAMMING_INPUT_VALUE}

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_EDIT_TYPE_GLOBAL_BUTTON}    visible    timeout=2s
    Browser.Click    ${SELECTOR_AUTOMATION_POINT_EDIT_TYPE_GLOBAL_BUTTON}

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_EDIT_TYPE_LOCAL_BUTTON}    visible    timeout=2s
    Browser.Click    ${SELECTOR_AUTOMATION_POINT_EDIT_TYPE_LOCAL_BUTTON}

    Module Selector    ${MODULE_PORT_INPUT_VALUE}    ${MODULE_NUMBER_INPUT_VALUE}    ${MODULE_POINT_VALUE}

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_EDIT_PICTURE_SELECT}    visible    timeout=2s
    Browser.Click    ${SELECTOR_AUTOMATION_POINT_EDIT_PICTURE_SELECT}
    ${option2}=    Set Variable    xpath=//mat-option[@data-qa-id='automation-point-edit-picture-option2']
    Browser.Click    ${option2}

    IF    ${GLOBAL_POINT} != 0
        Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_EDIT_TYPE_GLOBAL_BUTTON}    visible    timeout=2s
        Browser.Click    ${SELECTOR_AUTOMATION_POINT_EDIT_TYPE_GLOBAL_BUTTON}
        ${option2}=    Set Variable
        ...    xpath=//mat-option[@data-qa-id='automation-point-edit-global-info-substation-option2']
        ${option2_visible}=    Run Keyword And Return Status
        ...    Wait For Elements State
        ...    @{option2}
        ...    visible
        ...    timeout=2s
        IF    ${option2_visible}    Browser.Click    ${option2}
        ${pointname_input_visible}=    Run Keyword And Return Status
        ...    Wait For Elements State
        ...    ${SELECTOR_AUTOMATION_POINT_EDIT_GLOBAL_POINTNAME_INPUT}
        ...    visible
        ...    timeout=2s
        IF    ${pointname_input_visible}
            Fill Text    ${SELECTOR_AUTOMATION_POINT_EDIT_GLOBAL_POINTNAME_INPUT}    ${GLOBAL_POINT_NAME}
        END
    END

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_EDIT_SAVE_BUTTON}    visible    timeout=2s
    Browser.Click    ${SELECTOR_AUTOMATION_POINT_EDIT_SAVE_BUTTON}

    Snack-bar Visibility And Content
