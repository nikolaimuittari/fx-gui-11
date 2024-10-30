*** Settings ***
Library     Browser
Resource    navigate.resource
Resource    login.resource
Resource    point_locators.resource
Resource    device_locators.resource
Resource    global_variables.resource
Resource    automation_locators_id.resource


*** Keywords ***
Add New Modbus Device
    [Arguments]
    ...    ${port_number}
    ...    ${address_number}
    ...    ${bus_address}
    ...    ${register_type}
    ...    ${register_start}
    ...    ${register_number}
    ...    ${tcp_module}
    ...    ${ip_address}
    ...    ${ip_port}
    ...    ${debug}
    ...    ${sendonly}
    ...    ${timeout}

    # ${port_number}=    10
    # ${address_number}=    63

    # Go to automation
    # Go to automation modbus devices

    Wait For Elements State    ${SELECTOR_AUTOMATION_TOOLBAR_ADD_NEW_BUTTON}    visible    timeout=2s
    Browser.Click    ${SELECTOR_AUTOMATION_TOOLBAR_ADD_NEW_BUTTON}
    Wait For Elements State    ${SELECTOR_AUTOMATION_MODBUS_DEVICE_EDIT_CANCEL_BUTTON}    visible    timeout=2s

    Wait For Elements State    ${SELECTOR_AUTOMATION_MODBUS_DEVICE_EDIT_PORT_SELECT}    visible    timeout=2s

    # TO DO
    #    When GUI will be fixed, replace with "data-qa-id" locators:
    #    ${port_number_option}=    Set Variable    xpath=//mat-option[@data-qa-id='automation-modbus-device-edit-port-optionNaN']
    #    ${register_type_option}=    Set Variable    xpath=//mat-option[@data-qa-id='automation-modbus-device-edit-register-type-optionNaN']

    # TODO replace start
    Wait For Elements State    ${SELECTOR_AUTOMATION_MODBUS_DEVICE_EDIT_PORT_SELECT}    visible    timeout=2s
    Browser.Click    ${SELECTOR_AUTOMATION_MODBUS_DEVICE_EDIT_PORT_SELECT}

    Keyboard Key    press    ArrowDown
    Keyboard Key    press    ArrowDown
    Keyboard Key    press    Enter

    Wait For Elements State    ${SELECTOR_AUTOMATION_MODBUS_DEVICE_EDIT_REGISTER_TYPE_SELECT}    visible    timeout=2s
    Browser.Click    ${SELECTOR_AUTOMATION_MODBUS_DEVICE_EDIT_REGISTER_TYPE_SELECT}
    Keyboard Key    press    ArrowDown
    Keyboard Key    press    ArrowDown
    Keyboard Key    press    Enter
    # TODO replace end

    Wait For Elements State    ${SELECTOR_AUTOMATION_MODBUS_DEVICE_EDIT_ADDRESS_INPUT}    visible    timeout=2s
    Fill Text    ${SELECTOR_AUTOMATION_MODBUS_DEVICE_EDIT_ADDRESS_INPUT}    ${address_number}

    Wait For Elements State    ${SELECTOR_AUTOMATION_MODBUS_DEVICE_EDIT_BUS_ADDRESS_INPUT}    visible    timeout=2s
    Fill Text    ${SELECTOR_AUTOMATION_MODBUS_DEVICE_EDIT_BUS_ADDRESS_INPUT}    ${bus_address}
    Fill Text    ${SELECTOR_AUTOMATION_MODBUS_DEVICE_EDIT_START_REGISTER_INPUT}    ${register_start}
    Fill Text    ${SELECTOR_AUTOMATION_MODBUS_DEVICE_EDIT_REGISTER_COUNT_INPUT}    ${register_number}

    Check Checkbox    ${SELECTOR_AUTOMATION_MODBUS_DEVICE_EDIT_DEBUG_CHKBX}
    Uncheck Checkbox    ${SELECTOR_AUTOMATION_MODBUS_DEVICE_EDIT_DEBUG_CHKBX}
    Check Checkbox    ${SELECTOR_AUTOMATION_MODBUS_DEVICE_EDIT_DEBUG_CHKBX}

    Check Checkbox    ${SELECTOR_AUTOMATION_MODBUS_DEVICE_EDIT_TCP_IP_MODULE_CHKBX}
    Uncheck Checkbox    ${SELECTOR_AUTOMATION_MODBUS_DEVICE_EDIT_TCP_IP_MODULE_CHKBX}
    Check Checkbox    ${SELECTOR_AUTOMATION_MODBUS_DEVICE_EDIT_TCP_IP_MODULE_CHKBX}

    ${rnd_ip_port}=    Generate Random IP Port
    Wait For Elements State    ${SELECTOR_AUTOMATION_MODBUS_DEVICE_EDIT_IP_PORT_INPUT}    visible    timeout=2s
    Fill Text    ${SELECTOR_AUTOMATION_MODBUS_DEVICE_EDIT_IP_PORT_INPUT}    ${rnd_ip_port}
    ${rnd_ip_address}=    Generate Random IP Address
    Wait For Elements State    ${SELECTOR_AUTOMATION_MODBUS_DEVICE_EDIT_IP_ADDRESS_INPUT}    visible    timeout=2s
    Fill Text    ${SELECTOR_AUTOMATION_MODBUS_DEVICE_EDIT_IP_ADDRESS_INPUT}    ${rnd_ip_address}

    Check Checkbox    ${SELECTOR_AUTOMATION_MODBUS_DEVICE_EDIT_SEND_ONLY_CHKBX}
    Uncheck Checkbox    ${SELECTOR_AUTOMATION_MODBUS_DEVICE_EDIT_SEND_ONLY_CHKBX}
    Check Checkbox    ${SELECTOR_AUTOMATION_MODBUS_DEVICE_EDIT_SEND_ONLY_CHKBX}

    Fill Text    ${SELECTOR_AUTOMATION_MODBUS_DEVICE_EDIT_TIMEOUT_INPUT}    ${timeout}

    Wait For Elements State    ${SELECTOR_AUTOMATION_MODBUS_DEVICE_EDIT_ADD_BUTTON}    visible    timeout=2s
    Browser.Click    ${SELECTOR_AUTOMATION_MODBUS_DEVICE_EDIT_ADD_BUTTON}
    Snack-bar Visibility And Content

