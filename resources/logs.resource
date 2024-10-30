*** Settings ***
Library     Browser
Library     String
Library     DateTime
Resource    navigate.resource
Resource    login.resource
Resource    point_locators.resource
Resource    logs_locators.resource
Resource    global_variables.resource


*** Keywords ***
Events Log Features
    [Arguments]    ${user_name}    ${point_name}
    Go to logs

    Wait for Elements State    ${selector_logs_header}    visible    timeout=2s

    Browser.Click    ${selector_logs_events_search_user_btn}
    Browser.Click With Options    ${selector_logs_events_username_search_input}    clickCount=2
    Keyboard Input    insertText    ${user_name}
    Browser.Click    ${selector_logs_events_search_btn}

    ${result_visible}=    Run Keyword And Return Status
    ...    Wait For Elements State
    ...    xpath=//td[contains(., "${user_name}")]
    ...    visible
    ...    timeout=2s
    IF    ${result_visible}
        Log To Console    Events Username Result visible
    ELSE
        Log To Console    Events Username Result not visible
    END

    Browser.Click    ${selector_logs_events_search_input_delete_icon}

    Browser.Click    ${selector_logs_events_search_point_btn}
    Browser.Click With Options    ${selector_logs_events_point_search_input}    clickCount=2
    Keyboard Input    insertText    ${point_name}

    Browser.Click    ${selector_logs_events_search_btn}

    ${result_visible}=    Run Keyword And Return Status
    ...    Wait For Elements State
    ...    xpath=//td[contains(., "${point_name}")]
    ...    visible
    ...    timeout=2s
    IF    ${result_visible}
        Log To Console    Events Pointname Result visible
    ELSE
        Log To Console    Events Pointname Result not visible
    END

    Browser.Click    ${selector_logs_events_search_input_delete_icon}

    Browser.Click    ${selector_logs_events_search_date_btn}

    Browser.Click With Options    ${selector_logs_events_time_search_input}    clickCount=2

    Wait For Elements State    ${selector_logs_events_time_form}    visible    timeout=2s
    ${date_today}=    Get Current Date
    Log To Console    Today's Date: ${date_today}

    ${datetime}=    Convert Date    ${date_today}    datetime

    Log To Console    ${datetime.year}
    Log To Console    ${datetime.month}
    Log To Console    ${datetime.day}
    Log To Console    ${datetime.hour}
    Log To Console    ${datetime.minute}
    Log To Console    ${datetime.second}
    Log To Console    ${datetime.microsecond}

    IF    ${datetime.day} >= 25
        ${date_today}=    Subtract Time From Date    ${date_today}    10 days
    END

    ${date_start}=    Convert Date    ${date_today}    result_format=%B %#d, %Y
    Log To Console    Start Date: ${date_start}

    ${xpath_start}=    Set Variable    xpath=//button[@aria-label='${date_start}']
    ${date_finish}=    Add Time To Date    ${date_today}    7 days
    ${date_finish}=    Convert Date    ${date_finish}    result_format=%B %#d, %Y

    Log To Console    Finish Date: ${date_finish}

    ${xpath_finish}=    Set Variable    xpath=//button[@aria-label='${date_finish}']

    Browser.Click    ${xpath_start}

    Browser.Click    ${xpath_finish}

    Wait For Elements State    ${selector_logs_events_time_search_btn}    visible    timeout=2s
    Browser.Click    ${selector_logs_events_time_search_btn}

    ${result_visible}=    Run Keyword And Return Status
    ...    Wait For Elements State
    ...    xpath=//td[contains(., 'Date')]
    ...    visible
    ...    timeout=2s
    IF    ${result_visible}
        Log To Console    Events Timespan Result visible
    ELSE
        Log To Console    Events Timespan Result not visible
    END

