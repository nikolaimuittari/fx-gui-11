*** Settings ***
Library     Browser
Library     RPA.JavaAccessBridge
# Library    RPA.Desktop
Resource    navigate.resource
Resource    login.resource
Resource    point_locators.resource
Resource    global_variables.resource
Resource    automation_locators_id.resource


*** Keywords ***
Add New TS Event
    [Arguments]
    ...    ${DAY_NUMBER}
    ...    ${EVENT_NUMBER}
    ...    ${TIME_RANDOM}
    ...    ${VALUE_RANDOM_DEFAULT}
    ...    ${SET_VALUE}

    IF    ${DAY_NUMBER} > 10
        ${DAY_NUMBER}=    Set Variable    10
    END

    IF    ${EVENT_NUMBER} > 6
        ${EVENT_NUMBER}=    Set Variable    6
    END

    # GUI must be in Automation -> Time Schedules -> Point Add/Edit -> Table button
    # Browser.Click    ${SELECTOR_AUTOMATION_POINT_TS_EDIT_TABLE_BUTTON}
    ${event_xpath}=    Set Variable
    ...    xpath=//div[@data-qa-id="automation-time-schedule-edit-table-day${DAY_NUMBER}-event${EVENT_NUMBER}"]
    Wait For Elements State    ${event_xpath}    visible    timeout=2s
    Browser.Click    ${event_xpath}
    Log To Console    Creating event DAY: ${DAY_NUMBER} EVENT# ${EVENT_NUMBER}

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_TS_EVENT_DIALOG_ADD}    visible    timeout=2s
    Browser.Click    ${SELECTOR_AUTOMATION_POINT_TS_EVENT_DIALOG_ADD}

    Wait For Elements State
    ...    ${SELECTOR_AUTOMATION_POINT_TS_EVENT_CREATE_DIALOG_CLOSE_BUTTON}
    ...    visible
    ...    timeout=2s
    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_TS_EVENT_CREATE_DIALOG_TIME_INPUT}
    IF    '${TIME_RANDOM}' != 'Random'
        Browser.Click    ${SELECTOR_AUTOMATION_POINT_TS_EVENT_CREATE_DIALOG_TIME_INPUT}
        Keyboard Input    type    ${TIME_RANDOM}    50ms
        ${time}=    Set Variable    ${TIME_RANDOM}
    ELSE
        ${time}    ${hour_value}    ${minute_value}=    Generate Random Time

        Browser.Click    ${SELECTOR_AUTOMATION_POINT_TS_EVENT_CREATE_DIALOG_TIME_INPUT}
        Keyboard Input    type    ${hour_value}    50ms
        Keyboard Input    type    ${minute_value}    50ms
    END

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_TS_EVENT_CREATE_DIALOG_VALUE_SELECT}
    Browser.Click    ${SELECTOR_AUTOMATION_POINT_TS_EVENT_CREATE_DIALOG_VALUE_SELECT}

    IF    ${SET_VALUE} == 2    # Default, not possible to enter value
        Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_TS_SET_VALUE_OPTION_2}    visible    timeout=2s
        Browser.Click    ${SELECTOR_AUTOMATION_POINT_TS_SET_VALUE_OPTION_2}
    ELSE    # State, possible to enter value
        Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_TS_SET_VALUE_OPTION_1}    visible    timeout=2s
        Browser.Click    ${SELECTOR_AUTOMATION_POINT_TS_SET_VALUE_OPTION_1}
        Wait For Elements State
        ...    ${SELECTOR_AUTOMATION_POINT_TS_EVENT_CREATE_DIALOG_VALUE_INPUT}
        ...    visible
        ...    timeout=2s

        Fill Text    ${SELECTOR_AUTOMATION_POINT_TS_EVENT_CREATE_DIALOG_VALUE_INPUT}    ${SET_VALUE}
    END

    # Select Options By    ${SELECTOR_AUTOMATION_POINT_TS_EVENT_CREATE_DIALOG_VALUE_SELECT}    value    0

    # Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_TS_EVENT_CREATE_DIALOG_VALUE_INPUT}
    # Fill Text    ${SELECTOR_AUTOMATION_POINT_TS_EVENT_CREATE_DIALOG_VALUE_INPUT}    1

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_TS_EVENT_CREATE_DIALOG_CREATE_BUTTON}
    Browser.Click    ${SELECTOR_AUTOMATION_POINT_TS_EVENT_CREATE_DIALOG_CREATE_BUTTON}

    # Check if event is created
    # Wait For Elements State    //div[@class='time-detail ng-star-inserted' and text()='${time}']    visible    timeout=2s
    # Log To Console    DAY: ${DAY_NUMBER} event # ${EVENT_NUMBER} at ${time} is created

