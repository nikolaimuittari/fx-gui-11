*** Settings ***
Library     Browser
Resource    navigate.resource
Resource    login.resource
Resource    point_locators.resource
Resource    Device_locators.resource
Resource    global_variables.resource
Resource    automation_locators_id.resource


*** Keywords ***
Add New Freeze Protect
    [Arguments]
    ...    ${point_name}
    ...    ${point_description}
    ...    ${port_number}
    ...    ${module_number}
    ...    ${point_number}
    ...    ${setvalue}
    ...    ${PBand}
    ...    ${alarmLimit}
    ...    ${freezeReturnWaterAI}
    ...    ${freezeFanDO}
    ...    ${freezeValveAO}
    ...    ${freezeAlarmDO}
    ...    ${freezeWarningAlarm}
    ...    ${freezeAck}
    ...    ${ackByButton}

    # Go to automation
    # Go to automation freeze protectors

    Wait For Elements State    ${SELECTOR_AUTOMATION_TOOLBAR_ADD_NEW_BUTTON}    visible    timeout=2s
    Browser.Click    ${SELECTOR_AUTOMATION_TOOLBAR_ADD_NEW_BUTTON}
    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_EDIT_CANCEL_BUTTON}    visible    timeout=2s

    Wait For Elements State    ${SELECTOR_AUTOMATION_FREEZE_EDIT_POINT_ID_INPUT}    visible    timeout=2s
    Fill Text    ${SELECTOR_AUTOMATION_FREEZE_EDIT_POINT_ID_INPUT}    ${point_name}

    Fill Text    ${SELECTOR_AUTOMATION_FREEZE_EDIT_POINT_DESCRIPTION_INPUT}    ${point_description}
    Fill Text    ${SELECTOR_AUTOMATION_FREEZE_EDIT_ACCESS_LEVEL_VIEW_INPUT}    0
    Fill Text    ${SELECTOR_AUTOMATION_FREEZE_EDIT_ACCESS_LEVEL_MANUAL_INPUT}    0
    Fill Text    ${SELECTOR_AUTOMATION_FREEZE_EDIT_ACCESS_LEVEL_PROGRAMMING_INPUT}    0

    # Fill Text    ${SELECTOR_AUTOMATION_POINT_EDIT_MODULE_PORT_INPUT}    ${port_number}
    # Fill Text    ${SELECTOR_AUTOMATION_POINT_EDIT_MODULE_NUMBER_INPUT}    ${module_number}
    # Browser.Click    ${SELECTOR_AUTOMATION_POINT_EDIT_LINK_ICON}
    # Wait For Elements State    ${SELECTOR_AUTOMATION_MODULE_DETAILS_DIALOG_CANCEL_BUTTON}    visible    timeout=2s
    # Browser.Click    ${SELECTOR_AUTOMATION_MODULE_DETAILS_DIALOG_CANCEL_BUTTON}

    # Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_EDIT_MOD_POINT_INPUT}    visible    timeout=2s
    # Fill Text    ${SELECTOR_AUTOMATION_POINT_EDIT_MOD_POINT_INPUT}    ${point_number}

    Module Selector    ${port_number}    ${module_number}    ${point_number}

    Fill Text    ${SELECTOR_AUTOMATION_FREEZE_EDIT_SET_VALUE_INPUT}    ${setvalue}
    Fill Text    ${SELECTOR_AUTOMATION_FREEZE_EDIT_P_BAND_INPUT}    ${PBand}
    Fill Text    ${SELECTOR_AUTOMATION_FREEZE_EDIT_ALARM_LIMIT_INPUT}    ${alarmLimit}
    Fill Text    ${SELECTOR_AUTOMATION_FREEZE_EDIT_RETURN_WATER_AI_INPUT}    ${freezeReturnWaterAI}
    Fill Text    ${SELECTOR_AUTOMATION_FREEZE_EDIT_FAN_DO_INPUT}    ${freezeFanDO}
    Fill Text    ${SELECTOR_AUTOMATION_FREEZE_EDIT_VALVE_AO_INPUT}    ${freezeValveAO}
    Fill Text    ${SELECTOR_AUTOMATION_FREEZE_EDIT_MAIN_ALARM_INPUT}    ${freezeAlarmDO}
    Fill Text    ${SELECTOR_AUTOMATION_FREEZE_EDIT_ALARM_DO_INPUT}    ${freezeFanDO}
    Fill Text    ${SELECTOR_AUTOMATION_FREEZE_EDIT_WARNING_ALARM_INPUT}    ${freezeWarningAlarm}
    Fill Text    ${SELECTOR_AUTOMATION_FREEZE_EDIT_ACK_INPUT}    ${freezeAck}

    Check Checkbox    ${SELECTOR_AUTOMATION_FREEZE_EDIT_ACK_BY_BUTTON_CHKBX}
    Uncheck Checkbox    ${SELECTOR_AUTOMATION_FREEZE_EDIT_ACK_BY_BUTTON_CHKBX}
    Check Checkbox    ${SELECTOR_AUTOMATION_FREEZE_EDIT_ACK_BY_BUTTON_CHKBX}

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_EDIT_ADD_BUTTON}    visible    timeout=2s
    Browser.Click    ${SELECTOR_AUTOMATION_POINT_EDIT_ADD_BUTTON}
    Snack-bar Visibility And Content

