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
Add New ST Point
    [Arguments]
    ...    ${POINT_ID_INPUT_VALUE}
    ...    ${SYNCHRONIZE}
    ...    ${VALUES1_VALUE}
    ...    ${VALUES1_TEXT}
    ...    ${VALUES2_VALUE}
    ...    ${VALUES2_TEXT}
    ...    ${VALUES3_VALUE}
    ...    ${VALUES3_TEXT}

    Go to automation
    Go to automation state texts

    Wait For Elements State    ${SELECTOR_AUTOMATION_TOOLBAR_ADD_NEW_BUTTON}    visible    timeout=2s
    Browser.Click    ${SELECTOR_AUTOMATION_TOOLBAR_ADD_NEW_BUTTON}

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_ST_EDIT_POINT_POINTNAME_INPUT}    visible    timeout=2s
    Fill Text    ${SELECTOR_AUTOMATION_POINT_ST_EDIT_POINT_POINTNAME_INPUT}    ${POINT_ID_INPUT_VALUE}

    IF    ${SYNCHRONIZE} != 0
        Check Checkbox    ${SELECTOR_AUTOMATION_POINT_ST_EDIT_SYNCHRONIZE_CHKBX}
    END

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_ST_EDIT_VALUES1_VALUE_INPUT}    visible    timeout=2s
    Fill Text    ${SELECTOR_AUTOMATION_POINT_ST_EDIT_VALUES1_VALUE_INPUT}    ${VALUES1_VALUE}
    Fill Text    ${SELECTOR_AUTOMATION_POINT_ST_EDIT_VALUES1_TEXT_INPUT}    ${VALUES1_TEXT}
    Check Checkbox    ${SELECTOR_AUTOMATION_POINT_ST_EDIT_VALUES1_DIALOG_CHKBX}

    ${SELECTOR_AUTOMATION_POINT_ST_EDIT_VALUES2_VALUE_INPUT}=    Set Variable
    ...    xpath=//input[@data-qa-id="automation-state-text-edit-values2-value"]
    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_ST_EDIT_VALUES2_VALUE_INPUT}    visible    timeout=2s
    Fill Text    ${SELECTOR_AUTOMATION_POINT_ST_EDIT_VALUES2_VALUE_INPUT}    ${VALUES2_VALUE}

    ${SELECTOR_AUTOMATION_POINT_ST_EDIT_VALUES2_TEXT_INPUT}=    Set Variable
    ...    xpath=//input[@data-qa-id="automation-state-text-edit-values2-text"]
    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_ST_EDIT_VALUES2_TEXT_INPUT}    visible    timeout=2s
    Fill Text    ${SELECTOR_AUTOMATION_POINT_ST_EDIT_VALUES2_TEXT_INPUT}    ${VALUES2_TEXT}

    ${SELECTOR_AUTOMATION_POINT_ST_EDIT_VALUES2_DIALOG_CHKBX}=    Set Variable
    ...    xpath=//input[@id="automation-state-text-edit-values2-dialog-input"]
    Check Checkbox    ${SELECTOR_AUTOMATION_POINT_ST_EDIT_VALUES2_DIALOG_CHKBX}

    Browser.Click    ${SELECTOR_AUTOMATION_POINT_ST_EDIT_VALUES2_ADD_BUTTON}

    ${SELECTOR_AUTOMATION_POINT_ST_EDIT_VALUES3_VALUE_INPUT}=    Set Variable
    ...    xpath=//input[@data-qa-id="automation-state-text-edit-values3-value"]
    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_ST_EDIT_VALUES3_VALUE_INPUT}    visible    timeout=2s
    Fill Text    ${SELECTOR_AUTOMATION_POINT_ST_EDIT_VALUES3_VALUE_INPUT}    ${VALUES3_VALUE}

    ${SELECTOR_AUTOMATION_POINT_ST_EDIT_VALUES3_TEXT_INPUT}=    Set Variable
    ...    xpath=//input[@data-qa-id="automation-state-text-edit-values3-text"]
    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_ST_EDIT_VALUES3_TEXT_INPUT}    visible    timeout=2s
    Fill Text    ${SELECTOR_AUTOMATION_POINT_ST_EDIT_VALUES3_TEXT_INPUT}    ${VALUES3_TEXT}

    ${SELECTOR_AUTOMATION_POINT_ST_EDIT_VALUES3_DIALOG_CHKBX}=    Set Variable
    ...    xpath=//input[@id="automation-state-text-edit-values3-dialog-input"]
    Check Checkbox    ${SELECTOR_AUTOMATION_POINT_ST_EDIT_VALUES3_DIALOG_CHKBX}

    ${SELECTOR_AUTOMATION_POINT_ST_EDIT_VALUES3_REMOVE_BUTTON}=    Set Variable
    ...    xpath=//button[@data-qa-id="automation-state-text-edit-values3-remove-button"]
    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_ST_EDIT_VALUES3_REMOVE_BUTTON}    visible    timeout=2s
    Browser.Click    ${SELECTOR_AUTOMATION_POINT_ST_EDIT_VALUES3_REMOVE_BUTTON}

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_ST_EDIT_VALUES3_VALUE_INPUT}    hidden    timeout=2s

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_ST_EDIT_ADD_BUTTON}    visible    timeout=2s
    Browser.Click    ${SELECTOR_AUTOMATION_POINT_ST_EDIT_ADD_BUTTON}

    Snack-bar Visibility And Content

