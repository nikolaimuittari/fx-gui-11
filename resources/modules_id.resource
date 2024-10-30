*** Settings ***
Library     Browser
Resource    navigate.resource
Resource    login.resource
Resource    point_locators.resource
Resource    device_locators.resource
Resource    global_variables.resource
Resource    automation_locators_id.resource
Resource    key_press.resource


*** Keywords ***
Add New Module Device
    [Arguments]
    ...    ${port_number}
    ...    ${address_number}
    ...    ${module_type}
    ...    ${tcp_module}
    ...    ${ip_address}
    ...    ${ip_port}
    ...    ${debug}
    ...    ${timeout}
    ...    ${mbus_id}
    ...    ${mbus_address}
    ...    ${mbus_use_secondary}
    ...    ${mbus_send_reset}

    # ${port_number}=    10
    # ${address_number}=    63

    # Go to automation
    # Go to automation modules

    Wait For Elements State    ${SELECTOR_AUTOMATION_TOOLBAR_ADD_NEW_BUTTON}    visible    timeout=2s
    Browser.Click    ${SELECTOR_AUTOMATION_TOOLBAR_ADD_NEW_BUTTON}

    # TODO: When GUI will be fixed, replace with "data-qa-id" locators:
    # ${port_item}=    Set Variable    xpath=//mat-option[@data-qa-id='automation-module-edit-port-optionNaN']
    # ${address_item}=    Set Variable    xpath=//mat-option[@data-qa-id='automation-module-edit-address-optionNaN']
    # ${register_type_item}=    Set Variable    xpath=//mat-option[@data-qa-id='automation-module-edit-address-optionNaN']

    # TODO replace start
    Wait For Elements State    ${SELECTOR_AUTOMATION_MODULE_EDIT_CONNECTION_PORT_SELECT}    visible    timeout=2s
    Browser.Click    ${SELECTOR_AUTOMATION_MODULE_EDIT_CONNECTION_PORT_SELECT}

    IF    ${port_number} == 0
        ${port_option}=    Set Variable    1
    ELSE
        ${port_option}=    Set Variable    ${port_number}
    END

    ${port_option_xpath}=    Set Variable
    ...    xpath=//mat-option[@data-qa-id="automation-module-edit-port-option${port_option}"]
    Wait For Elements State    ${port_option_xpath}    visible    timeout=2s
    Browser.Click    ${port_option_xpath}
    # Keyboard Key    press    ArrowDown
    # Keyboard Key    press    ArrowDown
    # Keyboard Key    press    Enter

    Wait For Elements State    ${SELECTOR_AUTOMATION_MODULE_EDIT_CONNECTION_ADDRESS_SELECT}    visible    timeout=2s
    Browser.Click    ${SELECTOR_AUTOMATION_MODULE_EDIT_CONNECTION_ADDRESS_SELECT}

    ${address_option_xpath}=    Set Variable
    ...    xpath=//mat-option[@data-qa-id="automation-module-edit-address-option${address_number}"]
    Wait For Elements State    ${address_option_xpath}    visible    timeout=2s
    Browser.Click    ${address_option_xpath}
    # Keyboard Key    press    ArrowDown
    # Keyboard Key    press    Enter

    Wait For Elements State    ${SELECTOR_AUTOMATION_MODULE_EDIT_MODULE_TYPE_SELECT}    visible    timeout=2s
    Browser.Click    ${SELECTOR_AUTOMATION_MODULE_EDIT_MODULE_TYPE_SELECT}
    # Keyboard Key    press    ArrowDown
    # Keyboard Key    press    ArrowDown
    # Keyboard Key    press    Enter

    # Module type
    #
    IF    $module_type.lower() == 'di'
        ${module_option_xpath}=    Set Variable
        ...    xpath=//mat-option[@data-qa-id="automation-module-edit-module-type-option2"]
        Wait For Elements State    ${module_option_xpath}    visible    timeout=2s
        Browser.Click    ${module_option_xpath}
    ELSE IF    $module_type.lower() == 'do'
        ${module_option_xpath}=    Set Variable
        ...    xpath=//mat-option[@data-qa-id="automation-module-edit-module-type-option3"]
        Wait For Elements State    ${module_option_xpath}    visible    timeout=2s
        Browser.Click    ${module_option_xpath}
    ELSE IF    $module_type.lower() == 'ai'
        ${module_option_xpath}=    Set Variable
        ...    xpath=//mat-option[@data-qa-id="automation-module-edit-module-type-option4"]
        Wait For Elements State    ${module_option_xpath}    visible    timeout=2s
        Browser.Click    ${module_option_xpath}
    ELSE IF    $module_type.lower() == 'ao'
        ${module_option_xpath}=    Set Variable
        ...    xpath=//mat-option[@data-qa-id="automation-module-edit-module-type-option5"]
        Wait For Elements State    ${module_option_xpath}    visible    timeout=2s
        Browser.Click    ${module_option_xpath}
    ELSE IF    $module_type.lower() == 'tc16'
        ${module_option_xpath}=    Set Variable
        ...    xpath=//mat-option[@data-qa-id="automation-module-edit-module-type-option6"]
        Wait For Elements State    ${module_option_xpath}    visible    timeout=2s
        Browser.Click    ${module_option_xpath}
    ELSE IF    $module_type.lower() == 'mbus'
        ${module_option_xpath}=    Set Variable
        ...    xpath=//mat-option[@data-qa-id="automation-module-edit-module-type-option7"]
        Wait For Elements State    ${module_option_xpath}    visible    timeout=2s
        Browser.Click    ${module_option_xpath}

        IF    '${mbus_id}' == ''
            ${rnd_mbus_id}=    Generate Random MBUS ID
            Fill Text    ${SELECTOR_AUTOMATION_MODULE_CREATE_MBUS_DEVICE_NUMBER_INPUT}    ${rnd_mbus_id}
        ELSE
            Fill Text    ${SELECTOR_AUTOMATION_MODULE_CREATE_MBUS_DEVICE_NUMBER_INPUT}    ${mbus_id}
        END

        IF    '${mbus_address}' == ''
            ${mbus_address}=    Evaluate    1
            Fill Text    ${SELECTOR_AUTOMATION_MODULE_CREATE_MBUS_ADDRESS_INPUT}    ${mbus_address}
        ELSE
            Fill Text    ${SELECTOR_AUTOMATION_MODULE_CREATE_MBUS_ADDRESS_INPUT}    ${mbus_address}
        END

        IF    $mbus_use_secondary.lower() == 'yes'
            Check Checkbox    ${SELECTOR_AUTOMATION_MODULE_CREATE_MBUS_USE_SECONDARY_CHKBX}
            Uncheck Checkbox    ${SELECTOR_AUTOMATION_MODULE_CREATE_MBUS_USE_SECONDARY_CHKBX}
            Check Checkbox    ${SELECTOR_AUTOMATION_MODULE_CREATE_MBUS_USE_SECONDARY_CHKBX}
        ELSE
            Check Checkbox    ${SELECTOR_AUTOMATION_MODULE_CREATE_MBUS_USE_SECONDARY_CHKBX}
            Uncheck Checkbox    ${SELECTOR_AUTOMATION_MODULE_CREATE_MBUS_USE_SECONDARY_CHKBX}
        END

        IF    $mbus_send_reset.lower() == 'yes'
            Check Checkbox    ${SELECTOR_AUTOMATION_MODULE_CREATE_MBUS_SEND_RESET_CHKBX}
            Uncheck Checkbox    ${SELECTOR_AUTOMATION_MODULE_CREATE_MBUS_SEND_RESET_CHKBX}
            Check Checkbox    ${SELECTOR_AUTOMATION_MODULE_CREATE_MBUS_SEND_RESET_CHKBX}
        ELSE
            Check Checkbox    ${SELECTOR_AUTOMATION_MODULE_CREATE_MBUS_SEND_RESET_CHKBX}
            Uncheck Checkbox    ${SELECTOR_AUTOMATION_MODULE_CREATE_MBUS_SEND_RESET_CHKBX}
        END
    ELSE IF    $module_type.lower() == 'spider'
        ${module_option_xpath}=    Set Variable
        ...    xpath=//mat-option[@data-qa-id="automation-module-edit-module-type-option8"]
        Wait For Elements State    ${module_option_xpath}    visible    timeout=2s
        Browser.Click    ${module_option_xpath}

        ${error_message}=    Set Variable
        ...    xpath=//div[contains(@class, "message_text") and contains(text(), "Error! Only addresses 1,7,13,19,25,31 are valid for SPIDER module")]

        ${error_message_text}=    Browser.Get Text    ${error_message}
        Log To Console    ${error_message_text}
        ${error_message_close_button}=    Run Keyword And Return Status
        ...    Wait For Elements State
        ...    ${SELECTOR_AUTOMATION_MODULE_CREATE_SPIDER_ERROR_CLOSE_BUTTON}
        ...    visible
        ...    timeout=2s
        IF    ${error_message_close_button}
            ${error_message}=    Set Variable
            ...    xpath=//div[contains(@class, "message_text") and contains(text(), "Error! Only addresses 1,7,13,19,25,31 are valid for SPIDER module")]
            ${error_message_text}=    Browser.Get Text    ${error_message}
            Log To Console    ${error_message_text}
            Browser.Click    ${SELECTOR_AUTOMATION_MODULE_CREATE_SPIDER_ERROR_CLOSE_BUTTON}
        END
    ELSE IF    $module_type.lower() == 'bootloader'
        ${module_option_xpath}=    Set Variable
        ...    xpath=//mat-option[@data-qa-id="automation-module-edit-module-type-option9"]
    ELSE IF    $module_type.lower() == 'multi24'
        ${module_option_xpath}=    Set Variable
        ...    xpath=//mat-option[@data-qa-id="automation-module-edit-module-type-option10"]
    ELSE IF    $module_type.lower() == 'multidisplay'
        ${module_option_xpath}=    Set Variable
        ...    xpath=//mat-option[@data-qa-id="automation-module-edit-module-type-option11"]
    ELSE
        ${module_option_xpath}=    Set Variable
        ...    xpath=//mat-option[@data-qa-id="automation-module-edit-module-type-option1"]
    END

    IF    $tcp_module.lower() == 'yes'
        Wait For Elements State    ${SELECTOR_AUTOMATION_MODULE_EDIT_TCP_UDP_MODULE_CHKBX}    visible    timeout=2s
        Check Checkbox    ${SELECTOR_AUTOMATION_MODULE_EDIT_TCP_UDP_MODULE_CHKBX}
        Uncheck Checkbox    ${SELECTOR_AUTOMATION_MODULE_EDIT_TCP_UDP_MODULE_CHKBX}
        Check Checkbox    ${SELECTOR_AUTOMATION_MODULE_EDIT_TCP_UDP_MODULE_CHKBX}

        Wait For Elements State
        ...    ${SELECTOR_AUTOMATION_MODULE_EDIT_TCP_UDP_MODULE_IP_ADDRESS_INPUT}
        ...    visible
        ...    timeout=2s

        IF    '${ip_address}' == ''
            ${rnd_ip_address}=    Generate Random IP Address
            Fill Text    ${SELECTOR_AUTOMATION_MODULE_EDIT_TCP_UDP_MODULE_IP_ADDRESS_INPUT}    ${rnd_ip_address}
        ELSE
            Fill Text    ${SELECTOR_AUTOMATION_MODULE_EDIT_TCP_UDP_MODULE_IP_ADDRESS_INPUT}    ${ip_address}
        END

        Wait For Elements State
        ...    ${SELECTOR_AUTOMATION_MODULE_EDIT_TCP_UDP_MODULE_IP_PORT_INPUT}
        ...    visible
        ...    timeout=2s

        IF    '${ip_port}' == ''
            ${rnd_ip_port}=    Generate Random IP Port
            Fill Text    ${SELECTOR_AUTOMATION_MODULE_EDIT_TCP_UDP_MODULE_IP_PORT_INPUT}    ${rnd_ip_port}
        ELSE
            Fill Text    ${SELECTOR_AUTOMATION_MODULE_EDIT_TCP_UDP_MODULE_IP_PORT_INPUT}    ${ip_port}
        END
    END

    Check Checkbox    ${SELECTOR_AUTOMATION_MODULE_EDIT_DEBUG_CHKBX}
    Uncheck Checkbox    ${SELECTOR_AUTOMATION_MODULE_EDIT_DEBUG_CHKBX}
    Check Checkbox    ${SELECTOR_AUTOMATION_MODULE_EDIT_DEBUG_CHKBX}

    Wait For Elements State    ${SELECTOR_AUTOMATION_MODULE_EDIT_TIMEOUT_INPUT}    visible    timeout=2s
    ${rnd_ip_port}=    Generate Random IP Port
    Fill Text    ${SELECTOR_AUTOMATION_MODULE_EDIT_TIMEOUT_INPUT}    ${rnd_ip_port}

    Wait For Elements State    ${SELECTOR_AUTOMATION_MODULE_EDIT_ADD_BUTTON}    visible    timeout=2s
    Browser.Click    ${SELECTOR_AUTOMATION_MODULE_EDIT_ADD_BUTTON}

    Snack-bar Visibility And Content

