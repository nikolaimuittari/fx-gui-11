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
Add New CP Point
    [Arguments]
    ...    ${POINT_ID_INPUT_VALUE}
    ...    ${POINT_DESCRIPTION_INPUT_VALUE}
    ...    ${ACCESS_LEVEL_VIEW_INPUT_VALUE}
    ...    ${ACCESS_LEVEL_MANUAL_INPUT_VALUE}
    ...    ${ACCESS_LEVEL_PROGRAMMING_INPUT_VALUE}
    ...    ${MAIN_MAIN_MEASUREMENT}
    ...    ${MAIN_OUTDOOR_MEASUREMENT}
    ...    ${BASIC_INDICATION}
    ...    ${BASIC_UNIT}
    ...    ${BASIC_DECIMALS}
    ...    ${BASIC_STATETEXT}
    ...    ${BASIC_PICTURE}
    ...    ${BASIC_CONTROL_MODE}    # 1=PI, 2=PID
    ...    ${BASIC_SPEED_FACTOR}
    ...    ${BASIC_INTEGRATION_TIME}
    ...    ${BASIC_I_SENSITIVITY}
    ...    ${BASIC_COOLING_DEADZONE}
    ...    ${BASIC_EXEC_INTERVAL}
    ...    ${BASIC_BALANCE_POINT_STAGE}
    ...    ${BASIC_BALANCE_POINT_VALUE}
    ...    ${CONTROL_STAGE_COUNT}    # 1..6
    ...    ${CONTROL_STAGE_RANDOM}    # 0 / 1
    ...    ${CONTROL_1_NAME}
    ...    ${CONTROL_1_P_BAND}
    ...    ${CONTROL_1_TYPE}    # 1=Cooling, 2=Recovery, 3=Heating
    ...    ${CONTROL_1_MIN_OUTPUT}
    ...    ${CONTROL_1_MAX_OUTPUT}
    ...    ${CONTROL_1_OFF_STATE}
    ...    ${CONTROL_1_AO_POINT}
    ...    ${CONTROL_1_OUTDOOR_TE_LIMIT}
    ...    ${CONTROL_1_OUTDOOR_TE_P_BAND}
    ...    ${CONTROL_1_LIMIT_MEAS_LIMIT}
    ...    ${CONTROL_1_LIMIT_MEAS_P_BAND}
    ...    ${AHU_HEATING_STAGE_VALUE}
    ...    ${CONSTANT_DEFAULT_VALUE}
    ...    ${CONSTANT_COPY_MANUAL_TO_DEFAULT}
    ...    ${CASCADE_CONTROL_POINT}
    ...    ${CASCADE_CONTROL_POINT_STAGE}
    ...    ${COMPENSATION_LOOKUP}
    ...    ${COMPENSATION_AI}

    # Go to automation
    # Go to automation control points

    Wait For Elements State    ${SELECTOR_AUTOMATION_TOOLBAR_ADD_NEW_BUTTON}    visible    timeout=2s
    Browser.Click    ${SELECTOR_AUTOMATION_TOOLBAR_ADD_NEW_BUTTON}

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_EDIT_POINT_ID_INPUT}    visible    timeout=2s
    Fill Text    ${SELECTOR_AUTOMATION_POINT_EDIT_POINT_ID_INPUT}    ${POINT_ID_INPUT_VALUE}

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_EDIT_POINT_DESCRIPTION_INPUT}    visible    timeout=2s
    Fill Text    ${SELECTOR_AUTOMATION_POINT_EDIT_POINT_DESCRIPTION_INPUT}    ${POINT_DESCRIPTION_INPUT_VALUE}

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_EDIT_ACCESS_LEVEL_VIEW_INPUT}    visible    timeout=2s
    Fill Text    ${SELECTOR_AUTOMATION_POINT_EDIT_ACCESS_LEVEL_VIEW_INPUT}    ${ACCESS_LEVEL_VIEW_INPUT_VALUE}

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_EDIT_ACCESS_LEVEL_MANUAL_INPUT}    visible    timeout=2s
    Fill Text    ${SELECTOR_AUTOMATION_POINT_EDIT_ACCESS_LEVEL_MANUAL_INPUT}    ${ACCESS_LEVEL_MANUAL_INPUT_VALUE}

    Wait For Elements State
    ...    ${SELECTOR_AUTOMATION_POINT_EDIT_ACCESS_LEVEL_PROGRAMMING_INPUT}
    ...    visible
    ...    timeout=2s
    Fill Text
    ...    ${SELECTOR_AUTOMATION_POINT_EDIT_ACCESS_LEVEL_PROGRAMMING_INPUT}
    ...    ${ACCESS_LEVEL_PROGRAMMING_INPUT_VALUE}

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_EDIT_ADD_BUTTON}    visible    timeout=2s
    Browser.Click    ${SELECTOR_AUTOMATION_POINT_EDIT_ADD_BUTTON}

    Snack-bar Visibility And Content

Delete CP Point
    [Arguments]
    ...    ${POINT_ID_INPUT_VALUE}

    # Go to automation
    # Go to automation control points

    ${compiled_text}=    Set Variable    xpath=//td[contains(., '${POINT_ID_INPUT_VALUE}')]
    # //td[.//div[@class='point-name ng-star-inserted' and text()=" ${POINT_ID_INPUT_VALUE} "]]

    Wait For Elements State    ${compiled_text}    visible    timeout=2s
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

