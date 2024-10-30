*** Settings ***
Library     Browser
Library     RPA.JavaAccessBridge
Library     String
Library     OperatingSystem
# Library    RPA.Desktop
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

    # Go to automation
    # Go to automation lookup tables

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

    # Keyboard Key    press    ArrowDown
    # Keyboard Key    press    Enter
    # ${option2}=    Set Variable    //option[@data-qa-id="automation-lookup-table-edit-picture-option2"]
    # Browser.Click    ${option2}
    # Select Options By    ${SELECTOR_AUTOMATION_POINT_LT_EDIT_PICTURE_SELECT}    value    aaa.htm

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_LT_EDIT_X_AXIS_NAME_INPUT}    visible    timeout=2s
    Fill Text    ${SELECTOR_AUTOMATION_POINT_LT_EDIT_X_AXIS_NAME_INPUT}    ${X_AXIS_INPUT_VALUE}
    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_LT_EDIT_Y_AXIS_NAME_INPUT}    visible    timeout=2s
    Fill Text    ${SELECTOR_AUTOMATION_POINT_LT_EDIT_Y_AXIS_NAME_INPUT}    ${Y_AXIS_INPUT_VALUE}

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_LT_EDIT_VALUES1_IN_INPUT}    visible    timeout=2s
    Fill Text    ${SELECTOR_AUTOMATION_POINT_LT_EDIT_VALUES1_IN_INPUT}    ${MEASURED_1_VALUE}
    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_LT_EDIT_VALUES1_OUT_INPUT}    visible    timeout=2s
    Fill Text    ${SELECTOR_AUTOMATION_POINT_LT_EDIT_VALUES1_OUT_INPUT}    ${CONVERTED_1_VALUE}

    # Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_LT_EDIT_VALUES1_ADD_BUTTON}    visible    timeout=2s
    # Browser.Click    ${SELECTOR_AUTOMATION_POINT_LT_EDIT_VALUES1_ADD_BUTTON}

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_LT_EDIT_VALUES2_IN_INPUT}    visible    timeout=2s
    Fill Text    ${SELECTOR_AUTOMATION_POINT_LT_EDIT_VALUES2_IN_INPUT}    ${MEASURED_2_VALUE}
    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_LT_EDIT_VALUES2_OUT_INPUT}    visible    timeout=2s
    Fill Text    ${SELECTOR_AUTOMATION_POINT_LT_EDIT_VALUES2_OUT_INPUT}    ${CONVERTED_2_VALUE}

    # Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_LT_EDIT_VALUES2_ADD_BUTTON}    visible    timeout=2s
    # Browser.Click    ${SELECTOR_AUTOMATION_POINT_LT_EDIT_VALUES2_ADD_BUTTON}

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_LT_EDIT_VALUES2_REMOVE_BUTTON}    visible    timeout=2s
    Browser.Click    ${SELECTOR_AUTOMATION_POINT_LT_EDIT_VALUES2_REMOVE_BUTTON}

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_LT_EDIT_VALUES2_IN_INPUT}    visible    timeout=2s
    Fill Text    ${SELECTOR_AUTOMATION_POINT_LT_EDIT_VALUES2_IN_INPUT}    ${MEASURED_2_VALUE}
    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_LT_EDIT_VALUES2_OUT_INPUT}    visible    timeout=2s
    Fill Text    ${SELECTOR_AUTOMATION_POINT_LT_EDIT_VALUES2_OUT_INPUT}    ${CONVERTED_2_VALUE}

    # Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_LT_EDIT_REMOVE_VALUES_BUTTON}    visible    timeout=2s
    # Browser.Click    ${SELECTOR_AUTOMATION_POINT_LT_EDIT_REMOVE_VALUES_BUTTON}

    # ${measured_1_text}=    Get Property    ${SELECTOR_AUTOMATION_POINT_LT_EDIT_VALUES1_IN_INPUT}    innerText
    # ${text_is_empty}=    Should Be Empty    ${measured_1_text}
    # IF    ${text_is_empty}
    #    Log To Console    In value 1 is empty
    # ELSE
    #    Log To Console    In value 1 is : ${measured_1_text}
    # END

    # Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_LT_EDIT_VALUES1_IN_INPUT}    visible    timeout=2s
    # Fill Text    ${SELECTOR_AUTOMATION_POINT_LT_EDIT_VALUES1_IN_INPUT}    ${MEASURED_1_VALUE}
    # Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_LT_EDIT_VALUES1_OUT_INPUT}    visible    timeout=2s
    # Fill Text    ${SELECTOR_AUTOMATION_POINT_LT_EDIT_VALUES1_OUT_INPUT}    ${CONVERTED_1_VALUE}

    # # Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_LT_EDIT_VALUES1_ADD_BUTTON}    visible    timeout=2s
    # # Browser.Click    ${SELECTOR_AUTOMATION_POINT_LT_EDIT_VALUES1_ADD_BUTTON}

    # Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_LT_EDIT_VALUES2_IN_INPUT}    visible    timeout=2s
    # Fill Text    ${SELECTOR_AUTOMATION_POINT_LT_EDIT_VALUES2_IN_INPUT}    ${MEASURED_2_VALUE}
    # Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_LT_EDIT_VALUES2_OUT_INPUT}    visible    timeout=2s
    # Fill Text    ${SELECTOR_AUTOMATION_POINT_LT_EDIT_VALUES2_OUT_INPUT}    ${CONVERTED_2_VALUE}

    # # Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_LT_EDIT_VALUES2_ADD_BUTTON}    visible    timeout=2s
    # # Browser.Click    ${SELECTOR_AUTOMATION_POINT_LT_EDIT_VALUES2_ADD_BUTTON}

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

    # Browser.Click    ${SELECTOR_AUTOMATION_POINT_LT_EDIT_CHART_BUTTON}
    # Sleep    3s
    # Keyboard Key    press    Escape

    # xpath=//input[@data-qa-id="automation-lookup-table-edit-values1-in"]
    # xpath=//input[@data-qa-id="automation-lookup-table-edit-values1-out"]

    # ${SELECTOR_AUTOMATION_POINT_LT_EDIT_SENSOR_TYPE_SELECT}
    # ${SELECTOR_AUTOMATION_POINT_LT_EDIT_OFFSET_INPUT}
    # ${SELECTOR_AUTOMATION_POINT_LT_EDIT_PICTURE_SELECT}
    # ${SELECTOR_AUTOMATION_POINT_LT_EDIT_X_AXIS_NAME_INPUT}
    # ${SELECTOR_AUTOMATION_POINT_LT_EDIT_Y_AXIS_NAME_INPUT}
    # ${SELECTOR_AUTOMATION_POINT_LT_EDIT_TABS_TABLE_BUTTON}
    # ${SELECTOR_AUTOMATION_POINT_LT_EDIT_TABS_GRAPH_BUTTON}

    # ${SELECTOR_AUTOMATION_POINT_LT_EDIT_REMOVE_VALUES_BUTTON}
    # ${SELECTOR_AUTOMATION_POINT_LT_EDIT_VALUES1_IN_INPUT}
    # ${SELECTOR_AUTOMATION_POINT_LT_EDIT_VALUES1_OUT_INPUT}
    # ${SELECTOR_AUTOMATION_POINT_LT_EDIT_VALUES1_ADD_BUTTON}
    # ${SELECTOR_AUTOMATION_POINT_LT_EDIT_VALUES1_REMOVE_BUTTON}
    # ${SELECTOR_AUTOMATION_POINT_LT_EDIT_SAVE_BUTTON}
    # ${SELECTOR_AUTOMATION_POINT_LT_EDIT_CANCEL_BUTTON}
    # ${SELECTOR_AUTOMATION_POINT_LT_EDIT_X_AXIS_MIN_INPUT}
    # ${SELECTOR_AUTOMATION_POINT_LT_EDIT_X_AXIS_MAX_INPUT}
    # ${SELECTOR_AUTOMATION_POINT_LT_EDIT_Y_AXIS_MIN_INPUT}
    # ${SELECTOR_AUTOMATION_POINT_LT_EDIT_Y_AXIS_MAX_INPUT}
    # ${SELECTOR_AUTOMATION_POINT_LT_EDIT_REFRESH_BUTTON}

    # ${SELECTOR_AUTOMATION_POINT_LT_EDIT_CHART_BUTTON}
    # ${SELECTOR_AUTOMATION_POINT_LT_EDIT_CHART_CONTEXT_MENU}
    # ${SELECTOR_AUTOMATION_POINT_LT_EDIT_CHART_LEGEND_ITEM}

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_LT_EDIT_ADD_BUTTON}    visible    timeout=2s
    Browser.Click    ${SELECTOR_AUTOMATION_POINT_LT_EDIT_ADD_BUTTON}

    Snack-bar Visibility And Content

