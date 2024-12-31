*** Settings ***
Library     Browser
Resource    navigate.resource
Resource    login.resource
Resource    point_locators.resource
Resource    global_variables.resource
Resource    automation_locators_id.resource


*** Keywords ***
Add Alarm Group
    [Documentation]
    ...    Creates an Alarm Group object using arguments.
    ...    Requires active position at: Main navigation view -> Automation -> Alarms -> Groups

    [Arguments]    ${group_name}    ${alarm_device}

    Wait For Elements State    ${SELECTOR_AUTOMATION_TOOLBAR_ADD_NEW_BUTTON}    visible    timeout=2s
    Browser.Click    ${SELECTOR_AUTOMATION_TOOLBAR_ADD_NEW_BUTTON}

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_AG_EDIT_GROUP_NAME_INPUT}    visible    timeout=2s
    Fill Text    ${SELECTOR_AUTOMATION_POINT_AG_EDIT_GROUP_NAME_INPUT}    ${group_name}

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_AG_EDIT_TIME_SCHEDULE_SELECT}    visible    timeout=2s
    Browser.Click    ${SELECTOR_AUTOMATION_POINT_AG_EDIT_TIME_SCHEDULE_SELECT}
    ${option2}=    Set Variable    xpath=//mat-option[@data-qa-id="automation-alarm-group-edit-time-schedule-option2"]
    Wait For Elements State    ${option2}    visible    timeout=2s
    Browser.Click    ${option2}

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_AG_EDIT_SYNCHRONIZE_CHKBX}    visible    timeout=2s
    Check Checkbox    ${SELECTOR_AUTOMATION_POINT_AG_EDIT_SYNCHRONIZE_CHKBX}

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_AG_EDIT_STATE1_BUTTONS}    visible    timeout=2s
    Browser.Click    ${SELECTOR_AUTOMATION_POINT_AG_EDIT_STATE1_BUTTONS}

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_AG_EDIT_STATE2_BUTTONS}    visible    timeout=2s
    Browser.Click    ${SELECTOR_AUTOMATION_POINT_AG_EDIT_STATE2_BUTTONS}

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_AG_EDIT_STATE3_BUTTONS}    visible    timeout=2s
    Browser.Click    ${SELECTOR_AUTOMATION_POINT_AG_EDIT_STATE3_BUTTONS}

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_AG_EDIT_STATE4_BUTTONS}    visible    timeout=2s
    Browser.Click    ${SELECTOR_AUTOMATION_POINT_AG_EDIT_STATE4_BUTTONS}

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_AG_EDIT_STATE0_BUTTONS}    visible    timeout=2s
    Browser.Click    ${SELECTOR_AUTOMATION_POINT_AG_EDIT_STATE0_BUTTONS}

    ${alarm_device_row}=    Set Variable
    ...    xpath=//tr[@data-qa-id="automation-alarm-group-edit-device-table-itemNaN"]/td[contains(text(), '${alarm_device}')]
    ${alarm_device_row_visible}=    Run Keyword And Return Status
    ...    Wait For Elements State
    ...    ${alarm_device_row}
    ...    visible
    ...    timeout=2s
    IF    ${alarm_device_row_visible}
        Log To Console    Alalrm device ${alarm_device_row} table row is visible
        Browser.Click    ${alarm_device_row}
    END

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_AG_EDIT_ADD_BUTTON}    visible    timeout=2s
    Browser.Click    ${SELECTOR_AUTOMATION_POINT_AG_EDIT_ADD_BUTTON}

    Snack-bar Visibility And Content

Delete Alarm Group
    [Documentation]
    ...    Removes an Alarm Group object using arguments.
    ...    Requires active position at: Main navigation view -> Automation -> Alarms -> Groups

    [Arguments]    ${group_name}

    ${compiled_text}=    Set Variable    xpath=//td[contains(., '${group_name}')]

    Wait For Elements State    ${compiled_text}    visible    timeout=2s
    Browser.Click    ${compiled_text}

    Wait For Elements State    ${SELECTOR_AUTOMATION_TOOLBAR_DELETE_BUTTON}    visible    timeout=2s
    Browser.Click    ${SELECTOR_AUTOMATION_TOOLBAR_DELETE_BUTTON}

    ${point_xpath_variable}=    Set Variable
    ...    //app-confirm-dialog[@class="ng-star-inserted"]//p[text()='${group_name}']
    Wait For Elements State    ${point_xpath_variable}    visible    timeout=2s
    Wait For Elements State    ${SELECTOR_CONFIRM_DIALOG_CONFIRM_BUTTON}    visible    timeout=2s
    Browser.Click    ${SELECTOR_CONFIRM_DIALOG_CONFIRM_BUTTON}
    Snack-bar Visibility And Content
    Wait For Elements State    ${compiled_text}    hidden    timeout=2s

