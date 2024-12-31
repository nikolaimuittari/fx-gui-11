*** Settings ***
Library     Browser
Resource    navigate.resource
Resource    login.resource
Resource    point_locators.resource
Resource    global_variables.resource


### IMPORTANT NOTE ###
### OBSOLETE from version 20.0.63 ###

*** Keywords ***
Add New Alarm Help
    [Arguments]    ${point_name}

    Browser.Click    ${selector_automation_addnew}
    Wait For Elements State    ${selector_point_create_new_form}    visible    timeout=2s

    Fill Text    ${selector_AH_create_form_name_input}    ${point_name}

    Browser.Click    ${selector_AH_create_form_text_btn}
    Browser.Click    ${selector_AH_create_form_picture_btn}
    Browser.Click    ${selector_AH_create_form_text_btn}

    Fill Text    ${selector_AH_create_form_text_text}    Help text for alarm group !

    # Add button
    Wait For Elements State    ${selector_AH_create_form_add_btn}    visible    timeout=2s
    Browser.Click    ${selector_AH_create_form_add_btn}

    ${snack-bar_visible}=    Run Keyword And Return Status
    ...    Wait For Elements State
    ...    xpath=//div[contains(@class, "mat-simple-snackbar")]
    ...    visible
    ...    timeout=5s

    IF    ${snack-bar_visible}
        Log To Console    AH created. Snack-bar visible
    ELSE
        Log To Console    AH created. Snack-bar not visible
    END

Delete Alarm Help
    [Arguments]    ${point_name}

    Wait For Elements State    ${selector_point_list_pointname_header}    visible    timeout=5s

    ${full_string}=    Set Variable    xpath= //td[@class='point-name'][contains(text(), "${point_name}")]
    Browser.Click    ${full_string}
    Browser.Click    ${selector_automation_remove}

    Wait For Elements State    ${selector_automation_delete_form}    visible    timeout=5s
    Browser.Click    ${selector_automation_delete_form_delete_button}

    ${snack-bar_visible}=    Run Keyword And Return Status
    ...    Wait For Elements State
    ...    xpath=//div[contains(@class, "mat-simple-snackbar")]
    ...    visible
    ...    timeout=5s
    IF    ${snack-bar_visible}
        Log To Console    AH removed. Snack-bar visible
    ELSE
        Log To Console    AH removed. Snack-bar not visible
    END
