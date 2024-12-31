*** Settings ***
Library     Browser
Library     RPA.JavaAccessBridge
Library     String
Library     OperatingSystem
Resource    navigate.resource
Resource    login.resource
Resource    point_locators.resource
Resource    global_variables.resource
Resource    automation_locators_id.resource


*** Variables ***
${min_range}    -999
${max_range}    999


*** Keywords ***
Add New LT Point
    [Documentation]
    ...    Creates a new Lookup Table Point object using arguments.
    ...    Requires active position at: Main navigation view -> Automation -> Points -> Lookup tables

    [Arguments]
    ...    ${POINT_ID_INPUT_VALUE}
    ...    ${POINT_DESCRIPTION_INPUT_VALUE}
    ...    ${ACCESS_LEVEL_VIEW_INPUT_VALUE}
    ...    ${ACCESS_LEVEL_MANUAL_INPUT_VALUE}
    ...    ${ACCESS_LEVEL_PROGRAMMING_INPUT_VALUE}
    ...    ${SENSOR_TYPE}
    ...    ${OFFSET_INPUT_VALUE}
    ...    ${X_AXIS_INPUT_VALUE}
    ...    ${Y_AXIS_INPUT_VALUE}
    ...    ${X_AXIS_MIN_VALUE}
    ...    ${X_AXIS_MAX_VALUE}
    ...    ${Y_AXIS_MIN_VALUE}
    ...    ${Y_AXIS_MAX_VALUE}
    ...    ${MEASURED_1_VALUE}
    ...    ${CONVERTED_1_VALUE}
    ...    ${MEASURED_2_VALUE}
    ...    ${CONVERTED_2_VALUE}
    ...    ${MEASURED_3_VALUE}
    ...    ${CONVERTED_3_VALUE}
    ...    ${MEASURED_4_VALUE}
    ...    ${CONVERTED_4_VALUE}

    Wait For Elements State    ${SELECTOR_AUTOMATION_TOOLBAR_ADD_NEW_BUTTON}    visible    timeout=2s
    Browser.Click    ${SELECTOR_AUTOMATION_TOOLBAR_ADD_NEW_BUTTON}

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_LT_EDIT_POINT_ID_INPUT}    visible    timeout=2s
    Fill Text    ${SELECTOR_AUTOMATION_POINT_LT_EDIT_POINT_ID_INPUT}    ${POINT_ID_INPUT_VALUE}

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_LT_EDIT_POINT_DESCR_INPUT}    visible    timeout=2s
    Fill Text    ${SELECTOR_AUTOMATION_POINT_LT_EDIT_POINT_DESCR_INPUT}    ${POINT_DESCRIPTION_INPUT_VALUE}

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_LT_EDIT_LEVEL_VIEW_INPUT}    visible    timeout=2s
    Fill Text    ${SELECTOR_AUTOMATION_POINT_LT_EDIT_LEVEL_VIEW_INPUT}    ${ACCESS_LEVEL_VIEW_INPUT_VALUE}

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_LT_EDIT_LEVEL_MANUAL_INPUT}    visible    timeout=2s
    Fill Text    ${SELECTOR_AUTOMATION_POINT_LT_EDIT_LEVEL_MANUAL_INPUT}    ${ACCESS_LEVEL_MANUAL_INPUT_VALUE}

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_LT_EDIT_LEVEL_PROGRAMMING_INPUT}    visible    timeout=2s
    Fill Text
    ...    ${SELECTOR_AUTOMATION_POINT_LT_EDIT_LEVEL_PROGRAMMING_INPUT}
    ...    ${ACCESS_LEVEL_PROGRAMMING_INPUT_VALUE}

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_LT_EDIT_SENSOR_TYPE_SELECT}    visible    timeout=2s
    Browser.Click    ${SELECTOR_AUTOMATION_POINT_LT_EDIT_SENSOR_TYPE_SELECT}

    IF    ${SENSOR_TYPE} == 3
        Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_LT_EDIT_SENSOR_TYPE_3_CURRENT}    visible    timeout=2s
        Browser.Click    ${SELECTOR_AUTOMATION_POINT_LT_EDIT_SENSOR_TYPE_3_CURRENT}
    ELSE IF    ${SENSOR_TYPE} == 2
        Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_LT_EDIT_SENSOR_TYPE_2_VOLTAGE}    visible    timeout=2s
        Browser.Click    ${SELECTOR_AUTOMATION_POINT_LT_EDIT_SENSOR_TYPE_2_VOLTAGE}
    ELSE    # 1 == Resistive
        Wait For Elements State
        ...    ${SELECTOR_AUTOMATION_POINT_LT_EDIT_SENSOR_TYPE_1_RESISTIVE}
        ...    visible
        ...    timeout=2s
        Browser.Click    ${SELECTOR_AUTOMATION_POINT_LT_EDIT_SENSOR_TYPE_1_RESISTIVE}
    END

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_LT_EDIT_OFFSET_INPUT}    visible    timeout=2s
    Fill Text    ${SELECTOR_AUTOMATION_POINT_LT_EDIT_OFFSET_INPUT}    ${OFFSET_INPUT_VALUE}

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_LT_EDIT_PICTURE_SELECT}    visible    timeout=2s
    Browser.Click    ${SELECTOR_AUTOMATION_POINT_LT_EDIT_PICTURE_SELECT}

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_LT_EDIT_PICTURE_SELECT_2}    visible    timeout=2s
    Browser.Click    ${SELECTOR_AUTOMATION_POINT_LT_EDIT_PICTURE_SELECT_2}

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_LT_EDIT_X_AXIS_NAME_INPUT}    visible    timeout=2s
    Fill Text    ${SELECTOR_AUTOMATION_POINT_LT_EDIT_X_AXIS_NAME_INPUT}    ${X_AXIS_INPUT_VALUE}
    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_LT_EDIT_Y_AXIS_NAME_INPUT}    visible    timeout=2s
    Fill Text    ${SELECTOR_AUTOMATION_POINT_LT_EDIT_Y_AXIS_NAME_INPUT}    ${Y_AXIS_INPUT_VALUE}

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_LT_EDIT_VALUES1_IN_INPUT}    visible    timeout=2s
    Fill Text    ${SELECTOR_AUTOMATION_POINT_LT_EDIT_VALUES1_IN_INPUT}    ${MEASURED_1_VALUE}
    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_LT_EDIT_VALUES1_OUT_INPUT}    visible    timeout=2s
    Fill Text    ${SELECTOR_AUTOMATION_POINT_LT_EDIT_VALUES1_OUT_INPUT}    ${CONVERTED_1_VALUE}

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_LT_EDIT_VALUES2_IN_INPUT}    visible    timeout=2s
    Fill Text    ${SELECTOR_AUTOMATION_POINT_LT_EDIT_VALUES2_IN_INPUT}    ${MEASURED_2_VALUE}
    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_LT_EDIT_VALUES2_OUT_INPUT}    visible    timeout=2s
    Fill Text    ${SELECTOR_AUTOMATION_POINT_LT_EDIT_VALUES2_OUT_INPUT}    ${CONVERTED_2_VALUE}

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_LT_EDIT_VALUES2_REMOVE_BUTTON}    visible    timeout=2s
    Browser.Click    ${SELECTOR_AUTOMATION_POINT_LT_EDIT_VALUES2_REMOVE_BUTTON}

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_LT_EDIT_VALUES2_IN_INPUT}    visible    timeout=2s
    Fill Text    ${SELECTOR_AUTOMATION_POINT_LT_EDIT_VALUES2_IN_INPUT}    ${MEASURED_2_VALUE}
    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_LT_EDIT_VALUES2_OUT_INPUT}    visible    timeout=2s
    Fill Text    ${SELECTOR_AUTOMATION_POINT_LT_EDIT_VALUES2_OUT_INPUT}    ${CONVERTED_2_VALUE}

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_LT_EDIT_TABS_GRAPH_BUTTON}    visible    timeout=2s
    Browser.Click    ${SELECTOR_AUTOMATION_POINT_LT_EDIT_TABS_GRAPH_BUTTON}

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_LT_EDIT_X_AXIS_MIN_INPUT}    visible    timeout=2s
    Fill Text    ${SELECTOR_AUTOMATION_POINT_LT_EDIT_X_AXIS_MIN_INPUT}    ${X_AXIS_MIN_VALUE}
    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_LT_EDIT_X_AXIS_MAX_INPUT}    visible    timeout=2s
    Fill Text    ${SELECTOR_AUTOMATION_POINT_LT_EDIT_X_AXIS_MAX_INPUT}    ${X_AXIS_MAX_VALUE}
    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_LT_EDIT_X_AXIS_MIN_INPUT}    visible    timeout=2s
    Fill Text    ${SELECTOR_AUTOMATION_POINT_LT_EDIT_Y_AXIS_MIN_INPUT}    ${Y_AXIS_MIN_VALUE}
    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_LT_EDIT_X_AXIS_MAX_INPUT}    visible    timeout=2s
    Fill Text    ${SELECTOR_AUTOMATION_POINT_LT_EDIT_Y_AXIS_MAX_INPUT}    ${Y_AXIS_MAX_VALUE}

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_LT_EDIT_REFRESH_BUTTON}    visible    timeout=2s
    Browser.Click    ${SELECTOR_AUTOMATION_POINT_LT_EDIT_REFRESH_BUTTON}

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_LT_EDIT_ADD_BUTTON}    visible    timeout=2s
    Browser.Click    ${SELECTOR_AUTOMATION_POINT_LT_EDIT_ADD_BUTTON}

    Snack-bar Visibility And Content

