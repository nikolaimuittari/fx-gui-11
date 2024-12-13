*** Settings ***
# Resource        ../../resources/cpu.resource
# Resource        ../../resources/login.resource
# Resource        ../../resources/navigate.resource
# Resource        ../../resources/settings/user_settings/user.resource
# Resource        ../../resources/env.resource

Resource        resources\\login.resource
Resource        resources\\navigate.resource
Resource        resources\\env.resource
Resource        resources\\settings_locators_id.resource
Resource        resources\\language.resource


Library         Browser
Library         String
Library         Collections
Library         OperatingSystem
Library         DateTime
Library         RPA.Windows


Suite Setup         Prepare Session Timeout And Go To Clock Settings Page
Suite Teardown      Revert Clock Settings Page Settings To Current Time And Date

*** Variables ***
${TIMEZONE}       Europe/Helsinki
${user}    system
${user_password}    24680

# DST in years:
# Year	DST Start (Clock Forward)	DST End (Clock Backward)
# 2020	Sunday, 29 March, 03:00	    Sunday, 25 October, 04:00
# 2021	Sunday, 28 March, 03:00	    Sunday, 31 October, 04:00
# 2022	Sunday, 27 March, 03:00	    Sunday, 30 October, 04:00
# 2023	Sunday, 26 March, 03:00	    Sunday, 29 October, 04:00
# 2024	Sunday, 31 March, 03:00	    Sunday, 27 October, 04:00
# 2025	Sunday, 30 March, 03:00	    Sunday, 26 October, 04:00
# 2026	Sunday, 29 March, 03:00	    Sunday, 25 October, 04:00
# 2027	Sunday, 28 March, 03:00	    Sunday, 31 October, 04:00
# 2028	Sunday, 26 March, 03:00	    Sunday, 29 October, 04:00
# 2029	Sunday, 25 March, 03:00	    Sunday, 28 October, 04:00
    
${DST_FORWARD_2025_MARCH}    2025-03-30
${DST_BACKWARD_2025_OCTOBER}  2025-10-26

${DST_FORWARD_2026_MARCH}    2026-03-29
${DST_BACKWARD_2026_OCTOBER}  2026-10-25

${DST_FORWARD_2027_MARCH}    2027-03-28
${DST_BACKWARD_2027_OCTOBER}  2027-10-31

${DST_FORWARD_2028_MARCH}    2028-03-26
${DST_BACKWARD_2028_OCTOBER}  2028-10-29

${DST_FORWARD_2029_MARCH}    2029-03-25
${DST_BACKWARD_2029_OCTOBER}  2029-10-28

${DST_FORWARD_TIME}    03:00
${DST_BACKWARD_TIME}    04:00

${DST_BEFORE_FORWARD_TIME}    02:58
${DST_BEFORE_BACKWARD_TIME}    03:58

${DST_AFTER_FORWARD_TIME}    04:00
${DST_AFTER_BACKWARD_TIME}    03:00