Delete ST Point
    [Arguments]
    ...    ${POINT_ID_INPUT_VALUE}

    Go to automation
    Go to automation state texts

    ${compiled_text}=    Set Variable    //div[@class="point-name"][text()=" ${POINT_ID_INPUT_VALUE} "]
    #    ${compiled_text}=    Set Variable    //div[@class="state_text_info"][contains(text(), "${POINT_ID_INPUT_VALUE}")]
    # ${compiled_text}=    Set Variable    //div[@class="point-name"][text()=" ${POINT_ID_INPUT_VALUE} "]
    Wait For Elements State    ${compiled_text}    visible    timeout=2s
    # Browser.Click    ${compiled_text}
    # Browser.Click With Options    ${compiled_text}    position_x=100    position_y=1
    Mouse Move Relative To    ${compiled_text}    x=0.0    y=20.0    steps=1
    Mouse Button    action=click    delay=100ms

    ${copy_dialog}=    Run Keyword And Return Status
    ...    Wait For Elements State
    ...    ${SELECTOR_AUTOMATION_POINT_CELL_COPY_BUTTON}
    ...    visible
    ...    timeout=2s
    IF    ${copy_dialog}
        Browser.Click    ${SELECTOR_AUTOMATION_POINT_CELL_COPY_BUTTON}
    END

    Wait For Elements State    ${compiled_text}    visible    timeout=2s
    # Browser.Click    ${compiled_text}

    Wait For Elements State    ${SELECTOR_AUTOMATION_TOOLBAR_DELETE_BUTTON}    visible    timeout=2s
    Browser.Click    ${SELECTOR_AUTOMATION_TOOLBAR_DELETE_BUTTON}

    # ${point_xpath_variable}=    Set Variable    //app-confirm-dialog[@class="ng-star-inserted"]//p[text()='${POINT_ID_INPUT_VALUE}']
    # Wait For Elements State    ${point_xpath_variable}    visible    timeout=2s
    Wait For Elements State    ${SELECTOR_CONFIRM_DIALOG_CONFIRM_BUTTON}    visible    timeout=2s
    Browser.Click    ${SELECTOR_CONFIRM_DIALOG_CONFIRM_BUTTON}
    Snack-bar Visibility And Content
    Wait For Elements State    ${compiled_text}    hidden    timeout=2s

Print ST Pointlist
    Go to automation
    Go to automation state texts

    Wait For Elements State    ${SELECTOR_AUTOMATION_TOOLBAR_PRINT_BUTTON}    visible    timeout=2s
    Browser.Click    ${SELECTOR_AUTOMATION_TOOLBAR_PRINT_BUTTON}
    Sleep    3s
    Keyboard Key    press    Escape

    Wait For Elements State    ${SELECTOR_AUTOMATION_TOOLBAR_PRINT_BUTTON}    visible    timeout=2s

