*** Settings ***
Library     Browser
Resource    navigate.resource
Resource    login.resource
Resource    point_locators.resource
Resource    history_locators.resource
Resource    global_variables.resource


*** Keywords ***
History Point
    [Arguments]    ${point_name}
    Go to history

    Wait for Elements State    ${selector_history_header}    visible    timeout=2s

    Browser.Click    ${selector_history_points_btn}

    Wait For Elements State    ${selector_history_pointsettings_form}    visible    timeout=2s

    Browser.Click    ${selector_history_pointsettings_form_allpoints_btn}

    ${point_name_line}=    Set Variable
    ...    xpath=//div[contains(@class, 'point_container')]//span[text()='${point_name}']

    Browser.Click    ${point_name_line}

    Browser.Click    ${selector_history_pointsettings_form_allpoints_add_btn}

    Wait For Elements State    ${selector_history_pointsettings_form_tolerance_input}    visible    timeout=2s
    Fill Text    ${selector_history_pointsettings_form_tolerance_input}    1.0

    Fill Text    ${selector_history_pointsettings_form_sampleCount_input}    15000

    Fill Text    ${selector_history_pointsettings_form_sampleTime_input}    15

    Select Options By    ${selector_history_pointsettings_form_sampleTime_ddwn}    value    2

    Browser.Click    ${selector_history_pointsettings_form_recording_chkbx}

    Browser.Click    ${selector_history_pointsettings_form_recording_chkbx}

    Browser.Click    ${selector_history_pointsettings_form_energy_ddwn}
    Keyboard Key    press    ArrowDown
    Keyboard Key    press    ArrowDown
    Keyboard Key    press    Enter
    Sleep    ${SLEEP_TIME}

    Browser.Click    ${selector_history_pointsettings_form_histpoints_save_btn}

    ${snack-bar_visible}=    Run Keyword And Return Status
    ...    Wait For Elements State
    ...    xpath=//div[contains(@class, "mat-simple-snackbar")]
    ...    visible
    ...    timeout=5s

    IF    ${snack-bar_visible}
        Log To Console    History point added. Snack-bar visible
    ELSE
        Log To Console    History point added. Snack-bar not visible
    END

    Browser.Click    ${selector_history_pointsettings_form_histpoints_close_btn}
    Sleep    ${SLEEP_TIME}

    Browser.Click    ${selector_history_pointsettings_form_histpoints_remove_btn}
    Sleep    ${SLEEP_TIME}

    Wait For Elements State    ${selector_history_pointsettings_form_histpoints_delete_btn}    visible    timeout=2s
    Browser.Click    ${selector_history_pointsettings_form_histpoints_delete_btn}
    Sleep    ${SLEEP_TIME}

    ${snack-bar_visible}=    Run Keyword And Return Status
    ...    Wait For Elements State
    ...    xpath=//div[contains(@class, "mat-simple-snackbar")]
    ...    visible
    ...    timeout=5s

    IF    ${snack-bar_visible}
        Log To Console    History point removed. Snack-bar visible
    ELSE
        Log To Console    History point removed. Snack-bar not visible
    END