Delete LT Point
    [Arguments]
    ...    ${POINT_ID_INPUT_VALUE}

    # Go to automation
    # Go to automation lookup tables

    # ${compiled_text}=    Set Variable    //div[@class="point-name"][text()=" ${POINT_ID_INPUT_VALUE} "]
    #    ${compiled_text}=    Set Variable    //div[@class="state_text_info"][contains(text(), "${POINT_ID_INPUT_VALUE}")]
    # ${compiled_text}=    Set Variable    //div[@class="point-name"][text()=" ${POINT_ID_INPUT_VALUE} "]
    # ${compiled_text}=    Set Variable    //td[.//div[@class='point-name ng-star-inserted' and text()=" ${POINT_ID_INPUT_VALUE} "]]
    # ${compiled_text}=    Set Variable    //div[@class="point-name"][text()=" ${POINT_ID_INPUT_VALUE} "]
    ${compiled_text}=    Set Variable
    ...    xpath=//tr[.//td//div[contains(@class, 'point-name') and text()=' ${POINT_ID_INPUT_VALUE} ']]
    Wait For Elements State    ${compiled_text}    visible    timeout=2s
    Browser.Click    ${compiled_text}
    Browser.Click    ${compiled_text}

    # Browser.Click With Options    ${compiled_text}    position_x=100    position_y=1
    # Mouse Move Relative To    ${compiled_text}    x=0.0    y=20.0    steps=1
    # Mouse Button    action=Browser.Click    delay=100ms

    # ${copy_dialog}=    Run Keyword And Return Status    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_CELL_COPY_BUTTON}    visible    timeout=2s
    # IF    ${copy_dialog}
    #    Browser.Click    ${SELECTOR_AUTOMATION_POINT_CELL_COPY_BUTTON}
    # END

    Wait For Elements State    ${SELECTOR_AUTOMATION_TOOLBAR_DELETE_BUTTON}    visible    timeout=2s
    Browser.Click    ${SELECTOR_AUTOMATION_TOOLBAR_DELETE_BUTTON}

    # ${point_xpath_variable}=    Set Variable    //app-confirm-dialog[@class="ng-star-inserted"]//p[text()='${POINT_ID_INPUT_VALUE}']
    # Wait For Elements State    ${point_xpath_variable}    visible    timeout=2s
    Wait For Elements State    ${SELECTOR_CONFIRM_DIALOG_CONFIRM_BUTTON}    visible    timeout=2s
    Browser.Click    ${SELECTOR_CONFIRM_DIALOG_CONFIRM_BUTTON}
    Snack-bar Visibility And Content
    Wait For Elements State    ${compiled_text}    hidden    timeout=2s