Edit TS Event
    [Arguments]
    ...    ${DAY_NUMBER}
    ...    ${EVENT_NUMBER}
    ...    ${TIME_RANDOM}
    ...    ${VALUE_RANDOM_DEFAULT}
    ...    ${SET_VALUE}

    IF    ${DAY_NUMBER} > 10
        ${DAY_NUMBER}=    Set Variable    10
    END

    IF    ${EVENT_NUMBER} > 6
        ${EVENT_NUMBER}=    Set Variable    6
    END

    # GUI must be in Automation -> Time Schedules -> Point Add/Edit -> Table button
    # Browser.Click    ${SELECTOR_AUTOMATION_POINT_TS_EDIT_TABLE_BUTTON}
    ${event_xpath}=    Set Variable
    ...    xpath=//div[@data-qa-id="automation-time-schedule-edit-table-day${DAY_NUMBER}-event${EVENT_NUMBER}"]
    Wait For Elements State    ${event_xpath}    visible    timeout=2s
    Browser.Click    ${event_xpath}
    Log To Console    Editing event DAY: ${DAY_NUMBER} EVENT# ${EVENT_NUMBER}

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_TS_EVENT_DIALOG_EDIT}    visible    timeout=2s
    Browser.Click    ${SELECTOR_AUTOMATION_POINT_TS_EVENT_DIALOG_EDIT}

    Wait For Elements State
    ...    ${SELECTOR_AUTOMATION_POINT_TS_EVENT_CREATE_DIALOG_CLOSE_BUTTON}
    ...    visible
    ...    timeout=2s
    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_TS_EVENT_CREATE_DIALOG_TIME_INPUT}
    IF    '${TIME_RANDOM}' != 'Random'
        Browser.Click    ${SELECTOR_AUTOMATION_POINT_TS_EVENT_CREATE_DIALOG_TIME_INPUT}
        Keyboard Input    type    ${TIME_RANDOM}    50ms
        ${time}=    Set Variable    ${TIME_RANDOM}
    ELSE
        ${time}    ${hour_value}    ${minute_value}=    Generate Random Time

        Browser.Click    ${SELECTOR_AUTOMATION_POINT_TS_EVENT_CREATE_DIALOG_TIME_INPUT}
        Keyboard Input    type    ${hour_value}    50ms
        Keyboard Input    type    ${minute_value}    50ms
    END

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_TS_EVENT_CREATE_DIALOG_VALUE_SELECT}
    #    Select Options By    ${SELECTOR_AUTOMATION_POINT_TS_EVENT_CREATE_DIALOG_VALUE_SELECT}    value    0

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_TS_EVENT_CREATE_DIALOG_VALUE_SELECT}
    Browser.Click    ${SELECTOR_AUTOMATION_POINT_TS_EVENT_CREATE_DIALOG_VALUE_SELECT}

    IF    ${SET_VALUE} == 2    # Default, not possible to enter value
        Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_TS_SET_VALUE_OPTION_2}    visible    timeout=2s
        Browser.Click    ${SELECTOR_AUTOMATION_POINT_TS_SET_VALUE_OPTION_2}
    ELSE    # State, possible to enter value
        Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_TS_SET_VALUE_OPTION_1}    visible    timeout=2s
        Browser.Click    ${SELECTOR_AUTOMATION_POINT_TS_SET_VALUE_OPTION_1}
        Wait For Elements State
        ...    ${SELECTOR_AUTOMATION_POINT_TS_EVENT_CREATE_DIALOG_VALUE_INPUT}
        ...    visible
        ...    timeout=2s

        Fill Text    ${SELECTOR_AUTOMATION_POINT_TS_EVENT_CREATE_DIALOG_VALUE_INPUT}    ${SET_VALUE}
    END

    # Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_TS_EVENT_CREATE_DIALOG_VALUE_INPUT}
    # Fill Text    ${SELECTOR_AUTOMATION_POINT_TS_EVENT_CREATE_DIALOG_VALUE_INPUT}    1

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_TS_EVENT_CREATE_DIALOG_SAVE_BUTTON}
    Browser.Click    ${SELECTOR_AUTOMATION_POINT_TS_EVENT_CREATE_DIALOG_SAVE_BUTTON}

    # Check if event is created
    # Wait For Elements State    //div[@class='time-detail ng-star-inserted' and text()='${time}']    visible    timeout=2s
    # Log To Console    DAY: ${DAY_NUMBER} event # ${EVENT_NUMBER} at ${time} is created

Copy TS Event
    [Arguments]
    ...    ${DAY_NUMBER}
    ...    ${EVENT_NUMBER}

    # GUI must be in Automation -> Time Schedules -> Point Add/Edit -> Table button
    # Browser.Click    ${SELECTOR_AUTOMATION_POINT_TS_EDIT_TABLE_BUTTON}
    ${event_xpath}=    Set Variable
    ...    xpath=//div[@data-qa-id="automation-time-schedule-edit-table-day${DAY_NUMBER}-event${EVENT_NUMBER}"]
    Wait For Elements State    ${event_xpath}    visible    timeout=2s
    Browser.Click    ${event_xpath}
    Log To Console    Copying event DAY: ${DAY_NUMBER} EVENT# ${EVENT_NUMBER}

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_TS_EVENT_DIALOG_COPY}    visible    timeout=2s
    Browser.Click    ${SELECTOR_AUTOMATION_POINT_TS_EVENT_DIALOG_COPY}

    Snack-bar Visibility And Content

