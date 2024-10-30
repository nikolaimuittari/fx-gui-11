*** Settings ***
Library     Browser
Resource    navigate.resource
Resource    login.resource
Resource    point_locators.resource
Resource    global_variables.resource
Resource    automation_locators_id.resource


*** Keywords ***
Add New Alarm Point
    [Arguments]    ${point_name}    ${alarm_type}    ${port}    ${module}    ${point}

    # Go to automation
    # Go to automation alarm points

    Wait For Elements State    ${SELECTOR_AUTOMATION_TOOLBAR_ADD_NEW_BUTTON}    visible    timeout=2s
    Browser.Click    ${SELECTOR_AUTOMATION_TOOLBAR_ADD_NEW_BUTTON}

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_EDIT_POINT_ID_INPUT}
    Fill Text    ${SELECTOR_AUTOMATION_POINT_EDIT_POINT_ID_INPUT}    ${point_name}

    ${rnd_string}=    Generate Random String    32
    Fill Text    ${SELECTOR_AUTOMATION_POINT_EDIT_POINT_DESCRIPTION_INPUT}    ${rnd_string}

    Fill Text    ${SELECTOR_AUTOMATION_POINT_EDIT_ACCESS_LEVEL_VIEW_INPUT}    0
    Fill Text    ${SELECTOR_AUTOMATION_POINT_EDIT_ACCESS_LEVEL_MANUAL_INPUT}    0
    Fill Text    ${SELECTOR_AUTOMATION_POINT_EDIT_ACCESS_LEVEL_PROGRAMMING_INPUT}    0

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_EDIT_TYPE_GLOBAL_BUTTON}    visible    timeout=2s
    Browser.Click    ${SELECTOR_AUTOMATION_POINT_EDIT_TYPE_GLOBAL_BUTTON}

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_EDIT_GLOBAL_SUBSTATION_SELECT}    visible    timeout=2s
    # ${rnd_substation}=    Generate Random String    3    [UPPER]
    # Fill Text    ${SELECTOR_AUTOMATION_POINT_EDIT_GLOBAL_SUBSTATION_SELECT}    VAK_${rnd_substation}

    Browser.Click    ${SELECTOR_AUTOMATION_POINT_EDIT_GLOBAL_SUBSTATION_SELECT}
    ${substation_option_2}=    Set Variable
    ...    xpath= //mat-option[@data-qa-id='automation-point-edit-global-info-substation-option2']
    ${global_substation}=    Run Keyword And Return Status
    ...    Wait For Elements State
    ...    ${substation_option_2}
    ...    visible
    ...    timeout=2s
    IF    ${global_substation}    Browser.Click    ${substation_option_2}

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_EDIT_GLOBAL_POINTNAME_INPUT}    visible    timeout=2s
    ${rnd_pointname}=    Generate Random Point Name    AP    H    _
    Fill Text    ${SELECTOR_AUTOMATION_POINT_EDIT_GLOBAL_POINTNAME_INPUT}    ${rnd_pointname}

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_EDIT_TYPE_LOCAL_BUTTON}    visible    timeout=2s
    Browser.Click    ${SELECTOR_AUTOMATION_POINT_EDIT_TYPE_LOCAL_BUTTON}

    Module Selector    ${port}    ${module}    ${point}

    # Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_EDIT_MODULE_PORT_INPUT}    visible    timeout=2s
    # Fill Text    ${SELECTOR_AUTOMATION_POINT_EDIT_MODULE_PORT_INPUT}    ${port}
    # Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_EDIT_MODULE_NUMBER_INPUT}    visible    timeout=2s
    # Fill Text    ${SELECTOR_AUTOMATION_POINT_EDIT_MODULE_NUMBER_INPUT}    ${module}

    # Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_EDIT_LINK_ICON}    visible    timeout=2s
    # Browser.Click    ${SELECTOR_AUTOMATION_POINT_EDIT_LINK_ICON}

    # Wait For Elements State    ${SELECTOR_AUTOMATION_MODULE_VIEW_DIALOG_CANCEL_BUTTON}    visible    timeout=2s
    # # Wait For Elements State    ${SELECTOR_AUTOMATION_MODULE_VIEW_DIALOG_TABLE1_ROW1}    visible    timeout=2s
    # ${module_table_visible}=    Run Keyword And Return Status    Wait For Elements State    ${SELECTOR_AUTOMATION_MODULE_VIEW_DIALOG_TABLE1_ROW1}    visible    timeout=2s
    # IF    ${module_table_visible}
    #    Browser.Click    ${SELECTOR_AUTOMATION_MODULE_VIEW_DIALOG_TABLE1_ROW1}
    #    Browser.Click    ${SELECTOR_AUTOMATION_MODULE_VIEW_DIALOG_TABLE1_ROW2}
    #    Browser.Click    ${SELECTOR_AUTOMATION_MODULE_VIEW_DIALOG_TABLE1_ROW3}
    #    Browser.Click    ${SELECTOR_AUTOMATION_MODULE_VIEW_DIALOG_TABLE1_ROW4}
    #    Browser.Click    ${SELECTOR_AUTOMATION_MODULE_VIEW_DIALOG_TABLE1_ROW5}
    #    Browser.Click    ${SELECTOR_AUTOMATION_MODULE_VIEW_DIALOG_TABLE1_ROW6}
    #    Browser.Click    ${SELECTOR_AUTOMATION_MODULE_VIEW_DIALOG_TABLE1_ROW7}
    #    Browser.Click    ${SELECTOR_AUTOMATION_MODULE_VIEW_DIALOG_TABLE1_ROW8}

    #    Browser.Click    ${SELECTOR_AUTOMATION_MODULE_VIEW_DIALOG_CANCEL_BUTTON}
    # ELSE
    #    Browser.Click    ${SELECTOR_AUTOMATION_MODULE_VIEW_DIALOG_CANCEL_BUTTON}
    # END

    # Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_EDIT_MOD_POINT_INPUT}    visible    timeout=2s
    # Fill Text    ${SELECTOR_AUTOMATION_POINT_EDIT_MOD_POINT_INPUT}    ${point}

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_EDIT_STATE_TEXT_SELECT}    visible    timeout=2s
    Browser.Click    ${SELECTOR_AUTOMATION_POINT_EDIT_STATE_TEXT_SELECT}

    ${state_text_option_2}=    Set Variable
    ...    xpath= //mat-option[@data-qa-id='automation-point-edit-state-text-option2']

    Wait For Elements State    ${state_text_option_2}    visible    timeout=2s
    Browser.Click    ${state_text_option_2}

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_EDIT_START_DELAY_INPUT}    visible    timeout=2s
    Fill Text    ${SELECTOR_AUTOMATION_POINT_EDIT_START_DELAY_INPUT}    180

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_EDIT_STOP_DELAY_INPUT}    visible    timeout=2s
    Fill Text    ${SELECTOR_AUTOMATION_POINT_EDIT_STOP_DELAY_INPUT}    90

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_AP_EDIT_ALERTA_NUMBER_INPUT}    visible    timeout=2s
    Fill Text    ${SELECTOR_AUTOMATION_POINT_AP_EDIT_ALERTA_NUMBER_INPUT}    1234

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_AP_EDIT_NORMALLY_CLOSED_CHKBX}    visible    timeout=2s
    Check Checkbox    ${SELECTOR_AUTOMATION_POINT_AP_EDIT_NORMALLY_CLOSED_CHKBX}
    Uncheck Checkbox    ${SELECTOR_AUTOMATION_POINT_AP_EDIT_NORMALLY_CLOSED_CHKBX}
    Check Checkbox    ${SELECTOR_AUTOMATION_POINT_AP_EDIT_NORMALLY_CLOSED_CHKBX}

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_AP_EDIT_PRIORITY_INPUT}    visible    timeout=2s
    Fill Text    ${SELECTOR_AUTOMATION_POINT_AP_EDIT_PRIORITY_INPUT}    99    # max 99

    ${save_log_option_1}=    Set Variable
    ...    xpath= //mat-option[@data-qa-id='automation-point-edit-save-log-option1']
    ${save_log_option_2}=    Set Variable
    ...    xpath= //mat-option[@data-qa-id='automation-point-edit-save-log-option2']
    ${save_log_option_3}=    Set Variable
    ...    xpath= //mat-option[@data-qa-id='automation-point-edit-save-log-option3']
    ${save_log_option_4}=    Set Variable
    ...    xpath= //mat-option[@data-qa-id='automation-point-edit-save-log-option4']

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_AP_EDIT_SAVE_LOG_SELECT}    visible    timeout=2s
    Browser.Click    ${SELECTOR_AUTOMATION_POINT_AP_EDIT_SAVE_LOG_SELECT}
    Wait For Elements State    ${save_log_option_1}    visible    timeout=2s
    Browser.Click    ${save_log_option_1}
    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_AP_EDIT_SAVE_LOG_SELECT}    visible    timeout=2s
    Browser.Click    ${SELECTOR_AUTOMATION_POINT_AP_EDIT_SAVE_LOG_SELECT}
    Wait For Elements State    ${save_log_option_2}    visible    timeout=2s
    Browser.Click    ${save_log_option_2}
    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_AP_EDIT_SAVE_LOG_SELECT}    visible    timeout=2s
    Browser.Click    ${SELECTOR_AUTOMATION_POINT_AP_EDIT_SAVE_LOG_SELECT}
    Wait For Elements State    ${save_log_option_3}    visible    timeout=2s
    Browser.Click    ${save_log_option_3}
    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_AP_EDIT_SAVE_LOG_SELECT}    visible    timeout=2s
    Browser.Click    ${SELECTOR_AUTOMATION_POINT_AP_EDIT_SAVE_LOG_SELECT}
    Wait For Elements State    ${save_log_option_4}    visible    timeout=2s
    Browser.Click    ${save_log_option_4}