Delete LT Point
    [Documentation]
    ...    Removes a Lookup Table Point object using arguments.
    ...    Requires active position at: Main navigation view -> Automation -> Points -> Lookup tables

    [Arguments]
    ...    ${POINT_ID_INPUT_VALUE}

    ${compiled_text}=    Set Variable
    ...    xpath=//tr[.//td//div[contains(@class, 'point-name') and text()=' ${POINT_ID_INPUT_VALUE} ']]
    Wait For Elements State    ${compiled_text}    visible    timeout=2s
    Browser.Click    ${compiled_text}
    Browser.Click    ${compiled_text}

    Wait For Elements State    ${SELECTOR_AUTOMATION_TOOLBAR_DELETE_BUTTON}    visible    timeout=2s
    Browser.Click    ${SELECTOR_AUTOMATION_TOOLBAR_DELETE_BUTTON}

    Wait For Elements State    ${SELECTOR_CONFIRM_DIALOG_CONFIRM_BUTTON}    visible    timeout=2s
    Browser.Click    ${SELECTOR_CONFIRM_DIALOG_CONFIRM_BUTTON}
    Snack-bar Visibility And Content
    Wait For Elements State    ${compiled_text}    hidden    timeout=2s

Edit LT Point
    [Documentation]
    ...    Opens Lookup Table Point object for editing and changes parameters using arguments.
    ...    Requires active position at: Main navigation view -> Automation -> Points -> Lookup tables

    [Arguments]
    ...    ${POINT_ID_INPUT_VALUE}
    ...    ${POINT_ID_NEW_VALUE}
    ...    ${POINT_DESCRIPTION_INPUT_VALUE}
    ...    ${ACCESS_LEVEL_VIEW_INPUT_VALUE}
    ...    ${ACCESS_LEVEL_MANUAL_INPUT_VALUE}
    ...    ${ACCESS_LEVEL_PROGRAMMING_INPUT_VALUE}
    ...    ${SENSOR_TYPE}
    ...    ${OFFSET_INPUT_VALUE}
    ...    ${X_AXIS_INPUT_VALUE}
    ...    ${Y_AXIS_INPUT_VALUE}
    ...    ${X_AXIS_MIN_VALUE}
    ...    ${X_AXIS_MAX_VALUE}
    ...    ${Y_AXIS_MIN_VALUE}
    ...    ${Y_AXIS_MAX_VALUE}
    ...    ${RANDOM_VALUES}

    ${copy_dialog_visible}=    Run Keyword And Return Status
    ...    Wait For Elements State
    ...    ${SELECTOR_AUTOMATION_POINT_CELL_COPY_BUTTON}
    ...    visible
    ...    timeout=2s
    IF    ${copy_dialog_visible}
        Browser.Click    ${SELECTOR_AUTOMATION_POINT_CELL_COPY_BUTTON}
        Snack-bar Visibility And Content
    END

    ${compiled_text}=    Set Variable    //div[@class="point-name"][text()=" ${POINT_ID_INPUT_VALUE} "]
    Wait For Elements State    ${compiled_text}    visible    timeout=2s
    Browser.Click    ${compiled_text}

    Wait For Elements State    ${SELECTOR_AUTOMATION_TOOLBAR_EDIT_BUTTON}    visible    timeout=2s
    Browser.Click    ${SELECTOR_AUTOMATION_TOOLBAR_EDIT_BUTTON}

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_LT_EDIT_POINT_ID_INPUT}    visible    timeout=2s
    Fill Text    ${SELECTOR_AUTOMATION_POINT_LT_EDIT_POINT_ID_INPUT}    ${POINT_ID_NEW_VALUE}

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_LT_EDIT_POINT_DESCR_INPUT}    visible    timeout=2s
    Fill Text    ${SELECTOR_AUTOMATION_POINT_LT_EDIT_POINT_DESCR_INPUT}    ${POINT_DESCRIPTION_INPUT_VALUE}

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_LT_EDIT_LEVEL_VIEW_INPUT}    visible    timeout=2s
    Fill Text    ${SELECTOR_AUTOMATION_POINT_LT_EDIT_LEVEL_VIEW_INPUT}    ${ACCESS_LEVEL_VIEW_INPUT_VALUE}

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_LT_EDIT_LEVEL_MANUAL_INPUT}    visible    timeout=2s
    Fill Text    ${SELECTOR_AUTOMATION_POINT_LT_EDIT_LEVEL_MANUAL_INPUT}    ${ACCESS_LEVEL_MANUAL_INPUT_VALUE}

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_LT_EDIT_LEVEL_PROGRAMMING_INPUT}    visible    timeout=2s
    Fill Text
    ...    ${SELECTOR_AUTOMATION_POINT_LT_EDIT_LEVEL_PROGRAMMING_INPUT}
    ...    ${ACCESS_LEVEL_PROGRAMMING_INPUT_VALUE}

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_LT_EDIT_SENSOR_TYPE_SELECT}    visible    timeout=2s
    Browser.Click    ${SELECTOR_AUTOMATION_POINT_LT_EDIT_SENSOR_TYPE_SELECT}

    IF    ${SENSOR_TYPE} == 3
        Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_LT_EDIT_SENSOR_TYPE_3_CURRENT}    visible    timeout=2s
        Browser.Click    ${SELECTOR_AUTOMATION_POINT_LT_EDIT_SENSOR_TYPE_3_CURRENT}
    ELSE IF    ${SENSOR_TYPE} == 2
        Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_LT_EDIT_SENSOR_TYPE_2_VOLTAGE}    visible    timeout=2s
        Browser.Click    ${SELECTOR_AUTOMATION_POINT_LT_EDIT_SENSOR_TYPE_2_VOLTAGE}
    ELSE    # 1 == Resistive
        Wait For Elements State
        ...    ${SELECTOR_AUTOMATION_POINT_LT_EDIT_SENSOR_TYPE_1_RESISTIVE}
        ...    visible
        ...    timeout=2s
        Browser.Click    ${SELECTOR_AUTOMATION_POINT_LT_EDIT_SENSOR_TYPE_1_RESISTIVE}
    END

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_LT_EDIT_OFFSET_INPUT}    visible    timeout=2s
    Fill Text    ${SELECTOR_AUTOMATION_POINT_LT_EDIT_OFFSET_INPUT}    ${OFFSET_INPUT_VALUE}

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_LT_EDIT_X_AXIS_NAME_INPUT}    visible    timeout=2s
    Fill Text    ${SELECTOR_AUTOMATION_POINT_LT_EDIT_X_AXIS_NAME_INPUT}    ${X_AXIS_INPUT_VALUE}
    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_LT_EDIT_Y_AXIS_NAME_INPUT}    visible    timeout=2s
    Fill Text    ${SELECTOR_AUTOMATION_POINT_LT_EDIT_Y_AXIS_NAME_INPUT}    ${Y_AXIS_INPUT_VALUE}

    FOR    ${counter}    IN RANGE    1    14
        ${random_number}    ${random_string}=    Generate Random Variables    5
        ${xpath_value_in}=    Set Variable
        ...    xpath=//input[@data-qa-id="automation-lookup-table-edit-values${counter}-in"]
        ${xpath_value_out}=    Set Variable
        ...    xpath=//input[@data-qa-id="automation-lookup-table-edit-values${counter}-out"]
        Wait For Elements State    ${xpath_value_in}    visible    timeout=2s
        Fill Text    ${xpath_value_in}    ${random_number}
        Wait For Elements State    ${xpath_value_out}    visible    timeout=2s
        ${random_number}    ${random_string}=    Generate Random Variables    5
        ${value_out}=    Evaluate    ${random_number} * 1
        Fill Text    ${xpath_value_out}    ${value_out}
    END

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_LT_EDIT_TABS_GRAPH_BUTTON}    visible    timeout=2s
    Browser.Click    ${SELECTOR_AUTOMATION_POINT_LT_EDIT_TABS_GRAPH_BUTTON}

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_LT_EDIT_X_AXIS_MIN_INPUT}    visible    timeout=2s
    Fill Text    ${SELECTOR_AUTOMATION_POINT_LT_EDIT_X_AXIS_MIN_INPUT}    ${X_AXIS_MIN_VALUE}
    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_LT_EDIT_X_AXIS_MAX_INPUT}    visible    timeout=2s
    Fill Text    ${SELECTOR_AUTOMATION_POINT_LT_EDIT_X_AXIS_MAX_INPUT}    ${X_AXIS_MAX_VALUE}
    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_LT_EDIT_X_AXIS_MIN_INPUT}    visible    timeout=2s
    Fill Text    ${SELECTOR_AUTOMATION_POINT_LT_EDIT_Y_AXIS_MIN_INPUT}    ${Y_AXIS_MIN_VALUE}
    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_LT_EDIT_X_AXIS_MAX_INPUT}    visible    timeout=2s
    Fill Text    ${SELECTOR_AUTOMATION_POINT_LT_EDIT_Y_AXIS_MAX_INPUT}    ${Y_AXIS_MAX_VALUE}

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_LT_EDIT_REFRESH_BUTTON}    visible    timeout=2s
    Browser.Click    ${SELECTOR_AUTOMATION_POINT_LT_EDIT_REFRESH_BUTTON}

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_LT_EDIT_SAVE_BUTTON}    visible    timeout=2s
    Browser.Click    ${SELECTOR_AUTOMATION_POINT_LT_EDIT_SAVE_BUTTON}

    Snack-bar Visibility And Content