Clear TS Event
    [Arguments]
    ...    ${DAY_NUMBER}
    ...    ${EVENT_NUMBER}

    # GUI must be in Automation -> Time Schedules -> Point Add/Edit -> Table button
    # Browser.Click    ${SELECTOR_AUTOMATION_POINT_TS_EDIT_TABLE_BUTTON}
    ${event_xpath}=    Set Variable
    ...    xpath=//div[@data-qa-id="automation-time-schedule-edit-table-day${DAY_NUMBER}-event${EVENT_NUMBER}"]
    Wait For Elements State    ${event_xpath}    visible    timeout=2s
    Browser.Click    ${event_xpath}
    Log To Console    Clearing event DAY: ${DAY_NUMBER} EVENT# ${EVENT_NUMBER}

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_TS_EVENT_DIALOG_CLEAR}    visible    timeout=2s
    Browser.Click    ${SELECTOR_AUTOMATION_POINT_TS_EVENT_DIALOG_CLEAR}

    ${empty_event_xpath}=    Set Variable
    ...    xpath=//div[@data-qa-id='automation-time-schedule-edit-table-day${DAY_NUMBER}-event${EVENT_NUMBER}']//div[contains(text(), 'Add')]
    ${cleared_ok}=    Run Keyword And Return Status
    ...    Wait For Elements State
    ...    ${empty_event_xpath}
    ...    visible
    ...    timeout=2s
    IF    ${cleared_ok}
        Log To Console    Cleared OK Event for DAY: ${DAY_NUMBER} EVENT# ${EVENT_NUMBER}
    ELSE
        Log To Console    NOT cleared Event for DAY: ${DAY_NUMBER} EVENT# ${EVENT_NUMBER}
    END

Paste TS Event
    [Arguments]
    ...    ${DAY_NUMBER}
    ...    ${EVENT_NUMBER}

    # GUI must be in Automation -> Time Schedules -> Point Add/Edit -> Table button
    # Browser.Click    ${SELECTOR_AUTOMATION_POINT_TS_EDIT_TABLE_BUTTON}
    ${event_xpath}=    Set Variable
    ...    xpath=//div[@data-qa-id="automation-time-schedule-edit-table-day${DAY_NUMBER}-event${EVENT_NUMBER}"]
    Wait For Elements State    ${event_xpath}    visible    timeout=2s
    Browser.Click    ${event_xpath}
    Log To Console    Pasting event DAY: ${DAY_NUMBER} EVENT# ${EVENT_NUMBER}

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_TS_EVENT_DIALOG_PASTE}    visible    timeout=2s
    Browser.Click    ${SELECTOR_AUTOMATION_POINT_TS_EVENT_DIALOG_PASTE}