*** Test Cases ***
Check DST Time Change
    [Documentation]    DST transition forward-backward test

    Check Forward DST Correct    ${DST_FORWARD_2025_MARCH}
    Check Backward DST Correct    ${DST_BACKWARD_2025_OCTOBER}

    Check Forward DST Correct    ${DST_FORWARD_2026_MARCH}
    Check Backward DST Correct    ${DST_BACKWARD_2026_OCTOBER}

    Check Forward DST Correct    ${DST_FORWARD_2027_MARCH}
    Check Backward DST Correct    ${DST_BACKWARD_2027_OCTOBER}

    Check Forward DST Correct    ${DST_FORWARD_2028_MARCH}
    Check Backward DST Correct    ${DST_BACKWARD_2028_OCTOBER}

    Check Forward DST Correct    ${DST_FORWARD_2029_MARCH}
    Check Backward DST Correct    ${DST_BACKWARD_2029_OCTOBER}


    # Browser.Wait For Elements State    ${SELECTOR_SETTINGS_SYSTEM_CLOCK_TIME_SERVER_ADDRESS_INPUT}     state=visible    timeout=2s
    # ${settings_clock_clock_settings}=           Browser.Get Text    ${SELECTOR_SETTINGS_SYSTEM_CLOCK_TIME_SERVER_ADDRESS_INPUT}
    # Log To Console     fx_time_server_name: ${settings_clock_clock_settings}\n

    # Browser.Wait For Elements State    ${SELECTOR_SETTINGS_SYSTEM_CLOCK_USE_FX_TIME_SERVER_CHECKBOX}     state=visible    timeout=2s
    # ${settings_clock_fx_time_server}=           Browser.Get Text    ${SELECTOR_SETTINGS_SYSTEM_CLOCK_USE_FX_TIME_SERVER_CHECKBOX}
    # Log To Console    fx_time_server_checkbox: ${settings_clock_fx_time_server}\n

    # Browser.Wait For Elements State    ${SELECTOR_SETTINGS_SYSTEM_CLOCK_USE_GSM_TIME_CHECKBOX}     state=visible    timeout=2s
    # ${settings_clock_gsm_time}=           Browser.Get Text    ${SELECTOR_SETTINGS_SYSTEM_CLOCK_USE_GSM_TIME_CHECKBOX}
    # Log To Console    gsm_time_checkbox: ${settings_clock_gsm_time}\n

    # Browser.Wait For Elements State    ${SELECTOR_SETTINGS_SYSTEM_CLOCK_TIME_ZONE_DROPDOWN}     state=visible    timeout=2s
    # ${settings_clock_timezone}=           Browser.Get Text    ${SELECTOR_SETTINGS_SYSTEM_CLOCK_TIME_ZONE_DROPDOWN}
    # Log To Console    timezone: ${settings_clock_timezone}\n

    # Browser.Wait For Elements State    ${SELECTOR_SETTINGS_CLOCK_CURRENT_CLOCK_INPUT}     state=visible    timeout=2s
    # ${settings_clock_current_clock}=           Browser.Get Text    ${SELECTOR_SETTINGS_CLOCK_CURRENT_CLOCK_INPUT}
    # Log To Console    current_time: ${settings_clock_current_clock}\n

    # Browser.Wait For Elements State    ${SELECTOR_SETTINGS_CLOCK_CURRENT_DATE_INPUT}     state=visible    timeout=2s
    # ${settings_clock_current_date}=           Browser.Get Text    ${SELECTOR_SETTINGS_CLOCK_CURRENT_DATE_INPUT}
    # Log To Console    current_date: ${settings_clock_current_date}\n

    # Browser.Uncheck Checkbox   ${SELECTOR_SETTINGS_SYSTEM_CLOCK_USE_FX_TIME_SERVER_CHECKBOX}
    # Browser.Uncheck Checkbox   ${SELECTOR_SETTINGS_SYSTEM_CLOCK_USE_GSM_TIME_CHECKBOX}

    # ${dst_forward_2025_year}    ${dst_forward_2025_month}    ${dst_forward_2025_day}    Separate Year Month Day    ${DST_FORWARD_2025_MARCH}
    # ${dst_forward_2025_date}=    Set Variable    ${dst_forward_2025_day}${dst_forward_2025_month}${dst_forward_2025_year}
    # # Log To Console    DST date: ${dst_forward_2025_date}

    # # Setting date and time to the moment before DST clock change.
    # Browser.Type Text    ${SELECTOR_SETTINGS_CLOCK_CURRENT_CLOCK_INPUT}    ${DST_BEFORE_FORWARD_TIME}   
    # Browser.Type Text    ${SELECTOR_SETTINGS_CLOCK_CURRENT_DATE_INPUT}    txt=${dst_forward_2025_date}    delay=50 ms    clear=false

    # Browser.Wait For Elements State    ${SELECTOR_SETTINGS_CLOCK_SAVE_BUTTON}     state=visible    timeout=2s
    # Browser.Click    ${SELECTOR_SETTINGS_CLOCK_SAVE_BUTTON}

    # # Check date and time is set correctly
    # Browser.Wait For Elements State    ${SELECTOR_SETTINGS_CLOCK_CURRENT_CLOCK_INPUT}     state=visible    timeout=2s
    # ${settings_clock_current_clock}=           Browser.Get Text    ${SELECTOR_SETTINGS_CLOCK_CURRENT_CLOCK_INPUT}
    # Log To Console    Clock set to : ${settings_clock_current_clock}\n

    # Browser.Wait For Elements State    ${SELECTOR_SETTINGS_CLOCK_CURRENT_DATE_INPUT}     state=visible    timeout=2s
    # ${settings_clock_current_date}=           Browser.Get Text    ${SELECTOR_SETTINGS_CLOCK_CURRENT_DATE_INPUT}
    # Log To Console    Date set to : ${settings_clock_current_date}\n

    # Sleep    120s
    # # ${sleep_120}=    Set Variable    120
    # # Log To Console    Out of ${sleep_120}s left:   ${sleep_120}
    # # Log To Console    \b\b\b
    # # FOR    ${i}    IN RANGE    ${sleep_120}/2
    # #     IF    ${i} > 99
    # #         Log To Console    \b\b\b
    # #         Log To Console    ${i}
    # #     ELSE
    # #         IF    ${i} > 9
    # #             Log To Console    \b\b
    # #             Log To Console    ${i}

    # #         ELSE
    # #             Log To Console    \b
    # #             Log To Console    ${i}
    # #         END
    # #     END
    # #     Sleep    2s
    # # END

    # # Refreshing the page
    # Browser.Click    ${selector_navbar_settings} 
    # Browser.Click    ${selector_settings_system}
    # Browser.Click    ${selector_settings_system_clock}

    # # Check date and time after 2 minutes
    # Browser.Wait For Elements State    ${SELECTOR_SETTINGS_CLOCK_CURRENT_CLOCK_INPUT}     state=visible    timeout=2s
    # ${settings_clock_current_time}=           Browser.Get Text    ${SELECTOR_SETTINGS_CLOCK_CURRENT_CLOCK_INPUT}
    # Log To Console    Clock after 120s : ${settings_clock_current_clock}\n

    # Browser.Wait For Elements State    ${SELECTOR_SETTINGS_CLOCK_CURRENT_DATE_INPUT}     state=visible    timeout=2s
    # ${settings_clock_current_date}=           Browser.Get Text    ${SELECTOR_SETTINGS_CLOCK_CURRENT_DATE_INPUT}
    # Log To Console    Date after 120s : ${settings_clock_current_date}\n

    # IF    $settings_clock_current_date == $DST_FORWARD_2025_MARCH
    #     Log To Console    Correct DST date\n
    # ELSE
    #     Log To Console    INCORRECT DST date\n
    # END

    # IF    $settings_clock_current_time == $DST_AFTER_FORWARD_TIME
    #     Log To Console    Correct DST time\n
    # ELSE
    #     Log To Console    INCORRECT DST time\n
    # END