History Point Add
    [Arguments]
    ...    ${point_name}
    ...    ${tolerance}
    ...    ${samplecount}
    ...    ${sampletime}
    ...    ${sampletime_period}
    ...    ${recording}
    ...    ${energy}
    ...    ${save}

    Go to history

    Wait for Elements State    ${selector_history_header}    visible    timeout=2s
    Browser.Click    ${selector_history_points_btn}

    Wait For Elements State    ${selector_history_pointsettings_form}    visible    timeout=2s
    Browser.Click    ${selector_history_pointsettings_form_allpoints_btn}

    ${point_name_line}=    Set Variable
    ...    xpath=//div[contains(@class, 'point_container')]//span[text()='${point_name}']

    Wait For Elements State    ${selector_history_pointsettings_form_allpoints_search_input}    visible    timeout=30s
    ${search}=    Set Variable    ${point_name}[3:]
    Browser.Type Text    ${selector_history_pointsettings_form_allpoints_search_input}    ${search}

    Wait For Elements State    ${point_name_line}    visible    timeout=30s
    Browser.Click    ${point_name_line}
    Browser.Click    ${selector_history_pointsettings_form_allpoints_add_btn}

    Wait For Elements State    ${selector_history_pointsettings_form_tolerance_input}    visible    timeout=2s
    Fill Text    ${selector_history_pointsettings_form_tolerance_input}    ${tolerance}
    Fill Text    ${selector_history_pointsettings_form_sampleCount_input}    ${samplecount}
    Fill Text    ${selector_history_pointsettings_form_sampleTime_input}    ${sampletime}

    IF    ${sampletime_period} == 1    # Seconds
        Select Options By    ${selector_history_pointsettings_form_sampleTime_ddwn}    value    0
    ELSE IF    ${sampletime_period} == 2    # Minutes
        Select Options By    ${selector_history_pointsettings_form_sampleTime_ddwn}    value    1
    ELSE IF    ${sampletime_period} == 3    # hours
        Select Options By    ${selector_history_pointsettings_form_sampleTime_ddwn}    value    2
    ELSE    # Days
        Select Options By    ${selector_history_pointsettings_form_sampleTime_ddwn}    value    3
    END

    IF    ${recording} == 1
        Browser.Click    ${selector_history_pointsettings_form_recording_chkbx}
    END

    IF    ${energy} == 1    # No
        Select Options By    ${selector_history_pointsettings_form_energy_ddwn}    value    0
    ELSE IF    ${energy} == 2    # Day values
        Select Options By    ${selector_history_pointsettings_form_energy_ddwn}    value    1
    ELSE    # Hour values
        Select Options By    ${selector_history_pointsettings_form_energy_ddwn}    value    2
    END

    # ${button_result}=    Action Button Or Cancel Button    ${selector_history_pointsettings_form_histpoints_save_btn}    ${selector_history_pointsettings_form_histpoints_cancel_btn}    ${save}
    # Log To Console    ${button_result}

    Wait For Elements State    ${selector_history_pointsettings_form_close_btn}    timeout=2s
    Browser.Click    ${selector_history_pointsettings_form_close_btn}
    Log To Console    Point ${point_name} is ADDED

History Point Remove
    [Arguments]
    ...    ${point_name}
    ...    ${save}

    Go to history
    Sleep    ${SLEEP_TIME}

    Wait for Elements State    ${selector_history_header}    visible    timeout=2s
    Browser.Click    ${selector_history_points_btn}

    Wait For Elements State    ${selector_history_pointsettings_form}    visible    timeout=2s

    # //div[@class="point_name" and span/text()="3000C_01_A"]/following-sibling::div[@class="button_container"]//mat-icon[@svgicon="remove-icon"]
    ${local_selector_history_pointsettings_form_histpoints_remove_btn}=    Set Variable    xpath=//div[@class="point_name" and span/text()="${point_name}"]/following-sibling::div[@class="button_container"]//mat-icon[@svgicon="remove-icon"]

    Wait for Elements State    ${local_selector_history_pointsettings_form_histpoints_remove_btn}    visible    timeout=2s
    Browser.Click    ${local_selector_history_pointsettings_form_histpoints_remove_btn}
    ${point_name_text}=    Set Variable    xpath=//p[text()=" ${point_name}"]
    Wait For Elements State    ${point_name_text}    visible    timeout=5s

    Browser.Click    ${selector_history_pointsettings_form_histpoints_remove_delete_btn}
    Wait For Elements State    ${selector_history_pointsettings_form_close_btn}    visible    timeout=10s
    Browser.Click    ${selector_history_pointsettings_form_close_btn}

    Log To Console    Point ${point_name} is REMOVED

History Point Edit
    [Arguments]
    ...    ${point_name}
    ...    ${tolerance}
    ...    ${samplecount}
    ...    ${sampletime}
    ...    ${sampletime_period}
    ...    ${recording}
    ...    ${energy}
    ...    ${save}

    Go to history

    Wait for Elements State    ${selector_history_header}    visible    timeout=2s
    Browser.Click    ${selector_history_points_btn}

    Wait for Elements State    ${selector_history_pointsettings_form_histpoints_edit_btn}    visible    timeout=2s
    Browser.Click    ${selector_history_pointsettings_form_histpoints_edit_btn}

    Wait For Elements State    ${selector_history_pointsettings_form_tolerance_input}    visible    timeout=2s
    Fill Text    ${selector_history_pointsettings_form_tolerance_input}    ${tolerance}
    Fill Text    ${selector_history_pointsettings_form_sampleCount_input}    ${samplecount}
    Fill Text    ${selector_history_pointsettings_form_sampleTime_input}    ${sampletime}

    IF    ${sampletime_period} == 1    # Seconds
        Select Options By    ${selector_history_pointsettings_form_sampleTime_ddwn}    value    0
        Browser.Click    ${selector_history_pointsettings_form_sampleTime_ddwn}
    ELSE IF    ${sampletime_period} == 2    # Minutes
        Select Options By    ${selector_history_pointsettings_form_sampleTime_ddwn}    value    1
    ELSE IF    ${sampletime_period} == 3    # hours
        Select Options By    ${selector_history_pointsettings_form_sampleTime_ddwn}    value    2
    ELSE    # Days
        Select Options By    ${selector_history_pointsettings_form_sampleTime_ddwn}    value    2
    END

    IF    ${recording} == 1
        Browser.Click    ${selector_history_pointsettings_form_recording_chkbx}
        Sleep    ${SLEEP_TIME}
    END

    IF    ${energy} == 1    # No
        Select Options By    ${selector_history_pointsettings_form_energy_ddwn}    value    0
    ELSE IF    ${energy} == 2    # Day values
        Select Options By    ${selector_history_pointsettings_form_energy_ddwn}    value    1
    ELSE    # Hour values
        Select Options By    ${selector_history_pointsettings_form_energy_ddwn}    value    2
    END

    Browser.Click    ${selector_history_pointsettings_form_histpoints_save_btn}
    Snack-bar Visibility And Content
    Log To Console    Point ${point_name} is EDITED