Find Module Devices
    # Go to automation
    # Go to automation modules

    Wait For Elements State    ${SELECTOR_AUTOMATION_MODULE_TOOLBAR_FIND_MODULES_BUTTON}
    Browser.Click    ${SELECTOR_AUTOMATION_MODULE_TOOLBAR_FIND_MODULES_BUTTON}

    Wait For Elements State
    ...    ${SELECTOR_AUTOMATION_MODULE_TOOLBAR_FIND_MODULES_DIALOG_CLOSE_BUTTON}
    ...    visible
    ...    timeout=2s
    Browser.Click    ${SELECTOR_AUTOMATION_MODULE_TOOLBAR_FIND_MODULES_DIALOG_CLOSE_BUTTON}

    Wait For Elements State    ${SELECTOR_AUTOMATION_MODULE_TOOLBAR_FIND_MODULES_BUTTON}
    Browser.Click    ${SELECTOR_AUTOMATION_MODULE_TOOLBAR_FIND_MODULES_BUTTON}

    Wait For Elements State
    ...    ${SELECTOR_AUTOMATION_MODULE_TOOLBAR_FIND_MODULES_DIALOG_CLOSE_BUTTON}
    ...    hidden
    ...    timeout=120s

Connections Module Devices
    [Arguments]    ${port}    ${module}

    # Go to automation
    # Go to automation modules
    Wait For Elements State    ${SELECTOR_AUTOMATION_MODULE_TOOLBAR_CONNECTIONS_BUTTON}    visible    timeout=2s
    Browser.Click    ${SELECTOR_AUTOMATION_MODULE_TOOLBAR_CONNECTIONS_BUTTON}

    # Wait For Elements State    ${SELECTOR_AUTOMATION_MODULE_DETAILS_DIALOG_PRINT_BUTTON}    visible    timeout=2s
    Wait For Elements State    ${SELECTOR_AUTOMATION_MODULE_DETAILS_DIALOG_CANCEL_BUTTON}    visible    timeout=2s
    Browser.Click    ${SELECTOR_AUTOMATION_MODULE_DETAILS_DIALOG_CANCEL_BUTTON}

    Wait For Elements State    ${SELECTOR_AUTOMATION_MODULE_TOOLBAR_CONNECTIONS_BUTTON}    visible    timeout=2s
    Browser.Click    ${SELECTOR_AUTOMATION_MODULE_TOOLBAR_CONNECTIONS_BUTTON}

    # Check if form contains port 3 module 1
    ${port_module_header}=    Set Variable
    ...    xpath=//div[contains(concat(' ', @class, ' '), ' connection-container ')][span[contains(text(), 'Port : ${port}')]][span[contains(text(), 'Module : ${module}')]]

    ${port_module_found}=    Run Keyword And Return Status
    ...    Wait For Elements State
    ...    ${port_module_header}
    ...    visible
    ...    timeout=2s

    IF    ${port_module_found}
        Log To Console    Found: Port ${port} | Module ${module}
    ELSE
        Log To Console    NOT found: Port ${port} | Module ${module}
    END

    Wait For Elements State    ${SELECTOR_AUTOMATION_MODULE_DETAILS_DIALOG_PRINT_BUTTON}    visible    timeout=2s
    Scroll To Element    ${SELECTOR_AUTOMATION_MODULE_DETAILS_DIALOG_PRINT_BUTTON}
    Browser.Click    ${SELECTOR_AUTOMATION_MODULE_DETAILS_DIALOG_PRINT_BUTTON}
    Keyboard Key    press    Escape