Add New TS Point
    [Arguments]
    ...    ${POINT_ID_INPUT_VALUE}
    ...    ${POINT_DESCRIPTION_INPUT_VALUE}
    ...    ${ACCESS_LEVEL_VIEW_INPUT_VALUE}
    ...    ${ACCESS_LEVEL_MANUAL_INPUT_VALUE}
    ...    ${ACCESS_LEVEL_PROGRAMMING_INPUT_VALUE}
    ...    ${STATE_TEXT}
    ...    ${USE_EXCEPTION_DAYS_CHKBX}
    ...    ${DEFAULT_TYPE}
    ...    ${DEFAULT_VALUE}
    ...    ${VALUE_DECIMAL}
    ...    ${LAST_DEFAULT_VALUE_BUTTON}
    ...    ${SYNCHRONIZE_CHKBX}
    ...    ${RANDOM_EVENTS}
    ...    ${EVENTS_COPY}

    Go to automation
    Go to automation time schedules

    Wait For Elements State    ${SELECTOR_AUTOMATION_TOOLBAR_ADD_NEW_BUTTON}    visible    timeout=2s
    Browser.Click    ${SELECTOR_AUTOMATION_TOOLBAR_ADD_NEW_BUTTON}

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_TS_EDIT_POINT_ID_INPUT}    visible    timeout=2s
    Fill Text    ${SELECTOR_AUTOMATION_POINT_TS_EDIT_POINT_ID_INPUT}    ${POINT_ID_INPUT_VALUE}

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_TS_EDIT_POINT_DESCRIPTION_INPUT}    visible    timeout=2s
    Fill Text    ${SELECTOR_AUTOMATION_POINT_TS_EDIT_POINT_DESCRIPTION_INPUT}    ${POINT_DESCRIPTION_INPUT_VALUE}

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_TS_EDIT_ACCESS_LEVEL_VIEW_INPUT}    visible    timeout=2s
    Fill Text    ${SELECTOR_AUTOMATION_POINT_TS_EDIT_ACCESS_LEVEL_VIEW_INPUT}    ${ACCESS_LEVEL_VIEW_INPUT_VALUE}

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_TS_EDIT_ACCESS_LEVEL_MANUAL_INPUT}    visible    timeout=2s
    Fill Text    ${SELECTOR_AUTOMATION_POINT_TS_EDIT_ACCESS_LEVEL_MANUAL_INPUT}    ${ACCESS_LEVEL_MANUAL_INPUT_VALUE}

    Wait For Elements State
    ...    ${SELECTOR_AUTOMATION_POINT_TS_EDIT_ACCESS_LEVEL_PROGRAMMING_INPUT}
    ...    visible
    ...    timeout=2s
    Fill Text
    ...    ${SELECTOR_AUTOMATION_POINT_TS_EDIT_ACCESS_LEVEL_PROGRAMMING_INPUT}
    ...    ${ACCESS_LEVEL_PROGRAMMING_INPUT_VALUE}

    Browser.Click    ${SELECTOR_AUTOMATION_POINT_TS_STATE_TEXT_SELECT}
    ${option2}=    Set Variable    //mat-option[@data-qa-id="automation-time-schedule-edit-state-text-option2"]
    Browser.Click    ${option2}

    Browser.Click    ${SELECTOR_AUTOMATION_POINT_TS_STATE_TEXT_SELECT}
    ${option1}=    Set Variable    //mat-option[@data-qa-id="automation-time-schedule-edit-state-text-option1"]
    Browser.Click    ${option1}

    IF    ${USE_EXCEPTION_DAYS_CHKBX} == 1
        Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_TS_USE_SPECIAL_DAYS_CHECKBOX}    visible    timeout=2s
        Check Checkbox    ${SELECTOR_AUTOMATION_POINT_TS_USE_SPECIAL_DAYS_CHECKBOX}
        Uncheck Checkbox    ${SELECTOR_AUTOMATION_POINT_TS_USE_SPECIAL_DAYS_CHECKBOX}
        Check Checkbox    ${SELECTOR_AUTOMATION_POINT_TS_USE_SPECIAL_DAYS_CHECKBOX}
    END

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_TS_EVENT_TYPE_SELECT}    visible    timeout=2s
    Browser.Click    ${SELECTOR_AUTOMATION_POINT_TS_EVENT_TYPE_SELECT}

    IF    ${DEFAULT_TYPE} == 1
        # Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_TS_EVENT_TYPE_NORMAL}    visible    timeout=2s
        ${type_normal}=    Set Variable
        ...    //mat-option[@data-qa-id="automation-time-schedule-edit-default-type-option1"]
        Wait For Elements State    ${type_normal}    visible    timeout=2s
        Browser.Click    ${type_normal}
    ELSE IF    ${DEFAULT_TYPE} == 2
        # Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_TS_EVENT_TYPE_BOOLEAN}    visible    timeout=2s
        Browser.Click    ${SELECTOR_AUTOMATION_POINT_TS_EVENT_TYPE_BOOLEAN}
    ELSE IF    ${DEFAULT_TYPE} == 3
        # Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_TS_EVENT_TYPE_UINT}    visible    timeout=2s
        ${type_uint}=    Set Variable    //mat-option[@data-qa-id="automation-time-schedule-edit-default-type-option2"]
        Wait For Elements State    ${type_uint}    visible    timeout=2s
        Browser.Click    ${type_uint}
    ELSE IF    ${DEFAULT_TYPE} == 4
        # Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_TS_EVENT_TYPE_REAL}    visible    timeout=2s
        ${type_real}=    Set Variable    //mat-option[@data-qa-id="automation-time-schedule-edit-default-type-option3"]
        Wait For Elements State    ${type_real}    visible    timeout=2s
        Browser.Click    ${type_real}
    ELSE
        # Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_TS_EVENT_TYPE_ENUM}    visible    timeout=2s
        ${type_enum}=    Set Variable    //mat-option[@data-qa-id="automation-time-schedule-edit-default-type-option4"]
        Wait For Elements State    ${type_enum}    visible    timeout=2s
        Browser.Click    ${type_enum}
    END

    # Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_TS_EVENT_TYPE_NORMAL}    visible    timeout=2s
    # Browser.Click    ${SELECTOR_AUTOMATION_POINT_TS_EVENT_TYPE_NORMAL}

    # Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_TS_EVENT_TYPE_BOOLEAN}    visible    timeout=2s
    # Browser.Click    ${SELECTOR_AUTOMATION_POINT_TS_EVENT_TYPE_BOOLEAN}

    # Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_TS_EVENT_TYPE_UINT}    visible    timeout=2s
    # Browser.Click    ${SELECTOR_AUTOMATION_POINT_TS_EVENT_TYPE_UINT}

    # Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_TS_EVENT_TYPE_REAL}    visible    timeout=2s
    # Browser.Click    ${SELECTOR_AUTOMATION_POINT_TS_EVENT_TYPE_REAL}

    # Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_TS_EVENT_TYPE_ENUM}    visible    timeout=2s
    # Browser.Click    ${SELECTOR_AUTOMATION_POINT_TS_EVENT_TYPE_ENUM}

    IF    ${DEFAULT_VALUE} != 0
        Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_TS_DEFAULT_VALUE_INPUT}    visible    timeout=2s
        Fill Text    ${SELECTOR_AUTOMATION_POINT_TS_DEFAULT_VALUE_INPUT}    ${DEFAULT_VALUE}
    END

    # ${SELECTOR_AUTOMATION_POINT_TS_DEFAULT_VALUE_INPUT}
    # Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_TS_DECIMALS_INPUT}    visible    timeout=2s
    # Fill Text    ${SELECTOR_AUTOMATION_POINT_TS_DECIMALS_INPUT}    ${VALUE_DECIMAL}

    IF    ${LAST_DEFAULT_VALUE_BUTTON} == 1
        Wait For Elements State
        ...    ${SELECTOR_AUTOMATION_POINT_TS_FOLLOW_TYPE_LAST_VALUE_BUTTON}
        ...    visible
        ...    timeout=2s
        Browser.Click    ${SELECTOR_AUTOMATION_POINT_TS_FOLLOW_TYPE_LAST_VALUE_BUTTON}
    ELSE
        Wait For Elements State
        ...    ${SELECTOR_AUTOMATION_POINT_TS_FOLLOW_TYPE_DEFAULT_VALUE_BUTTON}
        ...    visible
        ...    timeout=2s
        Browser.Click    ${SELECTOR_AUTOMATION_POINT_TS_FOLLOW_TYPE_DEFAULT_VALUE_BUTTON}
    END

    IF    ${SYNCHRONIZE_CHKBX} == 1
        Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_TS_SYNCHRONIZE_CHECKBOX}    visible    timeout=2s
        Check Checkbox    ${SELECTOR_AUTOMATION_POINT_TS_SYNCHRONIZE_CHECKBOX}
        Uncheck Checkbox    ${SELECTOR_AUTOMATION_POINT_TS_SYNCHRONIZE_CHECKBOX}
        Check Checkbox    ${SELECTOR_AUTOMATION_POINT_TS_SYNCHRONIZE_CHECKBOX}
    ELSE
        Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_TS_SYNCHRONIZE_CHECKBOX}    visible    timeout=2s
        Uncheck Checkbox    ${SELECTOR_AUTOMATION_POINT_TS_SYNCHRONIZE_CHECKBOX}
    END

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_TS_PICTURE_SELECT}
    Browser.Click    ${SELECTOR_AUTOMATION_POINT_TS_PICTURE_SELECT}
    ${option2}=    Set Variable    //mat-option[@data-qa-id="automation-time-schedule-edit-picture-option2"]
    Browser.Click    ${option2}

    # IF    ${MON_EVENT_ON} != 0
    #    Browser.Click    ${SELECTOR_AUTOMATION_POINT_TS_EDIT_TABLE_BUTTON}
    #    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_TS_TABLE_DAY1_EVENT1}    visible    timeout=2s
    #    Browser.Click    ${SELECTOR_AUTOMATION_POINT_TS_TABLE_DAY1_EVENT1}

    #    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_TS_EVENT_DIALOG_ADD}    visible    timeout=2s
    #    Browser.Click    ${SELECTOR_AUTOMATION_POINT_TS_EVENT_DIALOG_ADD}

    #    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_TS_EVENT_CREATE_DIALOG_CLOSE_BUTTON}    visible    timeout=2s
    #    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_TS_EVENT_CREATE_DIALOG_TIME_INPUT}
    #    ${time}    ${hour_value}    ${minute_value}=    Generate Random Time

    #    Browser.Click    ${SELECTOR_AUTOMATION_POINT_TS_EVENT_CREATE_DIALOG_TIME_INPUT}
    #    Keyboard Input    type    ${hour_value}    50ms
    #    Keyboard Input    type    ${minute_value}    50ms

    #    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_TS_EVENT_CREATE_DIALOG_VALUE_SELECT}
    #    Select Options By    ${SELECTOR_AUTOMATION_POINT_TS_EVENT_CREATE_DIALOG_VALUE_SELECT}    value    0

    #    # Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_TS_EVENT_CREATE_DIALOG_VALUE_INPUT}
    #    # Fill Text    ${SELECTOR_AUTOMATION_POINT_TS_EVENT_CREATE_DIALOG_VALUE_INPUT}    1

    #    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_TS_EVENT_CREATE_DIALOG_CREATE_BUTTON}
    #    Browser.Click    ${SELECTOR_AUTOMATION_POINT_TS_EVENT_CREATE_DIALOG_CREATE_BUTTON}

    #    # Check if event is created
    #    Wait For Elements State    //div[@class='time-detail ng-star-inserted' and text()='${time}']    visible    timeout=2s
    #    Log To Console    MON event for ${time} is created
    # END

    Browser.Click    ${SELECTOR_AUTOMATION_POINT_TS_EDIT_TABLE_BUTTON}
    IF    ${RANDOM_EVENTS} != 0
        IF    ${USE_EXCEPTION_DAYS_CHKBX} != 0
            ${last_day}=    Set Variable    11
        ELSE
            ${last_day}=    Set Variable    7
        END

        FOR    ${day_counter}    IN RANGE    1    ${last_day}
            FOR    ${event_counter}    IN RANGE    1    7
                Add New TS Event
                ...    DAY_NUMBER=${day_counter}
                ...    EVENT_NUMBER=${event_counter}
                ...    TIME_RANDOM=Random
                ...    VALUE_RANDOM_DEFAULT=1
                ...    SET_VALUE=99
            END
        END
    END

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_TS_ADD_BUTTON}    visible    timeout=2s
    Browser.Click    ${SELECTOR_AUTOMATION_POINT_TS_ADD_BUTTON}

    Snack-bar Visibility And Content