Edit Alarm Group
    [Documentation]
    ...    Opend Alarm Group object for editing and changes parameters using arguments.
    ...    Requires active position at: Main navigation view -> Automation -> Alarms -> Groups

    [Arguments]    ${group_name}    ${alarm_device}

    ${compiled_text}=    Set Variable    xpath=//td[contains(., '${group_name}')]

    Wait For Elements State    ${compiled_text}    visible    timeout=2s
    Browser.Click    ${compiled_text}

    Wait For Elements State    ${SELECTOR_AUTOMATION_TOOLBAR_EDIT_BUTTON}    visible    timeout=2s
    Browser.Click    ${SELECTOR_AUTOMATION_TOOLBAR_EDIT_BUTTON}

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_AG_EDIT_GROUP_NAME_INPUT}    visible    timeout=2s
    Fill Text    ${SELECTOR_AUTOMATION_POINT_AG_EDIT_GROUP_NAME_INPUT}    ${group_name}

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_AG_EDIT_TIME_SCHEDULE_SELECT}    visible    timeout=2s
    Browser.Click    ${SELECTOR_AUTOMATION_POINT_AG_EDIT_TIME_SCHEDULE_SELECT}
    ${option2}=    Set Variable    xpath=//mat-option[@data-qa-id="automation-alarm-group-edit-time-schedule-option2"]
    Wait For Elements State    ${option2}    visible    timeout=2s
    Browser.Click    ${option2}

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_AG_EDIT_SYNCHRONIZE_CHKBX}    visible    timeout=2s
    Check Checkbox    ${SELECTOR_AUTOMATION_POINT_AG_EDIT_SYNCHRONIZE_CHKBX}

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_AG_EDIT_STATE1_BUTTONS}    visible    timeout=2s
    Browser.Click    ${SELECTOR_AUTOMATION_POINT_AG_EDIT_STATE1_BUTTONS}

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_AG_EDIT_STATE2_BUTTONS}    visible    timeout=2s
    Browser.Click    ${SELECTOR_AUTOMATION_POINT_AG_EDIT_STATE2_BUTTONS}

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_AG_EDIT_STATE3_BUTTONS}    visible    timeout=2s
    Browser.Click    ${SELECTOR_AUTOMATION_POINT_AG_EDIT_STATE3_BUTTONS}

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_AG_EDIT_STATE4_BUTTONS}    visible    timeout=2s
    Browser.Click    ${SELECTOR_AUTOMATION_POINT_AG_EDIT_STATE4_BUTTONS}

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_AG_EDIT_STATE0_BUTTONS}    visible    timeout=2s
    Browser.Click    ${SELECTOR_AUTOMATION_POINT_AG_EDIT_STATE0_BUTTONS}

    ${alarm_device_row}=    Set Variable
    ...    xpath=//tr[@data-qa-id="automation-alarm-group-edit-device-table-itemNaN"]/td[contains(text(), '${alarm_device}')]
    ${alarm_device_row_visible}=    Run Keyword And Return Status
    ...    Wait For Elements State
    ...    ${alarm_device_row}
    ...    visible
    ...    timeout=2s
    IF    ${alarm_device_row_visible}
        Log To Console    Alalrm device ${alarm_device_row} table row is visible
        Browser.Click    ${alarm_device_row}
    END

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_AG_EDIT_SAVE_BUTTON}    visible    timeout=2s
    Browser.Click    ${SELECTOR_AUTOMATION_POINT_AG_EDIT_SAVE_BUTTON}

    Snack-bar Visibility And Content

Print Alarm groups
    [Documentation]
    ...    Tries to print Alarm Group object list.
    ...    Requires active position at: Main navigation view -> Automation -> Alarms -> Groups

    Wait For Elements State    ${SELECTOR_AUTOMATION_TOOLBAR_PRINT_BUTTON}    visible    timeout=2s
    Browser.Click    ${SELECTOR_AUTOMATION_TOOLBAR_PRINT_BUTTON}
    Sleep    3s
    Keyboard Key    press    Escape

    Wait For Elements State    ${SELECTOR_AUTOMATION_TOOLBAR_PRINT_BUTTON}    visible    timeout=2s