Clear Errors Module Devices
    # Go to automation
    # Go to automation modules

    Wait For Elements State    ${SELECTOR_AUTOMATION_MODULE_TOOLBAR_CLEAR_ERRORS_BUTTON}    visible    timeout=2s
    Browser.Click    ${SELECTOR_AUTOMATION_MODULE_TOOLBAR_CLEAR_ERRORS_BUTTON}
    Snack-bar Visibility And Content

Update Software Module Devices
    [Arguments]    ${port_number}    ${address_number}    ${version_number}
    # Go to automation
    # Go to automation modules

    Wait For Elements State    ${SELECTOR_AUTOMATION_MODULE_TOOLBAR_CONNECTIONS_BUTTON}    visible    timeout=2s

    ${full_string}=    Set Variable    xpath=//tr[.//td[1]='${port_number}' and .//td[2]='${address_number}']
    ${attribute_value}=    Get Attribute    ${full_string}    data-qa-id
    Log To Console    DATA-QA_ID: ${attribute_value}

    ${version_cell}=    Set Variable    xpath=//div[@data-qa-id='${attribute_value}-version']
    ${version_text}=    Browser.Get Text    ${version_cell}
    ${modified_string}=    Replace CR LF with Pipe    ${version_text}
    Log To Console    version: ${modified_string}

    ${status_cell}=    Set Variable    xpath=//tr[@data-qa-id='${attribute_value}']//td[6]
    ${status_text}=    Browser.Get Text    ${status_cell}
    ${modified_string}=    Replace CR LF with Pipe    ${status_text}
    Log To Console    status: ${modified_string}

    # ${full_string}=    Set Variable    xpath=//tr[.//td[text()='${port_number}'] and .//td[text()='${address_number}']]

    ${table_line_visible}=    Run Keyword And Return Status
    ...    Wait For Elements State
    ...    ${full_string}
    ...    visible
    ...    timeout=1s
    Browser.Click    ${full_string}

    ${line_text}=    Browser.Get Text    ${full_string}
    ${modified_string}=    Replace CR LF with Pipe    ${line_text}
    Log To Console    row text: ${modified_string}

    ${table_xpath}=    Set Variable    xpath=//table[@class='automation-table striped ng-star-inserted']
    # //div[@class='automation-table-frame']
    # xpath=//table[@class='automation-table striped ng-star-inserted']
    # ${row_1_cell_1} =    Get Table Cell Element    ${table_xpath}    0    1
    # ${row_1_cell_1_text} =    Browser.Get Text    ${row_1_cell_1}
    # ${idx1}=    Get Table Row Index    ${table_xpath}
    # ${idx2}=    Get Table Row Index    ${table_xpath} >> "TC16"
    # ${idx3}=    Get Table Row Index    ${table_xpath} >> "1"
    # ${idx}=    Get Table Cell Index    ${table_xpath} >> "TC16"
    # Log To Console    Row 1 Cell 1 text: ${row_1_cell_1_text}
    # Log To Console    AO : ${idx1}
    # Log To Console    TC16 : ${idx2}
    # Log To Console    AO : ${idx3}
    # Log To Console    5: ${idx}
    Wait For Elements State    ${version_cell}    visible    timeout=2s
    Browser.Click    ${version_cell}
    Wait For Elements State    ${SELECTOR_AUTOMATION_MODULE_VERSION_DIALOG_CANCEL_BUTTON}    visible    timeout=2s
    Wait For Elements State    ${SELECTOR_AUTOMATION_MODULE_VERSION_DIALOG_VERSION_LIST}    visible    timeout=2s
    ${version_list}=    Browser.GetText    ${SELECTOR_AUTOMATION_MODULE_VERSION_DIALOG_VERSION_LIST}
    Log To Console    Version list: ${version_list}

    Browser.Click    ${SELECTOR_AUTOMATION_MODULE_VERSION_DIALOG_VERSION_LIST}

    Wait For Elements State    ${SELECTOR_AUTOMATION_MODULE_VERSION_DIALOG_CHOOSE_BUTTON}    visible    timeout=2s
    Browser.Click    ${SELECTOR_AUTOMATION_MODULE_VERSION_DIALOG_CHOOSE_BUTTON}
    Wait For Elements State    ${SELECTOR_AUTOMATION_MODULE_VERSION_DIALOG_CHOOSE_BUTTON}    hidden    timeout=2s

    ${version_text}=    Browser.Get Text    ${version_cell}
    Log To Console    Selected version: ${version_text}
    Wait For Elements State    ${SELECTOR_AUTOMATION_MODULE_VERSION_PROGRAM_BUTTON}    visible    timeout=2s

    Browser.Click    ${SELECTOR_AUTOMATION_MODULE_VERSION_PROGRAM_BUTTON}
    Wait For Elements State    ${SELECTOR_AUTOMATION_MODULE_VERSION_PROGRAM_CANCEL_BUTTON}    visible    timeout=2s

    Wait For Elements State    ${SELECTOR_AUTOMATION_MODULE_VERSION_PROGRAM_DIALOG_ROW_1}    visible    timeout=2s
    ${version_program_text}=    Browser.Get Text    ${SELECTOR_AUTOMATION_MODULE_VERSION_PROGRAM_DIALOG_ROW_1}
    ${modified_string}=    Replace CR LF with Pipe    ${version_program_text}
    Log To Console    Version to program : ${modified_string}

    Check Checkbox    ${SELECTOR_AUTOMATION_MODULE_VERSION_PROGRAM_DIALOG_ROW_1_CHKBX}
    Uncheck Checkbox    ${SELECTOR_AUTOMATION_MODULE_VERSION_PROGRAM_DIALOG_ROW_1_CHKBX}
    Check Checkbox    ${SELECTOR_AUTOMATION_MODULE_VERSION_PROGRAM_DIALOG_ROW_1_CHKBX}

    Wait For Elements State    ${SELECTOR_AUTOMATION_MODULE_VERSION_PROGRAM_PROGRAM_BUTTON}    visible    timeout=2s
    Browser.Click    ${SELECTOR_AUTOMATION_MODULE_VERSION_PROGRAM_PROGRAM_BUTTON}
    Wait For Elements State    ${SELECTOR_AUTOMATION_MODULE_VERSION_PROGRAM_CLOSE_BUTTON}    visible    timeout=2s

    ${version_program_text}=    Browser.Get Text    ${SELECTOR_AUTOMATION_MODULE_VERSION_PROGRAM_DIALOG_ROW_1}
    ${modified_string}=    Replace CR LF with Pipe    ${version_program_text}
    Log To Console    Version started to program : ${modified_string}

    Browser.Click    ${SELECTOR_AUTOMATION_MODULE_VERSION_PROGRAM_CLOSE_BUTTON}
    Wait For Elements State    ${SELECTOR_AUTOMATION_MODULE_VERSION_PROGRAM_CANCEL_BUTTON}    hidden    timeout=2s