Edit LT Point
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

    # Go to automation
    # Go to automation lookup tables

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
    #    ${compiled_text}=    Set Variable    //div[@class="state_text_info"][contains(text(), "${POINT_ID_INPUT_VALUE}")]
    # ${compiled_text}=    Set Variable    //div[@class="point-name"][text()=" ${POINT_ID_INPUT_VALUE} "]
    # ${compiled_text}=    Set Variable    //td[.//div[@class='point-name ng-star-inserted' and text()=" ${POINT_ID_INPUT_VALUE} "]]
    Wait For Elements State    ${compiled_text}    visible    timeout=2s
    Browser.Click    ${compiled_text}
    # Browser.Click With Options    ${compiled_text}    position_x=100    position_y=1
    # Mouse Move Relative To    ${compiled_text}    x=0.0    y=20.0    steps=1
    # Mouse Button    action=Browser.Click    delay=100ms

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

    # Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_LT_EDIT_PICTURE_SELECT}    visible    timeout=2s
    # Select Options By    ${SELECTOR_AUTOMATION_POINT_LT_EDIT_PICTURE_SELECT}    value    aaa.htm

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
    [Arguments]
    ...    ${POINT_ID_INPUT_VALUE}

    # ${compiled_text}=    Set Variable    //td[.//div[@class='point-name ng-star-inserted' and text()=" ${POINT_ID_INPUT_VALUE} "]]
    # ${compiled_text}=    Set Variable    //div[@class="point-name"][text()=" ${POINT_ID_INPUT_VALUE} "]
    # ${compiled_text}=    Set Variable    xpath=//tr[.//td//div[contains(@class, 'point-name') and text()=' ${POINT_ID_INPUT_VALUE} ']]

    # ${xpath}    Set Variable    xpath=//tr[.//td[1][contains(text(),'${POINT_ID_INPUT_VALUE}')]]
    # ${data_qa_id}=    Get Attribute    ${xpath}    data-qa-id
    # Log To Console    1DATA-QA_ID:    ${data_qa_id}

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
    # ${full_string}=    Set Variable    xpath=//tr[.//td[1]=' ${POINT_ID_INPUT_VALUE} ']

    Log To Console    ${compiled_text}
    ${full_string}=    Set Variable    xpath=//tr[.//td[1]=' ${POINT_ID_INPUT_VALUE} ']
    ${attribute_value}=    Get Attribute    ${full_string}    data-qa-id

    Log To Console    2_DATA-QA_ID:${attribute_value}

    # ${compiled_text}=    Set Variable    xpath=//tr[contains(.//td//div[@class='point-name'], ' ${POINT_ID_INPUT_VALUE} ') and .//td[3]//button[@data-qa-id]]
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

    # ${actions_cell_selected_button}=    Set Variable    //tr[contains(@class, 'ng-star-inserted selected')]//button[contains(@data-qa-id, 'automation-table-item') and contains(@data-qa-id, '-actions-graph')]
    # Wait For Elements State    ${actions_cell_selected_button}    visible    timeout=2s
    # Browser.Click    ${actions_cell_selected_button}

    # ${point_name_dialog}=    Set Variable    //div[@class="point-id"][text()=" ${POINT_ID_INPUT_VALUE} "]
    # Sleep    5s

    # ${dialog_close_btn}=    Set Variable    //mat-icon[@data-qa-id="automation-dialog-close"]
    # Browser.Click    ${dialog_close_btn}