Delete TS Point
    [Arguments]
    ...    ${POINT_ID_INPUT_VALUE}

    Go to automation
    Go to automation time schedules

    # ${compiled_text}=    Set Variable    xpath=//td[text()=" ${POINT_ID_INPUT_VALUE} "]
    # xpath=//td[contains(text(), "${point_name} description")]

    # ${compiled_text}=    Set Variable    xpath=//td[contains(text(), "${POINT_DESCRIPTION_INPUT_VALUE}")]
    # ${compiled_text}=    Set Variable    xpath=//td[.//div[@class='point-name ng-star-inserted' and text()=" ${POINT_ID_INPUT_VALUE} "]]
    # ${compiled_text}=    Set Variable    xpath=//div[contains(@class, 'point-name') and text()= " ${POINT_ID_INPUT_VALUE} "]
    # ${compiled_text}=    Set Variable    //td[contains(@class, 'ng-star-inserted')]//div[contains(@class, 'point-name') and contains(text(), '${POINT_ID_INPUT_VALUE}')]

    ${compiled_text}=    Set Variable    xpath=//td[contains(., '${POINT_ID_INPUT_VALUE}')]

    ${point_in_list}=    Run Keyword And Return Status
    ...    Wait For Elements State
    ...    ${compiled_text}
    ...    visible
    ...    timeout=2s
    IF    ${point_in_list}
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
    END