Delete Module Device
    [Arguments]    ${port_number}    ${address_number}
    # Go to automation
    # Go to automation modules

    Wait For Elements State    ${selector_module_create_form_port_header}    visible    timeout=2s

    # ${full_string}=    Set Variable    xpath=//table[@class='automation-table striped ng-star-inserted']/tbody/tr[td[1]='${port_number}' and td[2]='${address_number}']
    ${full_string}=    Set Variable    xpath=//tr[.//td[text()='${port_number}'] and .//td[text()='${address_number}']]

    ${module_exists}=    Run Keyword And Return Status
    ...    Wait For Elements State
    ...    ${full_string}
    ...    visible
    ...    timeout=2s

    IF    ${module_exists}
        Browser.Click    ${full_string}
        Browser.Click    ${selector_devices_module_remove_btn}

        Wait For Elements State    ${selector_automation_delete_form}    visible    timeout=2s
        Browser.Click    ${selector_automation_delete_form_delete_button}

        Snack-bar Visibility And Content
    ELSE
        Log To Console    Module Device does not in the table. Cannot remove.
    END

    # Browser.Click    ${full_string}
    # Browser.Click    ${selector_devices_module_remove_btn}

    # Wait For Elements State    ${selector_automation_delete_form}    visible    timeout=2s
    # Browser.Click    ${selector_automation_delete_form_delete_button}

    # Snack-bar Visibility And Content

    # ${snack-bar_visible}=    Run Keyword And Return Status
    # ...    Wait For Elements State
    # ...    xpath=//div[contains(@class, "mat-simple-snackbar")]
    # ...    visible
    # ...    timeout=5s
    # Sleep    ${SLEEP_TIME}
    # IF    ${snack-bar_visible}
    #    Log To Console    Module Device removed. Snack-bar visible
    # ELSE
    #    Log To Console    Module Device removed. Snack-bar not visible
    # END
