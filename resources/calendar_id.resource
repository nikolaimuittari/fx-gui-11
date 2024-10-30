*** Settings ***
Library     Browser
Library     DateTime
Library     String
Resource    navigate.resource
Resource    login.resource
Resource    device_locators.resource
Resource    global_variables.resource
Resource    automation_locators_id.resource


*** Variables ***
${DATE_FORMAT}      %B %d, %Y
${INPUT_FORMAT}     %d.%m.%Y %H:%M
${MONTH_NAMES}      JAN FEB MAR APR MAY JUN JUL AUG SEP OCT NOV DEC


*** Keywords ***
Create Current Month And Year String
    ${current_date}=    Get Current Date    result_format=%B %Y
    ${month}    ${year}=    Split String    ${current_date}
    ${upper_month}=    Convert To Uppercase    ${month}
    ${current_month_and_year}=    Set Variable    ${upper_month} ${year}
    Log To Console    ${current_month_and_year}
    RETURN    ${current_month_and_year}

Increment Year Related To Current
    [Arguments]    ${year}
    ${current_year}=    Get Current Date    result_format=%Y
    ${diff}=    Evaluate    ${year} - ${current_year} + 1
    RETURN    ${diff}

Get Date Relative to Today
    [Arguments]    ${days_offset}
    ${offset_date}=    Get Current Date    result_format=%Y-%m-%d    time_zone=LOCAL
    ...    increment=${days_offset} days
    RETURN    ${offset_date}

Check Month And Year Equal
    [Arguments]    ${expected_month_and_year}
    ${current_month_and_year}=    Create Current Month and Year String
    Should Be Equal As Strings    ${current_month_and_year}    ${expected_month_and_year}

Get Todays Date YYYY-MM-DD
    ${today}=    Get Current Date    result_format=%Y-%m-%d
    RETURN    ${today}

