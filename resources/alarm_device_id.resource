*** Settings ***
Library     Browser
Library     RPA.Browser.Selenium
Resource    navigate.resource
Resource    login.resource
Resource    point_locators.resource
Resource    global_variables.resource
Resource    automation_locators_id.resource


*** Keywords ***
Add Alarm Device
    [Arguments]    ${device_name}    ${device_type}

    # Go to automation
    # Go to automation alarm devices

    Wait For Elements State    ${SELECTOR_AUTOMATION_TOOLBAR_ADD_NEW_BUTTON}    visible    timeout=2s
    Browser.Click    ${SELECTOR_AUTOMATION_TOOLBAR_ADD_NEW_BUTTON}

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_NAME_INPUT}    visible    timeout=2s
    Fill Text    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_NAME_INPUT}    ${device_name}

    IF    $device_type.lower() != "do"
        Check Checkbox    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_EVENTS_STATE0_CHKBX}
        Check Checkbox    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_EVENTS_STATE1_CHKBX}
        Check Checkbox    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_EVENTS_STATE2_CHKBX}
        Check Checkbox    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_EVENTS_STATE3_CHKBX}
        Check Checkbox    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_EVENTS_STATE4_CHKBX}
        Check Checkbox    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_EVENTS_STATE5_CHKBX}
        Check Checkbox    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_EVENTS_STATE6_CHKBX}
        Check Checkbox    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_EVENTS_STATE7_CHKBX}
        Check Checkbox    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_EVENTS_STATE8_CHKBX}
        Check Checkbox    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_EVENTS_STATE9_CHKBX}
        Check Checkbox    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_EVENTS_STATE10_CHKBX}
        Check Checkbox    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_EVENTS_STATE11_CHKBX}

        Check Checkbox    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_EVENTS_ACKNOWLEDGE_CHKBX}
        Check Checkbox    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_EVENTS_LOCK_STATE_CHKBX}

        Uncheck Checkbox    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_EVENTS_STATE0_CHKBX}
        Uncheck Checkbox    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_EVENTS_STATE1_CHKBX}
        Uncheck Checkbox    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_EVENTS_STATE2_CHKBX}
        Uncheck Checkbox    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_EVENTS_STATE3_CHKBX}
        Uncheck Checkbox    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_EVENTS_STATE4_CHKBX}
        Uncheck Checkbox    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_EVENTS_STATE5_CHKBX}
        Uncheck Checkbox    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_EVENTS_STATE6_CHKBX}
        Uncheck Checkbox    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_EVENTS_STATE7_CHKBX}
        Uncheck Checkbox    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_EVENTS_STATE8_CHKBX}
        Uncheck Checkbox    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_EVENTS_STATE9_CHKBX}
        Uncheck Checkbox    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_EVENTS_STATE10_CHKBX}
        Uncheck Checkbox    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_EVENTS_STATE11_CHKBX}

        Uncheck Checkbox    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_EVENTS_ACKNOWLEDGE_CHKBX}
        Uncheck Checkbox    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_EVENTS_LOCK_STATE_CHKBX}

        Check Checkbox    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_EVENTS_STATE0_CHKBX}
        Check Checkbox    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_EVENTS_STATE1_CHKBX}
        Check Checkbox    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_EVENTS_STATE2_CHKBX}
        Check Checkbox    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_EVENTS_STATE3_CHKBX}
        Check Checkbox    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_EVENTS_STATE4_CHKBX}
        Check Checkbox    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_EVENTS_STATE5_CHKBX}
        Check Checkbox    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_EVENTS_STATE6_CHKBX}
        Check Checkbox    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_EVENTS_STATE7_CHKBX}
        Check Checkbox    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_EVENTS_STATE8_CHKBX}
        Check Checkbox    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_EVENTS_STATE9_CHKBX}
        Check Checkbox    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_EVENTS_STATE10_CHKBX}
        Check Checkbox    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_EVENTS_STATE11_CHKBX}

        Check Checkbox    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_EVENTS_ACKNOWLEDGE_CHKBX}
        Check Checkbox    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_EVENTS_LOCK_STATE_CHKBX}
    END

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_DEVICE_TYPE_SELECT}    visible    timeout=2s
    Browser.Click    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_DEVICE_TYPE_SELECT}
    IF    $device_type.lower() == 'webservice'
        Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_DEVICE_TYPE_OPTION6}    visible    timeout=2s
        Browser.Click    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_DEVICE_TYPE_OPTION6}

        Wait For Elements State
        ...    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_WEB_SERVICE_TYPE_SELECT}
        ...    visible
        ...    timeout=2s
        Browser.Click    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_WEB_SERVICE_TYPE_SELECT}

        Wait For Elements State
        ...    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_WEB_SERVICE_TYPE_OPTION1}
        ...    visible
        ...    timeout=2s
        Browser.Click    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_WEB_SERVICE_TYPE_OPTION1}

        Wait For Elements State
        ...    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_WEB_SERVICE_ADDRESS_INPUT}
        ...    visible
        ...    timeout=2s
        ${address_ip}=    Generate Random IP Address
        Fill Text    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_WEB_SERVICE_ADDRESS_INPUT}    ${address_ip}
        Clear Text    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_WEB_SERVICE_ADDRESS_INPUT}

        ${address_http}=    Generate Random Web Address    2
        Fill Text    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_WEB_SERVICE_ADDRESS_INPUT}    ${address_http}
        Clear Text    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_WEB_SERVICE_ADDRESS_INPUT}

        ${address_https}=    Generate Random Web Address    1
        Fill Text    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_WEB_SERVICE_ADDRESS_INPUT}    ${address_https}
        Clear Text    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_WEB_SERVICE_ADDRESS_INPUT}

        ${address_www}=    Generate Random Web Address    3
        Fill Text    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_WEB_SERVICE_ADDRESS_INPUT}    ${address_www}

        Wait For Elements State
        ...    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_WEB_SERVICE_SYSTEM_ID_INPUT}
        ...    visible
        ...    timeout=2s
        ${ip_port}=    Generate Random IP Port
        Fill Text    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_WEB_SERVICE_SYSTEM_ID_INPUT}    ${ip_port}

        Wait For Elements State
        ...    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_WEB_SERVICE_PASSWORD_INPUT}
        ...    visible
        ...    timeout=2s
        ${password}=    Generate Random String    12
        Fill Text    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_WEB_SERVICE_PASSWORD_INPUT}    ${password}

        Wait For Elements State
        ...    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_WEB_SERVICE_ORGANIZATION_ID_INPUT}
        ...    visible
        ...    timeout=2s
        Fill Text    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_WEB_SERVICE_ORGANIZATION_ID_INPUT}    ${ip_port}
    ELSE IF    $device_type.lower() == 'sms'
        Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_DEVICE_TYPE_OPTION2}    visible    timeout=2s
        Browser.Click    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_DEVICE_TYPE_OPTION2}

        ${ip_address}=    Generate Random IP Address
        Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_SMS_IP_ADDRESS_INPUT}    visible    timeout=2s
        Fill Text    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_SMS_IP_ADDRESS_INPUT}    ${ip_address}

        ${ip_port}=    Generate Random IP Port
        Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_SMS_IP_PORT_INPUT}
        Fill Text    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_SMS_IP_PORT_INPUT}    ${ip_port}

        ${phone_number}=    Generate Random Finnish Phone Number International
        Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_SMS_PHONE_NUMBER_INPUT}    visible    timeout=2s
        Fill Text    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_SMS_PHONE_NUMBER_INPUT}    ${phone_number}

        ${phone_number}=    Generate Random Finnish Phone Number International
        Wait For Elements State
        ...    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_SMS_BACKUP_NUMBER1_INPUT}
        ...    visible
        ...    timeout=2s
        Fill Text    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_SMS_BACKUP_NUMBER1_INPUT}    ${phone_number}

        ${phone_number}=    Generate Random Finnish Phone Number Local
        Wait For Elements State
        ...    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_SMS_BACKUP_NUMBER2_INPUT}
        ...    visible
        ...    timeout=2s
        Fill Text    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_SMS_BACKUP_NUMBER2_INPUT}    ${phone_number}

        ${phone_number}=    Generate Random Finnish Phone Number Local
        Wait For Elements State
        ...    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_SMS_BACKUP_NUMBER3_INPUT}
        ...    visible
        ...    timeout=2s
        Fill Text    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_SMS_BACKUP_NUMBER3_INPUT}    ${phone_number}

        ${phone_number}=    Generate Random Finnish Phone Number International
        Wait For Elements State
        ...    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_SMS_BACKUP_NUMBER4_INPUT}
        ...    visible
        ...    timeout=2s
        Fill Text    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_SMS_BACKUP_NUMBER4_INPUT}    ${phone_number}

        Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_TEMPLATE_SELECT}    visible    timeout=2s
        Browser.Click    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_TEMPLATE_SELECT}
        ${template_file_xpath}=    Set Variable
        ...    xpath=//mat-option[@data-qa-id='automation-alarm-device-edit-template-option2']

        Wait For Elements State    ${template_file_xpath}    visible    timeout=2s
        Browser.Click    ${template_file_xpath}

        FOR    ${counter}    IN RANGE    2    11
            Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_TEMPLATE_SELECT}    visible    timeout=2s
            Browser.Click    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_TEMPLATE_SELECT}

            ${template_file_xpath}=    Set Variable
            ...    xpath=//mat-option[@data-qa-id='automation-alarm-device-edit-template-option${counter}']
            Wait For Elements State    ${template_file_xpath}    visible    timeout=2s
            Browser.Click    ${template_file_xpath}
        END
    ELSE IF    $device_type.lower() == 'do'
        Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_DEVICE_TYPE_OPTION3}    visible    timeout=2s
        Browser.Click    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_DEVICE_TYPE_OPTION3}

        Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_DO_POINT_NAME_INPUT}    visible    timeout=2s
        ${do_pointname}=    Generate Random Point Name    DO    DO    _
        Fill Text    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_DO_POINT_NAME_INPUT}    ${do_pointname}

        Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_DO_MODE_UNACKNOWLEDGED}    visible    timeout=2s
        Browser.Click    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_DO_MODE_UNACKNOWLEDGED}

        Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_DO_MODE_ACTIVE}    visible    timeout=2s
        Browser.Click    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_DO_MODE_ACTIVE}

        Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_DO_MODE_BOTH}    visible    timeout=2s
        Browser.Click    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_DO_MODE_BOTH}

        Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_DO_MODE_UNACKNOWLEDGED}    visible    timeout=2s
        Browser.Click    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_DO_MODE_UNACKNOWLEDGED}
    ELSE IF    $device_type.lower() == 'forwarding'
        Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_DEVICE_TYPE_OPTION4}    visible    timeout=2s
        Browser.Click    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_DEVICE_TYPE_OPTION4}

        ${ip_address}=    Generate Random IP Address
        Wait For Elements State
        ...    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_FORWARDING_IP_ADDRESS_INPUT}
        ...    visible
        ...    timeout=2s
        Fill Text    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_FORWARDING_IP_ADDRESS_INPUT}    ${ip_address}

        ${ip_port}=    Generate Random IP Port
        Wait For Elements State
        ...    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_FORWARDING_IP_PORT_INPUT}
        ...    visible
        ...    timeout=2s
        Fill Text    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_FORWARDING_IP_PORT_INPUT}    ${ip_port}
    ELSE IF    $device_type.lower() == 'alerta'
        Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_DEVICE_TYPE_OPTION5}    visible    timeout=2s
        Browser.Click    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_DEVICE_TYPE_OPTION5}

        ${ip_address}=    Generate Random IP Address
        Wait For Elements State
        ...    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_ALERTA_IP_ADDRESS_INPUT}
        ...    visible
        ...    timeout=2s
        Fill Text    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_ALERTA_IP_ADDRESS_INPUT}    ${ip_address}

        ${ip_port}=    Generate Random IP Port
        Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_ALERTA_IP_PORT_INPUT}    visible    timeout=2s
        Fill Text    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_ALERTA_IP_PORT_INPUT}    ${ip_port}
    ELSE
        # Email
        Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_DEVICE_TYPE_OPTION1}    visible    timeout=2s
        Browser.Click    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_DEVICE_TYPE_OPTION1}

        Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_EMAIL_INPUT}    visible    timeout=2s
        ${email_address}=    Generate Random Email Address
        Fill Text    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_EMAIL_INPUT}    ${email_address}

        Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_EMAIL_SERVER_SELECT}    visible    timeout=2s
        Browser.Click    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_EMAIL_SERVER_SELECT}
        Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_EMAIL_SERVER_OPTION5}    visible    timeout=2s
        Browser.Click    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_EMAIL_SERVER_OPTION5}

        Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_EMAIL_SERVER_SELECT}    visible    timeout=2s
        Browser.Click    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_EMAIL_SERVER_SELECT}
        Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_EMAIL_SERVER_OPTION4}    visible    timeout=2s
        Browser.Click    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_EMAIL_SERVER_OPTION4}

        Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_EMAIL_SERVER_SELECT}    visible    timeout=2s
        Browser.Click    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_EMAIL_SERVER_SELECT}
        Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_EMAIL_SERVER_OPTION3}    visible    timeout=2s
        Browser.Click    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_EMAIL_SERVER_OPTION3}

        Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_EMAIL_SERVER_SELECT}    visible    timeout=2s
        Browser.Click    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_EMAIL_SERVER_SELECT}
        Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_EMAIL_SERVER_OPTION2}    visible    timeout=2s
        Browser.Click    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_EMAIL_SERVER_OPTION2}

        Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_EMAIL_SERVER_SELECT}    visible    timeout=2s
        Browser.Click    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_EMAIL_SERVER_SELECT}
        Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_EMAIL_SERVER_OPTION1}    visible    timeout=2s
        Browser.Click    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_EMAIL_SERVER_OPTION1}

        Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_TEMPLATE_SELECT}    visible    timeout=2s
        Browser.Click    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_TEMPLATE_SELECT}
        ${template_file_xpath}=    Set Variable
        ...    xpath=//mat-option[@data-qa-id='automation-alarm-device-edit-template-option2']

        Wait For Elements State    ${template_file_xpath}    visible    timeout=2s
        Browser.Click    ${template_file_xpath}

        FOR    ${counter}    IN RANGE    2    11
            Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_TEMPLATE_SELECT}    visible    timeout=2s
            Browser.Click    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_TEMPLATE_SELECT}

            ${template_file_xpath}=    Set Variable
            ...    xpath=//mat-option[@data-qa-id='automation-alarm-device-edit-template-option${counter}']
            Wait For Elements State    ${template_file_xpath}    visible    timeout=2s
            Browser.Click    ${template_file_xpath}
        END
    END

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_SYNCHRONIZE_CHKBX}    visible    timeout=2s
    Check Checkbox    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_SYNCHRONIZE_CHKBX}
    Uncheck Checkbox    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_SYNCHRONIZE_CHKBX}
    Check Checkbox    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_SYNCHRONIZE_CHKBX}

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_ADD_BUTTON}    visible    timeout=2s
    Browser.Click    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_ADD_BUTTON}

    Snack-bar Visibility And Content