Duplicate TS Point
    [Arguments]
    ...    ${POINT_ID_INPUT_VALUE}
    ...    ${POINT_NEW_NAME}

    Go to automation
    Go to automation time schedules

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
    Go to automation time schedules

    # ${compiled_text}=    Set Variable    xpath=//td[contains(text(), "${POINT_DESCRIPTION_INPUT_VALUE}")]
    # ${xpath_variable}=    Set Variable    //div[@class='point-name-container']//div[contains(text(),"${POINT_NEW_NAME}")]
    # ${xpath_variable}=    Set Variable    //div[@class='point-name ng-star-inserted' and contains(text(), "${POINT_NEW_NAME}")]
    ${xpath_variable}=    Set Variable    xpath=//td[contains(., '${POINT_NEW_NAME}')]

    Wait For Elements State    ${xpath_variable}    visible    timeout=2s

Print TS Pointlist
    Go to automation
    Go to automation time schedules

    Wait For Elements State    ${SELECTOR_AUTOMATION_TOOLBAR_PRINT_BUTTON}    visible    timeout=2s
    Browser.Click    ${SELECTOR_AUTOMATION_TOOLBAR_PRINT_BUTTON}
    Sleep    3s
    Keyboard Key    press    Escape

    Wait For Elements State    ${SELECTOR_AUTOMATION_TOOLBAR_PRINT_BUTTON}    visible    timeout=2s