Edit Calendar Event Timetable
    [Arguments]    ${event_description}    ${timetable_option}    ${weekday}

    Wait For Elements State    ${SELECTOR_AUTOMATION_CALENDAR_EDIT_DESCRIPTION_INPUT}    visible    timeout=2s
    Fill Text    ${SELECTOR_AUTOMATION_CALENDAR_EDIT_DESCRIPTION_INPUT}    ${event_description}

    IF    ${timetable_option} == 1
        Wait For Elements State    ${SELECTOR_AUTOMATION_CALENDAR_EDIT_APPLY_TIMETABLE_BUTTON}    visible    timeout=2s
        Browser.Click    ${SELECTOR_AUTOMATION_CALENDAR_EDIT_APPLY_TIMETABLE_BUTTON}

        Wait For Elements State    ${SELECTOR_AUTOMATION_CALENDAR_EDIT_TIMETABLE_SELECT}    visible    timeout=2s
        Browser.Click    ${SELECTOR_AUTOMATION_CALENDAR_EDIT_TIMETABLE_SELECT}

        ${timetable_option_2}=    Set Variable
        ...    xpath=//mat-option[@data-qa-id='automation-calendar-edit-timetable-option2']
        Wait For Elements State    ${timetable_option_2}    visible    timeout=2s
        Browser.Click    ${timetable_option_2}

        ${time}    ${hour_value}    ${minute_value}=    Generate Random Time
        # Browser.Click    ${SELECTOR_AUTOMATION_CALENDAR_EDIT_TIMETABLE_EVENT1_TIME_INPUT}
        Browser.Type Text
        ...    ${SELECTOR_AUTOMATION_CALENDAR_EDIT_TIMETABLE_EVENT1_TIME_INPUT}
        ...    ${hour_value}${minute_value}
        # Keyboard Input    type    ${hour_value}    50ms
        # Keyboard Input    type    ${minute_value}    50ms

        ${time}    ${hour_value}    ${minute_value}=    Generate Random Time
        Browser.Type Text
        ...    ${SELECTOR_AUTOMATION_CALENDAR_EDIT_TIMETABLE_EVENT2_TIME_INPUT}
        ...    ${hour_value}${minute_value}

        # Browser.Click    ${SELECTOR_AUTOMATION_CALENDAR_EDIT_TIMETABLE_EVENT2_TIME_INPUT}
        # Keyboard Input    type    ${hour_value}    50ms
        # Keyboard Input    type    ${minute_value}    50ms

        ${time}    ${hour_value}    ${minute_value}=    Generate Random Time
        Browser.Type Text
        ...    ${SELECTOR_AUTOMATION_CALENDAR_EDIT_TIMETABLE_EVENT3_TIME_INPUT}
        ...    ${hour_value}${minute_value}
        # Browser.Click    ${SELECTOR_AUTOMATION_CALENDAR_EDIT_TIMETABLE_EVENT3_TIME_INPUT}
        # Keyboard Input    type    ${hour_value}    50ms
        # Keyboard Input    type    ${minute_value}    50ms

        ${time}    ${hour_value}    ${minute_value}=    Generate Random Time
        Browser.Type Text
        ...    ${SELECTOR_AUTOMATION_CALENDAR_EDIT_TIMETABLE_EVENT4_TIME_INPUT}
        ...    ${hour_value}${minute_value}
        # Browser.Click    ${SELECTOR_AUTOMATION_CALENDAR_EDIT_TIMETABLE_EVENT4_TIME_INPUT}
        # Keyboard Input    type    ${hour_value}    50ms
        # Keyboard Input    type    ${minute_value}    50ms

        ${time}    ${hour_value}    ${minute_value}=    Generate Random Time
        Browser.Type Text
        ...    ${SELECTOR_AUTOMATION_CALENDAR_EDIT_TIMETABLE_EVENT5_TIME_INPUT}
        ...    ${hour_value}${minute_value}
        # Browser.Click    ${SELECTOR_AUTOMATION_CALENDAR_EDIT_TIMETABLE_EVENT5_TIME_INPUT}
        # Keyboard Input    type    ${hour_value}    50ms
        # Keyboard Input    type    ${minute_value}    50ms

        ${time}    ${hour_value}    ${minute_value}=    Generate Random Time
        Browser.Type Text
        ...    ${SELECTOR_AUTOMATION_CALENDAR_EDIT_TIMETABLE_EVENT6_TIME_INPUT}
        ...    ${hour_value}${minute_value}
        # Browser.Click    ${SELECTOR_AUTOMATION_CALENDAR_EDIT_TIMETABLE_EVENT6_TIME_INPUT}
        # Keyboard Input    type    ${hour_value}    50ms
        # Keyboard Input    type    ${minute_value}    50ms

        ${event_value}=    Evaluate    random.randint(-50, 99)
        Fill Text    ${SELECTOR_AUTOMATION_CALENDAR_EDIT_TIMETABLE_EVENT1_VALUE_INPUT}    ${event_value}

        ${event_value}=    Evaluate    random.randint(-50, 99)
        Fill Text    ${SELECTOR_AUTOMATION_CALENDAR_EDIT_TIMETABLE_EVENT2_VALUE_INPUT}    ${event_value}

        ${event_value}=    Evaluate    random.randint(-50, 99)
        Fill Text    ${SELECTOR_AUTOMATION_CALENDAR_EDIT_TIMETABLE_EVENT3_VALUE_INPUT}    ${event_value}

        ${event_value}=    Evaluate    random.randint(-50, 99)
        Fill Text    ${SELECTOR_AUTOMATION_CALENDAR_EDIT_TIMETABLE_EVENT4_VALUE_INPUT}    ${event_value}

        ${event_value}=    Evaluate    random.randint(-50, 99)
        Fill Text    ${SELECTOR_AUTOMATION_CALENDAR_EDIT_TIMETABLE_EVENT5_VALUE_INPUT}    ${event_value}

        ${event_value}=    Evaluate    random.randint(-50, 99)
        Fill Text    ${SELECTOR_AUTOMATION_CALENDAR_EDIT_TIMETABLE_EVENT6_VALUE_INPUT}    ${event_value}
    ELSE IF    ${timetable_option} == 2
        Wait For Elements State    ${SELECTOR_AUTOMATION_CALENDAR_EDIT_APPLY_WEEKDAY_BUTTON}    visible    timeout=2s
        Browser.Click    ${SELECTOR_AUTOMATION_CALENDAR_EDIT_APPLY_WEEKDAY_BUTTON}

        Wait For Elements State    ${SELECTOR_AUTOMATION_CALENDAR_EDIT_WEEKDAY_MONDAY_RADIO}    visible    timeout=2s
        Browser.Click    ${SELECTOR_AUTOMATION_CALENDAR_EDIT_WEEKDAY_MONDAY_RADIO}
        Log To Console    Monday OK
        Browser.Click    ${SELECTOR_AUTOMATION_CALENDAR_EDIT_WEEKDAY_TUESDAY_RADIO}
        Browser.Click    ${SELECTOR_AUTOMATION_CALENDAR_EDIT_WEEKDAY_WEDNESDAY_RADIO}
        Browser.Click    ${SELECTOR_AUTOMATION_CALENDAR_EDIT_WEEKDAY_THURSDAY_RADIO}
        Browser.Click    ${SELECTOR_AUTOMATION_CALENDAR_EDIT_WEEKDAY_FRIDAY_RADIO}
        Browser.Click    ${SELECTOR_AUTOMATION_CALENDAR_EDIT_WEEKDAY_SATURDAY_RADIO}
        Browser.Click    ${SELECTOR_AUTOMATION_CALENDAR_EDIT_WEEKDAY_SUNDAY_RADIO}
        Browser.Click    ${SELECTOR_AUTOMATION_CALENDAR_EDIT_WEEKDAY_E1_RADIO}
        Browser.Click    ${SELECTOR_AUTOMATION_CALENDAR_EDIT_WEEKDAY_E2_RADIO}
        Browser.Click    ${SELECTOR_AUTOMATION_CALENDAR_EDIT_WEEKDAY_E3_RADIO}
        Log To Console    E3 OK

        IF    $weekday == 1
            Browser.Click    ${SELECTOR_AUTOMATION_CALENDAR_EDIT_WEEKDAY_MONDAY_RADIO}
        ELSE IF    $weekday == 2
            Browser.Click    ${SELECTOR_AUTOMATION_CALENDAR_EDIT_WEEKDAY_TUESDAY_RADIO}
        ELSE IF    $weekday == 3
            Browser.Click    ${SELECTOR_AUTOMATION_CALENDAR_EDIT_WEEKDAY_WEDNESDAY_RADIO}
        ELSE IF    $weekday == 4
            Browser.Click    ${SELECTOR_AUTOMATION_CALENDAR_EDIT_WEEKDAY_THURSDAY_RADIO}
        ELSE IF    $weekday == 5
            Browser.Click    ${SELECTOR_AUTOMATION_CALENDAR_EDIT_WEEKDAY_FRIDAY_RADIO}
        ELSE IF    $weekday == 6
            Browser.Click    ${SELECTOR_AUTOMATION_CALENDAR_EDIT_WEEKDAY_SATURDAY_RADIO}
        ELSE IF    $weekday == 7
            Browser.Click    ${SELECTOR_AUTOMATION_CALENDAR_EDIT_WEEKDAY_SUNDAY_RADIO}
        ELSE IF    $weekday == 8
            Browser.Click    ${SELECTOR_AUTOMATION_CALENDAR_EDIT_WEEKDAY_E1_RADIO}
        ELSE IF    $weekday == 9
            Browser.Click    ${SELECTOR_AUTOMATION_CALENDAR_EDIT_WEEKDAY_E2_RADIO}
        ELSE IF    $weekday == 10
            Browser.Click    ${SELECTOR_AUTOMATION_CALENDAR_EDIT_WEEKDAY_E3_RADIO}
        END
    END