Delete Freeze Protect
    [Arguments]    ${point_name}
    # Go to automation
    # Go to automation freeze protectors

    Wait For Elements State    ${SELECTOR_AUTOMATION_TOOLBAR_DELETE_BUTTON}    visible    timeout=2s
    ${full_string}=    Set Variable    xpath=//td[contains(., '${point_name}')]
    # ${full_string}=    Set Variable    xpath=//td[contains(text(), "${point_name} description")]
    Wait For Elements State    ${full_string}    visible    timeout=2s
    Browser.Click    ${full_string}
    Browser.Click    ${SELECTOR_AUTOMATION_TOOLBAR_DELETE_BUTTON}
    Wait For Elements State    ${SELECTOR_CONFIRM_DIALOG_CONFIRM_BUTTON}    visible    timeout=2s
    Browser.Click    ${SELECTOR_CONFIRM_DIALOG_CONFIRM_BUTTON}

    Snack-bar Visibility And Content
    Wait For Elements State    ${full_string}    hidden    timeout=2s

Duplicate Freeze Protect
    [Arguments]    ${point_name}    ${new_point_name}
    # Go to automation
    # Go to automation freeze protectors

    Wait For Elements State    ${SELECTOR_AUTOMATION_TOOLBAR_DUPLICATE_BUTTON}    visible    timeout=2s
    ${full_string}=    Set Variable    xpath=//td[contains(., '${point_name}')]
    # ${full_string}=    Set Variable    xpath=//td[contains(text(), "${point_name} description")]
    Wait For Elements State    ${full_string}    visible    timeout=2s
    Browser.Click    ${full_string}
    Browser.Click    ${SELECTOR_AUTOMATION_TOOLBAR_DUPLICATE_BUTTON}

    Wait For Elements State    ${SELECTOR_AUTOMATION_COPY_POINT_DIALOG_POINT_ID_INPUT}    visible    timeout=2s
    Fill Text    ${SELECTOR_AUTOMATION_COPY_POINT_DIALOG_POINT_ID_INPUT}    ${new_point_name}
    Wait For Elements State    ${SELECTOR_AUTOMATION_COPY_POINT_DIALOG_CREATE_BUTTON}    visible    timeout=2s
    Browser.Click    ${SELECTOR_AUTOMATION_COPY_POINT_DIALOG_CREATE_BUTTON}
    Snack-bar Visibility And Content
    ${full_string}=    Set Variable    xpath=//td[contains(., '${new_point_name}')]
    Wait For Elements State    ${full_string}    visible    timeout=2s

Print Freeze Pointlist
    # Go to automation
    # Go to automation freeze protectors

    Wait For Elements State    ${SELECTOR_AUTOMATION_TOOLBAR_PRINT_BUTTON}    visible    timeout=2s
    Browser.Click    ${SELECTOR_AUTOMATION_TOOLBAR_PRINT_BUTTON}
    Sleep    3s
    Keyboard Key    press    Escape

    Wait For Elements State    ${SELECTOR_AUTOMATION_TOOLBAR_PRINT_BUTTON}    visible    timeout=2s