Show LT graph
    [Documentation]
    ...    Displays Lookup Table Point graph view using arguments.
    ...    Requires active position at: Main navigation view -> Automation -> Points -> Lookup tables

    [Arguments]
    ...    ${POINT_ID_INPUT_VALUE}

    ${full_string}=    Set Variable    xpath=//tr[.//td[1]//mat-icon[@data-qa-id="automation-table-item1-copy-name"]]
    ${attribute_value}=    Get Attribute    ${full_string}    data-qa-id
    ${text_value}=    Browser.Get Text    ${full_string}
    Log To Console    copy_DATA-QA_ID:${attribute_value}
    Log To Console    text:${text_value}

    ${compiled_text}=    Set Variable
    ...    xpath=//tr[contains(.//td//div[@class='point-name'], ' ${POINT_ID_INPUT_VALUE} ')]
    Wait For Elements State    ${compiled_text}    visible    timeout=2s
    ${attribute_value}=    Get Attribute    ${compiled_text}    data-qa-id
    Log To Console    1_DATA-QA_ID:${attribute_value}

    Browser.Click    ${compiled_text}

    Log To Console    ${compiled_text}
    ${full_string}=    Set Variable    xpath=//tr[.//td[1]=' ${POINT_ID_INPUT_VALUE} ']
    ${attribute_value}=    Get Attribute    ${full_string}    data-qa-id

    Log To Console    2_DATA-QA_ID:${attribute_value}

    ${compiled_text}=    Set Variable
    ...    xpath=//tr[@data-qa-id="automation-table-item1"]//button[@data-qa-id="automation-table-item1-actions-graph"]
    Log To Console    ${compiled_text}
    ${attribute_value}=    Get Attribute    ${compiled_text}    data-qa-id
    Log To Console    3_DATA-QA_ID:${attribute_value}
    Wait For Elements State    ${compiled_text}    visible    timeout=2s
    Browser.Click    ${compiled_text}
    Sleep    5s

    ${dialog_close_btn}=    Set Variable    //mat-icon[@data-qa-id="automation-dialog-close"]
    Wait For Elements State    ${dialog_close_btn}    visible    timeout=2s
    Browser.Click    ${dialog_close_btn}