Edit TS Point
    [Arguments]
    ...    ${POINT_ID_INPUT_VALUE}
    ...    ${NEW_POINT_ID_INPUT_VALUE}

    Go to automation
    Go to automation time schedules

    ${compiled_text}=    Set Variable    xpath=//td[contains(., '${POINT_ID_INPUT_VALUE}')]

    Wait For Elements State    ${compiled_text}    visible    timeout=2s
    Browser.Click    ${compiled_text}

    Wait For Elements State    ${SELECTOR_AUTOMATION_TOOLBAR_EDIT_BUTTON}    visible    timeout=2s
    Browser.Click    ${SELECTOR_AUTOMATION_TOOLBAR_EDIT_BUTTON}

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_TS_EDIT_POINT_ID_INPUT}    visible    timeout=2s
    Fill Text    ${SELECTOR_AUTOMATION_POINT_TS_EDIT_POINT_ID_INPUT}    ${NEW_POINT_ID_INPUT_VALUE}

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_TS_EDIT_POINT_DESCRIPTION_INPUT}    visible    timeout=2s
    Fill Text    ${SELECTOR_AUTOMATION_POINT_TS_EDIT_POINT_DESCRIPTION_INPUT}    Edited point description

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_TS_EDIT_ACCESS_LEVEL_VIEW_INPUT}    visible    timeout=2s
    Fill Text    ${SELECTOR_AUTOMATION_POINT_TS_EDIT_ACCESS_LEVEL_VIEW_INPUT}    0

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_TS_EDIT_ACCESS_LEVEL_MANUAL_INPUT}    visible    timeout=2s
    Fill Text    ${SELECTOR_AUTOMATION_POINT_TS_EDIT_ACCESS_LEVEL_MANUAL_INPUT}    0

    Wait For Elements State
    ...    ${SELECTOR_AUTOMATION_POINT_TS_EDIT_ACCESS_LEVEL_PROGRAMMING_INPUT}
    ...    visible
    ...    timeout=2s
    Fill Text    ${SELECTOR_AUTOMATION_POINT_TS_EDIT_ACCESS_LEVEL_PROGRAMMING_INPUT}    0

    Browser.Click    ${SELECTOR_AUTOMATION_POINT_TS_STATE_TEXT_SELECT}
    ${option2}=    Set Variable    //mat-option[@data-qa-id="automation-time-schedule-edit-state-text-option2"]
    Browser.Click    ${option2}

    Browser.Click    ${SELECTOR_AUTOMATION_POINT_TS_STATE_TEXT_SELECT}
    ${option1}=    Set Variable    //mat-option[@data-qa-id="automation-time-schedule-edit-state-text-option1"]
    Browser.Click    ${option1}

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_TS_USE_SPECIAL_DAYS_CHECKBOX}    visible    timeout=2s
    Check Checkbox    ${SELECTOR_AUTOMATION_POINT_TS_USE_SPECIAL_DAYS_CHECKBOX}
    Uncheck Checkbox    ${SELECTOR_AUTOMATION_POINT_TS_USE_SPECIAL_DAYS_CHECKBOX}
    Check Checkbox    ${SELECTOR_AUTOMATION_POINT_TS_USE_SPECIAL_DAYS_CHECKBOX}

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_TS_EVENT_TYPE_SELECT}    visible    timeout=2s
    Browser.Click    ${SELECTOR_AUTOMATION_POINT_TS_EVENT_TYPE_SELECT}

    ${DEFAULT_TYPE}=    Evaluate    random.randint(1, 5)

    IF    ${DEFAULT_TYPE} == 1
        # Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_TS_EVENT_TYPE_NORMAL}    visible    timeout=2s
        ${type_normal}=    Set Variable
        ...    //mat-option[@data-qa-id="automation-time-schedule-edit-default-type-option1"]
        Wait For Elements State    ${type_normal}    visible    timeout=2s
        Browser.Click    ${type_normal}
    ELSE IF    ${DEFAULT_TYPE} == 2
        # Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_TS_EVENT_TYPE_BOOLEAN}    visible    timeout=2s
        Browser.Click    ${SELECTOR_AUTOMATION_POINT_TS_EVENT_TYPE_BOOLEAN}
    ELSE IF    ${DEFAULT_TYPE} == 3
        # Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_TS_EVENT_TYPE_UINT}    visible    timeout=2s
        ${type_uint}=    Set Variable    //mat-option[@data-qa-id="automation-time-schedule-edit-default-type-option2"]
        Wait For Elements State    ${type_uint}    visible    timeout=2s
        Browser.Click    ${type_uint}
    ELSE IF    ${DEFAULT_TYPE} == 4
        # Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_TS_EVENT_TYPE_REAL}    visible    timeout=2s
        ${type_real}=    Set Variable    //mat-option[@data-qa-id="automation-time-schedule-edit-default-type-option3"]
        Wait For Elements State    ${type_real}    visible    timeout=2s
        Browser.Click    ${type_real}
    ELSE
        # Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_TS_EVENT_TYPE_ENUM}    visible    timeout=2s
        ${type_enum}=    Set Variable    //mat-option[@data-qa-id="automation-time-schedule-edit-default-type-option4"]
        Wait For Elements State    ${type_enum}    visible    timeout=2s
        Browser.Click    ${type_enum}
    END

    # ${DEFAULT_VALUE}=    Evaluate    random.randint(1, 99)
    # Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_TS_DEFAULT_VALUE_INPUT}    visible    timeout=2s
    # Fill Text    ${SELECTOR_AUTOMATION_POINT_TS_DEFAULT_VALUE_INPUT}    ${DEFAULT_VALUE}

    # ${SELECTOR_AUTOMATION_POINT_TS_DEFAULT_VALUE_INPUT}
    ${VALUE_DECIMAL}=    Evaluate    random.randint(1, 5)
    # Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_TS_DECIMALS_INPUT}    visible    timeout=2s
    # Fill Text    ${SELECTOR_AUTOMATION_POINT_TS_DECIMALS_INPUT}    ${VALUE_DECIMAL}

    ${LAST_DEFAULT_VALUE_BUTTON}=    Evaluate    random.randint(0, 1)
    IF    ${LAST_DEFAULT_VALUE_BUTTON} == 1
        Wait For Elements State
        ...    ${SELECTOR_AUTOMATION_POINT_TS_FOLLOW_TYPE_LAST_VALUE_BUTTON}
        ...    visible
        ...    timeout=2s
        Browser.Click    ${SELECTOR_AUTOMATION_POINT_TS_FOLLOW_TYPE_LAST_VALUE_BUTTON}
    ELSE
        Wait For Elements State
        ...    ${SELECTOR_AUTOMATION_POINT_TS_FOLLOW_TYPE_DEFAULT_VALUE_BUTTON}
        ...    visible
        ...    timeout=2s
        Browser.Click    ${SELECTOR_AUTOMATION_POINT_TS_FOLLOW_TYPE_DEFAULT_VALUE_BUTTON}
    END

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_TS_SYNCHRONIZE_CHECKBOX}    visible    timeout=2s
    Check Checkbox    ${SELECTOR_AUTOMATION_POINT_TS_SYNCHRONIZE_CHECKBOX}
    Uncheck Checkbox    ${SELECTOR_AUTOMATION_POINT_TS_SYNCHRONIZE_CHECKBOX}
    Check Checkbox    ${SELECTOR_AUTOMATION_POINT_TS_SYNCHRONIZE_CHECKBOX}

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_TS_PICTURE_SELECT}
    Browser.Click    ${SELECTOR_AUTOMATION_POINT_TS_PICTURE_SELECT}
    ${option2}=    Set Variable    //mat-option[@data-qa-id="automation-time-schedule-edit-picture-option2"]
    Browser.Click    ${option2}

    ${exception_days_checked}=    Get Checkbox State    ${SELECTOR_AUTOMATION_POINT_TS_USE_SPECIAL_DAYS_CHECKBOX}

    # 2024.04.24 GUI cannot edit both Details and Events forms. Need to save Details changes before editing Events
    # Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_TS_SAVE_BUTTON}    visible    timeout=2s
    # Browser.Click    ${SELECTOR_AUTOMATION_POINT_TS_SAVE_BUTTON}

    # # Edit same edited point again
    # ${compiled_text}=    Set Variable    xpath=//td[contains(., '${NEW_POINT_ID_INPUT_VALUE}')]
    # Wait For Elements State    ${compiled_text}    visible    timeout=2s
    # Browser.Click    ${compiled_text}

    # Wait For Elements State    ${SELECTOR_AUTOMATION_TOOLBAR_EDIT_BUTTON}    visible    timeout=2s
    # Browser.Click    ${SELECTOR_AUTOMATION_TOOLBAR_EDIT_BUTTON}

    Browser.Click    ${SELECTOR_AUTOMATION_POINT_TS_EDIT_TABLE_BUTTON}
    IF    ${exception_days_checked}
        ${last_day}=    Set Variable    11
    ELSE
        ${last_day}=    Set Variable    7
    END

    FOR    ${day_counter}    IN RANGE    1    ${last_day}
        FOR    ${event_counter}    IN RANGE    1    7
            ${default}=    Evaluate    random.randint(0, 99)

            Edit TS Event
            ...    DAY_NUMBER=${day_counter}
            ...    EVENT_NUMBER=${event_counter}
            ...    TIME_RANDOM=Random
            ...    VALUE_RANDOM_DEFAULT=${default}
            ...    SET_VALUE=2

            Copy TS Event    DAY_NUMBER=${day_counter}    EVENT_NUMBER=${event_counter}
            Clear TS Event    DAY_NUMBER=${day_counter}    EVENT_NUMBER=${event_counter}
            Paste TS Event    DAY_NUMBER=${day_counter}    EVENT_NUMBER=${event_counter}
        END
    END

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_TS_SAVE_BUTTON}    visible    timeout=2s
    Browser.Click    ${SELECTOR_AUTOMATION_POINT_TS_SAVE_BUTTON}

    ${save_visible}=    Run Keyword And Return Status
    ...    ${SELECTOR_AUTOMATION_POINT_TS_SAVE_BUTTON}
    ...    visible
    ...    timeout=2s
    IF    ${save_visible}
        Browser.Click    ${SELECTOR_AUTOMATION_POINT_TS_SAVE_BUTTON}
    ELSE
        Browser.Click    ${SELECTOR_AUTOMATION_POINT_TS_CANCEL_BUTTON}
    END
    Snack-bar Visibility And Content