Edit Calendar Event Validity Period
    [Arguments]
    ...    ${event_description}
    ...    ${validity_option}
    ...    ${date_1}
    ...    ${date_2}
    ...    ${repeat_month}
    ...    ${repeat_days_month}
    ...    ${repeat_day_week}

    Wait For Elements State    ${SELECTOR_AUTOMATION_CALENDAR_EDIT_DESCRIPTION_INPUT}    visible    timeout=2s
    Fill Text    ${SELECTOR_AUTOMATION_CALENDAR_EDIT_DESCRIPTION_INPUT}    ${event_description}

    Wait For Elements State    ${SELECTOR_AUTOMATION_CALENDAR_EDIT_MODE_SELECT}    visible    timeout=2s
    Browser.Click    ${SELECTOR_AUTOMATION_CALENDAR_EDIT_MODE_SELECT}

    ${validity_period_date}=    Set Variable    xpath=//mat-option[@data-qa-id='automation-calendar-edit-mode-option1']
    ${validity_period_date_range}=    Set Variable
    ...    xpath=//mat-option[@data-qa-id='automation-calendar-edit-mode-option2']
    ${validity_period_repeat}=    Set Variable
    ...    xpath=//mat-option[@data-qa-id='automation-calendar-edit-mode-option3']

    IF    ${validity_option} == 1
        ${splitted_year}    ${splitted_month}    ${splitted_day}=    Split Date String    ${date_1}
        Wait For Elements State    ${validity_period_date}    visible    timeout=2s
        Browser.Click    ${validity_period_date}

        Wait For Elements State    ${SELECTOR_AUTOMATION_CALENDAR_EDIT_START_DAY_SELECT}    visible    timeout=2s
        Browser.Click    ${SELECTOR_AUTOMATION_CALENDAR_EDIT_START_DAY_SELECT}

        ${date_1_day}=    Set Variable
        ...    xpath=//mat-option[@data-qa-id='automation-calendar-edit-start-day-option${splitted_day}']
        Wait For Elements State    ${date_1_day}    visible    timeout=2s
        Browser.Click    ${date_1_day}

        Wait For Elements State    ${SELECTOR_AUTOMATION_CALENDAR_EDIT_START_MONTH_SELECT}    visible    timeout=2s
        Browser.Click    ${SELECTOR_AUTOMATION_CALENDAR_EDIT_START_MONTH_SELECT}
        ${date_1_month}=    Set Variable
        ...    xpath=//mat-option[@data-qa-id='automation-calendar-edit-start-month-option${splitted_month}']
        Wait For Elements State    ${date_1_month}    visible    timeout=2s
        Browser.Click    ${date_1_month}

        Wait For Elements State    ${SELECTOR_AUTOMATION_CALENDAR_EDIT_START_YEAR_SELECT}    visible    timeout=2s
        Browser.Click    ${SELECTOR_AUTOMATION_CALENDAR_EDIT_START_YEAR_SELECT}
        ${year_option}=    Increment Year Related To Current    ${splitted_year}
        ${date_1_year}=    Set Variable
        ...    xpath=//mat-option[@data-qa-id='automation-calendar-edit-start-year-option${year_option}']
        Wait For Elements State    ${date_1_year}    visible    timeout=2s
        Browser.Click    ${date_1_year}
    ELSE IF    ${validity_option} == 2
        ${splitted_year}    ${splitted_month}    ${splitted_day}=    Split Date String    ${date_1}
        ${splitted_year_2}    ${splitted_month_2}    ${splitted_day_2}=    Split Date String    ${date_2}
        Wait For Elements State    ${validity_period_date_range}    visible    timeout=2s
        Browser.Click    ${validity_period_date_range}

        Wait For Elements State    ${SELECTOR_AUTOMATION_CALENDAR_EDIT_START_DAY_SELECT}    visible    timeout=2s
        Browser.Click    ${SELECTOR_AUTOMATION_CALENDAR_EDIT_START_DAY_SELECT}
        ${date_1_day}=    Set Variable
        ...    xpath=//mat-option[@data-qa-id='automation-calendar-edit-start-day-option${splitted_day}']
        Wait For Elements State    ${date_1_day}    visible    timeout=2s
        Browser.Click    ${date_1_day}

        Wait For Elements State    ${SELECTOR_AUTOMATION_CALENDAR_EDIT_START_MONTH_SELECT}    visible    timeout=2s
        Browser.Click    ${SELECTOR_AUTOMATION_CALENDAR_EDIT_START_MONTH_SELECT}
        ${date_1_month}=    Set Variable
        ...    xpath=//mat-option[@data-qa-id='automation-calendar-edit-start-month-option${splitted_month}']
        Wait For Elements State    ${date_1_month}    visible    timeout=2s
        Browser.Click    ${date_1_month}

        Wait For Elements State    ${SELECTOR_AUTOMATION_CALENDAR_EDIT_START_YEAR_SELECT}    visible    timeout=2s
        Browser.Click    ${SELECTOR_AUTOMATION_CALENDAR_EDIT_START_YEAR_SELECT}
        ${year_option}=    Increment Year Related To Current    ${splitted_year}
        ${date_1_year}=    Set Variable
        ...    xpath=//mat-option[@data-qa-id='automation-calendar-edit-start-year-option${year_option}']
        Wait For Elements State    ${date_1_year}    visible    timeout=2s
        Browser.Click    ${date_1_year}

        # Check Checkbox    ${SELECTOR_AUTOMATION_CALENDAR_EDIT_INCLUDE_START_DATE_CHECKBOX}
        # Uncheck Checkbox    ${SELECTOR_AUTOMATION_CALENDAR_EDIT_INCLUDE_START_DATE_CHECKBOX}
        # Check Checkbox    ${SELECTOR_AUTOMATION_CALENDAR_EDIT_INCLUDE_START_DATE_CHECKBOX}

        Wait For Elements State    ${SELECTOR_AUTOMATION_CALENDAR_EDIT_START_DAY_SELECT}    visible    timeout=2s
        Browser.Click    ${SELECTOR_AUTOMATION_CALENDAR_EDIT_START_DAY_SELECT}
        ${date_2_day}=    Set Variable
        ...    xpath=//mat-option[@data-qa-id='automation-calendar-edit-start-day-option${splitted_day_2}']
        Wait For Elements State    ${date_2_day}    visible    timeout=2s
        Browser.Click    ${date_2_day}

        Wait For Elements State    ${SELECTOR_AUTOMATION_CALENDAR_EDIT_START_MONTH_SELECT}    visible    timeout=2s
        Browser.Click    ${SELECTOR_AUTOMATION_CALENDAR_EDIT_START_MONTH_SELECT}
        ${date_2_month}=    Set Variable
        ...    xpath=//mat-option[@data-qa-id='automation-calendar-edit-start-month-option${splitted_month_2}']
        Wait For Elements State    ${date_2_month}    visible    timeout=2s
        Browser.Click    ${date_2_month}

        Wait For Elements State    ${SELECTOR_AUTOMATION_CALENDAR_EDIT_START_YEAR_SELECT}    visible    timeout=2s
        Browser.Click    ${SELECTOR_AUTOMATION_CALENDAR_EDIT_START_YEAR_SELECT}
        ${year_2_option}=    Increment Year Related To Current    ${splitted_year_2}
        ${date_2_year}=    Set Variable
        ...    xpath=//mat-option[@data-qa-id='automation-calendar-edit-start-year-option${year_2_option}']
        Wait For Elements State    ${date_2_year}    visible    timeout=2s
        Browser.Click    ${date_2_year}

        # Check Checkbox    ${SELECTOR_AUTOMATION_CALENDAR_EDIT_INCLUDE_END_DATE_CHECKBOX}
        # Uncheck Checkbox    ${SELECTOR_AUTOMATION_CALENDAR_EDIT_INCLUDE_END_DATE_CHECKBOX}
        # Check Checkbox    ${SELECTOR_AUTOMATION_CALENDAR_EDIT_INCLUDE_END_DATE_CHECKBOX}
    ELSE
        Wait For Elements State    ${validity_period_repeat}    visible    timeout=2s
        Browser.Click    ${validity_period_repeat}

        Wait For Elements State    ${SELECTOR_AUTOMATION_CALENDAR_EDIT_REPEAT_MONTH_SELECT}    visible    timeout=2s
        Browser.Click    ${SELECTOR_AUTOMATION_CALENDAR_EDIT_REPEAT_MONTH_SELECT}
        ${repeat_month_int}=    Convert To Integer    ${repeat_month}
        ${repeat_month_xpath}=    Set Variable
        ...    xpath=//mat-option[@data-qa-id='automation-calendar-edit-repeat-month-option${repeat_month_int}']
        Wait For Elements State    ${repeat_month_xpath}    visible    timeout=2s
        Browser.Click    ${repeat_month_xpath}

        Wait For Elements State
        ...    ${SELECTOR_AUTOMATION_CALENDAR_EDIT_REPEAT_DAYS_OF_MONTH_SELECT}
        ...    visible
        ...    timeout=2s
        Browser.Click    ${SELECTOR_AUTOMATION_CALENDAR_EDIT_REPEAT_DAYS_OF_MONTH_SELECT}
        ${repeat_days_month_int}=    Convert To Integer    ${repeat_days_month}
        ${repeat_days_month_xpath}=    Set Variable
        ...    //mat-option[@data-qa-id='automation-calendar-edit-repeat-days-of-month-option${repeat_days_month_int}']
        Wait For Elements State    ${repeat_days_month_xpath}    visible    timeout=2s
        Browser.Click    ${repeat_days_month_xpath}

        Wait For Elements State
        ...    ${SELECTOR_AUTOMATION_CALENDAR_EDIT_REPEAT_DAY_OF_WEEK_SELECT}
        ...    visible
        ...    timeout=2s
        Browser.Click    ${SELECTOR_AUTOMATION_CALENDAR_EDIT_REPEAT_DAY_OF_WEEK_SELECT}
        ${repeat_day_week_int}=    Convert To Integer    ${repeat_day_week}
        ${repeat_day_week_xpath}=    Set Variable
        ...    //mat-option[@data-qa-id='automation-calendar-edit-repeat-day-of-week-option${repeat_day_week_int}']
        Wait For Elements State    ${repeat_day_week_xpath}    visible    timeout=2s
        Browser.Click    ${repeat_day_week_xpath}
    END