*** Keywords ***

Settings Tab Dashboard Page
    navigate.Go to login page
    login.Login with credentials    ${user}    ${user_password}

    navigate.Go to settings

Prepare Session Timeout And Go To Clock Settings Page
    navigate.Go to login page
    login.Login with credentials    ${user}    ${user_password}
    language.Change language to english
    navigate.Go to system device settings
    # Check if timeout is less than 5 min
    Browser.Wait For Elements State    ${SELECTOR_SETTINGS_SYSTEM_DEVICE_SESSION_TIMEOUT_INPUT}    timeout=2s
    ${current_timeout_value}=    Browser.Get Text    ${SELECTOR_SETTINGS_SYSTEM_DEVICE_SESSION_TIMEOUT_INPUT}
    ${current_timeout_value_int}=    Convert To Integer    ${current_timeout_value}

    IF    $current_timeout_value_int < 5
        Browser.Type Text    ${SELECTOR_SETTINGS_SYSTEM_DEVICE_SESSION_TIMEOUT_INPUT}    5
        Browser.Wait For Elements State    ${SELECTOR_SETTINGS_SYSTEM_DEVICE_SAVE_BUTTON}    timeout=2s
        Browser.Click    ${SELECTOR_SETTINGS_SYSTEM_DEVICE_SAVE_BUTTON}
    END
    navigate.Go to system clock settings