Debug Log Features
    Go to logs

    Wait for Elements State    ${selector_logs_header}    visible    timeout=10s

    Browser.Click    ${selector_logs_debug_btn}

    Wait For Elements State    ${selector_logs_debug_watchdog_header}    visible    timeout=10s
    Wait For Elements State    ${selector_logs_debug_watchdog_csv_btn}    visible    timeout=10s

    Browser.Click    ${selector_logs_debug_watchdog_csv_btn}
    Keyboard Key    press    Escape

    ${result_visible}=    Run Keyword And Return Status
    ...    Wait For Elements State
    ...    ${selector_logs_debug_watchdog_header}
    ...    visible
    ...    timeout=10s
    IF    ${result_visible}
        Log To Console    Watchdog table visible
        Browser.Click    ${selector_logs_debug_watchdog_csv_btn}
        Keyboard Key    press    Escape
    ELSE
        ${empty_table_txt}=    Browser.Get Text    ${selector_logs_debug_empty_table_txt}
        Log To Console    Watchdog table not visible, text : ${empty_table_txt}
    END

    Browser.Click    ${selector_logs_debug_debug_btn}
    ${result_visible}=    Run Keyword And Return Status
    ...    Wait For Elements State
    ...    ${selector_logs_debug_debug_header}
    ...    visible
    ...    timeout=10s
    IF    ${result_visible}
        Log To Console    Debug table visible
        Browser.Click    ${selector_logs_debug_watchdog_csv_btn}
        Keyboard Key    press    Escape
    ELSE
        ${empty_table_txt}=    Browser.Get Text    ${selector_logs_debug_empty_table_txt}
        Log To Console    Debug table not visible, text : ${empty_table_txt}
    END

    Browser.Click    ${selector_logs_debug_mbus_btn}
    ${result_visible}=    Run Keyword And Return Status
    ...    Wait For Elements State
    ...    ${selector_logs_debug_mbus_header}
    ...    visible
    ...    timeout=10s
    IF    ${result_visible}
        Log To Console    MBus table visible
        Browser.Click    ${selector_logs_debug_watchdog_csv_btn}
        Keyboard Key    press    Escape
    ELSE
        ${empty_table_txt}=    Browser.Get Text    ${selector_logs_debug_empty_table_txt}
        Log To Console    MBus table not visible, text : ${empty_table_txt}
    END

    Browser.Click    ${selector_logs_debug_mail_btn}
    ${result_visible}=    Run Keyword And Return Status
    ...    Wait For Elements State
    ...    ${selector_logs_debug_mail_header}
    ...    visible
    ...    timeout=10s
    IF    ${result_visible}
        Log To Console    Mail table visible
        Browser.Click    ${selector_logs_debug_watchdog_csv_btn}
        Keyboard Key    press    Escape
    ELSE
        ${empty_table_txt}=    Browser.Get Text    ${selector_logs_debug_empty_table_txt}
        Log To Console    Mail table not visible, text : ${empty_table_txt}
    END

    Browser.Click    ${selector_logs_debug_gsm_btn}
    ${result_visible}=    Run Keyword And Return Status
    ...    Wait For Elements State
    ...    ${selector_logs_debug_gsm_header}
    ...    visible
    ...    timeout=10s
    IF    ${result_visible}
        Log To Console    GSM table visible
        Browser.Click    ${selector_logs_debug_watchdog_csv_btn}
        Keyboard Key    press    Escape
    ELSE
        ${empty_table_txt}=    Browser.Get Text    ${selector_logs_debug_empty_table_txt}
        Log To Console    GSM table not visible, text : ${empty_table_txt}
    END

    Browser.Click    ${selector_logs_debug_modbus_btn}
    ${result_visible}=    Run Keyword And Return Status
    ...    Wait For Elements State
    ...    ${selector_logs_debug_modbus_header}
    ...    visible
    ...    timeout=10s
    IF    ${result_visible}
        Log To Console    Modbus table visible
        Browser.Click    ${selector_logs_debug_watchdog_csv_btn}
        Keyboard Key    press    Escape
    ELSE
        ${empty_table_txt}=    Browser.Get Text    ${selector_logs_debug_empty_table_txt}
        Log To Console    Modbus table not visible, text : ${empty_table_txt}
    END

    Browser.Click    ${selector_logs_debug_smsalarms_btn}
    ${result_visible}=    Run Keyword And Return Status
    ...    Wait For Elements State
    ...    ${selector_logs_debug_smsalarm_header}
    ...    visible
    ...    timeout=10s
    IF    ${result_visible}
        Log To Console    SMSAlarms table visible
        Browser.Click    ${selector_logs_debug_watchdog_csv_btn}
        Keyboard Key    press    Escape
    ELSE
        ${empty_table_txt}=    Browser.Get Text    ${selector_logs_debug_empty_table_txt}
        Log To Console    SMSAlarms table not visible, text : ${empty_table_txt}
    END

    Browser.Click    ${selector_logs_debug_mailalarms_btn}
    ${result_visible}=    Run Keyword And Return Status
    ...    Wait For Elements State
    ...    ${selector_logs_debug_mailalarm_header}
    ...    visible
    ...    timeout=10s
    IF    ${result_visible}
        Log To Console    MailAlarms table visible
        Browser.Click    ${selector_logs_debug_watchdog_csv_btn}
        Keyboard Key    press    Escape
    ELSE
        ${empty_table_txt}=    Browser.Get Text    ${selector_logs_debug_empty_table_txt}
        Log To Console    MailAlarms table not visible, text : ${empty_table_txt}
    END

    Browser.Click    ${selector_logs_debug_alertalarms_btn}
    ${result_visible}=    Run Keyword And Return Status
    ...    Wait For Elements State
    ...    ${selector_logs_debug_alertaalarm_header}
    ...    visible
    ...    timeout=10s
    IF    ${result_visible}
        Log To Console    AlertaAlarms table visible
        Browser.Click    ${selector_logs_debug_watchdog_csv_btn}
        Keyboard Key    press    Escape
    ELSE
        ${empty_table_txt}=    Browser.Get Text    ${selector_logs_debug_empty_table_txt}
        Log To Console    AlertaAlarms table not visible, text : ${empty_table_txt}
    END

