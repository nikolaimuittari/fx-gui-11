*** Settings ***
Library     Browser
Library     RPA.JavaAccessBridge
Resource    navigate.resource
Resource    login.resource
Resource    point_locators.resource
Resource    global_variables.resource
Resource    automation_locators_id.resource


*** Keywords ***
Add New DI Point
    [Arguments]
    ...    ${POINT_ID_INPUT_VALUE}
    ...    ${POINT_DESCRIPTION_INPUT_VALUE}
    ...    ${ACCESS_LEVEL_VIEW_INPUT_VALUE}
    ...    ${ACCESS_LEVEL_MANUAL_INPUT_VALUE}
    ...    ${ACCESS_LEVEL_PROGRAMMING_INPUT_VALUE}
    ...    ${MODULE_PORT_INPUT_VALUE}
    ...    ${MODULE_NUMBER_INPUT_VALUE}
    ...    ${MODULE_POINT_VALUE}
    ...    ${START_DELAY_VALUE}
    ...    ${STOP_DELAY_VALUE}
    ...    ${GLOBAL_POINT}
    ...    ${GLOBAL_SUBSTATION_NAME}
    ...    ${GLOBAL_POINT_NAME}

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

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_EDIT_STATE_TEXT_SELECT}    visible    timeout=2s
    Browser.Click    ${SELECTOR_AUTOMATION_POINT_EDIT_STATE_TEXT_SELECT}
    ${option2}=    Set Variable    xpath=//mat-option[@data-qa-id="automation-point-edit-state-text-option2"]
    Browser.Click    ${option2}

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_EDIT_START_DELAY_INPUT}    visible    timeout=2s
    Fill Text    ${SELECTOR_AUTOMATION_POINT_EDIT_START_DELAY_INPUT}    ${START_DELAY_VALUE}

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_EDIT_STOP_DELAY_INPUT}    visible    timeout=2s
    Fill Text    ${SELECTOR_AUTOMATION_POINT_EDIT_STOP_DELAY_INPUT}    ${STOP_DELAY_VALUE}

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_EDIT_TRISTATE_CHKBX}    visible    timeout=2s
    Check Checkbox    ${SELECTOR_AUTOMATION_POINT_EDIT_TRISTATE_CHKBX}

    Uncheck Checkbox    ${SELECTOR_AUTOMATION_POINT_EDIT_TRISTATE_CHKBX}

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_EDIT_CLOSED_CONTACT_CHKBX}    visible    timeout=2s
    Check Checkbox    ${SELECTOR_AUTOMATION_POINT_EDIT_CLOSED_CONTACT_CHKBX}

    Uncheck Checkbox    ${SELECTOR_AUTOMATION_POINT_EDIT_CLOSED_CONTACT_CHKBX}

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

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_EDIT_PICTURE_SELECT}    visible    timeout=2s
    Browser.Click    ${SELECTOR_AUTOMATION_POINT_EDIT_PICTURE_SELECT}
    ${option2}=    Set Variable    xpath=//mat-option[@data-qa-id='automation-point-edit-picture-option2']
    Browser.Click    ${option2}

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_EDIT_ADD_BUTTON}    visible    timeout=2s
    Browser.Click    ${SELECTOR_AUTOMATION_POINT_EDIT_ADD_BUTTON}

    Snack-bar Visibility And Content

Delete DI Point
    [Arguments]
    ...    ${POINT_ID_INPUT_VALUE}

    ${compiled_text}=    Set Variable    xpath=//td[contains(., '${POINT_ID_INPUT_VALUE}')]

    Wait For Elements State    ${compiled_text}    visible    timeout=2s
    Browser.Click    ${compiled_text}

    Wait For Elements State    ${SELECTOR_AUTOMATION_TOOLBAR_DELETE_BUTTON}    visible    timeout=2s
    Browser.Click    ${SELECTOR_AUTOMATION_TOOLBAR_DELETE_BUTTON}

    ${point_xpath_variable}=    Set Variable    xpath=//td[contains(., '${POINT_ID_INPUT_VALUE}')]
    Wait For Elements State    ${point_xpath_variable}    visible    timeout=2s
    Wait For Elements State    ${SELECTOR_CONFIRM_DIALOG_CONFIRM_BUTTON}    visible    timeout=2s
    Browser.Click    ${SELECTOR_CONFIRM_DIALOG_CONFIRM_BUTTON}
    Snack-bar Visibility And Content
    Wait For Elements State    ${compiled_text}    hidden    timeout=2s

Duplicate DI Point
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
    Go to automation indications
    ${xpath_variable}=    Set Variable    xpath=//td[contains(., '${POINT_NEW_NAME}')]

    Wait For Elements State    ${xpath_variable}    visible    timeout=2s

Print DI Pointlist

    Wait For Elements State    ${SELECTOR_AUTOMATION_TOOLBAR_PRINT_BUTTON}    visible    timeout=2s
    Browser.Click    ${SELECTOR_AUTOMATION_TOOLBAR_PRINT_BUTTON}
    Sleep    3s
    Keyboard Key    press    Escape

    Wait For Elements State    ${SELECTOR_AUTOMATION_TOOLBAR_PRINT_BUTTON}    visible    timeout=2s

Edit DI Point
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
    ...    ${START_DELAY_VALUE}
    ...    ${STOP_DELAY_VALUE}
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

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_EDIT_STATE_TEXT_SELECT}    visible    timeout=2s
    Browser.Click    ${SELECTOR_AUTOMATION_POINT_EDIT_STATE_TEXT_SELECT}
    ${option2}=    Set Variable    xpath=//mat-option[@data-qa-id="automation-point-edit-state-text-option2"]
    Browser.Click    ${option2}

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_EDIT_START_DELAY_INPUT}    visible    timeout=2s
    Fill Text    ${SELECTOR_AUTOMATION_POINT_EDIT_START_DELAY_INPUT}    ${START_DELAY_VALUE}

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_EDIT_STOP_DELAY_INPUT}    visible    timeout=2s
    Fill Text    ${SELECTOR_AUTOMATION_POINT_EDIT_STOP_DELAY_INPUT}    ${STOP_DELAY_VALUE}

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_EDIT_TRISTATE_CHKBX}    visible    timeout=2s
    Check Checkbox    ${SELECTOR_AUTOMATION_POINT_EDIT_TRISTATE_CHKBX}

    Uncheck Checkbox    ${SELECTOR_AUTOMATION_POINT_EDIT_TRISTATE_CHKBX}

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_EDIT_CLOSED_CONTACT_CHKBX}    visible    timeout=2s
    Check Checkbox    ${SELECTOR_AUTOMATION_POINT_EDIT_CLOSED_CONTACT_CHKBX}

    Uncheck Checkbox    ${SELECTOR_AUTOMATION_POINT_EDIT_CLOSED_CONTACT_CHKBX}

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

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_EDIT_SAVE_BUTTON}    visible    timeout=2s
    Browser.Click    ${SELECTOR_AUTOMATION_POINT_EDIT_SAVE_BUTTON}

    Snack-bar Visibility And Content