Revert Clock Settings Page Settings To Current Time And Date

    ${current_date}    ${current_time}=    Get Current Date And Time Custom
    Browser.Wait For Elements State    ${SELECTOR_SETTINGS_CLOCK_CURRENT_CLOCK_INPUT}     state=visible    timeout=2s
    Browser.Type Text    ${SELECTOR_SETTINGS_CLOCK_CURRENT_CLOCK_INPUT}    ${current_time}    delay=50 ms    clear=true

    Browser.Wait For Elements State    ${SELECTOR_SETTINGS_CLOCK_CURRENT_DATE_INPUT}     state=visible    timeout=2s
    Browser.Type Text    ${SELECTOR_SETTINGS_CLOCK_CURRENT_DATE_INPUT}    ${current_date}    delay=50 ms    clear=true

    Browser.Wait For Elements State    ${SELECTOR_SETTINGS_CLOCK_SAVE_BUTTON}     state=visible    timeout=2s
    Browser.Click    ${SELECTOR_SETTINGS_CLOCK_SAVE_BUTTON}

    Browser.Wait For Elements State    ${SELECTOR_SETTINGS_CLOCK_CURRENT_CLOCK_INPUT}     state=visible    timeout=2s
    ${settings_clock_current_time}=           Browser.Get Text    ${SELECTOR_SETTINGS_CLOCK_CURRENT_CLOCK_INPUT}

    Browser.Wait For Elements State    ${SELECTOR_SETTINGS_CLOCK_CURRENT_DATE_INPUT}     state=visible    timeout=2s
    ${settings_clock_current_date}=           Browser.Get Text    ${SELECTOR_SETTINGS_CLOCK_CURRENT_DATE_INPUT}

Separate Hour And Minute
    [Arguments]    ${TIME}

    ${time_parts}=    Split String    ${TIME}    :
    ${hour}=          Set Variable    ${time_parts}[0]
    ${minute}=        Set Variable    ${time_parts}[1]

Separate Year Month Day
    [Arguments]    ${DATE}

    ${date_parts}=    Split String    ${DATE}    -
    ${year}=          Set Variable    ${date_parts}[0]
    ${month}=         Set Variable    ${date_parts}[1]
    ${day}=           Set Variable    ${date_parts}[2]
    [Return]    ${year}    ${month}    ${day}

Get Current Date And Time Custom
    ${current_date_time}=    Get Current Date    result_format=%Y-%m-%d %H:%M
    ${CURRENT_DATE}=    Convert Date    ${current_date_time}    result_format=%Y-%m-%d
    ${CURRENT_TIME}=    Convert Date    ${current_date_time}    result_format=%H:%M
    [Return]    ${CURRENT_DATE}    ${CURRENT_TIME}