# TO DO
# When GUI will be fixed, replace with option number xpath

    # Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_AP_EDIT_ALARM_GROUP_SELECT}    visible    timeout=2s
    # Browser.Click    ${SELECTOR_AUTOMATION_POINT_AP_EDIT_ALARM_GROUP_SELECT}

    # ${alarm_group_option_2}=    Set Variable
    # ...    xpath= //mat-option[@data-qa-id='automation-point-edit-alarm-group-optionNaN']/span[contains(text(), 'GROUP_01')]

    # Wait For Elements State    ${alarm_group_option_2}    visible    timeout=2s
    # Browser.Click    ${alarm_group_option_2}

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_AP_EDIT_PICTURE_SELECT}    visible    timeout=2s
    Browser.Click    ${SELECTOR_AUTOMATION_POINT_AP_EDIT_PICTURE_SELECT}

    ${picture_option_2}=    Set Variable
    ...    xpath= //mat-option[@data-qa-id='automation-point-edit-picture-option2']
    Wait For Elements State    ${picture_option_2}    visible    timeout=2s
    Browser.Click    ${picture_option_2}

    IF    $alarm_type.lower() == 'normal'
        Wait For Elements State
        ...    ${SELECTOR_AUTOMATION_POINT_AP_EDIT_ALARM_TYPE_NORMAL_BUTTON}
        ...    visible
        ...    timeout=2s
        Browser.Click    ${SELECTOR_AUTOMATION_POINT_AP_EDIT_ALARM_TYPE_NORMAL_BUTTON}

        ${rnd_pointname}=    Generate Random Point Name    first_part=DI    last_part=FI    delimiter=_
        Wait For Elements State
        ...    ${SELECTOR_AUTOMATION_POINT_AP_EDIT_NORMAL_LOCK_POINT_ID_INPUT}
        ...    visible
        ...    timeout=2s
        Fill Text    ${SELECTOR_AUTOMATION_POINT_AP_EDIT_NORMAL_LOCK_POINT_ID_INPUT}    ${rnd_pointname}
        Wait For Elements State
        ...    ${SELECTOR_AUTOMATION_POINT_AP_EDIT_NORMAL_LOCK_POINT_STATE_INPUT}
        ...    visible
        ...    timeout=2s
        Fill Text    ${SELECTOR_AUTOMATION_POINT_AP_EDIT_NORMAL_LOCK_POINT_STATE_INPUT}    255    # max 255
    ELSE IF    $alarm_type.lower() == 'limit'
        Wait For Elements State
        ...    ${SELECTOR_AUTOMATION_POINT_AP_EDIT_ALARM_TYPE_LIMIT_BUTTON}
        ...    visible
        ...    timeout=2s
        Browser.Click    ${SELECTOR_AUTOMATION_POINT_AP_EDIT_ALARM_TYPE_LIMIT_BUTTON}

        ${rnd_pointname}=    Generate Random Point Name    first_part=DI    last_part=FI    delimiter=_
        Wait For Elements State
        ...    ${SELECTOR_AUTOMATION_POINT_AP_EDIT_NORMAL_LOCK_POINT_ID_INPUT}
        ...    visible
        ...    timeout=2s
        Fill Text    ${SELECTOR_AUTOMATION_POINT_AP_EDIT_NORMAL_LOCK_POINT_ID_INPUT}    ${rnd_pointname}
        Wait For Elements State
        ...    ${SELECTOR_AUTOMATION_POINT_AP_EDIT_NORMAL_LOCK_POINT_STATE_INPUT}
        ...    visible
        ...    timeout=2s
        Fill Text    ${SELECTOR_AUTOMATION_POINT_AP_EDIT_NORMAL_LOCK_POINT_STATE_INPUT}    255    # max 255

        ${rnd_pointname}=    Generate Random Point Name    first_part=AI    last_part=M    delimiter=_
        Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_AP_EDIT_LIMIT_POINT_ID_INPUT}    visible    timeout=2s
        Fill Text    ${SELECTOR_AUTOMATION_POINT_AP_EDIT_LIMIT_POINT_ID_INPUT}    ${rnd_pointname}

        Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_AP_EDIT_LIMIT1_MODE_SELECT}    visible    timeout=2s
        Browser.Click    ${SELECTOR_AUTOMATION_POINT_AP_EDIT_LIMIT1_MODE_SELECT}
        ${value_option_lower}=    Set Variable
        ...    xpath= //mat-option[@data-qa-id='automation-point-edit-alarm-options-limit1-mode-option1']
        ${value_option_higher}=    Set Variable
        ...    xpath= //mat-option[@data-qa-id='automation-point-edit-alarm-options-limit1-mode-option2']

        Browser.Click    ${value_option_higher}
        Browser.Click    ${SELECTOR_AUTOMATION_POINT_AP_EDIT_LIMIT1_MODE_SELECT}
        Browser.Click    ${value_option_higher}

        Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_AP_LIMIT_LIMIT_1_SELECT}    visible    timeout=2s
        Browser.Click    ${SELECTOR_AUTOMATION_POINT_AP_LIMIT_LIMIT_1_SELECT}
        Browser.Click    ${SELECTOR_AUTOMATION_POINT_AP_LIMIT_OPTION_1}

        Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_AP_LIMIT_LIMIT_1_SELECT}    visible    timeout=2s
        Browser.Click    ${SELECTOR_AUTOMATION_POINT_AP_LIMIT_LIMIT_1_SELECT}
        Browser.Click    ${SELECTOR_AUTOMATION_POINT_AP_LIMIT_OPTION_2}

        Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_AP_LIMIT_LIMIT_1_SELECT}    visible    timeout=2s
        Browser.Click    ${SELECTOR_AUTOMATION_POINT_AP_LIMIT_LIMIT_1_SELECT}
        Browser.Click    ${SELECTOR_AUTOMATION_POINT_AP_LIMIT_OPTION_3}

        Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_AP_LIMIT_LIMIT_1_SELECT}    visible    timeout=2s
        Browser.Click    ${SELECTOR_AUTOMATION_POINT_AP_LIMIT_LIMIT_1_SELECT}
        Browser.Click    ${SELECTOR_AUTOMATION_POINT_AP_LIMIT_OPTION_4}

        # Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_AP_EDIT_LIMIT1_LIMIT_INPUT}    visible    timeout=2s
        # Fill Text    ${SELECTOR_AUTOMATION_POINT_AP_EDIT_LIMIT1_LIMIT_INPUT}    1

        Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_AP_EDIT_LIMIT_OPERATION_SELECT}    visible    timeout=2s
        Browser.Click    ${SELECTOR_AUTOMATION_POINT_AP_EDIT_LIMIT_OPERATION_SELECT}
        Wait For Elements State
        ...    ${SELECTOR_AUTOMATION_POINT_AP_LIMIT_OPTIONS_OPERATION_OPTION1}
        ...    visible
        ...    timeout=2s
        Browser.Click    ${SELECTOR_AUTOMATION_POINT_AP_LIMIT_OPTIONS_OPERATION_OPTION1}

        Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_AP_EDIT_LIMIT_OPERATION_SELECT}    visible    timeout=2s
        Browser.Click    ${SELECTOR_AUTOMATION_POINT_AP_EDIT_LIMIT_OPERATION_SELECT}
        Wait For Elements State
        ...    ${SELECTOR_AUTOMATION_POINT_AP_LIMIT_OPTIONS_OPERATION_OPTION2}
        ...    visible
        ...    timeout=2s
        Browser.Click    ${SELECTOR_AUTOMATION_POINT_AP_LIMIT_OPTIONS_OPERATION_OPTION2}

        Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_AP_EDIT_LIMIT_OPERATION_SELECT}    visible    timeout=2s
        Browser.Click    ${SELECTOR_AUTOMATION_POINT_AP_EDIT_LIMIT_OPERATION_SELECT}
        Wait For Elements State
        ...    ${SELECTOR_AUTOMATION_POINT_AP_LIMIT_OPTIONS_OPERATION_OPTION3}
        ...    visible
        ...    timeout=2s
        Browser.Click    ${SELECTOR_AUTOMATION_POINT_AP_LIMIT_OPTIONS_OPERATION_OPTION3}

        # ${operation_option_none}=    Set Variable
        # ...    xpath= //mat-option[@data-qa-id='automation-point-edit-alarm-options-operation-option1']
        # ${operation_option_and}=    Set Variable
        # ...    xpath= //mat-option[@data-qa-id='automation-point-edit-alarm-options-operation-option2']
        # ${operation_option_or}=    Set Variable
        # ...    xpath= //mat-option[@data-qa-id='automation-point-edit-alarm-options-operation-option3']
        # Browser.Click    ${operation_option_and}

        Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_AP_LIMIT_OPTIONS_LIMIT2_MODE}    visible    timeout=2s
        Browser.Click    ${SELECTOR_AUTOMATION_POINT_AP_LIMIT_OPTIONS_LIMIT2_MODE}
        Wait For Elements State
        ...    ${SELECTOR_AUTOMATION_POINT_AP_LIMIT_OPTIONS_LIMIT2_MODE_OPTION1}
        ...    visible
        ...    timeout=2s
        Browser.Click    ${SELECTOR_AUTOMATION_POINT_AP_LIMIT_OPTIONS_LIMIT2_MODE_OPTION1}

        Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_AP_LIMIT_OPTIONS_LIMIT2_MODE}    visible    timeout=2s
        Browser.Click    ${SELECTOR_AUTOMATION_POINT_AP_LIMIT_OPTIONS_LIMIT2_MODE}
        Wait For Elements State
        ...    ${SELECTOR_AUTOMATION_POINT_AP_LIMIT_OPTIONS_LIMIT2_MODE_OPTION2}
        ...    visible
        ...    timeout=2s
        Browser.Click    ${SELECTOR_AUTOMATION_POINT_AP_LIMIT_OPTIONS_LIMIT2_MODE_OPTION2}

        # ${value_option_lower}=    Set Variable
        # ...    xpath= //mat-option[@data-qa-id='automation-point-edit-alarm-options-limit2-mode-option1']
        # ${value_option_higher}=    Set Variable
        # ...    xpath= //mat-option[@data-qa-id='automation-point-edit-alarm-options-limit2-mode-option2']
        # Browser.Click    ${value_option_lower}

        # Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_AP_EDIT_LIMIT2_LIMIT_INPUT}    visible    timeout=2s
        # Fill Text    ${SELECTOR_AUTOMATION_POINT_AP_EDIT_LIMIT2_LIMIT_INPUT}    2

        Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_AP_EDIT_LIMIT_DEAD_ZONE_INPUT}    visible    timeout=2s
        Fill Text    ${SELECTOR_AUTOMATION_POINT_AP_EDIT_LIMIT_DEAD_ZONE_INPUT}    0.5

        Check Checkbox    ${SELECTOR_AUTOMATION_POINT_AP_LIMIT_RESET_MEASUREMENT_CHKBX}
        Uncheck Checkbox    ${SELECTOR_AUTOMATION_POINT_AP_LIMIT_RESET_MEASUREMENT_CHKBX}
    ELSE IF    $alarm_type.lower() == 'module'
        Wait For Elements State
        ...    ${SELECTOR_AUTOMATION_POINT_AP_EDIT_ALARM_TYPE_MODULE_BUTTON}
        ...    visible
        ...    timeout=2s
        Browser.Click    ${SELECTOR_AUTOMATION_POINT_AP_EDIT_ALARM_TYPE_MODULE_BUTTON}

        ${rnd_pointname}=    Generate Random Point Name    first_part=DI    last_part=FI    delimiter=_
        Wait For Elements State
        ...    ${SELECTOR_AUTOMATION_POINT_AP_EDIT_NORMAL_LOCK_POINT_ID_INPUT}
        ...    visible
        ...    timeout=2s
        Fill Text    ${SELECTOR_AUTOMATION_POINT_AP_EDIT_NORMAL_LOCK_POINT_ID_INPUT}    ${rnd_pointname}
        Wait For Elements State
        ...    ${SELECTOR_AUTOMATION_POINT_AP_EDIT_NORMAL_LOCK_POINT_STATE_INPUT}
        ...    visible
        ...    timeout=2s
        Fill Text    ${SELECTOR_AUTOMATION_POINT_AP_EDIT_NORMAL_LOCK_POINT_STATE_INPUT}    255    # max 255

        Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_AP_EDIT_MODULE_TYPE_PORT_INPUT}    visible    timeout=2s
        Fill Text    ${SELECTOR_AUTOMATION_POINT_AP_EDIT_MODULE_TYPE_PORT_INPUT}    ${port}
        Wait For Elements State
        ...    ${SELECTOR_AUTOMATION_POINT_AP_EDIT_MODULE_TYPE_MODULE_INPUT}
        ...    visible
        ...    timeout=2s
        Fill Text    ${SELECTOR_AUTOMATION_POINT_AP_EDIT_MODULE_TYPE_MODULE_INPUT}    ${module}

        # Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_AP_LINK_ICON}    visible    timeout=2s
        # ${SELECTOR_AUTOMATION_POINT_AP_LINK_ICON}

        Wait For Elements State
        ...    ${SELECTOR_AUTOMATION_POINT_AP_MODULE_TYPE_SENSITIVITY_INPUT}
        ...    visible
        ...    timeout=2s
        Fill Text    ${SELECTOR_AUTOMATION_POINT_AP_MODULE_TYPE_SENSITIVITY_INPUT}    30
    ELSE    # Conflict
        Wait For Elements State
        ...    ${SELECTOR_AUTOMATION_POINT_AP_EDIT_ALARM_TYPE_CONFLICT_BUTTON}
        ...    visible
        ...    timeout=2s
        Browser.Click    ${SELECTOR_AUTOMATION_POINT_AP_EDIT_ALARM_TYPE_CONFLICT_BUTTON}

        ${rnd_pointname}=    Generate Random Point Name    first_part=DI    last_part=FI    delimiter=_
        Wait For Elements State
        ...    ${SELECTOR_AUTOMATION_POINT_AP_EDIT_NORMAL_LOCK_POINT_ID_INPUT}
        ...    visible
        ...    timeout=2s
        Fill Text    ${SELECTOR_AUTOMATION_POINT_AP_EDIT_NORMAL_LOCK_POINT_ID_INPUT}    ${rnd_pointname}
        Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_AP_EDIT_NORMAL_LOCK_POINT_STATE_INPUT}
        Fill Text    ${SELECTOR_AUTOMATION_POINT_AP_EDIT_NORMAL_LOCK_POINT_STATE_INPUT}    255    # max 255

        Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_AP_CONFLICT_POINT_ID_1_INPUT}    visible    timeout=2s
        ${rnd_pointname}=    Generate Random Point Name    first_part=DI    last_part=FI    delimiter=_
        Fill Text    ${SELECTOR_AUTOMATION_POINT_AP_CONFLICT_POINT_ID_1_INPUT}    ${rnd_pointname}

        Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_AP_CONFLICT_POINT_ID_2_INPUT}    visible    timeout=2s
        ${rnd_pointname}=    Generate Random Point Name    first_part=DO    last_part=FO    delimiter=_
        Fill Text    ${SELECTOR_AUTOMATION_POINT_AP_CONFLICT_POINT_ID_2_INPUT}    ${rnd_pointname}
    END

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_EDIT_ADD_BUTTON}    visible    timeout=2s
    Browser.Click    ${SELECTOR_AUTOMATION_POINT_EDIT_ADD_BUTTON}
    Snack-bar Visibility And Content