Edit Freeze Protect
    [Arguments]
    ...    ${point_name}
    ...    ${new_point_name}
    ...    ${point_description}
    ...    ${port_number}
    ...    ${module_number}
    ...    ${point_number}
    ...    ${setvalue}
    ...    ${PBand}
    ...    ${alarmLimit}
    ...    ${freezeReturnWaterAI}
    ...    ${freezeFanDO}
    ...    ${freezeValveAO}
    ...    ${freezeAlarmDO}
    ...    ${freezeWarningAlarm}
    ...    ${freezeAck}
    ...    ${ackByButton}

    # Go to automation
    # Go to automation freeze protectors

    ${full_string}=    Set Variable    xpath=//td[contains(., '${point_name}')]
    # ${full_string}=    Set Variable    xpath=//td[contains(text(), "${point_name} description")]
    Wait For Elements State    ${full_string}    visible    timeout=2s
    Browser.Click    ${full_string}

    Wait For Elements State    ${SELECTOR_AUTOMATION_TOOLBAR_EDIT_BUTTON}    visible    timeout=2s
    Browser.Click    ${SELECTOR_AUTOMATION_TOOLBAR_EDIT_BUTTON}
    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_EDIT_CANCEL_BUTTON}    visible    timeout=2s

    Wait For Elements State    ${SELECTOR_AUTOMATION_FREEZE_EDIT_POINT_ID_INPUT}    visible    timeout=2s
    Fill Text    ${SELECTOR_AUTOMATION_FREEZE_EDIT_POINT_ID_INPUT}    ${new_point_name}

    Fill Text    ${SELECTOR_AUTOMATION_FREEZE_EDIT_POINT_DESCRIPTION_INPUT}    ${point_description}
    Fill Text    ${SELECTOR_AUTOMATION_FREEZE_EDIT_ACCESS_LEVEL_VIEW_INPUT}    0
    Fill Text    ${SELECTOR_AUTOMATION_FREEZE_EDIT_ACCESS_LEVEL_MANUAL_INPUT}    0
    Fill Text    ${SELECTOR_AUTOMATION_FREEZE_EDIT_ACCESS_LEVEL_PROGRAMMING_INPUT}    0

    # Fill Text    ${SELECTOR_AUTOMATION_POINT_EDIT_MODULE_PORT_INPUT}    ${port_number}
    # Fill Text    ${SELECTOR_AUTOMATION_POINT_EDIT_MODULE_NUMBER_INPUT}    ${module_number}
    # Browser.Click    ${SELECTOR_AUTOMATION_POINT_EDIT_LINK_ICON}
    # Wait For Elements State    ${SELECTOR_AUTOMATION_MODULE_DETAILS_DIALOG_CANCEL_BUTTON}    visible    timeout=2s
    # Browser.Click    ${SELECTOR_AUTOMATION_MODULE_DETAILS_DIALOG_CANCEL_BUTTON}

    # Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_EDIT_MOD_POINT_INPUT}    visible    timeout=2s
    # Fill Text    ${SELECTOR_AUTOMATION_POINT_EDIT_MOD_POINT_INPUT}    ${point_number}

    Module Selector    ${port_number}    ${module_number}    ${point_number}

    Fill Text    ${SELECTOR_AUTOMATION_FREEZE_EDIT_SET_VALUE_INPUT}    ${setvalue}
    Fill Text    ${SELECTOR_AUTOMATION_FREEZE_EDIT_P_BAND_INPUT}    ${PBand}
    Fill Text    ${SELECTOR_AUTOMATION_FREEZE_EDIT_ALARM_LIMIT_INPUT}    ${alarmLimit}
    Fill Text    ${SELECTOR_AUTOMATION_FREEZE_EDIT_RETURN_WATER_AI_INPUT}    ${freezeReturnWaterAI}
    Fill Text    ${SELECTOR_AUTOMATION_FREEZE_EDIT_FAN_DO_INPUT}    ${freezeFanDO}
    Fill Text    ${SELECTOR_AUTOMATION_FREEZE_EDIT_VALVE_AO_INPUT}    ${freezeValveAO}
    Fill Text    ${SELECTOR_AUTOMATION_FREEZE_EDIT_MAIN_ALARM_INPUT}    ${freezeAlarmDO}
    Fill Text    ${SELECTOR_AUTOMATION_FREEZE_EDIT_ALARM_DO_INPUT}    ${freezeFanDO}
    Fill Text    ${SELECTOR_AUTOMATION_FREEZE_EDIT_WARNING_ALARM_INPUT}    ${freezeWarningAlarm}
    Fill Text    ${SELECTOR_AUTOMATION_FREEZE_EDIT_ACK_INPUT}    ${freezeAck}

    Check Checkbox    ${SELECTOR_AUTOMATION_FREEZE_EDIT_ACK_BY_BUTTON_CHKBX}
    Uncheck Checkbox    ${SELECTOR_AUTOMATION_FREEZE_EDIT_ACK_BY_BUTTON_CHKBX}
    Check Checkbox    ${SELECTOR_AUTOMATION_FREEZE_EDIT_ACK_BY_BUTTON_CHKBX}

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_EDIT_SAVE_BUTTON}    visible    timeout=2s
    Browser.Click    ${SELECTOR_AUTOMATION_POINT_EDIT_SAVE_BUTTON}

    Snack-bar Visibility And Content