Calculate Date And Time Difference
    [Arguments]    ${input_date_time}
    
    # Get the current date and time
    ${current_date_time}=    Get Current Date    result_format=%Y-%m-%d %H:%M
    
    # Convert both dates to datetime objects
    ${current_datetime}=    Convert Date    ${current_date_time}    result_format=%Y-%m-%d %H:%M
    ${input_datetime}=      Convert Date    ${input_date_time}      result_format=%Y-%m-%d %H:%M
    
    # Calculate time difference
    ${time_difference}=     Evaluate    ${current_datetime} - ${input_datetime}    modules=datetime
    
    # Extract days, hours, and minutes from the time difference
    ${total_seconds}=       Evaluate    ${time_difference}.total_seconds()    modules=datetime
    ${days}=                Evaluate    int(${total_seconds} // 86400)
    ${hours}=               Evaluate    int(${total_seconds} % 86400 // 3600)
    ${minutes}=             Evaluate    int(${total_seconds} % 3600 // 60)
    
   # Determine direction
    ${direction}=           Set Variable    after
    Run Keyword If    ${is_before}    Set Variable    ${direction}    before
    
    # Format the difference with direction
    ${diff}=                Set Variable    ${days} days ${hours} hours ${minutes} minutes ${direction}
    
    [Return]    ${diff}

Calculate Date And Time Difference 2
    [Arguments]    ${input_date}    ${input_time}
    
    # Get the current date and time in separate formats
    ${current_date}=    Get Current Date    result_format=%Y-%m-%d
    ${current_time}=    Get Current Date    result_format=%H:%M
    
    # Combine the date and time into full datetime strings
    ${current_datetime}=    Set Variable    ${current_date} ${current_time}
    ${input_datetime}=      Set Variable    ${input_date} ${input_time}
    
    # Convert both date-time strings to datetime objects
    ${current_datetime_obj}=    Convert Date    ${current_datetime}    result_format=%Y-%m-%d %H:%M
    ${input_datetime_obj}=      Convert Date    ${input_datetime}      result_format=%Y-%m-%d %H:%M
    
    # Calculate if input datetime is before or after the current datetime
    ${is_before}=    Run Keyword And Return Status    Evaluate    ${input_datetime_obj} < ${current_datetime_obj}
    
    # Calculate the absolute time difference
    ${time_difference}=     Evaluate    abs(${current_datetime_obj} - ${input_datetime_obj})    modules=datetime
    
    # Extract days, hours, and minutes from the time difference
    ${total_seconds}=       Evaluate    ${time_difference}.total_seconds()    modules=datetime
    ${days}=                Evaluate    int(${total_seconds} // 86400)
    ${hours}=               Evaluate    int(${total_seconds} % 86400 // 3600)
    ${minutes}=             Evaluate    int(${total_seconds} % 3600 // 60)
    
    # Determine direction (before or after)
    ${direction}=           Set Variable    after
    Run Keyword If    ${is_before}    Set Variable    ${direction}    before
    
    # Format the difference with direction
    ${diff}=                Set Variable    ${days} days ${hours} hours ${minutes} minutes ${direction}
    
    [Return]    ${diff}


Check Forward DST Correct
    [Arguments]    ${forward_dst_date}

    Browser.Wait For Elements State    ${SELECTOR_SETTINGS_SYSTEM_CLOCK_TIME_ZONE_DROPDOWN}     state=visible    timeout=2s
    ${settings_clock_timezone}=           Browser.Get Text    ${SELECTOR_SETTINGS_SYSTEM_CLOCK_TIME_ZONE_DROPDOWN}

    Browser.Wait For Elements State    ${SELECTOR_SETTINGS_CLOCK_CURRENT_CLOCK_INPUT}     state=visible    timeout=2s
    ${settings_clock_current_clock}=           Browser.Get Text    ${SELECTOR_SETTINGS_CLOCK_CURRENT_CLOCK_INPUT}

    Browser.Wait For Elements State    ${SELECTOR_SETTINGS_CLOCK_CURRENT_DATE_INPUT}     state=visible    timeout=2s
    ${settings_clock_current_date}=           Browser.Get Text    ${SELECTOR_SETTINGS_CLOCK_CURRENT_DATE_INPUT}

    Browser.Uncheck Checkbox   ${SELECTOR_SETTINGS_SYSTEM_CLOCK_USE_FX_TIME_SERVER_CHECKBOX}
    Browser.Uncheck Checkbox   ${SELECTOR_SETTINGS_SYSTEM_CLOCK_USE_GSM_TIME_CHECKBOX}

    ${dst_forward_dst_year}    ${dst_forward_dst_month}    ${dst_forward_dst_day}    Separate Year Month Day    ${forward_dst_date}
    ${dst_forward_dst_date}=    Set Variable    ${dst_forward_dst_day}${dst_forward_dst_month}${dst_forward_dst_year}

    # Setting date and time to the moment before DST clock change.
    Browser.Type Text    ${SELECTOR_SETTINGS_CLOCK_CURRENT_CLOCK_INPUT}    ${DST_BEFORE_FORWARD_TIME}   
    Browser.Type Text    ${SELECTOR_SETTINGS_CLOCK_CURRENT_DATE_INPUT}    txt=${dst_forward_dst_date}    delay=50 ms    clear=false

    Browser.Wait For Elements State    ${SELECTOR_SETTINGS_CLOCK_SAVE_BUTTON}     state=visible    timeout=2s
    Browser.Click    ${SELECTOR_SETTINGS_CLOCK_SAVE_BUTTON}

    # Check date and time is set correctly
    Browser.Wait For Elements State    ${SELECTOR_SETTINGS_CLOCK_CURRENT_CLOCK_INPUT}     state=visible    timeout=2s
    ${settings_clock_current_clock}=           Browser.Get Text    ${SELECTOR_SETTINGS_CLOCK_CURRENT_CLOCK_INPUT}

    Browser.Wait For Elements State    ${SELECTOR_SETTINGS_CLOCK_CURRENT_DATE_INPUT}     state=visible    timeout=2s
    ${settings_clock_current_date}=           Browser.Get Text    ${SELECTOR_SETTINGS_CLOCK_CURRENT_DATE_INPUT}

    Log To Console    \nInitial setup: Timezone: ${settings_clock_timezone}\nCurrent timestamp: ${settings_clock_current_date} ** ${settings_clock_current_clock}
    Log To Console    Next DST transition forward: ${forward_dst_date} ** ${DST_BEFORE_FORWARD_TIME}
    Log To Console    Time set to 2 minutes before: ${settings_clock_current_date} ** ${settings_clock_current_clock}\n

    Log To Console    Sleeping for 120s
    Sleep    30s
    Log To Console    Sleeping for 30s out 120s
    Sleep    30s
    Log To Console    Sleeping for 60s out 120s
    Sleep    30s
    Log To Console    Sleeping for 90s out 120s
    Sleep    30s

    # Refreshing the page
    Browser.Click    ${selector_navbar_settings} 
    Browser.Click    ${selector_settings_system}
    Browser.Click    ${selector_settings_system_clock}

    # Check date and time after 2 minutes
    Browser.Wait For Elements State    ${SELECTOR_SETTINGS_CLOCK_CURRENT_CLOCK_INPUT}     state=visible    timeout=2s
    ${settings_clock_current_time}=           Browser.Get Text    ${SELECTOR_SETTINGS_CLOCK_CURRENT_CLOCK_INPUT}

    Browser.Wait For Elements State    ${SELECTOR_SETTINGS_CLOCK_CURRENT_DATE_INPUT}     state=visible    timeout=2s
    ${settings_clock_current_date}=           Browser.Get Text    ${SELECTOR_SETTINGS_CLOCK_CURRENT_DATE_INPUT}
    Log To Console    Date reading after 120s : ${settings_clock_current_date} ** ${settings_clock_current_time}\n
    Log To Console    TEST RESULT:

    IF    $settings_clock_current_date == $forward_dst_date
        Log To Console    Correct DST date for ${forward_dst_date}
    ELSE
        Log To Console    ! INCORRECT DST date for ${forward_dst_date}
    END

    IF    $settings_clock_current_time == $DST_AFTER_FORWARD_TIME
        Log To Console    Correct DST time for ${forward_dst_date}
    ELSE
        Log To Console    ! INCORRECT DST time for ${forward_dst_date}
    END


Check Backward DST Correct
    [Arguments]    ${backward_dst_date}

    Browser.Wait For Elements State    ${SELECTOR_SETTINGS_SYSTEM_CLOCK_TIME_ZONE_DROPDOWN}     state=visible    timeout=2s
    ${settings_clock_timezone}=           Browser.Get Text    ${SELECTOR_SETTINGS_SYSTEM_CLOCK_TIME_ZONE_DROPDOWN}

    Browser.Wait For Elements State    ${SELECTOR_SETTINGS_CLOCK_CURRENT_CLOCK_INPUT}     state=visible    timeout=2s
    ${settings_clock_current_clock}=           Browser.Get Text    ${SELECTOR_SETTINGS_CLOCK_CURRENT_CLOCK_INPUT}

    Browser.Wait For Elements State    ${SELECTOR_SETTINGS_CLOCK_CURRENT_DATE_INPUT}     state=visible    timeout=2s
    ${settings_clock_current_date}=           Browser.Get Text    ${SELECTOR_SETTINGS_CLOCK_CURRENT_DATE_INPUT}

    Browser.Uncheck Checkbox   ${SELECTOR_SETTINGS_SYSTEM_CLOCK_USE_FX_TIME_SERVER_CHECKBOX}
    Browser.Uncheck Checkbox   ${SELECTOR_SETTINGS_SYSTEM_CLOCK_USE_GSM_TIME_CHECKBOX}

    ${dst_backward_dst_year}    ${dst_backward_dst_month}    ${dst_backward_dst_day}    Separate Year Month Day    ${backward_dst_date}
    ${dst_backward_dst_date}=    Set Variable    ${dst_backward_dst_day}${dst_backward_dst_month}${dst_backward_dst_year}

    # Setting date and time to the moment before DST clock change.
    Browser.Type Text    ${SELECTOR_SETTINGS_CLOCK_CURRENT_CLOCK_INPUT}    ${DST_BEFORE_FORWARD_TIME}   
    Browser.Type Text    ${SELECTOR_SETTINGS_CLOCK_CURRENT_DATE_INPUT}    txt=${dst_backward_dst_date}    delay=50 ms    clear=false

    Browser.Wait For Elements State    ${SELECTOR_SETTINGS_CLOCK_SAVE_BUTTON}     state=visible    timeout=2s
    Browser.Click    ${SELECTOR_SETTINGS_CLOCK_SAVE_BUTTON}

    # Check date and time is set correctly
    Browser.Wait For Elements State    ${SELECTOR_SETTINGS_CLOCK_CURRENT_CLOCK_INPUT}     state=visible    timeout=2s
    ${settings_clock_current_clock}=           Browser.Get Text    ${SELECTOR_SETTINGS_CLOCK_CURRENT_CLOCK_INPUT}

    Browser.Wait For Elements State    ${SELECTOR_SETTINGS_CLOCK_CURRENT_DATE_INPUT}     state=visible    timeout=2s
    ${settings_clock_current_date}=           Browser.Get Text    ${SELECTOR_SETTINGS_CLOCK_CURRENT_DATE_INPUT}

    Log To Console    \nInitial setup: Timezone: ${settings_clock_timezone}\nCurrent timestamp: ${settings_clock_current_date} ** ${settings_clock_current_clock}
    Log To Console    Next DST transition backward: ${backward_dst_date} ** ${DST_BEFORE_BACKWARD_TIME}
    Log To Console    Time set to 2 minutes before: ${settings_clock_current_date} ** ${settings_clock_current_clock}\n

    Log To Console    Sleeping for 120s
    Sleep    30s
    Log To Console    Sleeping for 30s out 120s
    Sleep    30s
    Log To Console    Sleeping for 60s out 120s
    Sleep    30s
    Log To Console    Sleeping for 90s out 120s
    Sleep    30s

    # Refreshing the page
    Browser.Click    ${selector_navbar_settings} 
    Browser.Click    ${selector_settings_system}
    Browser.Click    ${selector_settings_system_clock}

    # Check date and time after 2 minutes
    Browser.Wait For Elements State    ${SELECTOR_SETTINGS_CLOCK_CURRENT_CLOCK_INPUT}     state=visible    timeout=2s
    ${settings_clock_current_time}=           Browser.Get Text    ${SELECTOR_SETTINGS_CLOCK_CURRENT_CLOCK_INPUT}

    Browser.Wait For Elements State    ${SELECTOR_SETTINGS_CLOCK_CURRENT_DATE_INPUT}     state=visible    timeout=2s
    ${settings_clock_current_date}=           Browser.Get Text    ${SELECTOR_SETTINGS_CLOCK_CURRENT_DATE_INPUT}
    Log To Console    Date reading after 120s : ${settings_clock_current_date} ** ${settings_clock_current_time}\n
    Log To Console    TEST RESULT:

    IF    $settings_clock_current_date == $backward_dst_date
        Log To Console    Correct DST date for ${backward_dst_date}
    ELSE
        Log To Console    ! INCORRECT DST date for ${backward_dst_date}
    END

    IF    $settings_clock_current_time == $DST_AFTER_BACKWARD_TIME
        Log To Console    Correct DST time for ${backward_dst_date}
    ELSE
        Log To Console    ! INCORRECT DST time for ${backward_dst_date}
    END