Alarm Log Features
    [Arguments]    ${user_name}    ${point_name}
    Go to logs

    Wait for Elements State    ${selector_logs_header}    visible    timeout=2s

    Wait for Elements State    ${selector_logs_alarm_btn}    visible    timeout=2s
    Browser.Click    ${selector_logs_alarm_btn}

    Browser.Click    ${selector_logs_events_search_user_passive_btn}
    Wait for Elements State    ${selector_logs_events_username_search_input}    visible    timeout=2s
    Browser.Click With Options    ${selector_logs_events_username_search_input}    clickCount=2
    Keyboard Input    insertText    ${user_name}

    ${result_visible}=    Run Keyword And Return Status
    ...    Wait For Elements State
    ...    xpath=//td[text()="${user_name}"]
    ...    visible
    ...    timeout=2s
    IF    ${result_visible}
        Log To Console    Alarms Username Result visible
    ELSE
        Log To Console    Alarms Username Result not visible
    END

    Browser.Click    ${selector_logs_events_search_input_delete_icon}

    Browser.Click    ${selector_logs_events_search_point_btn}

    Browser.Click With Options    ${selector_logs_events_point_search_input}    clickCount=2
    Keyboard Input    insertText    ${point_name}
    Browser.Click    ${selector_logs_events_search_btn}

    ${result_visible}=    Run Keyword And Return Status
    ...    Wait For Elements State
    ...    xpath=//td[text()="${point_name}"]
    ...    visible
    ...    timeout=2s
    IF    ${result_visible}
        Log To Console    Alarms Pointname Result visible
    ELSE
        Log To Console    Alarms Pointname Result not visible
    END

    Browser.Click    ${selector_logs_events_search_date_btn}

    Browser.Click    ${selector_logs_events_search_input_delete_icon}

    Browser.Click    ${selector_logs_events_time_search_input}

    Wait For Elements State    ${selector_logs_events_time_form}    visible    timeout=2s

    ${date_today}=    Get Current Date
    Log To Console    Today's Date: ${date_today}

    ${datetime}=    Convert Date    ${date_today}    datetime

    Log To Console    ${datetime.year}
    Log To Console    ${datetime.month}
    Log To Console    ${datetime.day}
    Log To Console    ${datetime.hour}
    Log To Console    ${datetime.minute}
    Log To Console    ${datetime.second}
    Log To Console    ${datetime.microsecond}

    IF    ${datetime.day} >= 25
        ${date_today}=    Subtract Time From Date    ${date_today}    10 days
    END

    ${date_start}=    Convert Date    ${date_today}    result_format=%B %#d, %Y
    Log To Console    Start Date: ${date_start}

    ${xpath_start}=    Set Variable    xpath=//button[@aria-label='${date_start}']
    ${date_finish}=    Add Time To Date    ${date_today}    7 days
    ${date_finish}=    Convert Date    ${date_finish}    result_format=%B %#d, %Y

    Log To Console    Finish Date: ${date_finish}

    ${xpath_finish}=    Set Variable    xpath=//button[@aria-label='${date_finish}']

    Browser.Click    ${xpath_start}

    Browser.Click    ${xpath_finish}

    Browser.Click    ${xpath_start}

    Browser.Click    ${xpath_finish}

    Wait For Elements State    ${selector_logs_events_time_search_btn}    visible    timeout=2s
    Browser.Click    ${selector_logs_events_time_search_btn}