Delete Modbus Device
    [Arguments]    ${port_number}    ${address_number}
    # Go to automation
    # Go to automation modbus devices

    Wait For Elements State    ${SELECTOR_AUTOMATION_TOOLBAR_DELETE_BUTTON}    visible    timeout=2s
    ${full_string}=    Set Variable    xpath=//tr[.//td[text()='${port_number}'] and .//td[text()='${address_number}']]
    Wait For Elements State    ${full_string}    visible    timeout=2s
    Browser.Click    ${full_string}
    Browser.Click    ${SELECTOR_AUTOMATION_TOOLBAR_DELETE_BUTTON}
    Wait For Elements State    ${SELECTOR_CONFIRM_DIALOG_CONFIRM_BUTTON}    visible    timeout=2s
    Browser.Click    ${SELECTOR_CONFIRM_DIALOG_CONFIRM_BUTTON}
    Wait For Elements State    ${SELECTOR_CONFIRM_DIALOG_CONFIRM_BUTTON}    hidden    timeout=2s
    Wait For Elements State    ${full_string}    hidden    timeout=2s

    Snack-bar Visibility And Content

Edit Modbus Device
    [Arguments]
    ...    ${port_number}
    ...    ${address_number}
    ...    ${new_port_number}
    ...    ${new_address_number}
    ...    ${bus_address}
    ...    ${register_type}
    ...    ${register_start}
    ...    ${register_number}
    ...    ${tcp_module}
    ...    ${ip_address}
    ...    ${ip_port}
    ...    ${debug}
    ...    ${sendonly}
    ...    ${timeout}

    # ${port_number}=    10
    # ${address_number}=    63

    # Go to automation
    # Go to automation modbus devices

    ${full_string}=    Set Variable    xpath=//tr[.//td[text()='${port_number}'] and .//td[text()='${address_number}']]
    Wait For Elements State    ${full_string}    visible    timeout=2s
    Browser.Click    ${full_string}

    Wait For Elements State    ${SELECTOR_AUTOMATION_TOOLBAR_EDIT_BUTTON}    visible    timeout=2s
    Browser.Click    ${SELECTOR_AUTOMATION_TOOLBAR_EDIT_BUTTON}
    Wait For Elements State    ${SELECTOR_AUTOMATION_MODBUS_DEVICE_EDIT_CANCEL_BUTTON}    visible    timeout=2s

    Wait For Elements State    ${SELECTOR_AUTOMATION_MODBUS_DEVICE_EDIT_PORT_SELECT}    visible    timeout=2s

    # TO DO
    #    When GUI will be fixed, replace with "data-qa-id" locators:
    #    ${port_number_option}=    Set Variable    xpath=//mat-option[@data-qa-id='automation-modbus-device-edit-port-optionNaN']
    #    ${register_type_option}=    Set Variable    xpath=//mat-option[@data-qa-id='automation-modbus-device-edit-register-type-optionNaN']

    # TODO replace start
    Wait For Elements State    ${SELECTOR_AUTOMATION_MODBUS_DEVICE_EDIT_PORT_SELECT}    visible    timeout=2s
    Browser.Click    ${SELECTOR_AUTOMATION_MODBUS_DEVICE_EDIT_PORT_SELECT}

    Keyboard Key    press    ArrowDown
    Keyboard Key    press    ArrowDown
    Keyboard Key    press    Enter

    Wait For Elements State    ${SELECTOR_AUTOMATION_MODBUS_DEVICE_EDIT_REGISTER_TYPE_SELECT}    visible    timeout=2s
    Browser.Click    ${SELECTOR_AUTOMATION_MODBUS_DEVICE_EDIT_REGISTER_TYPE_SELECT}
    Keyboard Key    press    ArrowDown
    Keyboard Key    press    ArrowDown
    Keyboard Key    press    Enter
    # TODO replace end

    Wait For Elements State    ${SELECTOR_AUTOMATION_MODBUS_DEVICE_EDIT_ADDRESS_INPUT}    visible    timeout=2s
    Fill Text    ${SELECTOR_AUTOMATION_MODBUS_DEVICE_EDIT_ADDRESS_INPUT}    ${address_number}

    Wait For Elements State    ${SELECTOR_AUTOMATION_MODBUS_DEVICE_EDIT_BUS_ADDRESS_INPUT}    visible    timeout=2s
    Fill Text    ${SELECTOR_AUTOMATION_MODBUS_DEVICE_EDIT_BUS_ADDRESS_INPUT}    ${bus_address}
    Fill Text    ${SELECTOR_AUTOMATION_MODBUS_DEVICE_EDIT_START_REGISTER_INPUT}    ${register_start}
    Fill Text    ${SELECTOR_AUTOMATION_MODBUS_DEVICE_EDIT_REGISTER_COUNT_INPUT}    ${register_number}

    Check Checkbox    ${SELECTOR_AUTOMATION_MODBUS_DEVICE_EDIT_DEBUG_CHKBX}
    Uncheck Checkbox    ${SELECTOR_AUTOMATION_MODBUS_DEVICE_EDIT_DEBUG_CHKBX}
    Check Checkbox    ${SELECTOR_AUTOMATION_MODBUS_DEVICE_EDIT_DEBUG_CHKBX}

    Check Checkbox    ${SELECTOR_AUTOMATION_MODBUS_DEVICE_EDIT_TCP_IP_MODULE_CHKBX}
    Uncheck Checkbox    ${SELECTOR_AUTOMATION_MODBUS_DEVICE_EDIT_TCP_IP_MODULE_CHKBX}
    Check Checkbox    ${SELECTOR_AUTOMATION_MODBUS_DEVICE_EDIT_TCP_IP_MODULE_CHKBX}

    ${rnd_ip_port}=    Generate Random IP Port
    Wait For Elements State    ${SELECTOR_AUTOMATION_MODBUS_DEVICE_EDIT_IP_PORT_INPUT}    visible    timeout=2s
    Fill Text    ${SELECTOR_AUTOMATION_MODBUS_DEVICE_EDIT_IP_PORT_INPUT}    ${rnd_ip_port}
    ${rnd_ip_address}=    Generate Random IP Address
    Wait For Elements State    ${SELECTOR_AUTOMATION_MODBUS_DEVICE_EDIT_IP_ADDRESS_INPUT}    visible    timeout=2s
    Fill Text    ${SELECTOR_AUTOMATION_MODBUS_DEVICE_EDIT_IP_ADDRESS_INPUT}    ${rnd_ip_address}

    Check Checkbox    ${SELECTOR_AUTOMATION_MODBUS_DEVICE_EDIT_SEND_ONLY_CHKBX}
    Uncheck Checkbox    ${SELECTOR_AUTOMATION_MODBUS_DEVICE_EDIT_SEND_ONLY_CHKBX}
    Check Checkbox    ${SELECTOR_AUTOMATION_MODBUS_DEVICE_EDIT_SEND_ONLY_CHKBX}

    Fill Text    ${SELECTOR_AUTOMATION_MODBUS_DEVICE_EDIT_TIMEOUT_INPUT}    ${timeout}

    Wait For Elements State    ${SELECTOR_AUTOMATION_MODBUS_DEVICE_EDIT_SAVE_BUTTON}    visible    timeout=2s
    Browser.Click    ${SELECTOR_AUTOMATION_MODBUS_DEVICE_EDIT_SAVE_BUTTON}
    Snack-bar Visibility And Content

Clear Errors Modbus Devices
    # Go to automation
    # Go to automation modbus devices

    Wait For Elements State    ${SELECTOR_AUTOMATION_MODULE_TOOLBAR_CLEAR_ERRORS_BUTTON}    visible    timeout=2s
    Browser.Click    ${SELECTOR_AUTOMATION_MODULE_TOOLBAR_CLEAR_ERRORS_BUTTON}
    Snack-bar Visibility And Content