Delete Alarm Point
    [Arguments]    ${point_name}
    # Go to automation
    # Go to automation alarm points

    ${compiled_text}=    Set Variable    xpath=//td[contains(., '${point_name}')]

    Wait For Elements State    ${compiled_text}    visible    timeout=2s
    Browser.Click    ${compiled_text}

    Wait For Elements State    ${SELECTOR_AUTOMATION_TOOLBAR_DELETE_BUTTON}    visible    timeout=2s
    Browser.Click    ${SELECTOR_AUTOMATION_TOOLBAR_DELETE_BUTTON}

    ${point_xpath_variable}=    Set Variable
    ...    //app-confirm-dialog[@class="ng-star-inserted"]//p[text()='${point_name}']
    Wait For Elements State    ${point_xpath_variable}    visible    timeout=2s
    Wait For Elements State    ${SELECTOR_CONFIRM_DIALOG_CONFIRM_BUTTON}    visible    timeout=2s
    Browser.Click    ${SELECTOR_CONFIRM_DIALOG_CONFIRM_BUTTON}
    Snack-bar Visibility And Content
    Wait For Elements State    ${compiled_text}    hidden    timeout=2s

Edit Alarm Point
    [Arguments]    ${point_name}    ${new_point_name}    ${alarm_type}    ${port}    ${module}    ${point}
    # Go to automation
    # Go to automation alarm points

    ${compiled_text}=    Set Variable    xpath=//td[contains(., '${point_name}')]

    Wait For Elements State    ${compiled_text}    visible    timeout=2s
    Browser.Click    ${compiled_text}

    Wait For Elements State    ${SELECTOR_AUTOMATION_TOOLBAR_EDIT_BUTTON}    visible    timeout=2s
    Browser.Click    ${SELECTOR_AUTOMATION_TOOLBAR_EDIT_BUTTON}

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_EDIT_POINT_ID_INPUT}
    Fill Text    ${SELECTOR_AUTOMATION_POINT_EDIT_POINT_ID_INPUT}    ${new_point_name}

    ${rnd_string}=    Generate Random String    32
    Fill Text    ${SELECTOR_AUTOMATION_POINT_EDIT_POINT_DESCRIPTION_INPUT}    ${rnd_string}

    Fill Text    ${SELECTOR_AUTOMATION_POINT_EDIT_ACCESS_LEVEL_VIEW_INPUT}    0
    Fill Text    ${SELECTOR_AUTOMATION_POINT_EDIT_ACCESS_LEVEL_MANUAL_INPUT}    0
    Fill Text    ${SELECTOR_AUTOMATION_POINT_EDIT_ACCESS_LEVEL_PROGRAMMING_INPUT}    0

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_EDIT_TYPE_GLOBAL_BUTTON}    visible    timeout=2s
    Browser.Click    ${SELECTOR_AUTOMATION_POINT_EDIT_TYPE_GLOBAL_BUTTON}

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_EDIT_GLOBAL_SUBSTATION_SELECT}    visible    timeout=2s
    # ${rnd_substation}=    Generate Random String    3    [UPPER]
    # Fill Text    ${SELECTOR_AUTOMATION_POINT_EDIT_GLOBAL_SUBSTATION_SELECT}    VAK_${rnd_substation}

    Browser.Click    ${SELECTOR_AUTOMATION_POINT_EDIT_GLOBAL_SUBSTATION_SELECT}
    ${substation_option_2}=    Set Variable
    ...    xpath= //mat-option[@data-qa-id='automation-point-edit-global-info-substation-option2']
    ${global_substation}=    Run Keyword And Return Status
    ...    Wait For Elements State
    ...    ${substation_option_2}
    ...    visible
    ...    timeout=2s
    IF    ${global_substation}    Browser.Click    ${substation_option_2}

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_EDIT_GLOBAL_POINTNAME_INPUT}    visible    timeout=2s
    ${rnd_pointname}=    Generate Random Point Name    AP    H    _
    Fill Text    ${SELECTOR_AUTOMATION_POINT_EDIT_GLOBAL_POINTNAME_INPUT}    ${rnd_pointname}

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_EDIT_TYPE_LOCAL_BUTTON}    visible    timeout=2s
    Browser.Click    ${SELECTOR_AUTOMATION_POINT_EDIT_TYPE_LOCAL_BUTTON}

    Module Selector    ${port}    ${module}    ${point}

    # Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_EDIT_MODULE_PORT_INPUT}    visible    timeout=2s
    # Fill Text    ${SELECTOR_AUTOMATION_POINT_EDIT_MODULE_PORT_INPUT}    ${port}
    # Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_EDIT_MODULE_NUMBER_INPUT}    visible    timeout=2s
    # Fill Text    ${SELECTOR_AUTOMATION_POINT_EDIT_MODULE_NUMBER_INPUT}    ${module}

    # Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_EDIT_LINK_ICON}    visible    timeout=2s
    # ${SELECTOR_AUTOMATION_POINT_EDIT_LINK_ICON}

    # Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_EDIT_MOD_POINT_INPUT}    visible    timeout=2s
    # Fill Text    ${SELECTOR_AUTOMATION_POINT_EDIT_MOD_POINT_INPUT}    ${point}

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_EDIT_STATE_TEXT_SELECT}    visible    timeout=2s
    Browser.Click    ${SELECTOR_AUTOMATION_POINT_EDIT_STATE_TEXT_SELECT}

    ${state_text_option_2}=    Set Variable
    ...    xpath= //mat-option[@data-qa-id='automation-point-edit-state-text-option2']

    Wait For Elements State    ${state_text_option_2}    visible    timeout=2s
    Browser.Click    ${state_text_option_2}

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_EDIT_START_DELAY_INPUT}    visible    timeout=2s
    Fill Text    ${SELECTOR_AUTOMATION_POINT_EDIT_START_DELAY_INPUT}    180

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_EDIT_STOP_DELAY_INPUT}    visible    timeout=2s
    Fill Text    ${SELECTOR_AUTOMATION_POINT_EDIT_STOP_DELAY_INPUT}    90

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_AP_EDIT_ALERTA_NUMBER_INPUT}    visible    timeout=2s
    Fill Text    ${SELECTOR_AUTOMATION_POINT_AP_EDIT_ALERTA_NUMBER_INPUT}    1234

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_AP_EDIT_NORMALLY_CLOSED_CHKBX}    visible    timeout=2s
    Check Checkbox    ${SELECTOR_AUTOMATION_POINT_AP_EDIT_NORMALLY_CLOSED_CHKBX}
    Uncheck Checkbox    ${SELECTOR_AUTOMATION_POINT_AP_EDIT_NORMALLY_CLOSED_CHKBX}
    Check Checkbox    ${SELECTOR_AUTOMATION_POINT_AP_EDIT_NORMALLY_CLOSED_CHKBX}

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_AP_EDIT_PRIORITY_INPUT}    visible    timeout=2s
    Fill Text    ${SELECTOR_AUTOMATION_POINT_AP_EDIT_PRIORITY_INPUT}    99    # max 99

    ${save_log_option_1}=    Set Variable
    ...    xpath= //mat-option[@data-qa-id='automation-point-edit-save-log-option1']
    ${save_log_option_2}=    Set Variable
    ...    xpath= //mat-option[@data-qa-id='automation-point-edit-save-log-option2']
    ${save_log_option_3}=    Set Variable
    ...    xpath= //mat-option[@data-qa-id='automation-point-edit-save-log-option3']
    ${save_log_option_4}=    Set Variable
    ...    xpath= //mat-option[@data-qa-id='automation-point-edit-save-log-option4']

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_AP_EDIT_SAVE_LOG_SELECT}    visible    timeout=2s
    Browser.Click    ${SELECTOR_AUTOMATION_POINT_AP_EDIT_SAVE_LOG_SELECT}
    Wait For Elements State    ${save_log_option_1}    visible    timeout=2s
    Browser.Click    ${save_log_option_1}
    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_AP_EDIT_SAVE_LOG_SELECT}    visible    timeout=2s
    Browser.Click    ${SELECTOR_AUTOMATION_POINT_AP_EDIT_SAVE_LOG_SELECT}
    Wait For Elements State    ${save_log_option_2}    visible    timeout=2s
    Browser.Click    ${save_log_option_2}
    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_AP_EDIT_SAVE_LOG_SELECT}    visible    timeout=2s
    Browser.Click    ${SELECTOR_AUTOMATION_POINT_AP_EDIT_SAVE_LOG_SELECT}
    Wait For Elements State    ${save_log_option_3}    visible    timeout=2s
    Browser.Click    ${save_log_option_3}
    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_AP_EDIT_SAVE_LOG_SELECT}    visible    timeout=2s
    Browser.Click    ${SELECTOR_AUTOMATION_POINT_AP_EDIT_SAVE_LOG_SELECT}
    Wait For Elements State    ${save_log_option_4}    visible    timeout=2s
    Browser.Click    ${save_log_option_4}