Duplicate CP Point
    [Arguments]
    ...    ${POINT_ID_INPUT_VALUE}
    ...    ${POINT_NEW_NAME}

    # Go to automation
    # Go to automation control points

    ${compiled_text}=    Set Variable    xpath=//td[contains(., '${POINT_ID_INPUT_VALUE}')]
    # ${compiled_text}=    Set Variable    //td[.//div[@class='point-name ng-star-inserted' and text()=" ${POINT_ID_INPUT_VALUE} "]]

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
    Go to automation control points

    ${xpath_variable}=    Set Variable    xpath=//td[contains(., '${POINT_NEW_NAME}')]
    Wait For Elements State    ${xpath_variable}    visible    timeout=2s

Print CP Pointlist
    # Go to automation
    # Go to automation control points

    Wait For Elements State    ${SELECTOR_AUTOMATION_TOOLBAR_PRINT_BUTTON}    visible    timeout=2s
    Browser.Click    ${SELECTOR_AUTOMATION_TOOLBAR_PRINT_BUTTON}
    Sleep    3s
    Keyboard Key    press    Escape

    Wait For Elements State    ${SELECTOR_AUTOMATION_TOOLBAR_PRINT_BUTTON}    visible    timeout=2s

Edit CP Point
    [Arguments]
    ...    ${POINT_ID_INPUT_VALUE}
    ...    ${POINT_ID_NEW_VALUE}
    ...    ${POINT_DESCRIPTION_INPUT_VALUE}
    ...    ${ACCESS_LEVEL_VIEW_INPUT_VALUE}
    ...    ${ACCESS_LEVEL_MANUAL_INPUT_VALUE}
    ...    ${ACCESS_LEVEL_PROGRAMMING_INPUT_VALUE}
    ...    ${MAIN_MAIN_MEASUREMENT}
    ...    ${MAIN_OUTDOOR_MEASUREMENT}

    # Go to automation
    # Go to automation control points
    ${compiled_text}=    Set Variable    xpath=//td[contains(., '${POINT_ID_INPUT_VALUE}')]
    # ${compiled_text}=    Set Variable    //td[.//div[@class='point-name ng-star-inserted' and text()=" ${POINT_ID_INPUT_VALUE} "]]

    Wait For Elements State    ${compiled_text}    visible    timeout=2s
    Browser.Click    ${compiled_text}

    ${copy_dialog_visible}=    Run Keyword And Return Status
    ...    Wait For Elements State
    ...    ${SELECTOR_AUTOMATION_POINT_CELL_COPY_BUTTON}
    ...    visible
    ...    timeout=2s
    IF    ${copy_dialog_visible}
        Browser.Click    ${SELECTOR_AUTOMATION_POINT_CELL_COPY_BUTTON}
        Snack-bar Visibility And Content
    END

    Wait For Elements State    ${SELECTOR_AUTOMATION_TOOLBAR_EDIT_BUTTON}    visible    timeout=2s
    Browser.Click    ${SELECTOR_AUTOMATION_TOOLBAR_EDIT_BUTTON}

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_EDIT_POINT_ID_INPUT}    visible    timeout=2s
    Fill Text    ${SELECTOR_AUTOMATION_POINT_EDIT_POINT_ID_INPUT}    ${POINT_ID_NEW_VALUE}

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_EDIT_POINT_DESCRIPTION_INPUT}    visible    timeout=2s
    Fill Text    ${SELECTOR_AUTOMATION_POINT_EDIT_POINT_DESCRIPTION_INPUT}    ${POINT_DESCRIPTION_INPUT_VALUE}

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_EDIT_ACCESS_LEVEL_VIEW_INPUT}    visible    timeout=2s
    Fill Text    ${SELECTOR_AUTOMATION_POINT_EDIT_ACCESS_LEVEL_VIEW_INPUT}    ${ACCESS_LEVEL_VIEW_INPUT_VALUE}

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_EDIT_ACCESS_LEVEL_MANUAL_INPUT}    visible    timeout=2s
    Fill Text    ${SELECTOR_AUTOMATION_POINT_EDIT_ACCESS_LEVEL_MANUAL_INPUT}    ${ACCESS_LEVEL_MANUAL_INPUT_VALUE}

    Wait For Elements State
    ...    ${SELECTOR_AUTOMATION_POINT_EDIT_ACCESS_LEVEL_PROGRAMMING_INPUT}
    ...    visible
    ...    timeout=2s
    Fill Text
    ...    ${SELECTOR_AUTOMATION_POINT_EDIT_ACCESS_LEVEL_PROGRAMMING_INPUT}
    ...    ${ACCESS_LEVEL_PROGRAMMING_INPUT_VALUE}

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_CP_EDIT_POINT_MAIN_MEAS_ID_INPUT}    visible    timeout=2s
    Fill Text    ${SELECTOR_AUTOMATION_POINT_CP_EDIT_POINT_MAIN_MEAS_ID_INPUT}    ${MAIN_MAIN_MEASUREMENT}

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_CP_EDIT_POINT_OUTDOOR_MEAS_INPUT}    visible    timeout=2s
    Fill Text    ${SELECTOR_AUTOMATION_POINT_CP_EDIT_POINT_OUTDOOR_MEAS_INPUT}    ${MAIN_OUTDOOR_MEASUREMENT}

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_EDIT_SAVE_BUTTON}    visible    timeout=2s
    Browser.Click    ${SELECTOR_AUTOMATION_POINT_EDIT_SAVE_BUTTON}

    Snack-bar Visibility And Content