Delete Alarm Device
    [Arguments]    ${device_name}
    # Go to automation
    # Go to automation alarm devices

    ${compiled_text}=    Set Variable    xpath=//td[contains(., '${device_name}')]

    Wait For Elements State    ${compiled_text}    visible    timeout=2s
    Browser.Click    ${compiled_text}

    Wait For Elements State    ${SELECTOR_AUTOMATION_TOOLBAR_DELETE_BUTTON}    visible    timeout=2s
    Browser.Click    ${SELECTOR_AUTOMATION_TOOLBAR_DELETE_BUTTON}

    ${point_xpath_variable}=    Set Variable
    ...    //app-confirm-dialog[@class="ng-star-inserted"]//p[text()='${device_name}']
    Wait For Elements State    ${point_xpath_variable}    visible    timeout=2s
    Wait For Elements State    ${SELECTOR_CONFIRM_DIALOG_CONFIRM_BUTTON}    visible    timeout=2s
    Browser.Click    ${SELECTOR_CONFIRM_DIALOG_CONFIRM_BUTTON}
    Snack-bar Visibility And Content
    Wait For Elements State    ${compiled_text}    hidden    timeout=2s

Edit Alarm Device
    [Arguments]    ${device_name}    ${new_device_name}    ${device_type}

    # Go to automation
    # Go to automation alarm devices

    ${compiled_text}=    Set Variable    xpath=//td[contains(., '${device_name}')]

    Wait For Elements State    ${compiled_text}    visible    timeout=2s
    Browser.Click    ${compiled_text}

    Wait For Elements State    ${SELECTOR_AUTOMATION_TOOLBAR_EDIT_BUTTON}    visible    timeout=2s
    Browser.Click    ${SELECTOR_AUTOMATION_TOOLBAR_EDIT_BUTTON}

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_NAME_INPUT}    visible    timeout=2s
    Fill Text    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_NAME_INPUT}    ${new_device_name}

    ${checkbox_visible}=    Run Keyword And Return Status
    ...    Wait For Elements State
    ...    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_EVENTS_ACKNOWLEDGE_CHKBX}
    ...    visible
    ...    timeout=200ms
    IF    ${checkbox_visible}
        Uncheck Checkbox    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_EVENTS_STATE0_CHKBX}
        Uncheck Checkbox    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_EVENTS_STATE1_CHKBX}
        Uncheck Checkbox    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_EVENTS_STATE2_CHKBX}
        Uncheck Checkbox    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_EVENTS_STATE3_CHKBX}
        Uncheck Checkbox    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_EVENTS_STATE4_CHKBX}
        Uncheck Checkbox    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_EVENTS_STATE5_CHKBX}
        Uncheck Checkbox    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_EVENTS_STATE6_CHKBX}
        Uncheck Checkbox    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_EVENTS_STATE7_CHKBX}
        Uncheck Checkbox    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_EVENTS_STATE8_CHKBX}
        Uncheck Checkbox    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_EVENTS_STATE9_CHKBX}
        Uncheck Checkbox    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_EVENTS_STATE10_CHKBX}
        Uncheck Checkbox    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_EVENTS_STATE11_CHKBX}

        Uncheck Checkbox    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_EVENTS_ACKNOWLEDGE_CHKBX}
        Uncheck Checkbox    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_EVENTS_LOCK_STATE_CHKBX}

        Check Checkbox    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_EVENTS_STATE0_CHKBX}
        Check Checkbox    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_EVENTS_STATE1_CHKBX}
        Check Checkbox    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_EVENTS_STATE2_CHKBX}
        Check Checkbox    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_EVENTS_STATE3_CHKBX}
        Check Checkbox    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_EVENTS_STATE4_CHKBX}
        Check Checkbox    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_EVENTS_STATE5_CHKBX}
        Check Checkbox    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_EVENTS_STATE6_CHKBX}
        Check Checkbox    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_EVENTS_STATE7_CHKBX}
        Check Checkbox    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_EVENTS_STATE8_CHKBX}
        Check Checkbox    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_EVENTS_STATE9_CHKBX}
        Check Checkbox    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_EVENTS_STATE10_CHKBX}
        Check Checkbox    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_EVENTS_STATE11_CHKBX}

        Check Checkbox    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_EVENTS_ACKNOWLEDGE_CHKBX}
        Check Checkbox    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_EVENTS_LOCK_STATE_CHKBX}
    END

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_DEVICE_TYPE_SELECT}    visible    timeout=2s
    Browser.Click    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_DEVICE_TYPE_SELECT}
    IF    $device_type.lower() == 'webservice'
        Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_DEVICE_TYPE_OPTION6}    visible    timeout=2s
        Browser.Click    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_DEVICE_TYPE_OPTION6}

        Wait For Elements State
        ...    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_WEB_SERVICE_TYPE_SELECT}
        ...    visible
        ...    timeout=2s
        Browser.Click    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_WEB_SERVICE_TYPE_SELECT}

        Wait For Elements State
        ...    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_WEB_SERVICE_TYPE_OPTION1}
        ...    visible
        ...    timeout=2s
        Browser.Click    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_WEB_SERVICE_TYPE_OPTION1}

        Wait For Elements State
        ...    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_WEB_SERVICE_ADDRESS_INPUT}
        ...    visible
        ...    timeout=2s
        ${address_ip}=    Generate Random IP Address
        Fill Text    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_WEB_SERVICE_ADDRESS_INPUT}    ${address_ip}
        Clear Text    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_WEB_SERVICE_ADDRESS_INPUT}

        ${address_http}=    Generate Random Web Address    2
        Fill Text    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_WEB_SERVICE_ADDRESS_INPUT}    ${address_http}
        Clear Text    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_WEB_SERVICE_ADDRESS_INPUT}

        ${address_https}=    Generate Random Web Address    1
        Fill Text    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_WEB_SERVICE_ADDRESS_INPUT}    ${address_https}
        Clear Text    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_WEB_SERVICE_ADDRESS_INPUT}

        ${address_www}=    Generate Random Web Address    3
        Fill Text    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_WEB_SERVICE_ADDRESS_INPUT}    ${address_www}

        Wait For Elements State
        ...    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_WEB_SERVICE_SYSTEM_ID_INPUT}
        ...    visible
        ...    timeout=2s
        ${ip_port}=    Generate Random IP Port
        Fill Text    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_WEB_SERVICE_SYSTEM_ID_INPUT}    ${ip_port}

        Wait For Elements State
        ...    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_WEB_SERVICE_PASSWORD_INPUT}
        ...    visible
        ...    timeout=2s
        ${password}=    Generate Random String    12
        Fill Text    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_WEB_SERVICE_PASSWORD_INPUT}    ${password}

        Wait For Elements State
        ...    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_WEB_SERVICE_ORGANIZATION_ID_INPUT}
        ...    visible
        ...    timeout=2s
        Fill Text    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_WEB_SERVICE_ORGANIZATION_ID_INPUT}    ${ip_port}
    ELSE IF    $device_type.lower() == 'sms'
        Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_DEVICE_TYPE_OPTION2}    visible    timeout=2s
        Browser.Click    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_DEVICE_TYPE_OPTION2}

        ${ip_address}=    Generate Random IP Address
        Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_SMS_IP_ADDRESS_INPUT}    visible    timeout=2s
        Fill Text    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_SMS_IP_ADDRESS_INPUT}    ${ip_address}

        ${ip_port}=    Generate Random IP Port
        Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_SMS_IP_PORT_INPUT}
        Fill Text    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_SMS_IP_PORT_INPUT}    ${ip_port}

        ${phone_number}=    Generate Random Finnish Phone Number International
        Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_SMS_PHONE_NUMBER_INPUT}    visible    timeout=2s
        Fill Text    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_SMS_PHONE_NUMBER_INPUT}    ${phone_number}

        ${phone_number}=    Generate Random Finnish Phone Number International
        Wait For Elements State
        ...    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_SMS_BACKUP_NUMBER1_INPUT}
        ...    visible
        ...    timeout=2s
        Fill Text    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_SMS_BACKUP_NUMBER1_INPUT}    ${phone_number}

        ${phone_number}=    Generate Random Finnish Phone Number Local
        Wait For Elements State
        ...    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_SMS_BACKUP_NUMBER2_INPUT}
        ...    visible
        ...    timeout=2s
        Fill Text    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_SMS_BACKUP_NUMBER2_INPUT}    ${phone_number}

        ${phone_number}=    Generate Random Finnish Phone Number Local
        Wait For Elements State
        ...    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_SMS_BACKUP_NUMBER3_INPUT}
        ...    visible
        ...    timeout=2s
        Fill Text    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_SMS_BACKUP_NUMBER3_INPUT}    ${phone_number}

        ${phone_number}=    Generate Random Finnish Phone Number International
        Wait For Elements State
        ...    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_SMS_BACKUP_NUMBER4_INPUT}
        ...    visible
        ...    timeout=2s
        Fill Text    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_SMS_BACKUP_NUMBER4_INPUT}    ${phone_number}

        Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_TEMPLATE_SELECT}    visible    timeout=2s
        Browser.Click    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_TEMPLATE_SELECT}
        ${template_file_xpath}=    Set Variable
        ...    xpath=//mat-option[@data-qa-id='automation-alarm-device-edit-template-option2']

        Wait For Elements State    ${template_file_xpath}    visible    timeout=2s
        Browser.Click    ${template_file_xpath}

        FOR    ${counter}    IN RANGE    2    11
            Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_TEMPLATE_SELECT}    visible    timeout=2s
            Browser.Click    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_TEMPLATE_SELECT}

            ${template_file_xpath}=    Set Variable
            ...    xpath=//mat-option[@data-qa-id='automation-alarm-device-edit-template-option${counter}']
            Wait For Elements State    ${template_file_xpath}    visible    timeout=2s
            Browser.Click    ${template_file_xpath}
        END
    ELSE IF    $device_type.lower() == 'do'
        Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_DEVICE_TYPE_OPTION3}    visible    timeout=2s
        Browser.Click    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_DEVICE_TYPE_OPTION3}

        Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_DO_POINT_NAME_INPUT}    visible    timeout=2s
        ${do_pointname}=    Generate Random Point Name    DO    DO    _
        Fill Text    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_DO_POINT_NAME_INPUT}    ${do_pointname}

        Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_DO_MODE_UNACKNOWLEDGED}    visible    timeout=2s
        Browser.Click    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_DO_MODE_UNACKNOWLEDGED}

        Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_DO_MODE_ACTIVE}    visible    timeout=2s
        Browser.Click    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_DO_MODE_ACTIVE}

        Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_DO_MODE_BOTH}    visible    timeout=2s
        Browser.Click    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_DO_MODE_BOTH}

        Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_DO_MODE_UNACKNOWLEDGED}    visible    timeout=2s
        Browser.Click    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_DO_MODE_UNACKNOWLEDGED}
    ELSE IF    $device_type.lower() == 'forwarding'
        Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_DEVICE_TYPE_OPTION4}    visible    timeout=2s
        Browser.Click    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_DEVICE_TYPE_OPTION4}

        ${ip_address}=    Generate Random IP Address
        Wait For Elements State
        ...    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_FORWARDING_IP_ADDRESS_INPUT}
        ...    visible
        ...    timeout=2s
        Fill Text    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_FORWARDING_IP_ADDRESS_INPUT}    ${ip_address}

        ${ip_port}=    Generate Random IP Port
        Wait For Elements State
        ...    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_FORWARDING_IP_PORT_INPUT}
        ...    visible
        ...    timeout=2s
        Fill Text    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_FORWARDING_IP_PORT_INPUT}    ${ip_port}
    ELSE IF    $device_type.lower() == 'alerta'
        Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_DEVICE_TYPE_OPTION5}    visible    timeout=2s
        Browser.Click    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_DEVICE_TYPE_OPTION5}

        ${ip_address}=    Generate Random IP Address
        Wait For Elements State
        ...    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_ALERTA_IP_ADDRESS_INPUT}
        ...    visible
        ...    timeout=2s
        Fill Text    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_ALERTA_IP_ADDRESS_INPUT}    ${ip_address}

        ${ip_port}=    Generate Random IP Port
        Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_ALERTA_IP_PORT_INPUT}    visible    timeout=2s
        Fill Text    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_ALERTA_IP_PORT_INPUT}    ${ip_port}
    ELSE
        # Email
        Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_DEVICE_TYPE_OPTION1}    visible    timeout=2s
        Browser.Click    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_DEVICE_TYPE_OPTION1}

        Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_EMAIL_INPUT}    visible    timeout=2s
        ${email_address}=    Generate Random Email Address
        Fill Text    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_EMAIL_INPUT}    ${email_address}

        Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_EMAIL_SERVER_SELECT}    visible    timeout=2s
        Browser.Click    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_EMAIL_SERVER_SELECT}
        Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_EMAIL_SERVER_OPTION5}    visible    timeout=2s
        Browser.Click    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_EMAIL_SERVER_OPTION5}

        Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_EMAIL_SERVER_SELECT}    visible    timeout=2s
        Browser.Click    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_EMAIL_SERVER_SELECT}
        Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_EMAIL_SERVER_OPTION4}    visible    timeout=2s
        Browser.Click    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_EMAIL_SERVER_OPTION4}

        Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_EMAIL_SERVER_SELECT}    visible    timeout=2s
        Browser.Click    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_EMAIL_SERVER_SELECT}
        Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_EMAIL_SERVER_OPTION3}    visible    timeout=2s
        Browser.Click    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_EMAIL_SERVER_OPTION3}

        Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_EMAIL_SERVER_SELECT}    visible    timeout=2s
        Browser.Click    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_EMAIL_SERVER_SELECT}
        Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_EMAIL_SERVER_OPTION2}    visible    timeout=2s
        Browser.Click    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_EMAIL_SERVER_OPTION2}

        Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_EMAIL_SERVER_SELECT}    visible    timeout=2s
        Browser.Click    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_EMAIL_SERVER_SELECT}
        Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_EMAIL_SERVER_OPTION1}    visible    timeout=2s
        Browser.Click    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_EMAIL_SERVER_OPTION1}

        Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_TEMPLATE_SELECT}    visible    timeout=2s
        Browser.Click    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_TEMPLATE_SELECT}
        ${template_file_xpath}=    Set Variable
        ...    xpath=//mat-option[@data-qa-id='automation-alarm-device-edit-template-option2']

        Wait For Elements State    ${template_file_xpath}    visible    timeout=2s
        Browser.Click    ${template_file_xpath}

        FOR    ${counter}    IN RANGE    2    11
            Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_TEMPLATE_SELECT}    visible    timeout=2s
            Browser.Click    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_TEMPLATE_SELECT}

            ${template_file_xpath}=    Set Variable
            ...    xpath=//mat-option[@data-qa-id='automation-alarm-device-edit-template-option${counter}']
            Wait For Elements State    ${template_file_xpath}    visible    timeout=2s
            Browser.Click    ${template_file_xpath}
        END
    END

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_SYNCHRONIZE_CHKBX}    visible    timeout=2s
    Check Checkbox    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_SYNCHRONIZE_CHKBX}
    Uncheck Checkbox    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_SYNCHRONIZE_CHKBX}
    Check Checkbox    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_SYNCHRONIZE_CHKBX}

    Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_SAVE_BUTTON}    visible    timeout=2s
    Browser.Click    ${SELECTOR_AUTOMATION_POINT_AD_EDIT_SAVE_BUTTON}

    Snack-bar Visibility And Content

Print Alarm Devices
    # Go to automation
    # Go to automation alarm devices

    Wait For Elements State    ${SELECTOR_AUTOMATION_TOOLBAR_PRINT_BUTTON}    visible    timeout=2s
    Browser.Click    ${SELECTOR_AUTOMATION_TOOLBAR_PRINT_BUTTON}
    Sleep    3s
    Keyboard Key    press    Escape

    Wait For Elements State    ${SELECTOR_AUTOMATION_TOOLBAR_PRINT_BUTTON}    visible    timeout=2s