Add New Calendar Event To Day
    [Arguments]
    ...    ${event_description}
    ...    ${timetable_option}
    ...    ${weekday}
    ...    ${bypass_validity_option}
    ...    ${bypass_date_1}
    ...    ${bypass_date_2}
    ...    ${bypass_repeat_month}
    ...    ${bypass_repeat_days_month}
    ...    ${bypass_repeat_day_week}

    # Go to automation
    # Go to automation calendar

    Wait For Elements State    ${SELECTOR_AUTOMATION_CALENDAR_EVENTS_BUTTON}    visible    timeout=2s
    ${calendar_month_year_header}=    Browser.Get Text
    ...    xpath=//div[@class='fc-toolbar-chunk']/h2[@class='fc-toolbar-title']
    Log To Console    Default view month: ${calendar_month_year_header}

    ${detected_month_year}=    Create Current Month And Year String
    Log To Console    Detected current month: ${detected_month_year}

    Browser.Click    ${SELECTOR_AUTOMATION_CALENDAR_PREVIOUS_MONTH_BUTTON}
    ${calendar_month_year_header}=    Browser.Get Text
    ...    xpath=//div[@class='fc-toolbar-chunk']/h2[@class='fc-toolbar-title']
    Log To Console    Previous month: ${calendar_month_year_header}

    Browser.Click    ${SELECTOR_AUTOMATION_CALENDAR_TODAY_BUTTON}
    ${calendar_month_year_header}=    Browser.Get Text
    ...    xpath=//div[@class='fc-toolbar-chunk']/h2[@class='fc-toolbar-title']
    Log To Console    Today button month: ${calendar_month_year_header}

    Browser.Click    ${SELECTOR_AUTOMATION_CALENDAR_NEXT_MONTH_BUTTON}
    ${calendar_month_year_header}=    Browser.Get Text
    ...    xpath=//div[@class='fc-toolbar-chunk']/h2[@class='fc-toolbar-title']
    Log To Console    Next month: ${calendar_month_year_header}

    Browser.Click    ${SELECTOR_AUTOMATION_CALENDAR_TODAY_BUTTON}
    ${calendar_month_year_header}=    Browser.Get Text
    ...    xpath=//div[@class='fc-toolbar-chunk']/h2[@class='fc-toolbar-title']
    Log To Console    Today button month: ${calendar_month_year_header}

    ${todays_date}=    Todays Date YYYY-MM-DD
    ${today_cell_xpath}=    Set Variable    xpath=//td[@data-date='${todays_date}']
    Wait For Elements State    ${today_cell_xpath}    visible    timeout=2s
    Browser.Click    ${today_cell_xpath}

    # ${SELECTOR_AUTOMATION_CALENDAR_ADD_EVENT_BUTTON}
    ${calendar_event_title_xpath}=    Set Variable
    ...    xpath=//div[@class='toolbar_title' and contains(text(), 'Calendar event')]
    Wait For Elements State    ${calendar_event_title_xpath}    visible    timeout=2s

    ${is_empty_day}=    Run Keyword And Return Status
    ...    Wait For Elements State
    ...    ${SELECTOR_AUTOMATION_CALENDAR_ADD_EVENT_BUTTON}
    ...    visible
    ...    timeout=2s
    IF    ${is_empty_day}
        Wait For Elements State    ${SELECTOR_AUTOMATION_CALENDAR_ADD_EVENT_BUTTON}    visible    timeout=2s
        Browser.Click    ${SELECTOR_AUTOMATION_CALENDAR_ADD_EVENT_BUTTON}

        Edit Calendar Event Timetable    ${event_description}    ${timetable_option}    ${weekday}
        Edit Calendar Event Validity Period
        ...    event_description= ${event_description}
        ...    validity_option= ${bypass_validity_option}
        ...    date_1= ${bypass_date_1}
        ...    date_2= ${bypass_date_2}
        ...    repeat_month= ${bypass_repeat_month}
        ...    repeat_days_month= ${bypass_repeat_days_month}
        ...    repeat_day_week= ${bypass_repeat_day_week}
    ELSE
        Wait For Elements State    ${SELECTOR_AUTOMATION_CALENDAR_EDIT_DESCRIPTION_INPUT}    visible    timeout=2s
        Fill Text    ${SELECTOR_AUTOMATION_CALENDAR_EDIT_DESCRIPTION_INPUT}    ${event_description}

        Edit Calendar Event Timetable    ${event_description}    ${timetable_option}    ${weekday}
        Edit Calendar Event Validity Period
        ...    event_description=${event_description}
        ...    validity_option=${bypass_validity_option}
        ...    date_1=${bypass_date_1}
        ...    date_2=${bypass_date_2}
        ...    repeat_month=${bypass_repeat_month}
        ...    repeat_days_month=${bypass_repeat_days_month}
        ...    repeat_day_week=${bypass_repeat_day_week}
    END

Delete Calendar Event
    [Arguments]    ${point_name}
    # Go to automation
    # Go to automation calendar

    Wait For Elements State    ${selector_calendar_header}    visible    timeout=5s
    Browser.Click    ${selector_calendar_events_btn}
    Sleep    ${SLEEP_TIME}

    ${full_string}=    Set Variable    xpath=//div[@class='description' and text()="${point_name}"]

    Browser.Click    ${full_string}
    Sleep    ${SLEEP_TIME}

    Browser.Click    ${selector_calendar_event_form_remove_btn}
    Sleep    ${SLEEP_TIME}

    ${snack-bar_visible}=    Run Keyword And Return Status
    ...    Wait For Elements State
    ...    xpath=//div[contains(@class, "mat-simple-snackbar")]
    ...    visible
    ...    timeout=5s
    Sleep    ${SLEEP_TIME}
    IF    ${snack-bar_visible}
        Log To Console    Calendar Event removed. Snack-bar visible
    ELSE
        Log To Console    Calendar Event removed. Snack-bar not visible
    END