History Group Add
    [Arguments]
    ...    ${group_name}
    ...    ${timespan}
    ...    ${timespan_item}
    ...    ${samples_max}
    ...    ${email}
    ...    ${server}
    ...    ${recipient}
    ...    ${timespan_email}
    ...    ${samples_day}
    ...    ${save}
    ...    ${point_name}

    Go to history

    Wait for Elements State    ${selector_history_header}    visible    timeout=2s
    Browser.Click    ${selector_history_addgroup_btn}

    Wait For Elements State    ${selector_group_settings_form_header}    visible    timeout=2s
    Fill Text    ${selector_group_settings_from_name_input}    ${group_name}
    Fill Text    ${selector_group_settings_form_timeSpan_input}    ${timespan}

    Select Options By    ${selector_group_settings_form_timeUnit_ddwn}    value    2
    # Browser.Click    ${selector_group_settings_form_email_chkbx}

    # 20.0.73 features are removed ?
    # Wait For Elements State    ${selector_group_settings_form_server_ddwn}    visible    timeout=2s
    # Select Options By    ${selector_group_settings_form_server_ddwn}    value    1
    # Fill Text    ${selector_group_settings_form_emailAddress_input}    ${recipient}

    # Wait For Elements State    ${selector_group_settings_form_emailTimeSpan_ddwn}    visible    timeout=2s
    # Select Options By    ${selector_group_settings_form_emailTimeSpan_ddwn}    value    2

    # Fill Text    ${selector_group_settings_form_emailSamplesDay_input}    ${samples_day}
    Browser.Click    ${selector_group_settings_form_point_settings_btn}
    Wait For Elements State    ${selector_group_settings_form_point_settings_header}    visible    timeout=2s

    ${local_selector_group_settings_form_point_settings_plus_btn}=    Set Variable    xpath=//div[@class="point_name" and span/text()="${point_name}"]/following-sibling::div[@class="button_container"]//mat-icon[@svgicon="icon-add"]
    ${local_selector_group_settings_form_point_settings_minus_btn}=    Set Variable    xpath=//div[@class="point_name" and span/text()="${point_name}"]/following-sibling::div[@class="button_container"]//mat-icon[@svgicon="remove-line-icon"]
    ${local_selector_group_settings_form_point_settings_edit_btn}=    Set Variable    xpath=//div[@class="point_name" and span/text()="${point_name}"]/following-sibling::div[@class="button_container"]//mat-icon[@svgicon="icon-automation-edit"]


    Wait For Elements State    ${local_selector_group_settings_form_point_settings_plus_btn}    visible    timeout=2s
    Browser.Click    ${local_selector_group_settings_form_point_settings_plus_btn}

    Wait For Elements State    ${local_selector_group_settings_form_point_settings_minus_btn}    visible    timeout=2s
    Browser.Click    ${local_selector_group_settings_form_point_settings_minus_btn}

    Wait For Elements State    ${local_selector_group_settings_form_point_settings_plus_btn}    visible    timeout=2s
    Browser.Click    ${local_selector_group_settings_form_point_settings_plus_btn}

    Browser.Click    ${selector_group_settings_form_point_settings_save_btn}
    Browser.Click    ${selector_group_settings_form_addgroup_btn}

    Snack-bar Visibility And Content
    Log To Console    Group ${group_name} is ADDED

History Group Remove
    [Arguments]
    ...    ${group_name}
    ...    ${save}

    Go to history

    Wait For Elements State    ${selector_group_delete_btn}    visible    timeout=2s
    Browser.Click    ${selector_group_delete_btn}
    Wait For Elements State    ${selector_remove_group_form_header}    visible    timeout=2s
    Browser.Click    ${selector_remove_group_form_delete_btn}

    Snack-bar Visibility And Content
    Log To Console    Group ${group_name} is REMOVED