Edit ST Point
    [Arguments]
    ...    ${POINT_ID_INPUT_VALUE}
    ...    ${POINT_ID_NEW_VALUE}
    ...    ${SYNCHRONIZE}
    ...    ${VALUES1_VALUE}
    ...    ${VALUES1_TEXT}
    ...    ${VALUES2_VALUE}
    ...    ${VALUES2_TEXT}
    ...    ${VALUES3_VALUE}
    ...    ${VALUES3_TEXT}

    Go to automation
    Go to automation state texts

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
    Wait For Elements State    ${compiled_text}    visible    timeout=2s
    Browser.Click    ${compiled_text}
    # Browser.Click With Options    ${compiled_text}    position_x=100    position_y=1

    # Mouse Move Relative To    ${compiled_text}    x=0.0    y=20.0    steps=1
    # Mouse Button    action=click    delay=100ms

    Wait For Elements State    ${SELECTOR_AUTOMATION_TOOLBAR_EDIT_BUTTON}    visible    timeout=2s
    Browser.Click    ${SELECTOR_AUTOMATION_TOOLBAR_EDIT_BUTTON}

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_ST_EDIT_POINT_POINTNAME_INPUT}    visible    timeout=2s
    Fill Text    ${SELECTOR_AUTOMATION_POINT_ST_EDIT_POINT_POINTNAME_INPUT}    ${POINT_ID_NEW_VALUE}

    IF    ${SYNCHRONIZE} != 0
        Check Checkbox    ${SELECTOR_AUTOMATION_POINT_ST_EDIT_SYNCHRONIZE_CHKBX}
    ELSE
        Uncheck Checkbox    ${SELECTOR_AUTOMATION_POINT_ST_EDIT_SYNCHRONIZE_CHKBX}
    END

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_ST_EDIT_VALUES1_VALUE_INPUT}    visible    timeout=2s
    Fill Text    ${SELECTOR_AUTOMATION_POINT_ST_EDIT_VALUES1_VALUE_INPUT}    ${VALUES1_VALUE}
    Fill Text    ${SELECTOR_AUTOMATION_POINT_ST_EDIT_VALUES1_TEXT_INPUT}    ${VALUES1_TEXT}
    Check Checkbox    ${SELECTOR_AUTOMATION_POINT_ST_EDIT_VALUES1_DIALOG_CHKBX}

    ${SELECTOR_AUTOMATION_POINT_ST_EDIT_VALUES2_VALUE_INPUT}=    Set Variable
    ...    xpath=//input[@data-qa-id="automation-state-text-edit-values2-value"]
    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_ST_EDIT_VALUES2_VALUE_INPUT}    visible    timeout=2s
    Fill Text    ${SELECTOR_AUTOMATION_POINT_ST_EDIT_VALUES2_VALUE_INPUT}    ${VALUES2_VALUE}

    ${SELECTOR_AUTOMATION_POINT_ST_EDIT_VALUES2_TEXT_INPUT}=    Set Variable
    ...    xpath=//input[@data-qa-id="automation-state-text-edit-values2-text"]
    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_ST_EDIT_VALUES2_TEXT_INPUT}    visible    timeout=2s
    Fill Text    ${SELECTOR_AUTOMATION_POINT_ST_EDIT_VALUES2_TEXT_INPUT}    ${VALUES2_TEXT}

    ${SELECTOR_AUTOMATION_POINT_ST_EDIT_VALUES2_DIALOG_CHKBX}=    Set Variable
    ...    xpath=//input[@id="automation-state-text-edit-values2-dialog-input"]
    Check Checkbox    ${SELECTOR_AUTOMATION_POINT_ST_EDIT_VALUES2_DIALOG_CHKBX}

    Browser.Click    ${SELECTOR_AUTOMATION_POINT_ST_EDIT_VALUES2_ADD_BUTTON}

    ${SELECTOR_AUTOMATION_POINT_ST_EDIT_VALUES3_VALUE_INPUT}=    Set Variable
    ...    xpath=//input[@data-qa-id="automation-state-text-edit-values3-value"]
    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_ST_EDIT_VALUES3_VALUE_INPUT}    visible    timeout=2s
    Fill Text    ${SELECTOR_AUTOMATION_POINT_ST_EDIT_VALUES3_VALUE_INPUT}    ${VALUES3_VALUE}

    ${SELECTOR_AUTOMATION_POINT_ST_EDIT_VALUES3_TEXT_INPUT}=    Set Variable
    ...    xpath=//input[@data-qa-id="automation-state-text-edit-values3-text"]
    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_ST_EDIT_VALUES3_TEXT_INPUT}    visible    timeout=2s
    Fill Text    ${SELECTOR_AUTOMATION_POINT_ST_EDIT_VALUES3_TEXT_INPUT}    ${VALUES3_TEXT}

    ${SELECTOR_AUTOMATION_POINT_ST_EDIT_VALUES3_DIALOG_CHKBX}=    Set Variable
    ...    xpath=//input[@id="automation-state-text-edit-values3-dialog-input"]
    Check Checkbox    ${SELECTOR_AUTOMATION_POINT_ST_EDIT_VALUES3_DIALOG_CHKBX}

    ${SELECTOR_AUTOMATION_POINT_ST_EDIT_VALUES3_REMOVE_BUTTON}=    Set Variable
    ...    xpath=//button[@data-qa-id="automation-state-text-edit-values3-remove-button"]
    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_ST_EDIT_VALUES3_REMOVE_BUTTON}    visible    timeout=2s
    Browser.Click    ${SELECTOR_AUTOMATION_POINT_ST_EDIT_VALUES3_REMOVE_BUTTON}

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_ST_EDIT_VALUES3_VALUE_INPUT}    hidden    timeout=2s

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_ST_EDIT_SAVE_BUTTON}    visible    timeout=2s
    Browser.Click    ${SELECTOR_AUTOMATION_POINT_ST_EDIT_SAVE_BUTTON}

    Snack-bar Visibility And Content