# TO DO
# When GUI will be fixed, replace with option number xpath

    # Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_AP_EDIT_ALARM_GROUP_SELECT}    visible    timeout=2s
    # Browser.Click    ${SELECTOR_AUTOMATION_POINT_AP_EDIT_ALARM_GROUP_SELECT}

    # ${alarm_group_option_2}=    Set Variable
    # ...    xpath= //mat-option[@data-qa-id='automation-point-edit-alarm-group-optionNaN']/span[contains(text(), 'GROUP_01')]

    # Wait For Elements State    ${alarm_group_option_2}    visible    timeout=2s
    # Browser.Click    ${alarm_group_option_2}

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_AP_EDIT_PICTURE_SELECT}    visible    timeout=2s
    Browser.Click    ${SELECTOR_AUTOMATION_POINT_AP_EDIT_PICTURE_SELECT}

    ${picture_option_2}=    Set Variable
    ...    xpath= //mat-option[@data-qa-id='automation-point-edit-picture-option2']
    Wait For Elements State    ${picture_option_2}    visible    timeout=2s
    Browser.Click    ${picture_option_2}

    IF    $alarm_type.lower() == 'normal'
        Wait For Elements State
        ...    ${SELECTOR_AUTOMATION_POINT_AP_EDIT_ALARM_TYPE_NORMAL_BUTTON}
        ...    visible
        ...    timeout=2s
        Browser.Click    ${SELECTOR_AUTOMATION_POINT_AP_EDIT_ALARM_TYPE_NORMAL_BUTTON}

        ${rnd_pointname}=    Generate Random Point Name    first_part=DI    last_part=FI    delimiter=_
        Wait For Elements State
        ...    ${SELECTOR_AUTOMATION_POINT_AP_EDIT_NORMAL_LOCK_POINT_ID_INPUT}
        ...    visible
        ...    timeout=2s
        Fill Text    ${SELECTOR_AUTOMATION_POINT_AP_EDIT_NORMAL_LOCK_POINT_ID_INPUT}    ${rnd_pointname}
        Wait For Elements State
        ...    ${SELECTOR_AUTOMATION_POINT_AP_EDIT_NORMAL_LOCK_POINT_STATE_INPUT}
        ...    visible
        ...    timeout=2s
        Fill Text    ${SELECTOR_AUTOMATION_POINT_AP_EDIT_NORMAL_LOCK_POINT_STATE_INPUT}    255    # max 255
    ELSE IF    $alarm_type.lower() == 'limit'
        Wait For Elements State
        ...    ${SELECTOR_AUTOMATION_POINT_AP_EDIT_ALARM_TYPE_LIMIT_BUTTON}
        ...    visible
        ...    timeout=2s
        Browser.Click    ${SELECTOR_AUTOMATION_POINT_AP_EDIT_ALARM_TYPE_LIMIT_BUTTON}

        ${rnd_pointname}=    Generate Random Point Name    first_part=DI    last_part=FI    delimiter=_
        Wait For Elements State
        ...    ${SELECTOR_AUTOMATION_POINT_AP_EDIT_NORMAL_LOCK_POINT_ID_INPUT}
        ...    visible
        ...    timeout=2s
        Fill Text    ${SELECTOR_AUTOMATION_POINT_AP_EDIT_NORMAL_LOCK_POINT_ID_INPUT}    ${rnd_pointname}
        Wait For Elements State
        ...    ${SELECTOR_AUTOMATION_POINT_AP_EDIT_NORMAL_LOCK_POINT_STATE_INPUT}
        ...    visible
        ...    timeout=2s
        Fill Text    ${SELECTOR_AUTOMATION_POINT_AP_EDIT_NORMAL_LOCK_POINT_STATE_INPUT}    255    # max 255

        ${rnd_pointname}=    Generate Random Point Name    first_part=AI    last_part=M    delimiter=_
        Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_AP_EDIT_LIMIT_POINT_ID_INPUT}    visible    timeout=2s
        Fill Text    ${SELECTOR_AUTOMATION_POINT_AP_EDIT_LIMIT_POINT_ID_INPUT}    ${rnd_pointname}

        Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_AP_EDIT_LIMIT1_MODE_SELECT}    visible    timeout=2s
        Browser.Click    ${SELECTOR_AUTOMATION_POINT_AP_EDIT_LIMIT1_MODE_SELECT}
        ${value_option_lower}=    Set Variable
        ...    xpath= //mat-option[@data-qa-id='automation-point-edit-alarm-options-limit1-mode-option1']
        ${value_option_higher}=    Set Variable
        ...    xpath= //mat-option[@data-qa-id='automation-point-edit-alarm-options-limit1-mode-option2']

        Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_AP_EDIT_LIMIT1_LIMIT_INPUT}    visible    timeout=2s
        Fill Text    ${SELECTOR_AUTOMATION_POINT_AP_EDIT_LIMIT1_LIMIT_INPUT}    1

        Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_AP_EDIT_LIMIT_OPERATION_SELECT}    visible    timeout=2s
        Browser.Click    ${SELECTOR_AUTOMATION_POINT_AP_EDIT_LIMIT_OPERATION_SELECT}
        ${operation_option_none}=    Set Variable
        ...    xpath= //mat-option[@data-qa-id='automation-point-edit-alarm-options-operation-option1']
        ${operation_option_and}=    Set Variable
        ...    xpath= //mat-option[@data-qa-id='automation-point-edit-alarm-options-operation-option2']
        ${operation_option_or}=    Set Variable
        ...    xpath= //mat-option[@data-qa-id='automation-point-edit-alarm-options-operation-option2']
        Browser.Click    ${operation_option_and}

        Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_AP_EDIT_LIMIT2_MODE_SELECT}
        ${SELECTOR_AUTOMATION_POINT_AP_EDIT_LIMIT2_MODE_SELECT}=
        ${value_option_lower}=    Set Variable
        ...    xpath= //mat-option[@data-qa-id='automation-point-edit-alarm-options-limit2-mode-option1']
        ${value_option_higher}=    Set Variable
        ...    xpath= //mat-option[@data-qa-id='automation-point-edit-alarm-options-limit2-mode-option2']
        Browser.Click    ${value_option_lower}

        Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_AP_EDIT_LIMIT2_LIMIT_INPUT}    visible    timeout=2s
        Fill Text    ${SELECTOR_AUTOMATION_POINT_AP_EDIT_LIMIT2_LIMIT_INPUT}    2

        Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_AP_EDIT_LIMIT_DEAD_ZONE_INPUT}    visible    timeout=2s
        Fill Text    ${SELECTOR_AUTOMATION_POINT_AP_EDIT_LIMIT_DEAD_ZONE_INPUT}    0.5
        Check Checkbox    ${SELECTOR_AUTOMATION_POINT_AP_EDIT_LIMIT_CLEAR_RUN_TIME_CHKBX}
        Uncheck Checkbox    ${SELECTOR_AUTOMATION_POINT_AP_EDIT_LIMIT_CLEAR_RUN_TIME_CHKBX}
    ELSE IF    $alarm_type.lower() == 'module'
        Wait For Elements State
        ...    ${SELECTOR_AUTOMATION_POINT_AP_EDIT_ALARM_TYPE_MODULE_BUTTON}
        ...    visible
        ...    timeout=2s
        Browser.Click    ${SELECTOR_AUTOMATION_POINT_AP_EDIT_ALARM_TYPE_MODULE_BUTTON}

        ${rnd_pointname}=    Generate Random Point Name    first_part=DI    last_part=FI    delimiter=_
        Wait For Elements State
        ...    ${SELECTOR_AUTOMATION_POINT_AP_EDIT_NORMAL_LOCK_POINT_ID_INPUT}
        ...    visible
        ...    timeout=2s
        Fill Text    ${SELECTOR_AUTOMATION_POINT_AP_EDIT_NORMAL_LOCK_POINT_ID_INPUT}    ${rnd_pointname}
        Wait For Elements State
        ...    ${SELECTOR_AUTOMATION_POINT_AP_EDIT_NORMAL_LOCK_POINT_STATE_INPUT}
        ...    visible
        ...    timeout=2s
        Fill Text    ${SELECTOR_AUTOMATION_POINT_AP_EDIT_NORMAL_LOCK_POINT_STATE_INPUT}    255    # max 255

        Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_AP_EDIT_MODULE_TYPE_PORT_INPUT}    visible    timeout=2s
        Fill Text    ${SELECTOR_AUTOMATION_POINT_AP_EDIT_MODULE_TYPE_PORT_INPUT}    ${port}
        Wait For Elements State
        ...    ${SELECTOR_AUTOMATION_POINT_AP_EDIT_MODULE_TYPE_MODULE_INPUT}
        ...    visible
        ...    timeout=2s
        Fill Text    ${SELECTOR_AUTOMATION_POINT_AP_EDIT_MODULE_TYPE_MODULE_INPUT}    ${module}

        # Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_AP_LINK_ICON}    visible    timeout=2s
        # ${SELECTOR_AUTOMATION_POINT_AP_LINK_ICON}

        Wait For Elements State
        ...    ${SELECTOR_AUTOMATION_POINT_AP_MODULE_TYPE_SENSITIVITY_INPUT}
        ...    visible
        ...    timeout=2s
        Fill Text    ${SELECTOR_AUTOMATION_POINT_AP_MODULE_TYPE_SENSITIVITY_INPUT}    30
    ELSE    # Conflict
        Wait For Elements State
        ...    ${SELECTOR_AUTOMATION_POINT_AP_EDIT_ALARM_TYPE_CONFLICT_BUTTON}
        ...    visible
        ...    timeout=2s
        Browser.Click    ${SELECTOR_AUTOMATION_POINT_AP_EDIT_ALARM_TYPE_CONFLICT_BUTTON}

        ${rnd_pointname}=    Generate Random Point Name    first_part=DI    last_part=FI    delimiter=_
        Wait For Elements State
        ...    ${SELECTOR_AUTOMATION_POINT_AP_EDIT_NORMAL_LOCK_POINT_ID_INPUT}
        ...    visible
        ...    timeout=2s
        Fill Text    ${SELECTOR_AUTOMATION_POINT_AP_EDIT_NORMAL_LOCK_POINT_ID_INPUT}    ${rnd_pointname}
        Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_AP_EDIT_NORMAL_LOCK_POINT_STATE_INPUT}
        Fill Text    ${SELECTOR_AUTOMATION_POINT_AP_EDIT_NORMAL_LOCK_POINT_STATE_INPUT}    255    # max 255

        Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_AP_CONFLICT_POINT_ID_1_INPUT}    visible    timeout=2s
        ${rnd_pointname}=    Generate Random Point Name    first_part=DI    last_part=FI    delimiter=_
        Fill Text    ${SELECTOR_AUTOMATION_POINT_AP_CONFLICT_POINT_ID_1_INPUT}    ${rnd_pointname}

        Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_AP_CONFLICT_POINT_ID_2_INPUT}    visible    timeout=2s
        ${rnd_pointname}=    Generate Random Point Name    first_part=DO    last_part=FO    delimiter=_
        Fill Text    ${SELECTOR_AUTOMATION_POINT_AP_CONFLICT_POINT_ID_2_INPUT}    ${rnd_pointname}
    END

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_EDIT_ADD_BUTTON}    visible    timeout=2s
    Browser.Click    ${SELECTOR_AUTOMATION_POINT_EDIT_ADD_BUTTON}
    Snack-bar Visibility And Content

Duplicate Alarm Point
    [Arguments]    ${point_name}
    # Go to automation
    # Go to automation alarm points

    ${compiled_text}=    Set Variable    xpath=//td[contains(., '${point_name}')]

    Wait For Elements State    ${compiled_text}    visible    timeout=2s
    Browser.Click    ${compiled_text}
    Wait For Elements State    ${SELECTOR_AUTOMATION_TOOLBAR_DUPLICATE_BUTTON}    visible    timeout=2s
    Browser.Click    ${SELECTOR_AUTOMATION_TOOLBAR_DUPLICATE_BUTTON}

    Wait For Elements State    ${SELECTOR_AUTOMATION_COPY_POINT_DIALOG_POINT_ID_INPUT}    visible    timeout=2s
    Fill Text    ${SELECTOR_AUTOMATION_COPY_POINT_DIALOG_POINT_ID_INPUT}    1COPY_${point_name}

    Wait For Elements State    ${SELECTOR_AUTOMATION_COPY_POINT_DIALOG_CREATE_BUTTON}    visible    timeout=2s
    Browser.Click    ${SELECTOR_AUTOMATION_COPY_POINT_DIALOG_CREATE_BUTTON}
