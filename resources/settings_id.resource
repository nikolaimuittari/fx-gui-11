*** Settings ***
Library     RPA.Browser.Selenium
Resource    navigate.resource
Resource    login.resource
Resource    point_locators.resource
Resource    settings_locators.resource
Resource    settings_locators_id.resource
Resource    global_variables.resource


*** Variables ***
${MIN_PORT_NUMBER}      1
${MAX_PORT_NUMBER}      65535


*** Keywords ***
Settings Dashboard Elements QA-ID
    Go to settings

    Wait For Elements State    ${SELECTOR_SETTINGS_DASHBOARD_DEVICE_SETTINGS}    visible    timeout=2s

    Console Text From Path    Header:    ${SELECTOR_SETTINGS_DASHBOARD_DEVICE_HEADER}
    Console Text From Path    Header:    ${SELECTOR_SETTINGS_DASHBOARD_CLOCK_HEADER}
    Console Text From Path    Header:    ${SELECTOR_SETTINGS_DASHBOARD_ACTIVATIONS_HEADER}
    Console Text From Path    Header:    ${SELECTOR_SETTINGS_DASHBOARD_GSM_HEADER}
    Console Text From Path    Header:    ${SELECTOR_SETTINGS_DASHBOARD_SYSTEM_HEADER}
    Console Text From Path    Header:    ${SELECTOR_SETTINGS_DASHBOARD_PORT_HEADER}
    Console Text From Path    Header:    ${SELECTOR_SETTINGS_DASHBOARD_NETWORK_HEADER}
    Console Text From Path    Header:    ${SELECTOR_SETTINGS_DASHBOARD_FIREWALL_HEADER}
    Console Text From Path    Header:    ${SELECTOR_SETTINGS_DASHBOARD_SYNC_HEADER}

    Console Text From Path    Device Settings card:    ${SELECTOR_SETTINGS_DASHBOARD_DEVICE_NAME}
    Console Text From Path    Device Settings card:    ${SELECTOR_SETTINGS_DASHBOARD_SESSION_TIME_LIMIT}
    Console Text From Path    Device Settings card:    ${SELECTOR_SETTINGS_DASHBOARD_WEBVISION_AUTH}
    Console Text From Path    Device Settings card:    ${SELECTOR_SETTINGS_DASHBOARD_OS_VERSION}
    Console Text From Path    Device Settings card:    ${SELECTOR_SETTINGS_DASHBOARD_IECPROG_POLL_TIME}

    Console Text From Path    Clock Settings card:    ${SELECTOR_SETTINGS_DASHBOARD_SUN_SET}
    Console Text From Path    Clock Settings card:    ${SELECTOR_SETTINGS_DASHBOARD_SET_TIME}
    # Console Text From Path    Clock Settings card:    ${SELECTOR_SETTINGS_DASHBOARD_TIME_AND_DATE}
    Console Text From Path    Clock Settings card:    ${SELECTOR_SETTINGS_DASHBOARD_DATE}
    Console Text From Path    Clock Settings card:    ${SELECTOR_SETTINGS_DASHBOARD_TIME_SERVER}
    Console Text From Path    Clock Settings card:    ${SELECTOR_SETTINGS_DASHBOARD_TIMEZONE}
    # Console Text From Path    Clock Settings card:    ${SELECTOR_SETTINGS_DASHBOARD_DAYLIGHT_SAVING}

    Console Text From Path    Activations card:    ${SELECTOR_SETTINGS_DASHBOARD_ACTIVATIONS_ITEM_FX_BASE}
    Console Text From Path    Activations card:    ${SELECTOR_SETTINGS_DASHBOARD_ACTIVATIONS_ITEM_TOSIBOX}
    Console Text From Path    Activations card:    ${SELECTOR_SETTINGS_DASHBOARD_ACTIVATIONS_ITEM_ECO_SMART}
    Console Text From Path    Activations card:    ${SELECTOR_SETTINGS_DASHBOARD_ACTIVATIONS_ITEM_MODBUS_SERVER}
    Console Text From Path    Activations card:    ${SELECTOR_SETTINGS_DASHBOARD_ACTIVATIONS_ITEM_INU}
    # Console Text From Path    Activations card:    ${SELECTOR_SETTINGS_DASHBOARD_ACTIVATIONS_ITEM_WEATHER}

    # Console Text From Path    GSM-Settings card:    ${SELECTOR_SETTNIGS_DASHBOARD_GSM_STATUS_ICON}
    # Console Text From Path    GSM-Settings card:    ${SELECTOR_SETTNIGS_DASHBOARD_GSM_STATUS_DETAIL_DESCRIPTIONS}
    # Console Text From Path    GSM-Settings card:    ${SELECTOR_SETTNIGS_DASHBOARD_GSM_STATUS_DETAIL_VALUES}

    Console Text From Path    System card:    ${SELECTOR_SETTINGS_DASHBOARD_SYSTEM_CPU_WATCHDOG_VERSION}
    Console Text From Path    System card:    ${SELECTOR_SETTINGS_DASHBOARD_SYSTEM_CPU_BATTERY_VOLTAGE}
    Console Text From Path    System card:    ${SELECTOR_SETTINGS_DASHBOARD_SYSTEM_CPU_MAIN_VOLTAGE}
    Console Text From Path    System card:    ${SELECTOR_SETTINGS_DASHBOARD_SYSTEM_CPU_CONDENSATOR_VOLTAGE}
    Console Text From Path    System card:    ${SELECTOR_SETTINGS_DASHBOARD_SYSTEM_CPU_FREQUENCY}
    # Console Text From Path    System card:    ${SELECTOR_SETTINGS_DASHBOARD_SYSTEM_CPU_MODULE_TEMPERATURE}
    Console Text From Path    System card:    ${SELECTOR_SETTINGS_DASHBOARD_SYSTEM_CPU_CORE_TEMPERATURE}

    Console Text From Path    Port settings:    ${SELECTOR_SETTINGS_DASHBOARD_PORT_SETTINGS_PORT_3_NAME}
    Console Text From Path    Port settings:    ${SELECTOR_SETTINGS_DASHBOARD_PORT_SETTINGS_PORT_3_TYPE}
    # Console Text From Path    Port settings:    ${SELECTOR_SETTINGS_DASHBOARD_PORT_SETTINGS_PORT_3_MODULES_TITLE}
    # Console Text From Path    Port settings:    ${SELECTOR_SETTINGS_DASHBOARD_PORT_SETTINGS_PORT_3_MODULES_COUNT}
    # Console Text From Path    Port settings:    ${SELECTOR_SETTINGS_DASHBOARD_PORT_SETTINGS_PORT_4_NAME}
    # Console Text From Path    Port settings:    ${SELECTOR_SETTINGS_DASHBOARD_PORT_SETTINGS_PORT_4_TYPE}
    # Console Text From Path    Port settings:    ${SELECTOR_SETTINGS_DASHBOARD_PORT_SETTINGS_PORT_4_NO_DEVICES}
    Console Text From Path    Port settings:    ${SELECTOR_SETTINGS_DASHBOARD_PORT_SETTINGS_M_BUS_SEND_DELAY}

    # Console Text From Path    WAN Network settings:    ${WAN_group_xpath}
    # Console Text From Path    LAN Network settings:    ${LAN_group_xpath}
    # Console Text From Path    LAN Network settings:    ${WLAN_group_xpath}

    # ${elements}=    Browser.Get Elements    ${WAN_group_xpath}
    # FOR    ${element}    IN    @{elements}
    #    ${text}=    Browser.Get Text    ${element}
    #    Log To Console    ROW_CONTENT_XPATH:    ${text}

    # END

    # ${elements}=    Browser.Get Elements    ${ROW_CONTENT_XPATH}
    # FOR    ${element}    IN    @{elements}
    #    ${text}=    Browser.Get Text    ${element}
    #    Log To Console    ROW_CONTENT_XPATH:    ${text}

    # END

    # Console Text From Path    Network settings:    ${SELECTOR_SETTINGS_DASHBOARD_NETWORK_WAN_IP}
    # Console Text From Path    Network settings:    ${SELECTOR_SETTINGS_DASHBOARD_NETWORK_WAN_MASK}
    # Console Text From Path    Network settings:    ${SELECTOR_SETTINGS_DASHBOARD_NETWORK_WAN_GATEWAY}
    # Console Text From Path    Network settings:    ${SELECTOR_SETTINGS_DASHBOARD_NETWORK_WAN_PORT}
    # Console Text From Path    Network settings:    ${SELECTOR_SETTINGS_DASHBOARD_NETWORK_LAN_IP}
    # Console Text From Path    Network settings:    ${SELECTOR_SETTINGS_DASHBOARD_NETWORK_LAN_MASK}
    # Console Text From Path    Network settings:    ${SELECTOR_SETTINGS_DASHBOARD_NETWORK_LAN_GATEWAY}
    # Console Text From Path    Network settings:    ${SELECTOR_SETTINGS_DASHBOARD_NETWORK_LAN_PORTS}
    # Console Text From Path    Network settings:    ${SELECTOR_SETTINGS_DASHBOARD_NETWORK_WLAN_NETWORK_NAME}
    # Console Text From Path    Network settings:    ${SELECTOR_SETTINGS_DASHBOARD_NETWORK_WLAN_PASSWORD}
    # Console Text From Path    Network settings:    ${SELECTOR_SETTINGS_DASHBOARD_NETWORK_WLAN_PORT}

    # Console Text From Path    Firewall settings:    ${SELECTOR_SETTINGS_DASHBOARD_FIREWALL_WEB_SERVER_PORT}
    # Console Text From Path    Firewall settings:    ${SELECTOR_SETTINGS_DASHBOARD_FIREWALL_WEB_SERVER_STATUS}
    # Console Text From Path    Firewall settings:    ${SELECTOR_SETTINGS_DASHBOARD_FIREWALL_MAINTENANCE_SERVER_STATUS}
    # Console Text From Path    Firewall settings:    ${SELECTOR_SETTINGS_DASHBOARD_FIREWALL_MAIN_PC_SERVER_PORT}
    # Console Text From Path    Firewall settings:    ${SELECTOR_SETTINGS_DASHBOARD_FIREWALL_MAIN_PC_SERVER_STATUS}
    # Console Text From Path    Firewall settings:    ${SELECTOR_SETTINGS_DASHBOARD_FIREWALL_OPEN_PCS_SERVER_PORT}
    # Console Text From Path    Firewall settings:    ${SELECTOR_SETTINGS_DASHBOARD_FIREWALL_OPEN_PCS_SERVER_STATUS}
    # Console Text From Path    Firewall settings:    ${SELECTOR_SETTINGS_DASHBOARD_FIREWALL_PING_SERVER_STATUS}
    # Console Text From Path    Firewall settings:    ${SELECTOR_SETTINGS_DASHBOARD_FIREWALL_TIME_SERVER_PORT}
    # Console Text From Path    Firewall settings:    ${SELECTOR_SETTINGS_DASHBOARD_FIREWALL_TIME_SERVER_STATUS}
    # Console Text From Path    Firewall settings:    ${SELECTOR_SETTINGS_DASHBOARD_FIREWALL_MODBUS_SERVER_PORT}
    # Console Text From Path    Firewall settings:    ${SELECTOR_SETTINGS_DASHBOARD_FIREWALL_MODBUS_SERVER_STATUS}

    # Console Text From Path    Syncronization card:    ${SELECTOR_SETTINGS_DASHBOARD_SYNC_CALENDAR_STATUS}
    # Console Text From Path    Syncronization card:    ${SELECTOR_SETTINGS_DASHBOARD_SYNC_WEBVISION_STATUS}
    # Console Text From Path    Syncronization card:    ${SELECTOR_SETTINGS_DASHBOARD_SYNC_STATE_TEXTS_STATUS}
    # Console Text From Path    Syncronization card:    ${SELECTOR_SETTINGS_DASHBOARD_SYNC_TIME_TABLES_STATUS}
    # Console Text From Path    Syncronization card:    ${SELECTOR_SETTINGS_DASHBOARD_SYNC_USER_RIGHTS_STATUS}
    # Console Text From Path    Syncronization card:    ${SELECTOR_SETTINGS_DASHBOARD_SYNC_ALARM_GROUPS_STATUS}

Settings System Device QA-ID
    [Arguments]    ${save}

    Go to settings

    Browser.Click    ${selector_settings_system_btn}

    Fill Text    ${SELECTOR_SETTINGS_SYSTEM_DEVICE_DEVICE_NAME_INPUT}    3KX
    Fill Text    ${SELECTOR_SETTINGS_SYSTEM_DEVICE_SESSION_TIMEOUT_INPUT}    999
    Fill Text    ${SELECTOR_SETTINGS_SYSTEM_DEVICE_WEBVISION_AUTH_KEY_INPUT}    Authentic

    ${button_result}=    Action Button Or Cancel Button
    ...    ${SELECTOR_SETTINGS_SYSTEM_DEVICE_SAVE_BUTTON}
    ...    ${SELECTOR_SETTINGS_SYSTEM_DEVICE_CANCEL_BUTTON}
    ...    ${save}
    Log To Console    ${button_result}

    Fill Text    ${SELECTOR_SETTINGS_SYSTEM_DEVICE_DEVICE_NAME_INPUT}    FX3000XX
    Fill Text    ${SELECTOR_SETTINGS_SYSTEM_DEVICE_SESSION_TIMEOUT_INPUT}    15
    Fill Text    ${SELECTOR_SETTINGS_SYSTEM_DEVICE_WEBVISION_AUTH_KEY_INPUT}    FdxAuth

    ${button_result}=    Action Button Or Cancel Button
    ...    ${SELECTOR_SETTINGS_SYSTEM_DEVICE_SAVE_BUTTON}
    ...    ${SELECTOR_SETTINGS_SYSTEM_DEVICE_CANCEL_BUTTON}
    ...    ${save}
    Log To Console    ${button_result}

Settings System Status QA-ID
    [Arguments]    ${save}

    Go to settings

    Browser.Click    ${selector_settings_system_btn}
    Browser.Click    ${selector_settings_system_status_item}

    Browser.Click    ${SELECTOR_SETTINGS_SYSTEM_STATUS_REBOOT_DEVICE_BUTTON}

    ${button_result}=    Action Button Or Cancel Button
    ...    ${SELECTOR_SETTINGS_SYSTEM_STATUS_REBOOT_DEVICE_DIALOG_REBOOT_BUTTON}
    ...    ${SELECTOR_SETTINGS_SYSTEM_STATUS_REBOOT_DEVICE_DIALOG_CANCEL_BUTTON}
    ...    ${save}
    Log To Console    ${button_result}

Settings System Clock QA-ID
    [Arguments]    ${save}

    Go to settings
    Sleep    ${SLEEP_TIME}

    Browser.Click    ${selector_settings_system_btn}
    Browser.Click    ${selector_settings_system_clock_item}

    Fill Text    ${SELECTOR_SETTINGS_SYSTEM_CLOCK_TIME_SERVER_ADDRESS_INPUT}    time.microsoft.com

    Browser.Click    ${SELECTOR_SETTINGS_SYSTEM_CLOCK_USE_FX_TIME_SERVER_CHECKBOX}
    Browser.Click    ${SELECTOR_SETTINGS_SYSTEM_CLOCK_USE_GSM_TIME_CHECKBOX}
    # Browser.Click    ${SELECTOR_SETTINGS_SYSTEM_CLOCK_AUTOMATIC_SUMMER_TIME_CHECKBOX}

    Fill Text    ${SELECTOR_SETTINGS_CLOCK_CURRENT_CLOCK_INPUT}    12:34
    Browser.Click    ${SELECTOR_SETTINGS_CLOCK_CURRENT_DATE_INPUT}
    Browser.Keyboard Input    type    12112024    delay=1s
    # Fill Text    ${SELECTOR_SETTINGS_CLOCK_CURRENT_DATE_INPUT}    12.11.2024

    Wait For Elements State    ${SELECTOR_SETTINGS_SYSTEM_CLOCK_TIME_ZONE_DROPDOWN}    timeout=2s
    Browser.Click    ${SELECTOR_SETTINGS_SYSTEM_CLOCK_TIME_ZONE_DROPDOWN}
    ${SELECTOR_SETTINGS_SYSTEM_CLOCK_TIME_ZONE_DROPDOWN_OPTION}=    Set Variable
    ...    xpath=//div[contains(@id, '-444') and contains(@class, 'ng-option-child')]
    Wait For Elements State    ${SELECTOR_SETTINGS_SYSTEM_CLOCK_TIME_ZONE_DROPDOWN_OPTION}    timeout=2s
    Browser.Click    ${SELECTOR_SETTINGS_SYSTEM_CLOCK_TIME_ZONE_DROPDOWN_OPTION}

    Wait For Elements State    ${SELECTOR_SETTINGS_SYSTEM_CLOCK_TIME_ZONE_DROPDOWN}    timeout=2s
    Browser.Click    ${SELECTOR_SETTINGS_SYSTEM_CLOCK_TIME_ZONE_DROPDOWN}
    ${SELECTOR_SETTINGS_SYSTEM_CLOCK_TIME_ZONE_DROPDOWN_OPTION}=    Set Variable
    ...    xpath=//div[contains(@id, '-448') and contains(@class, 'ng-option-child')]
    Wait For Elements State    ${SELECTOR_SETTINGS_SYSTEM_CLOCK_TIME_ZONE_DROPDOWN_OPTION}    timeout=2s
    Browser.Click    ${SELECTOR_SETTINGS_SYSTEM_CLOCK_TIME_ZONE_DROPDOWN_OPTION}

    # Select Options By    ${SELECTOR_SETTINGS_SYSTEM_CLOCK_TIME_ZONE_DROPDOWN}    value    -12
    # Select Options By    ${SELECTOR_SETTINGS_SYSTEM_CLOCK_TIME_ZONE_DROPDOWN}    value    -2
    # Select Options By    ${SELECTOR_SETTINGS_SYSTEM_CLOCK_TIME_ZONE_DROPDOWN}    value    4
    # Select Options By    ${SELECTOR_SETTINGS_SYSTEM_CLOCK_TIME_ZONE_DROPDOWN}    value    12

    Fill Text    ${SELECTOR_SETTINGS_CLOCK_LATITUDE_DEGREES_INPUT_INPUT}    -88
    Fill Text    ${SELECTOR_SETTINGS_CLOCK_LATITUDE_MINUTES_INPUT_INPUT}    55

    # Select Options By    ${SELECTOR_SETTINGS_CLOCK_LATITUDE_DIRECTION_DROPDOWN}    value    1

    Fill Text    ${SELECTOR_SETTINGS_CLOCK_LONGITUDE_DEGREES_INPUT_INPUT}    -88
    Fill Text    ${SELECTOR_SETTINGS_CLOCK_LONGITUDE_MINUTES_INPUT_INPUT}    59

    # Select Options By    ${SELECTOR_SETTINGS_CLOCK_LONGITUDE_DIRECTION_DROPDOWN}    value    1

    ${button_result}=    Action Button Or Cancel Button
    ...    ${SELECTOR_SETTINGS_CLOCK_SAVE_BUTTON}
    ...    ${SELECTOR_SETTINGS_CLOCK_CANCEL_BUTTON}
    ...    ${save}
    Log To Console    ${button_result}

Settings System Activations QA-ID
    [Arguments]    ${save}

    Go to settings

    Browser.Click    ${selector_settings_system_btn}
    Browser.Click    ${selector_settings_system_activations_item}

    # All shall be activated

    Browser.Click    ${SELECTOR_SETTINGS_ACTIVATIONS_FXBASE_COPY_PRODUCT_KEY_ICON}

    ${snack-bar_visible}=    Check Xpath visible    xpath=//span[@class='mdc-button__label']
    Log To Console    Snack-bar: ${snack-bar_visible}
    ${snack-bar_text}=    Get Text From XPath    xpath=//span[@class='mdc-button__label']
    Log To Console    Snack-bar text: ${snack-bar_text}

    ${fx_base_key_value}=    Get Text From XPath    ${SELECTOR_SETTINGS_ACTIVATIONS_FXBASE_ACTIVATION_KEY_INPUT}
    Log To Console    FX base key: ${fx_base_key_value}

    ${trimmed_string}=    Set Variable    ${fx_base_key_value}[:-5]
    Log To Console    ${trimmed_string}
    Fill Text    ${SELECTOR_SETTINGS_ACTIVATIONS_FXBASE_ACTIVATION_KEY_INPUT}    ${trimmed_string}

    ${fxbase_activated}=    Run Keyword And Return Status
    ...    Wait For Elements State
    ...    ${SELECTOR_SETTINGS_ACTIVATION_FX_BASE_SOFTWARE_REMOVE_BUTTON}
    ...    timeout=2s
    IF    ${fxbase_activated}
        Browser.Click    ${SELECTOR_SETTINGS_ACTIVATION_FX_BASE_SOFTWARE_REMOVE_BUTTON}
        Wait For Elements state    ${SELECTOR_SETTINGS_ACTIVATION_REMOVE_DIALOG_REMOVE_BUTTON}    timeout=2s
        Browser.Click    ${SELECTOR_SETTINGS_ACTIVATION_REMOVE_DIALOG_REMOVE_BUTTON}

        Wait For Elements State    ${SELECTOR_SETTINGS_ACTIVATION_FX_BASE_SOFTWARE_INPUT_ACTIVATION_KEY}    timeout=2s
        Fill Text    ${SELECTOR_SETTINGS_ACTIVATION_FX_BASE_SOFTWARE_INPUT_ACTIVATION_KEY}    ${trimmed_string}

        Wait For Elements State    ${SELECTOR_SETTINGS_ACTIVATION_FX_BASE_SOFTWARE_ACTIVATE_BUTTON}    timeout=2s
        Browser.Click    ${SELECTOR_SETTINGS_ACTIVATION_FX_BASE_SOFTWARE_ACTIVATE_BUTTON}
        Sleep    2s
        ${fx_base_key_value}=    Get Text From XPath    ${SELECTOR_SETTINGS_ACTIVATIONS_FXBASE_ACTIVATION_KEY_INPUT}
        Log To Console    FX base activation: ${fx_base_key_value}
    END

    ${snack-bar_visible}=    Check Xpath visible    xpath=//span[@class='mdc-button__label']
    Log To Console    Snack-bar: ${snack-bar_visible}
    ${snack-bar_text}=    Get Text From XPath    xpath=//span[@class='mdc-button__label']
    Log To Console    Snack-bar text: ${snack-bar_text}

Settings System SMS QA-ID
    [Arguments]    ${save}

    Go to settings

    Browser.Click    ${selector_settings_system_btn}
    Browser.Click    ${selector_settings_system_sms_item}

    Fill Text    ${SELECTOR_SETTINGS_SMS_HEADER_INPUT}    SMS_header
    Check Checkbox    ${SELECTOR_SETTINGS_SMS_SEND_USING_WEB_SERVICE_CHECKBOX}
    Uncheck Checkbox    ${SELECTOR_SETTINGS_SMS_SEND_USING_WEB_SERVICE_CHECKBOX}
    Check Checkbox    ${SELECTOR_SETTINGS_SMS_SEND_USING_WEB_SERVICE_CHECKBOX}

    ${server_host_1}=    Get Text From Xpath    ${SELECTOR_SETTINGS_SMS_SERVER_HOST_1_INPUT}
    Fill Text    ${SELECTOR_SETTINGS_SMS_SERVER_HOST_1_INPUT}    ${EMPTY}
    Fill Text    ${SELECTOR_SETTINGS_SMS_SERVER_HOST_1_INPUT}    ${server_host_1}

    ${server_host_2}=    Get Text From Xpath    ${SELECTOR_SETTINGS_SMS_SERVER_HOST_2_INPUT}
    Fill Text    ${SELECTOR_SETTINGS_SMS_SERVER_HOST_2_INPUT}    ${EMPTY}
    Fill Text    ${SELECTOR_SETTINGS_SMS_SERVER_HOST_2_INPUT}    ${server_host_2}

    ${server_host_3}=    Get Text From Xpath    ${SELECTOR_SETTINGS_SMS_SERVER_HOST_3_INPUT}
    Fill Text    ${SELECTOR_SETTINGS_SMS_SERVER_HOST_3_INPUT}    ${EMPTY}
    Fill Text    ${SELECTOR_SETTINGS_SMS_SERVER_HOST_3_INPUT}    ${server_host_3}

    ${server_host_4}=    Get Text From Xpath    ${SELECTOR_SETTINGS_SMS_SERVER_HOST_4_INPUT}
    Fill Text    ${SELECTOR_SETTINGS_SMS_SERVER_HOST_4_INPUT}    ${EMPTY}
    Fill Text    ${SELECTOR_SETTINGS_SMS_SERVER_HOST_4_INPUT}    ${server_host_4}

    ${activation_id}=    Get Text From Xpath    ${SELECTOR_SETTINGS_SMS_ACTIVATION_ID_INPUT}
    Fill Text    ${SELECTOR_SETTINGS_SMS_ACTIVATION_ID_INPUT}    ${EMPTY}
    Fill Text    ${SELECTOR_SETTINGS_SMS_ACTIVATION_ID_INPUT}    ${activation_id}

    Select Options By    ${SELECTOR_SETTINGS_SMS_SMS_SEND_VALIDITY_TIME_DROPDOWN}    value    3

    Check Checkbox    ${SELECTOR_SETTINGS_SMS_DEBUG_GSM_MODEM_CHECKBOX}
    # Checkbox Should Be Selected    ${SELECTOR_SETTINGS_SMS_DEBUG_GSM_MODEM_CHECKBOX}

    ${button_result}=    Action Button Or Cancel Button
    ...    ${SELECTOR_SETTINGS_SMS_SAVE_BUTTON}
    ...    ${SELECTOR_SETTINGS_SMS_CANCEL_BUTTON}
    ...    ${save}
    Log To Console    ${button_result}

Settings System Information Synchronization QA-ID
    [Arguments]    ${save}

    Go to settings

    Browser.Click    ${selector_settings_system_btn}
    Browser.Click    ${selector_settings_system_synchronization_item}

    Check Checkbox    ${SELECTOR_SETTINGS_SYNCHRO_CALENDAR_CHECKBOX}
    Check Checkbox    ${SELECTOR_SETTINGS_SYNCHRO_DISABLE_WEBVISION_CALENDAR_CHECKBOX}
    Check Checkbox    ${SELECTOR_SETTINGS_SYNCHRO_STATE_TEXTS_CHECKBOX}
    Check Checkbox    ${SELECTOR_SETTINGS_SYNCHRO_TIME_TABLES_CHECKBOX}
    Check Checkbox    ${SELECTOR_SETTINGS_SYNCHRO_USER_RIGHTS_CHECKBOX}
    Check Checkbox    ${SELECTOR_SETTINGS_SYNCHRO_ALARM_GROUPS_CHECKBOX}

    Uncheck Checkbox    ${SELECTOR_SETTINGS_SYNCHRO_CALENDAR_CHECKBOX}
    Uncheck Checkbox    ${SELECTOR_SETTINGS_SYNCHRO_DISABLE_WEBVISION_CALENDAR_CHECKBOX}
    Uncheck Checkbox    ${SELECTOR_SETTINGS_SYNCHRO_STATE_TEXTS_CHECKBOX}
    Uncheck Checkbox    ${SELECTOR_SETTINGS_SYNCHRO_TIME_TABLES_CHECKBOX}
    Uncheck Checkbox    ${SELECTOR_SETTINGS_SYNCHRO_USER_RIGHTS_CHECKBOX}
    Uncheck Checkbox    ${SELECTOR_SETTINGS_SYNCHRO_ALARM_GROUPS_CHECKBOX}

    ${button_result}=    Action Button Or Cancel Button
    ...    ${SELECTOR_SETTINGS_SYNCHRO_SAVE_BUTTON}
    ...    ${SELECTOR_SETTINGS_SYNCHRO_CANCEL_BUTTON}
    ...    ${save}
    Log To Console    ${button_result}

Settings System Backup QA-ID
    [Arguments]    ${save}

    Go to settings

    Browser.Click    ${selector_settings_system_btn}
    Browser.Click    ${SELECTOR_SETTINGS_BACKUP_BUTTON}

    IF    $save==1 or $save=='save' or $save=='Save'
        Browser.Click    ${SELECTOR_SETTINGS_SYSTEM_BACKUP_START_BUTTON}
    ELSE
        Browser.Click    ${SELECTOR_SETTINGS_SYSTEM_BACKUP_CANCEL_BUTTON}
    END

Settings Network IP QA-ID
    [Arguments]    ${save}
    ${possible_values}=    Create List    254    252    248    240    224    192    128    0
    ${list_length}=    Get Length    ${possible_values}
    ${mask_octets}=    Set Variable    255.255.255.
    ${random_index}=    Evaluate    random.randint(0, ${list_length} - 1)
    ${random_value}=    Set Variable    ${possible_values}[${random_index}]
    ${random_mask_octet}=    Convert To String    ${possible_values}[${random_index}]
    ${random_subnet_mask}=    Set Variable    ${mask_octets}${random_mask_octet}
    ${random_port}=    Evaluate    random.randint(int('${MIN_PORT_NUMBER}'), int('${MAX_PORT_NUMBER}'))
    ${random_ip}=    Evaluate    '.'.join(map(str, random.sample(range(1, 256), 4)))

    Go to settings

    Browser.Click    ${selector_settings_network_btn}

    ${header_visible}=    Run Keyword And Return Status
    ...    Wait for Elements State
    ...    ${selector_settings_network_ip_header}
    ...    visible
    ...    timeout=2s
    IF    ${header_visible}
        Log To Console    IP-address settings header visible
    ELSE
        Log To Console    IP-address settings header NOT visible
    END

    Browser.Click    ${SELECTOR_SETTINGS_NETWORK_IP_INTERNET_GATEWAY_SELECT_0_BTN}
    Browser.Click    ${SELECTOR_SETTINGS_NETWORK_IP_INTERNET_GATEWAY_SELECT_1_BTN}
    Browser.Click    ${SELECTOR_SETTINGS_NETWORK_IP_INTERNET_GATEWAY_SELECT_2_BTN}

    Browser.Click    ${SELECTOR_SETTINGS_NETWORK_IP_INTERNET_GATEWAY_SELECT_0_BTN}

    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_IP_WAN_DHCP_ENABLE_CHECKBOX}
    Sleep    2s
    Uncheck Checkbox    ${SELECTOR_SETTINGS_NETWORK_IP_WAN_DHCP_ENABLE_CHECKBOX}

    Fill Text    ${SELECTOR_SETTINGS_NETWORK_IP_WAN_IP_INPUT}    ${random_ip}
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_IP_WAN_MASK_INPUT}    ${random_subnet_mask}
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_IP_WAN_GATEWAY_INPUT}    ${random_ip}
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_IP_WAN_DNS_INPUT}    ${random_ip}

    Fill Text    ${SELECTOR_SETTINGS_NETWORK_IP_LAN_IP_INPUT}    ${random_ip}
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_IP_LAN_GATEWAY_INPUT}    ${random_ip}
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_IP_LAN_MASK_INPUT}    ${random_subnet_mask}

    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_IP_WLAN_ENABLE_CHKBX}

    Fill text    ${SELECTOR_SETTINGS_NETWORK_IP_WLAN_IP_INPUT}    ${random_ip}
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_IP_WLAN_MASK_INPUT}    ${random_subnet_mask}
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_IP_WLAN_NETWORK_NAME_INPUT}    Fx3000:FF:ec:ff
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_IP_WLAN_NETWORK_KEY_INPUT}    ffff06qL

    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_IP_WWAN_ENABLE_CHKBX}

    Fill text    ${SELECTOR_SETTINGS_NETWORK_IP_WWAN_APN_INPUT}    apn_input
    Fill text    ${SELECTOR_SETTINGS_NETWORK_IP_WWAN_PIN_INPUT}    123456
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_IP_WWAN_HEALTH_CHECK_IP_INPUT}    health.fidleix.com
    Fill text    ${SELECTOR_SETTINGS_NETWORK_IP_WWAN_IP_INPUT}    ${random_ip}

    Fill Text    ${SELECTOR_SETTINGS_NETWORK_IP_WWAN_REMOTE_SERVER_IP_INPUT}    ${random_ip}

    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_IP_DOMAIN_LOGIN_ENABLE_CHKBX}

    Fill Text    ${SELECTOR_SETTINGS_NETWORK_IP_DOMAIN_LOGIN_PROXY_IP_INPUT}    ${random_ip}
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_IP_DOMAIN_LOGIN_SERVER_IP_INPUT}    ${random_ip}
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_IP_DOMAIN_LOGIN_DOMAIN_NAME_INPUT}    domain_name
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_IP_DOMAIN_LOGIN_USERNAME_INPUT}    domain_username
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_IP_DOMAIN_LOGIN_PASSWORD_INPUT}    domain_password

    ${button_result}=    Action Button Or Cancel Button
    ...    ${SELECTOR_SETTINGS_NETWORK_IP_SAVE_BUTTON}
    ...    ${SELECTOR_SETTINGS_NETWORK_IP_CANCEL_BUTTON}
    ...    ${save}
    Log To Console    ${button_result}

Settings Network Port QA_ID Set Port Parameters
    [Arguments]
    ...    ${port}
    ...    ${type}
    ...    ${data_code}
    ...    ${speed}
    ...    ${send_delay}
    ...    ${address}
    ...    ${max_masters}
    ...    ${mbus_send_delay}

    Go to settings

    Browser.Click    ${selector_settings_network_btn}

    ${header_visible}=    Run Keyword And Return Status
    ...    Wait for Elements State
    ...    ${selector_settings_network_ip_header}
    ...    visible
    ...    timeout=2s
    IF    ${header_visible}
        Log To Console    IP-address settings header visible
    ELSE
        Log To Console    IP-address settings header NOT visible
    END

    Browser.Click    ${selector_settings_network_port_item}
    ${header_visible}=    Run Keyword And Return Status
    ...    Wait for Elements State
    ...    ${selector_settings_network_port_header}
    ...    visible
    ...    timeout=2s
    IF    ${header_visible}
        Log To Console    Port settings header visible
    ELSE
        Log To Console    Port settings header NOT visible
    END

    IF    '$port' == '0'
        Log To Console    Port 0 is MBUS port by default. Setting delay...
        Fill Text    ${SELECTOR_SETTINGS_NETWORK_PORTS_MBUS_SEND_DELAY}    ${mbus_send_delay}
    ELSE IF    $port == '1'
        Log To Console    Port 1 is Modem port by default. Setting speed...
        Browser.Click    ${SELECTOR_SETTINGS_NETWORK_PORTS_PORT1_BAUD_RATE}
        IF    '$speed' == '9600'
            Browser.Click    ${SELECTOR_DROPDOWN_OPTION_9600}
        ELSE IF    '$speed' == '19200'
            Browser.Click    ${SELECTOR_DROPDOWN_OPTION_19200}
        ELSE IF    '$speed' == '38400'
            Browser.Click    ${SELECTOR_DROPDOWN_OPTION_38400}
        ELSE IF    '$speed' == '57600
            Browser.Click    ${SELECTOR_DROPDOWN_OPTION_57600}
        ELSE IF    '$speed' == '115200'
            Browser.Click    ${SELECTOR_DROPDOWN_OPTION_115200}
        ELSE
            Log To Console
            ...    Port 1 is Modem port by default. Speed is not correct. Allowed options: 9600, 19200, 35400, 57600, 115200
        END
    ELSE IF    $port == 3 or $port == 4 or $port == 5
        # Physical ports settings

        Log To Console    Port ${port} is a physical port. Applying settings...

        # Type setting
        ${selector_port_type_dropdown}=    Set Variable
        ...    xpath=//*[@data-qa-id='settings-network-ports-port${port}-usage']
        Wait For Elements State    ${selector_port_type_dropdown}    visible    timeout=2s
        Browser.Click    ${selector_port_type_dropdown}

        ${type_lowercase}=    Convert To Lowercase    ${type}
        IF    $type_lowercase == 'free'
            ${selector_port_type_dropdown_option}=    Set Variable
            ...    xpath=//*[@data-qa-id='settings-network-ports-port${port}-usage-option1']
        ELSE IF    $type_lowercase == 'gsm modem'
            ${selector_port_type_dropdown_option}=    Set Variable
            ...    xpath=//*[@data-qa-id='settings-network-ports-port${port}-usage-option2']
        ELSE IF    $type_lowercase == 'modbus rtu'
            ${selector_port_type_dropdown_option}=    Set Variable
            ...    xpath=//*[@data-qa-id='settings-network-ports-port${port}-usage-option3']
        ELSE IF    $type_lowercase == 'modbus rtu server'
            ${selector_port_type_dropdown_option}=    Set Variable
            ...    xpath=//*[@data-qa-id='settings-network-ports-port${port}-usage-option4']
        ELSE
            Log To Console
            ...    Port ${port} is a physical port. Type is not correct. Allowed options: Free, GSM modem, Modbus RTU, Modbus RTU Server
        END

        Wait For Elements State    ${selector_port_type_dropdown_option}    visible    timeout=2s
        Browser.Click    ${selector_port_type_dropdown_option}

        # Data code setting
        ${selector_port_mode_dropdown}=    Set Variable
        ...    xpath=//*[@data-qa-id='settings-network-ports-port${port}-mode']
        Wait For Elements State    ${selector_port_mode_dropdown}    visible    timeout=2s
        Browser.Click    ${selector_port_mode_dropdown}

        ${mode_lowercase}=    Convert To Lowercase    ${data_code}
        IF    $mode_lowercase == 'n82'
            ${selector_port_mode_dropdown_option}=    Set Variable
            ...    xpath=//*[@data-qa-id='settings-network-ports-port${port}-usage-option1']
        ELSE IF    $mode_lowercase == 'n81'
            ${selector_port_mode_dropdown_option}=    Set Variable
            ...    xpath=//*[@data-qa-id='settings-network-ports-port${port}-usage-option2']
        ELSE IF    $mode_lowercase == 'e82'
            ${selector_port_mode_dropdown_option}=    Set Variable
            ...    xpath=//*[@data-qa-id='settings-network-ports-port${port}-usage-option3']
        ELSE IF    $mode_lowercase == 'e81'
            ${selector_port_mode_dropdown_option}=    Set Variable
            ...    xpath=//*[@data-qa-id='settings-network-ports-port${port}-usage-option4']
        ELSE IF    $mode_lowercase == 'o82'
            ${selector_port_mode_dropdown_option}=    Set Variable
            ...    xpath=//*[@data-qa-id='settings-network-ports-port${port}-usage-option5']
        ELSE IF    $mode_lowercase == 'o81'
            ${selector_port_mode_dropdown_option}=    Set Variable
            ...    xpath=//*[@data-qa-id='settings-network-ports-port${port}-usage-option6']
        ELSE
            Log To Console    Port ${port} is a physical port. Data code is not correct. Allowed options: N/E/O 81/82
        END

        Wait For Elements State    ${selector_port_mode_dropdown_option}    visible    timeout=2s
        Browser.Click    ${selector_port_mode_dropdown_option}

        # Speed setting

        ${selector_port_speed_dropdown}=    Set Variable
        ...    xpath=//*[@data-qa-id='settings-network-ports-port${port}-baud-rate']
        Wait For Elements State    ${selector_port_speed_dropdown}    visible    timeout=2s
        Browser.Click    ${selector_port_speed_dropdown}

        IF    $speed == '9600'
            ${selector_port_speed_dropdown}=    Set Variable
            ...    xpath=//*[@data-qa-id='settings-network-ports-port${port}-baud-rate-option1']
        ELSE IF    $speed == '19200'
            ${selector_port_speed_dropdown}=    Set Variable
            ...    xpath=//*[@data-qa-id='settings-network-ports-port${port}-baud-rate-option2']
        ELSE IF    $speed == '38400'
            ${selector_port_speed_dropdown}=    Set Variable
            ...    xpath=//*[@data-qa-id='settings-network-ports-port${port}-baud-rate-option3']
        ELSE IF    $speed == '57600'
            ${selector_port_speed_dropdown}=    Set Variable
            ...    xpath=//*[@data-qa-id='settings-network-ports-port${port}-baud-rate-option4']
        ELSE IF    $speed == '115200'
            ${selector_port_speed_dropdown}=    Set Variable
            ...    xpath=//*[@data-qa-id='settings-network-ports-port${port}-baud-rate-option5']
        ELSE
            Log To Console
            ...    Port 1 is physical port. Speed is not correct. Allowed options:
            ...    9600, 19200, 35400, 57600, 115200
        END

        # Address or send delay setting

        IF    $type_lowercase == 'modbus rtu server'
            ${selector_port_address_input}=    Set Variable
            ...    xpath=//*[@data-qa-id='settings-network-ports-port${port}-address']
            Wait For Elements State    ${selector_port_address_input}
            Fill Text    ${selector_port_address_input}    ${address}
        ELSE IF    $type_lowercase == 'modbus rtu'
            ${selector_port_send_delay_input}=    Set Variable
            ...    xpath=//*[@data-qa-id='settings-network-ports-port${port}-send-delay']
            Wait For Elements State    ${selector_port_send_delay_input}
            Fill Text    ${selector_port_send_delay_input}    ${send_delay}
        END

        # END OF Physical ports settings
    ELSE IF    $port == '6' or $port == '7' or $port == '8' or $port == '9' or $port == '10'
        # Virtual ports settings

        Log To Console    Port ${port} is a physical port. Applying settings...

        # Type setting
        ${selector_port_type_dropdown}=    Set Variable
        ...    xpath=//*[@data-qa-id='settings-network-ports-port${port}-usage']
        Wait For Elements State    ${selector_port_type_dropdown}    visible    timeout=2s
        Browser.Click    ${selector_port_type_dropdown}

        ${type_lowercase}=    Convert To Lowercase    ${type}
        IF    $type_lowercase == 'free'
            ${selector_port_type_dropdown_option}=    Set Variable
            ...    xpath=//*[@data-qa-id='settings-network-ports-port${port}-usage-option1']
        ELSE IF    $type_lowercase == 'modbus udp'
            ${selector_port_type_dropdown_option}=    Set Variable
            ...    xpath=//*[@data-qa-id='settings-network-ports-port${port}-usage-option2']
        ELSE IF    $type_lowercase == 'modbus tcp'
            ${selector_port_type_dropdown_option}=    Set Variable
            ...    xpath=//*[@data-qa-id='settings-network-ports-port${port}-usage-option3']
        ELSE IF    $type_lowercase == 'modbus over tcp'
            ${selector_port_type_dropdown_option}=    Set Variable
            ...    xpath=//*[@data-qa-id='settings-network-ports-port${port}-usage-option4']
        ELSE IF    $type_lowercase == 'mbus'
            ${selector_port_type_dropdown_option}=    Set Variable
            ...    xpath=//*[@data-qa-id='settings-network-ports-port${port}-usage-option5']
        ELSE
            Log To Console
            ...    Port ${port} is a virtual port. Type is not correct. Allowed options: Free, Modbus UDP, Modbus TCP, Modbus over TCP, MBUS
        END

        Wait For Elements State    ${selector_port_type_dropdown_option}    visible    timeout=2s
        Browser.Click    ${selector_port_type_dropdown_option}

        # Send delay setting

        IF    $type_lowercase == 'modbus udp' or $type_lowercase == 'modbus tcp' or $type_lowercase == 'modbus over tcp'
            ${selector_port_send_delay_input}=    Set Variable
            ...    xpath=//*[@data-qa-id='settings-network-ports-port${port}-send-delay']
            Wait For Elements State    ${selector_port_send_delay_input}
            Fill Text    ${selector_port_send_delay_input}    ${send_delay}
        END

        # END OF Virtual ports settings
    END

Settings Network Port QA-ID
    [Arguments]    ${save}
    Go to settings

    Browser.Click    ${selector_settings_network_btn}

    ${header_visible}=    Run Keyword And Return Status
    ...    Wait for Elements State
    ...    ${selector_settings_network_ip_header}
    ...    visible
    ...    timeout=2s
    IF    ${header_visible}
        Log To Console    IP-address settings header visible
    ELSE
        Log To Console    IP-address settings header NOT visible
    END

    Browser.Click    ${selector_settings_network_port_item}
    ${header_visible}=    Run Keyword And Return Status
    ...    Wait for Elements State
    ...    ${selector_settings_network_port_header}
    ...    visible
    ...    timeout=2s
    IF    ${header_visible}
        Log To Console    Port settings header visible
    ELSE
        Log To Console    Port settings header NOT visible
    END

    # Port 1
    # Baud rate
    Browser.Click    ${SELECTOR_SETTINGS_NETWORK_PORTS_PORT1_BAUD_RATE}
    Browser.Click    ${SELECTOR_DROPDOWN_OPTION_19200}

    Browser.Click    ${SELECTOR_SETTINGS_NETWORK_PORTS_PORT1_BAUD_RATE}
    Browser.Click    ${SELECTOR_DROPDOWN_OPTION_38400}

    Browser.Click    ${SELECTOR_SETTINGS_NETWORK_PORTS_PORT1_BAUD_RATE}
    Browser.Click    ${SELECTOR_DROPDOWN_OPTION_57600}

    Browser.Click    ${SELECTOR_SETTINGS_NETWORK_PORTS_PORT1_BAUD_RATE}
    Browser.Click    ${SELECTOR_DROPDOWN_OPTION_115200}

    Browser.Click    ${SELECTOR_SETTINGS_NETWORK_PORTS_PORT1_BAUD_RATE}
    Browser.Click    ${SELECTOR_DROPDOWN_OPTION_9600}

    # Port 3
    # Port usage
    Browser.Click    ${SELECTOR_SETTINGS_NETWORK_PORTS_PORT3_USAGE}
    Browser.Click    ${SELECTOR_DROPDOWN_OPTION_GSM_MODEM}

    Browser.Click    ${SELECTOR_SETTINGS_NETWORK_PORTS_PORT3_USAGE}
    Browser.Click    ${SELECTOR_DROPDOWN_OPTION_MODBUS_RTU}

    Browser.Click    ${SELECTOR_SETTINGS_NETWORK_PORTS_PORT3_USAGE}
    Browser.Click    ${SELECTOR_DROPDOWN_OPTION_MODBUS_RTU_SERVER}

    Browser.Click    ${SELECTOR_SETTINGS_NETWORK_PORTS_PORT3_USAGE}
    Browser.Click    ${SELECTOR_DROPDOWN_OPTION_FREE}

    Browser.Click    ${SELECTOR_SETTINGS_NETWORK_PORTS_PORT3_USAGE}
    Browser.Click    ${SELECTOR_DROPDOWN_OPTION_MODBUS_RTU}

    # Port mode
    Browser.Click    ${SELECTOR_SETTINGS_NETWORK_PORTS_PORT3_MODE}
    Browser.Click    ${SELECTOR_DROPDOWN_OPTION_N82}

    Browser.Click    ${SELECTOR_SETTINGS_NETWORK_PORTS_PORT3_MODE}
    Browser.Click    ${SELECTOR_DROPDOWN_OPTION_N81}

    Browser.Click    ${SELECTOR_SETTINGS_NETWORK_PORTS_PORT3_MODE}
    Browser.Click    ${SELECTOR_DROPDOWN_OPTION_E82}

    Browser.Click    ${SELECTOR_SETTINGS_NETWORK_PORTS_PORT3_MODE}
    Browser.Click    ${SELECTOR_DROPDOWN_OPTION_E81}

    Browser.Click    ${SELECTOR_SETTINGS_NETWORK_PORTS_PORT3_MODE}
    Browser.Click    ${SELECTOR_DROPDOWN_OPTION_O82}

    Browser.Click    ${SELECTOR_SETTINGS_NETWORK_PORTS_PORT3_MODE}
    Browser.Click    ${SELECTOR_DROPDOWN_OPTION_O81}

    Browser.Click    ${SELECTOR_SETTINGS_NETWORK_PORTS_PORT3_MODE}
    Browser.Click    ${SELECTOR_DROPDOWN_OPTION_N82}

    # Baud rate
    Browser.Click    ${SELECTOR_SETTINGS_NETWORK_PORTS_PORT3_BAUD_RATE}
    Browser.Click    ${SELECTOR_DROPDOWN_OPTION_9600}

    Browser.Click    ${SELECTOR_SETTINGS_NETWORK_PORTS_PORT3_BAUD_RATE}
    Browser.Click    ${SELECTOR_DROPDOWN_OPTION_19200}

    Browser.Click    ${SELECTOR_SETTINGS_NETWORK_PORTS_PORT3_BAUD_RATE}
    Browser.Click    ${SELECTOR_DROPDOWN_OPTION_38400}

    Browser.Click    ${SELECTOR_SETTINGS_NETWORK_PORTS_PORT3_BAUD_RATE}
    Browser.Click    ${SELECTOR_DROPDOWN_OPTION_57600}

    Browser.Click    ${SELECTOR_SETTINGS_NETWORK_PORTS_PORT3_BAUD_RATE}
    Browser.Click    ${SELECTOR_DROPDOWN_OPTION_115200}

    Browser.Click    ${SELECTOR_SETTINGS_NETWORK_PORTS_PORT3_BAUD_RATE}
    Browser.Click    ${SELECTOR_DROPDOWN_OPTION_57600}

    # Send delay
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_PORTS_PORT3_SEND_DELAY}    123
    # Modbus server
    Browser.Click    ${SELECTOR_SETTINGS_NETWORK_PORTS_PORT3_USAGE}
    Browser.Click    ${SELECTOR_DROPDOWN_OPTION_MODBUS_RTU_SERVER}
    # Address
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_PORTS_PORT3_ADDRESS}    247
    # Return to free state
    Browser.Click    ${SELECTOR_SETTINGS_NETWORK_PORTS_PORT3_USAGE}
    Browser.Click    ${SELECTOR_DROPDOWN_OPTION_FREE}

    # Port 4
    # Port usage
    Browser.Click    ${SELECTOR_SETTINGS_NETWORK_PORTS_PORT4_USAGE}
    Browser.Click    ${SELECTOR_DROPDOWN_OPTION_GSM_MODEM}
    Browser.Click    ${SELECTOR_SETTINGS_NETWORK_PORTS_PORT4_USAGE}
    Browser.Click    ${SELECTOR_DROPDOWN_OPTION_MODBUS_RTU}
    Browser.Click    ${SELECTOR_SETTINGS_NETWORK_PORTS_PORT4_USAGE}
    Browser.Click    ${SELECTOR_DROPDOWN_OPTION_MODBUS_RTU_SERVER}
    Browser.Click    ${SELECTOR_SETTINGS_NETWORK_PORTS_PORT4_USAGE}
    Browser.Click    ${SELECTOR_DROPDOWN_OPTION_FREE}
    Browser.Click    ${SELECTOR_SETTINGS_NETWORK_PORTS_PORT4_USAGE}
    Browser.Click    ${SELECTOR_DROPDOWN_OPTION_MODBUS_RTU}

    # Port mode
    Browser.Click    ${SELECTOR_SETTINGS_NETWORK_PORTS_PORT4_MODE}
    Browser.Click    ${SELECTOR_DROPDOWN_OPTION_N82}

    Browser.Click    ${SELECTOR_SETTINGS_NETWORK_PORTS_PORT4_MODE}
    Browser.Click    ${SELECTOR_DROPDOWN_OPTION_N81}

    Browser.Click    ${SELECTOR_SETTINGS_NETWORK_PORTS_PORT4_MODE}
    Browser.Click    ${SELECTOR_DROPDOWN_OPTION_E82}

    Browser.Click    ${SELECTOR_SETTINGS_NETWORK_PORTS_PORT4_MODE}
    Browser.Click    ${SELECTOR_DROPDOWN_OPTION_E81}

    Browser.Click    ${SELECTOR_SETTINGS_NETWORK_PORTS_PORT4_MODE}
    Browser.Click    ${SELECTOR_DROPDOWN_OPTION_O82}

    Browser.Click    ${SELECTOR_SETTINGS_NETWORK_PORTS_PORT4_MODE}
    Browser.Click    ${SELECTOR_DROPDOWN_OPTION_O81}

    Browser.Click    ${SELECTOR_SETTINGS_NETWORK_PORTS_PORT4_MODE}
    Browser.Click    ${SELECTOR_DROPDOWN_OPTION_N82}

    # Baud rate
    Browser.Click    ${SELECTOR_SETTINGS_NETWORK_PORTS_PORT4_BAUD_RATE}
    Browser.Click    ${SELECTOR_DROPDOWN_OPTION_9600}

    Browser.Click    ${SELECTOR_SETTINGS_NETWORK_PORTS_PORT4_BAUD_RATE}
    Browser.Click    ${SELECTOR_DROPDOWN_OPTION_19200}

    Browser.Click    ${SELECTOR_SETTINGS_NETWORK_PORTS_PORT4_BAUD_RATE}
    Browser.Click    ${SELECTOR_DROPDOWN_OPTION_38400}

    Browser.Click    ${SELECTOR_SETTINGS_NETWORK_PORTS_PORT4_BAUD_RATE}
    Browser.Click    ${SELECTOR_DROPDOWN_OPTION_57600}

    Browser.Click    ${SELECTOR_SETTINGS_NETWORK_PORTS_PORT4_BAUD_RATE}
    Browser.Click    ${SELECTOR_DROPDOWN_OPTION_115200}

    Browser.Click    ${SELECTOR_SETTINGS_NETWORK_PORTS_PORT4_BAUD_RATE}
    Browser.Click    ${SELECTOR_DROPDOWN_OPTION_57600}

    # Send delay
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_PORTS_PORT4_SEND_DELAY}    321

    # Modbus server
    Browser.Click    ${SELECTOR_SETTINGS_NETWORK_PORTS_PORT4_USAGE}
    Browser.Click    ${SELECTOR_DROPDOWN_OPTION_MODBUS_RTU_SERVER}

    # Address
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_PORTS_PORT4_ADDRESS}    246

    # Return to free state
    Browser.Click    ${SELECTOR_SETTINGS_NETWORK_PORTS_PORT4_USAGE}
    Browser.Click    ${SELECTOR_DROPDOWN_OPTION_FREE}

    # Port 5
    # Port usage
    Browser.Click    ${SELECTOR_SETTINGS_NETWORK_PORTS_PORT5_USAGE}
    Browser.Click    ${SELECTOR_DROPDOWN_OPTION_GSM_MODEM}
    Browser.Click    ${SELECTOR_SETTINGS_NETWORK_PORTS_PORT5_USAGE}
    Browser.Click    ${SELECTOR_DROPDOWN_OPTION_MODBUS_RTU}
    Browser.Click    ${SELECTOR_SETTINGS_NETWORK_PORTS_PORT5_USAGE}
    Browser.Click    ${SELECTOR_DROPDOWN_OPTION_MODBUS_RTU_SERVER}
    Browser.Click    ${SELECTOR_SETTINGS_NETWORK_PORTS_PORT5_USAGE}
    Browser.Click    ${SELECTOR_DROPDOWN_OPTION_FREE}
    Browser.Click    ${SELECTOR_SETTINGS_NETWORK_PORTS_PORT5_USAGE}
    Browser.Click    ${SELECTOR_DROPDOWN_OPTION_MODBUS_RTU}

    # Port mode
    Browser.Click    ${SELECTOR_SETTINGS_NETWORK_PORTS_PORT5_MODE}
    Browser.Click    ${SELECTOR_DROPDOWN_OPTION_N82}

    Browser.Click    ${SELECTOR_SETTINGS_NETWORK_PORTS_PORT5_MODE}
    Browser.Click    ${SELECTOR_DROPDOWN_OPTION_N81}

    Browser.Click    ${SELECTOR_SETTINGS_NETWORK_PORTS_PORT5_MODE}
    Browser.Click    ${SELECTOR_DROPDOWN_OPTION_E82}

    Browser.Click    ${SELECTOR_SETTINGS_NETWORK_PORTS_PORT5_MODE}
    Browser.Click    ${SELECTOR_DROPDOWN_OPTION_E81}

    Browser.Click    ${SELECTOR_SETTINGS_NETWORK_PORTS_PORT5_MODE}
    Browser.Click    ${SELECTOR_DROPDOWN_OPTION_O82}

    Browser.Click    ${SELECTOR_SETTINGS_NETWORK_PORTS_PORT5_MODE}
    Browser.Click    ${SELECTOR_DROPDOWN_OPTION_O81}

    Browser.Click    ${SELECTOR_SETTINGS_NETWORK_PORTS_PORT5_MODE}
    Browser.Click    ${SELECTOR_DROPDOWN_OPTION_N82}

    # Baud rate
    Browser.Click    ${SELECTOR_SETTINGS_NETWORK_PORTS_PORT5_BAUD_RATE}
    Browser.Click    ${SELECTOR_DROPDOWN_OPTION_9600}

    Browser.Click    ${SELECTOR_SETTINGS_NETWORK_PORTS_PORT5_BAUD_RATE}
    Browser.Click    ${SELECTOR_DROPDOWN_OPTION_19200}

    Browser.Click    ${SELECTOR_SETTINGS_NETWORK_PORTS_PORT5_BAUD_RATE}
    Browser.Click    ${SELECTOR_DROPDOWN_OPTION_38400}

    Browser.Click    ${SELECTOR_SETTINGS_NETWORK_PORTS_PORT5_BAUD_RATE}
    Browser.Click    ${SELECTOR_DROPDOWN_OPTION_57600}

    Browser.Click    ${SELECTOR_SETTINGS_NETWORK_PORTS_PORT5_BAUD_RATE}
    Browser.Click    ${SELECTOR_DROPDOWN_OPTION_115200}

    Browser.Click    ${SELECTOR_SETTINGS_NETWORK_PORTS_PORT5_BAUD_RATE}
    Browser.Click    ${SELECTOR_DROPDOWN_OPTION_57600}

    # Send delay
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_PORTS_PORT5_SEND_DELAY}    321

    # Modbus server
    Browser.Click    ${SELECTOR_SETTINGS_NETWORK_PORTS_PORT5_USAGE}
    Browser.Click    ${SELECTOR_DROPDOWN_OPTION_MODBUS_RTU_SERVER}

    # Address
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_PORTS_PORT5_ADDRESS}    246

    # Return to free state
    Browser.Click    ${SELECTOR_SETTINGS_NETWORK_PORTS_PORT5_USAGE}
    Browser.Click    ${SELECTOR_DROPDOWN_OPTION_FREE}

    # Port 6
    # Port usage
    Browser.Click    ${SELECTOR_SETTINGS_NETWORK_PORTS_PORT6_USAGE}
    Browser.Click    ${SELECTOR_DROPDOWN_OPTION_MODBUS_UDP}

    # Send delay
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_PORTS_PORT6_SEND_DELAY}    666

    Browser.Click    ${SELECTOR_SETTINGS_NETWORK_PORTS_PORT6_USAGE}
    Browser.Click    ${SELECTOR_DROPDOWN_OPTION_MODBUS_TCP}
    Browser.Click    ${SELECTOR_SETTINGS_NETWORK_PORTS_PORT6_USAGE}
    Browser.Click    ${SELECTOR_DROPDOWN_OPTION_MODBUS_OVER_TCP}
    Browser.Click    ${SELECTOR_SETTINGS_NETWORK_PORTS_PORT6_USAGE}
    Browser.Click    ${SELECTOR_DROPDOWN_OPTION_MBUS}
    Browser.Click    ${SELECTOR_SETTINGS_NETWORK_PORTS_PORT6_USAGE}
    Browser.Click    ${SELECTOR_DROPDOWN_OPTION_FREE}

    # Return to free state
    Browser.Click    ${SELECTOR_SETTINGS_NETWORK_PORTS_PORT6_USAGE}
    Browser.Click    ${SELECTOR_DROPDOWN_OPTION_FREE}

    # Port 7
    # Port usage
    Browser.Click    ${SELECTOR_SETTINGS_NETWORK_PORTS_PORT7_USAGE}
    Browser.Click    ${SELECTOR_DROPDOWN_OPTION_MODBUS_UDP}

    # Send delay
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_PORTS_PORT7_SEND_DELAY}    777

    Browser.Click    ${SELECTOR_SETTINGS_NETWORK_PORTS_PORT7_USAGE}
    Browser.Click    ${SELECTOR_DROPDOWN_OPTION_MODBUS_TCP}
    Browser.Click    ${SELECTOR_SETTINGS_NETWORK_PORTS_PORT7_USAGE}
    Browser.Click    ${SELECTOR_DROPDOWN_OPTION_MODBUS_OVER_TCP}
    Browser.Click    ${SELECTOR_SETTINGS_NETWORK_PORTS_PORT7_USAGE}
    Browser.Click    ${SELECTOR_DROPDOWN_OPTION_MBUS}
    Browser.Click    ${SELECTOR_SETTINGS_NETWORK_PORTS_PORT7_USAGE}
    Browser.Click    ${SELECTOR_DROPDOWN_OPTION_FREE}

    # Return to free state
    Browser.Click    ${SELECTOR_SETTINGS_NETWORK_PORTS_PORT7_USAGE}
    Browser.Click    ${SELECTOR_DROPDOWN_OPTION_FREE}

    # Port 8
    # Port usage
    Browser.Click    ${SELECTOR_SETTINGS_NETWORK_PORTS_PORT8_USAGE}
    Browser.Click    ${SELECTOR_DROPDOWN_OPTION_MODBUS_UDP}

    # Send delay
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_PORTS_PORT8_SEND_DELAY}    888

    Browser.Click    ${SELECTOR_SETTINGS_NETWORK_PORTS_PORT8_USAGE}
    Browser.Click    ${SELECTOR_DROPDOWN_OPTION_MODBUS_TCP}
    Browser.Click    ${SELECTOR_SETTINGS_NETWORK_PORTS_PORT8_USAGE}
    Browser.Click    ${SELECTOR_DROPDOWN_OPTION_MODBUS_OVER_TCP}
    Browser.Click    ${SELECTOR_SETTINGS_NETWORK_PORTS_PORT8_USAGE}
    Browser.Click    ${SELECTOR_DROPDOWN_OPTION_MBUS}
    Browser.Click    ${SELECTOR_SETTINGS_NETWORK_PORTS_PORT8_USAGE}
    Browser.Click    ${SELECTOR_DROPDOWN_OPTION_FREE}

    # Return to free state
    Browser.Click    ${SELECTOR_SETTINGS_NETWORK_PORTS_PORT8_USAGE}
    Browser.Click    ${SELECTOR_DROPDOWN_OPTION_FREE}

    # Port 9
    # Port usage
    Browser.Click    ${SELECTOR_SETTINGS_NETWORK_PORTS_PORT9_USAGE}
    Browser.Click    ${SELECTOR_DROPDOWN_OPTION_MODBUS_UDP}

    # Send delay
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_PORTS_PORT9_SEND_DELAY}    999

    Browser.Click    ${SELECTOR_SETTINGS_NETWORK_PORTS_PORT9_USAGE}
    Browser.Click    ${SELECTOR_DROPDOWN_OPTION_MODBUS_TCP}
    Browser.Click    ${SELECTOR_SETTINGS_NETWORK_PORTS_PORT9_USAGE}
    Browser.Click    ${SELECTOR_DROPDOWN_OPTION_MODBUS_OVER_TCP}
    Browser.Click    ${SELECTOR_SETTINGS_NETWORK_PORTS_PORT9_USAGE}
    Browser.Click    ${SELECTOR_DROPDOWN_OPTION_MBUS}
    Browser.Click    ${SELECTOR_SETTINGS_NETWORK_PORTS_PORT9_USAGE}
    Browser.Click    ${SELECTOR_DROPDOWN_OPTION_FREE}

    # Return to free state
    Browser.Click    ${SELECTOR_SETTINGS_NETWORK_PORTS_PORT9_USAGE}
    Browser.Click    ${SELECTOR_DROPDOWN_OPTION_FREE}
    # Port 9
    # Port usage
    Browser.Click    ${SELECTOR_SETTINGS_NETWORK_PORTS_PORT10_USAGE}
    Browser.Click    ${SELECTOR_DROPDOWN_OPTION_MODBUS_UDP}

    # Send delay
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_PORTS_PORT10_SEND_DELAY}    1010
    Browser.Click    ${SELECTOR_SETTINGS_NETWORK_PORTS_PORT10_USAGE}
    Browser.Click    ${SELECTOR_DROPDOWN_OPTION_MODBUS_TCP}

    Browser.Click    ${SELECTOR_SETTINGS_NETWORK_PORTS_PORT10_USAGE}
    Browser.Click    ${SELECTOR_DROPDOWN_OPTION_MODBUS_OVER_TCP}

    Browser.Click    ${SELECTOR_SETTINGS_NETWORK_PORTS_PORT10_USAGE}
    Browser.Click    ${SELECTOR_DROPDOWN_OPTION_MBUS}
    Browser.Click    ${SELECTOR_SETTINGS_NETWORK_PORTS_PORT10_USAGE}
    Browser.Click    ${SELECTOR_DROPDOWN_OPTION_FREE}

    # Return to free state
    Browser.Click    ${SELECTOR_SETTINGS_NETWORK_PORTS_PORT10_USAGE}
    Browser.Click    ${SELECTOR_DROPDOWN_OPTION_FREE}

    # Mbus delay
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_PORTS_MBUS_SEND_DELAY}    5555

    # Module move from port to port

    Browser.Click    ${SELECTOR_SETTINGS_NETWORK_PORTS_PORT3_USAGE}
    Browser.Click    ${SELECTOR_DROPDOWN_OPTION_MODBUS_RTU}

    Browser.Click    ${SELECTOR_SETTINGS_NETWORK_PORTS_PORT4_USAGE}
    Browser.Click    ${SELECTOR_DROPDOWN_OPTION_MODBUS_RTU}

    ${button_result}=    Action Button Or Cancel Button
    ...    ${SELECTOR_SETTINGS_NETWORK_PORTS_CANCEL_BUTTON_XPATH}
    ...    ${SELECTOR_SETTINGS_NETWORK_PORTS_SAVE_BUTTON_XPATH}
    ...    ${save}
    Log To Console    ${button_result}

    Browser.Click    ${SELECTOR_SETTINGS_NETWORK_PORTS_FROM_PORT_DROPDOWN}

    ${element_visible}=    Run Keyword And Return Status
    ...    Wait for Elements State
    ...    ${SELECTOR_SETTINGS_NETWORK_PORTS_OPTION_2_IN_FROM_PORT_DROPDOWN}
    ...    visible
    ...    timeout=2s
    IF    ${element_visible}
        Log To Console    Option 2 is visible
        Browser.Click    ${SELECTOR_SETTINGS_NETWORK_PORTS_OPTION_2_IN_FROM_PORT_DROPDOWN}
    ELSE
        Log To Console    Option 2 is NOT visible
    END

Settings Network Firewall QA-ID
    [Arguments]    ${save}
    Go to settings

    ${random_mask}=    Set Variable    255.255.255.0
    ${random_ip}=    Set Variable    10.10.10.10

    Browser.Click    ${selector_settings_network_btn}

    Browser.Click    ${selector_settings_network_firewall_item}

    Uncheck Checkbox    ${SELECTOR_SETTINGS_NETWORK_FIREWALL_ENABLE_CHECKBOX}
    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_FIREWALL_ENABLE_CHECKBOX}

    Uncheck Checkbox    ${SELECTOR_SETTINGS_NETWORK_FIREWALL_WWW_ENABLE_CHECKBOX}
    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_FIREWALL_WWW_ENABLE_CHECKBOX}

    Fill Text    ${SELECTOR_SETTINGS_NETWORK_FIREWALL_WWW_PORT_INPUT}    80

    Uncheck Checkbox    ${SELECTOR_SETTINGS_NETWORK_FIREWALL_WWW_PRIVATE_ADDRESS_CHECKBOX}
    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_FIREWALL_WWW_PRIVATE_ADDRESS_CHECKBOX}

    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_FIREWALL_WWW_ADDRESS1_ENABLE_CHECKBOX}
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_FIREWALL_WWW_ADDRESS1_IP_INPUT}    ${random_ip}
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_FIREWALL_WWW_ADDRESS1_MASK_INPUT}    ${random_mask}
    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_FIREWALL_WWW_ADDRESS2_ENABLE_CHECKBOX}
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_FIREWALL_WWW_ADDRESS2_IP_INPUT}    ${random_ip}
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_FIREWALL_WWW_ADDRESS2_MASK_INPUT}    ${random_mask}
    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_FIREWALL_WWW_ADDRESS3_ENABLE_CHECKBOX}
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_FIREWALL_WWW_ADDRESS3_IP_INPUT}    ${random_ip}
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_FIREWALL_WWW_ADDRESS3_MASK_INPUT}    ${random_mask}

    Uncheck Checkbox    ${SELECTOR_SETTINGS_NETWORK_FIREWALL_WEBVISION_ENABLE_CHECKBOX}
    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_FIREWALL_WEBVISION_ENABLE_CHECKBOX}

    Fill Text    ${SELECTOR_SETTINGS_NETWORK_FIREWALL_WEBVISION_PORT_INPUT}    1235

    Uncheck Checkbox    ${SELECTOR_SETTINGS_NETWORK_FIREWALL_WEBVISION_PRIVATE_ADDRESS_CHECKBOX}
    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_FIREWALL_WEBVISION_PRIVATE_ADDRESS_CHECKBOX}

    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_FIREWALL_WEBVISION_ADDRESS1_ENABLE_CHECKBOX}
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_FIREWALL_WEBVISION_ADDRESS1_IP_INPUT}    ${random_ip}
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_FIREWALL_WEBVISION_ADDRESS1_MASK_INPUT}    ${random_mask}
    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_FIREWALL_WEBVISION_ADDRESS2_ENABLE_CHECKBOX}
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_FIREWALL_WEBVISION_ADDRESS2_IP_INPUT}    ${random_ip}
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_FIREWALL_WEBVISION_ADDRESS2_MASK_INPUT}    ${random_mask}
    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_FIREWALL_WEBVISION_ADDRESS3_ENABLE_CHECKBOX}
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_FIREWALL_WEBVISION_ADDRESS3_IP_INPUT}    ${random_ip}
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_FIREWALL_WEBVISION_ADDRESS3_MASK_INPUT}    ${random_mask}

    Uncheck Checkbox    ${SELECTOR_SETTINGS_NETWORK_FIREWALL_OPENPCS_ENABLE_CHECKBOX}
    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_FIREWALL_OPENPCS_ENABLE_CHECKBOX}

    Fill Text    ${SELECTOR_SETTINGS_NETWORK_FIREWALL_OPENPCS_PORT_INPUT}    23042

    Uncheck Checkbox    ${SELECTOR_SETTINGS_NETWORK_FIREWALL_OPENPCS_PRIVATE_ADDRESS_CHECKBOX}
    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_FIREWALL_OPENPCS_PRIVATE_ADDRESS_CHECKBOX}

    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_FIREWALL_OPENPCS_ADDRESS1_ENABLE_CHECKBOX}
    # Fill Text    ${SELECTOR_SETTINGS_NETWORK_FIREWALL_OPENPCS_ADDRESS1_IP_INPUT}    ${random_ip}
    # Fill Text    ${SELECTOR_SETTINGS_NETWORK_FIREWALL_OPENPCS_ADDRESS1_MASK_INPUT}    ${random_mask}
    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_FIREWALL_OPENPCS_ADDRESS2_ENABLE_CHECKBOX}
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_FIREWALL_OPENPCS_ADDRESS2_IP_INPUT}    ${random_ip}
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_FIREWALL_OPENPCS_ADDRESS2_MASK_INPUT}    ${random_mask}
    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_FIREWALL_OPENPCS_ADDRESS3_ENABLE_CHECKBOX}
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_FIREWALL_OPENPCS_ADDRESS3_IP_INPUT}    ${random_ip}
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_FIREWALL_OPENPCS_ADDRESS3_MASK_INPUT}    ${random_mask}

    Uncheck Checkbox    ${SELECTOR_SETTINGS_NETWORK_FIREWALL_PING_ENABLE_CHECKBOX}
    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_FIREWALL_PING_ENABLE_CHECKBOX}

    Uncheck Checkbox    ${SELECTOR_SETTINGS_NETWORK_FIREWALL_PING_PRIVATE_ADDRESS_CHECKBOX}
    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_FIREWALL_PING_PRIVATE_ADDRESS_CHECKBOX}

    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_FIREWALL_PING_ADDRESS1_ENABLE_CHECKBOX}
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_FIREWALL_PING_ADDRESS1_IP_INPUT}    ${random_ip}
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_FIREWALL_PING_ADDRESS1_MASK_INPUT}    ${random_mask}
    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_FIREWALL_PING_ADDRESS2_ENABLE_CHECKBOX}
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_FIREWALL_PING_ADDRESS2_IP_INPUT}    ${random_ip}
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_FIREWALL_PING_ADDRESS2_MASK_INPUT}    ${random_mask}
    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_FIREWALL_PING_ADDRESS3_ENABLE_CHECKBOX}
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_FIREWALL_PING_ADDRESS3_IP_INPUT}    ${random_ip}
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_FIREWALL_PING_ADDRESS3_MASK_INPUT}    ${random_mask}

    Uncheck Checkbox    ${SELECTOR_SETTINGS_NETWORK_FIREWALL_SMTP_ENABLE_CHECKBOX}
    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_FIREWALL_SMTP_ENABLE_CHECKBOX}

    Fill Text    ${SELECTOR_SETTINGS_NETWORK_FIREWALL_SMTP_PORT_INPUT}    25

    Uncheck Checkbox    ${SELECTOR_SETTINGS_NETWORK_FIREWALL_SMTP_PRIVATE_ADDRESS_CHECKBOX}
    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_FIREWALL_SMTP_PRIVATE_ADDRESS_CHECKBOX}

    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_FIREWALL_SMTP_ADDRESS1_ENABLE_CHECKBOX}
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_FIREWALL_SMTP_ADDRESS1_IP_INPUT}    ${random_ip}
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_FIREWALL_SMTP_ADDRESS1_MASK_INPUT}    ${random_mask}
    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_FIREWALL_SMTP_ADDRESS2_ENABLE_CHECKBOX}
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_FIREWALL_SMTP_ADDRESS2_IP_INPUT}    ${random_ip}
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_FIREWALL_SMTP_ADDRESS2_MASK_INPUT}    ${random_mask}
    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_FIREWALL_SMTP_ADDRESS3_ENABLE_CHECKBOX}
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_FIREWALL_SMTP_ADDRESS3_IP_INPUT}    ${random_ip}
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_FIREWALL_SMTP_ADDRESS3_MASK_INPUT}    ${random_mask}

    Uncheck Checkbox    ${SELECTOR_SETTINGS_NETWORK_FIREWALL_FTP_ENABLE_CHECKBOX}
    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_FIREWALL_FTP_ENABLE_CHECKBOX}

    Uncheck Checkbox    ${SELECTOR_SETTINGS_NETWORK_FIREWALL_FTP_PRIVATE_ADDRESS_CHECKBOX}
    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_FIREWALL_FTP_PRIVATE_ADDRESS_CHECKBOX}

    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_FIREWALL_FTP_ADDRESS1_ENABLE_CHECKBOX}
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_FIREWALL_FTP_ADDRESS1_IP_INPUT}    ${random_ip}
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_FIREWALL_FTP_ADDRESS1_MASK_INPUT}    ${random_mask}
    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_FIREWALL_FTP_ADDRESS2_ENABLE_CHECKBOX}
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_FIREWALL_FTP_ADDRESS2_IP_INPUT}    ${random_ip}
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_FIREWALL_FTP_ADDRESS2_MASK_INPUT}    ${random_mask}
    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_FIREWALL_FTP_ADDRESS3_ENABLE_CHECKBOX}
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_FIREWALL_FTP_ADDRESS3_IP_INPUT}    ${random_ip}
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_FIREWALL_FTP_ADDRESS3_MASK_INPUT}    ${random_mask}

    Uncheck Checkbox    ${SELECTOR_SETTINGS_NETWORK_FIREWALL_SNTP_ENABLE_CHECKBOX}
    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_FIREWALL_SNTP_ENABLE_CHECKBOX}

    Fill text    ${SELECTOR_SETTINGS_NETWORK_FIREWALL_SNTP_PORT_INPUT}    123

    Uncheck Checkbox    ${SELECTOR_SETTINGS_NETWORK_FIREWALL_SNTP_PRIVATE_ADDRESS_CHECKBOX}
    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_FIREWALL_SNTP_PRIVATE_ADDRESS_CHECKBOX}

    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_FIREWALL_SNTP_ADDRESS1_ENABLE_CHECKBOX}
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_FIREWALL_SNTP_ADDRESS1_IP_INPUT}    ${random_ip}
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_FIREWALL_SNTP_ADDRESS1_MASK_INPUT}    ${random_mask}
    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_FIREWALL_SNTP_ADDRESS2_ENABLE_CHECKBOX}
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_FIREWALL_SNTP_ADDRESS2_IP_INPUT}    ${random_ip}
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_FIREWALL_SNTP_ADDRESS2_MASK_INPUT}    ${random_mask}
    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_FIREWALL_SNTP_ADDRESS3_ENABLE_CHECKBOX}
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_FIREWALL_SNTP_ADDRESS3_IP_INPUT}    ${random_ip}
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_FIREWALL_SNTP_ADDRESS3_MASK_INPUT}    ${random_mask}

    Uncheck Checkbox    ${SELECTOR_SETTINGS_NETWORK_FIREWALL_MODBUS_ENABLE_CHECKBOX}
    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_FIREWALL_MODBUS_ENABLE_CHECKBOX}

    Fill Text    ${SELECTOR_SETTINGS_NETWORK_FIREWALL_MODBUS_PORT_INPUT}    502

    Uncheck Checkbox    ${SELECTOR_SETTINGS_NETWORK_FIREWALL_MODBUS_PRIVATE_ADDRESS_CHECKBOX}
    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_FIREWALL_MODBUS_PRIVATE_ADDRESS_CHECKBOX}

    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_FIREWALL_MODBUS_ADDRESS1_ENABLE_CHECKBOX}
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_FIREWALL_MODBUS_ADDRESS1_IP_INPUT}    ${random_ip}
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_FIREWALL_MODBUS_ADDRESS1_MASK_INPUT}    ${random_mask}
    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_FIREWALL_MODBUS_ADDRESS2_ENABLE_CHECKBOX}
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_FIREWALL_MODBUS_ADDRESS2_IP_INPUT}    ${random_ip}
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_FIREWALL_MODBUS_ADDRESS2_MASK_INPUT}    ${random_mask}
    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_FIREWALL_MODBUS_ADDRESS3_ENABLE_CHECKBOX}
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_FIREWALL_MODBUS_ADDRESS3_IP_INPUT}    ${random_ip}
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_FIREWALL_MODBUS_ADDRESS3_MASK_INPUT}    ${random_mask}

    ${button_result}=    Action Button Or Cancel Button
    ...    ${SELECTOR_SETTINGS_NETWORK_FIREWALL_SAVE_BUTTON}
    ...    ${SELECTOR_SETTINGS_NETWORK_FIREWALL_CANCEL_BUTTON}
    ...    ${save}
    Log To Console    ${button_result}

Settings Network NAT Settings QA-ID
    [Arguments]    ${save}
    Go to settings
    ${possible_values}=    Create List    254    252    248    240    224    192    128    0
    ${list_length}=    Get Length    ${possible_values}
    ${mask_octets}=    Set Variable    255.255.255.
    ${random_index}=    Evaluate    random.randint(0, ${list_length} - 1)
    ${random_value}=    Set Variable    ${possible_values}[${random_index}]
    ${random_mask_octet}=    Convert To String    ${possible_values}[${random_index}]
    ${random_subnet_mask}=    Set Variable    ${mask_octets}${random_mask_octet}
    ${random_port}=    Evaluate    random.randint(int('${MIN_PORT_NUMBER}'), int('${MAX_PORT_NUMBER}'))
    ${random_ip}=    Evaluate    '.'.join(map(str, random.sample(range(1, 256), 4)))

    Browser.Click    ${selector_settings_network_btn}
    Browser.Click    ${selector_settings_network_nat_item}

    ${header_visible}=    Run Keyword And Return Status
    ...    Wait for Elements State
    ...    ${selector_settings_network_nat_header}
    ...    visible
    ...    timeout=2s
    IF    ${header_visible}
        Log To Console    NAT settings header visible
    ELSE
        Log To Console    NAT settings header NOT visible
    END

    Wait for Elements State    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE1_SOURCE_ADDRESS_DROPDOWN}    visible    timeout=2s

    # RULE 1    variables
    Select Options By    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE1_SOURCE_ADDRESS_DROPDOWN}    value    1
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE1_SOURCE_PORT_INPUT}    ${random_port}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE1_DEST_ADDRESS_INPUT}    ${random_ip}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE1_DEST_PORT_INPUT}    ${random_port}

    ${checkbox_checked}=    Run Keyword And Return Status
    ...    RPA.Browser.Selenium.Checkbox Should Not Be Selected
    ...    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE1_PRIVATE_ADDRESS_CHECKBOX_XPATH}
    # Log To Console    ${checkbox_checked}

    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE1_ADDRESS1_ENABLE_CHECKBOX_XPATH}
    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE1_ADDRESS2_ENABLE_CHECKBOX_XPATH}
    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE1_ADDRESS3_ENABLE_CHECKBOX_XPATH}

    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE1_ADDRESS1_IP_INPUT_XPATH}    ${random_ip}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE1_ADDRESS1_MASK_INPUT_XPATH}    ${random_subnet_mask}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE1_ADDRESS2_IP_INPUT_XPATH}    ${random_ip}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE1_ADDRESS2_MASK_INPUT_XPATH}    ${random_subnet_mask}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE1_ADDRESS3_IP_INPUT_XPATH}    ${random_ip}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE1_ADDRESS3_MASK_INPUT_XPATH}    ${random_subnet_mask}

    # RULE 2 variables
    Select Options By    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE2_SOURCE_ADDRESS_DROPDOWN}    value    1
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE2_SOURCE_PORT_INPUT}    ${random_port}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE2_DEST_ADDRESS_INPUT}    ${random_ip}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE2_DEST_PORT_INPUT}    ${random_port}

    # ${checkbox_checked}=    Run Keyword And Return Status    Checkbox Should Not Be Selected    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE2_PRIVATE_ADDRESS_CHECKBOX_XPATH}
    # Log To Console    ${checkbox_checked}

    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE2_ADDRESS1_ENABLE_CHECKBOX_XPATH}
    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE2_ADDRESS2_ENABLE_CHECKBOX_XPATH}
    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE2_ADDRESS3_ENABLE_CHECKBOX_XPATH}

    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE2_ADDRESS1_IP_INPUT_XPATH}    ${random_ip}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE2_ADDRESS1_MASK_INPUT_XPATH}    ${random_subnet_mask}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE2_ADDRESS2_IP_INPUT_XPATH}    ${random_ip}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE2_ADDRESS2_MASK_INPUT_XPATH}    ${random_subnet_mask}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE2_ADDRESS3_IP_INPUT_XPATH}    ${random_ip}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE2_ADDRESS3_MASK_INPUT_XPATH}    ${random_subnet_mask}

    # RULE 3 variables
    Select Options By    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE3_SOURCE_ADDRESS_DROPDOWN}    value    1
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE3_SOURCE_PORT_INPUT}    ${random_port}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE3_DEST_ADDRESS_INPUT}    ${random_ip}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE3_DEST_PORT_INPUT}    ${random_port}

    # ${checkbox_checked}=    Run Keyword And Return Status    Checkbox Should Not Be Selected    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE3_PRIVATE_ADDRESS_CHECKBOX_XPATH}
    # Log To Console    ${checkbox_checked}

    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE3_ADDRESS1_ENABLE_CHECKBOX_XPATH}
    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE3_ADDRESS2_ENABLE_CHECKBOX_XPATH}
    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE3_ADDRESS3_ENABLE_CHECKBOX_XPATH}

    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE3_ADDRESS1_IP_INPUT_XPATH}    ${random_ip}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE3_ADDRESS1_MASK_INPUT_XPATH}    ${random_subnet_mask}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE3_ADDRESS2_IP_INPUT_XPATH}    ${random_ip}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE3_ADDRESS2_MASK_INPUT_XPATH}    ${random_subnet_mask}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE3_ADDRESS3_IP_INPUT_XPATH}    ${random_ip}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE3_ADDRESS3_MASK_INPUT_XPATH}    ${random_subnet_mask}

    # RULE 4 variables
    Select Options By    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE4_SOURCE_ADDRESS_DROPDOWN}    value    1
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE4_SOURCE_PORT_INPUT}    ${random_port}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE4_DEST_ADDRESS_INPUT}    ${random_ip}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE4_DEST_PORT_INPUT}    ${random_port}

    # ${checkbox_checked}=    Run Keyword And Return Status    Checkbox Should Not Be Selected    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE4_PRIVATE_ADDRESS_CHECKBOX_XPATH}
    # Log To Console    ${checkbox_checked}

    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE4_ADDRESS1_ENABLE_CHECKBOX_XPATH}
    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE4_ADDRESS2_ENABLE_CHECKBOX_XPATH}
    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE4_ADDRESS3_ENABLE_CHECKBOX_XPATH}

    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE4_ADDRESS1_IP_INPUT_XPATH}    ${random_ip}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE4_ADDRESS1_MASK_INPUT_XPATH}    ${random_subnet_mask}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE4_ADDRESS2_IP_INPUT_XPATH}    ${random_ip}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE4_ADDRESS2_MASK_INPUT_XPATH}    ${random_subnet_mask}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE4_ADDRESS3_IP_INPUT_XPATH}    ${random_ip}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE4_ADDRESS3_MASK_INPUT_XPATH}    ${random_subnet_mask}

    # RULE 5 variables
    Select Options By    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE5_SOURCE_ADDRESS_DROPDOWN}    value    1
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE5_SOURCE_PORT_INPUT}    ${random_port}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE5_DEST_ADDRESS_INPUT}    ${random_ip}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE5_DEST_PORT_INPUT}    ${random_port}

    # ${checkbox_checked}=    Run Keyword And Return Status    Checkbox Should Not Be Selected    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE5_PRIVATE_ADDRESS_CHECKBOX_XPATH}
    # Log To Console    ${checkbox_checked}

    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE5_ADDRESS1_ENABLE_CHECKBOX_XPATH}
    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE5_ADDRESS2_ENABLE_CHECKBOX_XPATH}
    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE5_ADDRESS3_ENABLE_CHECKBOX_XPATH}

    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE5_ADDRESS1_IP_INPUT_XPATH}    ${random_ip}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE5_ADDRESS1_MASK_INPUT_XPATH}    ${random_subnet_mask}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE5_ADDRESS2_IP_INPUT_XPATH}    ${random_ip}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE5_ADDRESS2_MASK_INPUT_XPATH}    ${random_subnet_mask}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE5_ADDRESS3_IP_INPUT_XPATH}    ${random_ip}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE5_ADDRESS3_MASK_INPUT_XPATH}    ${random_subnet_mask}

    # RULE 6 variables
    Select Options By    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE6_SOURCE_ADDRESS_DROPDOWN}    value    1
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE6_SOURCE_PORT_INPUT}    ${random_port}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE6_DEST_ADDRESS_INPUT}    ${random_ip}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE6_DEST_PORT_INPUT}    ${random_port}

    # ${checkbox_checked}=    Run Keyword And Return Status    Checkbox Should Not Be Selected    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE6_PRIVATE_ADDRESS_CHECKBOX_XPATH}
    # Log To Console    ${checkbox_checked}

    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE6_ADDRESS1_ENABLE_CHECKBOX_XPATH}
    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE6_ADDRESS2_ENABLE_CHECKBOX_XPATH}
    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE6_ADDRESS3_ENABLE_CHECKBOX_XPATH}

    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE6_ADDRESS1_IP_INPUT_XPATH}    ${random_ip}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE6_ADDRESS1_MASK_INPUT_XPATH}    ${random_subnet_mask}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE6_ADDRESS2_IP_INPUT_XPATH}    ${random_ip}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE6_ADDRESS2_MASK_INPUT_XPATH}    ${random_subnet_mask}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE6_ADDRESS3_IP_INPUT_XPATH}    ${random_ip}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE6_ADDRESS3_MASK_INPUT_XPATH}    ${random_subnet_mask}

    # RULE 7 variables
    Select Options By    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE7_SOURCE_ADDRESS_DROPDOWN}    value    1
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE7_SOURCE_PORT_INPUT}    ${random_port}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE7_DEST_ADDRESS_INPUT}    ${random_ip}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE7_DEST_PORT_INPUT}    ${random_port}

    # ${checkbox_checked}=    Run Keyword And Return Status    Checkbox Should Not Be Selected    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE7_PRIVATE_ADDRESS_CHECKBOX_XPATH}
    # Log To Console    ${checkbox_checked}

    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE7_ADDRESS1_ENABLE_CHECKBOX_XPATH}
    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE7_ADDRESS2_ENABLE_CHECKBOX_XPATH}
    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE7_ADDRESS3_ENABLE_CHECKBOX_XPATH}

    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE7_ADDRESS1_IP_INPUT_XPATH}    ${random_ip}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE7_ADDRESS1_MASK_INPUT_XPATH}    ${random_subnet_mask}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE7_ADDRESS2_IP_INPUT_XPATH}    ${random_ip}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE7_ADDRESS2_MASK_INPUT_XPATH}    ${random_subnet_mask}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE7_ADDRESS3_IP_INPUT_XPATH}    ${random_ip}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE7_ADDRESS3_MASK_INPUT_XPATH}    ${random_subnet_mask}

    # RULE 8 variables
    Select Options By    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE8_SOURCE_ADDRESS_DROPDOWN}    value    1
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE8_SOURCE_PORT_INPUT}    ${random_port}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE8_DEST_ADDRESS_INPUT}    ${random_ip}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE8_DEST_PORT_INPUT}    ${random_port}

    # ${checkbox_checked}=    Run Keyword And Return Status    Checkbox Should Not Be Selected    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE8_PRIVATE_ADDRESS_CHECKBOX_XPATH}
    # Log To Console    ${checkbox_checked}

    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE8_ADDRESS1_ENABLE_CHECKBOX_XPATH}
    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE8_ADDRESS2_ENABLE_CHECKBOX_XPATH}
    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE8_ADDRESS3_ENABLE_CHECKBOX_XPATH}

    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE8_ADDRESS1_IP_INPUT_XPATH}    ${random_ip}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE8_ADDRESS1_MASK_INPUT_XPATH}    ${random_subnet_mask}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE8_ADDRESS2_IP_INPUT_XPATH}    ${random_ip}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE8_ADDRESS2_MASK_INPUT_XPATH}    ${random_subnet_mask}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE8_ADDRESS3_IP_INPUT_XPATH}    ${random_ip}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE8_ADDRESS3_MASK_INPUT_XPATH}    ${random_subnet_mask}

    # RULE 9 variables
    Select Options By    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE9_SOURCE_ADDRESS_DROPDOWN}    value    1
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE9_SOURCE_PORT_INPUT}    ${random_port}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE9_DEST_ADDRESS_INPUT}    ${random_ip}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE9_DEST_PORT_INPUT}    ${random_port}

    # ${checkbox_checked}=    Run Keyword And Return Status    Checkbox Should Not Be Selected    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE9_PRIVATE_ADDRESS_CHECKBOX_XPATH}
    # Log To Console    ${checkbox_checked}

    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE9_ADDRESS1_ENABLE_CHECKBOX_XPATH}
    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE9_ADDRESS2_ENABLE_CHECKBOX_XPATH}
    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE9_ADDRESS3_ENABLE_CHECKBOX_XPATH}

    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE9_ADDRESS1_IP_INPUT_XPATH}    ${random_ip}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE9_ADDRESS1_MASK_INPUT_XPATH}    ${random_subnet_mask}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE9_ADDRESS2_IP_INPUT_XPATH}    ${random_ip}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE9_ADDRESS2_MASK_INPUT_XPATH}    ${random_subnet_mask}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE9_ADDRESS3_IP_INPUT_XPATH}    ${random_ip}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE9_ADDRESS3_MASK_INPUT_XPATH}    ${random_subnet_mask}

    # RULE 10 variables
    Select Options By    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE10_SOURCE_ADDRESS_DROPDOWN}    value    1
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE10_SOURCE_PORT_INPUT}    ${random_port}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE10_DEST_ADDRESS_INPUT}    ${random_ip}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE10_DEST_PORT_INPUT}    ${random_port}

    # ${checkbox_checked}=    Run Keyword And Return Status    Checkbox Should Not Be Selected    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE10_PRIVATE_ADDRESS_CHECKBOX_XPATH}
    # Log To Console    ${checkbox_checked}

    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE10_ADDRESS1_ENABLE_CHECKBOX_XPATH}
    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE10_ADDRESS2_ENABLE_CHECKBOX_XPATH}
    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE10_ADDRESS3_ENABLE_CHECKBOX_XPATH}

    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE10_ADDRESS1_IP_INPUT_XPATH}    ${random_ip}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE10_ADDRESS1_MASK_INPUT_XPATH}    ${random_subnet_mask}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE10_ADDRESS2_IP_INPUT_XPATH}    ${random_ip}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE10_ADDRESS2_MASK_INPUT_XPATH}    ${random_subnet_mask}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE10_ADDRESS3_IP_INPUT_XPATH}    ${random_ip}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE10_ADDRESS3_MASK_INPUT_XPATH}    ${random_subnet_mask}

    # RULE 11 variables
    Select Options By    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE11_SOURCE_ADDRESS_DROPDOWN}    value    1
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE11_SOURCE_PORT_INPUT}    ${random_port}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE11_DEST_ADDRESS_INPUT}    ${random_ip}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE11_DEST_PORT_INPUT}    ${random_port}

    # ${checkbox_checked}=    Run Keyword And Return Status    Checkbox Should Not Be Selected    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE11_PRIVATE_ADDRESS_CHECKBOX_XPATH}
    # Log To Console    ${checkbox_checked}

    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE11_ADDRESS1_ENABLE_CHECKBOX_XPATH}
    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE11_ADDRESS2_ENABLE_CHECKBOX_XPATH}
    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE11_ADDRESS3_ENABLE_CHECKBOX_XPATH}

    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE11_ADDRESS1_IP_INPUT_XPATH}    ${random_ip}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE11_ADDRESS1_MASK_INPUT_XPATH}    ${random_subnet_mask}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE11_ADDRESS2_IP_INPUT_XPATH}    ${random_ip}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE11_ADDRESS2_MASK_INPUT_XPATH}    ${random_subnet_mask}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE11_ADDRESS3_IP_INPUT_XPATH}    ${random_ip}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE11_ADDRESS3_MASK_INPUT_XPATH}    ${random_subnet_mask}

    # RULE 12 variables
    Select Options By    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE12_SOURCE_ADDRESS_DROPDOWN}    value    1
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE12_SOURCE_PORT_INPUT}    ${random_port}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE12_DEST_ADDRESS_INPUT}    ${random_ip}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE12_DEST_PORT_INPUT}    ${random_port}

    # ${checkbox_checked}=    Run Keyword And Return Status    Checkbox Should Not Be Selected    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE12_PRIVATE_ADDRESS_CHECKBOX_XPATH}
    # Log To Console    ${checkbox_checked}

    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE12_ADDRESS1_ENABLE_CHECKBOX_XPATH}
    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE12_ADDRESS2_ENABLE_CHECKBOX_XPATH}
    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE12_ADDRESS3_ENABLE_CHECKBOX_XPATH}

    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE12_ADDRESS1_IP_INPUT_XPATH}    ${random_ip}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE12_ADDRESS1_MASK_INPUT_XPATH}    ${random_subnet_mask}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE12_ADDRESS2_IP_INPUT_XPATH}    ${random_ip}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE12_ADDRESS2_MASK_INPUT_XPATH}    ${random_subnet_mask}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE12_ADDRESS3_IP_INPUT_XPATH}    ${random_ip}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE12_ADDRESS3_MASK_INPUT_XPATH}    ${random_subnet_mask}

    # RULE 13 variables
    Select Options By    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE13_SOURCE_ADDRESS_DROPDOWN}    value    1
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE13_SOURCE_PORT_INPUT}    ${random_port}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE13_DEST_ADDRESS_INPUT}    ${random_ip}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE13_DEST_PORT_INPUT}    ${random_port}

    # ${checkbox_checked}=    Run Keyword And Return Status    Checkbox Should Not Be Selected    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE13_PRIVATE_ADDRESS_CHECKBOX_XPATH}
    # Log To Console    ${checkbox_checked}

    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE13_ADDRESS1_ENABLE_CHECKBOX_XPATH}
    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE13_ADDRESS2_ENABLE_CHECKBOX_XPATH}
    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE13_ADDRESS3_ENABLE_CHECKBOX_XPATH}

    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE13_ADDRESS1_IP_INPUT_XPATH}    ${random_ip}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE13_ADDRESS1_MASK_INPUT_XPATH}    ${random_subnet_mask}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE13_ADDRESS2_IP_INPUT_XPATH}    ${random_ip}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE13_ADDRESS2_MASK_INPUT_XPATH}    ${random_subnet_mask}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE13_ADDRESS3_IP_INPUT_XPATH}    ${random_ip}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE13_ADDRESS3_MASK_INPUT_XPATH}    ${random_subnet_mask}

    # RULE 14 variables
    Select Options By    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE14_SOURCE_ADDRESS_DROPDOWN}    value    1
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE14_SOURCE_PORT_INPUT}    ${random_port}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE14_DEST_ADDRESS_INPUT}    ${random_ip}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE14_DEST_PORT_INPUT}    ${random_port}

    # ${checkbox_checked}=    Run Keyword And Return Status    Checkbox Should Not Be Selected    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE14_PRIVATE_ADDRESS_CHECKBOX_XPATH}
    # Log To Console    ${checkbox_checked}

    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE14_ADDRESS1_ENABLE_CHECKBOX_XPATH}
    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE14_ADDRESS2_ENABLE_CHECKBOX_XPATH}
    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE14_ADDRESS3_ENABLE_CHECKBOX_XPATH}

    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE14_ADDRESS1_IP_INPUT_XPATH}    ${random_ip}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE14_ADDRESS1_MASK_INPUT_XPATH}    ${random_subnet_mask}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE14_ADDRESS2_IP_INPUT_XPATH}    ${random_ip}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE14_ADDRESS2_MASK_INPUT_XPATH}    ${random_subnet_mask}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE14_ADDRESS3_IP_INPUT_XPATH}    ${random_ip}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE14_ADDRESS3_MASK_INPUT_XPATH}    ${random_subnet_mask}

    # RULE 15 variables
    Select Options By    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE15_SOURCE_ADDRESS_DROPDOWN}    value    1
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE15_SOURCE_PORT_INPUT}    ${random_port}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE15_DEST_ADDRESS_INPUT}    ${random_ip}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE15_DEST_PORT_INPUT}    ${random_port}

    # ${checkbox_checked}=    Run Keyword And Return Status    Checkbox Should Not Be Selected    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE15_PRIVATE_ADDRESS_CHECKBOX_XPATH}
    # Log To Console    ${checkbox_checked}

    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE15_ADDRESS1_ENABLE_CHECKBOX_XPATH}
    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE15_ADDRESS2_ENABLE_CHECKBOX_XPATH}
    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE15_ADDRESS3_ENABLE_CHECKBOX_XPATH}

    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE15_ADDRESS1_IP_INPUT_XPATH}    ${random_ip}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE15_ADDRESS1_MASK_INPUT_XPATH}    ${random_subnet_mask}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE15_ADDRESS2_IP_INPUT_XPATH}    ${random_ip}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE15_ADDRESS2_MASK_INPUT_XPATH}    ${random_subnet_mask}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE15_ADDRESS3_IP_INPUT_XPATH}    ${random_ip}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE15_ADDRESS3_MASK_INPUT_XPATH}    ${random_subnet_mask}

    # RULE 16 variables
    Select Options By    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE16_SOURCE_ADDRESS_DROPDOWN}    value    1
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE16_SOURCE_PORT_INPUT}    ${random_port}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE16_DEST_ADDRESS_INPUT}    ${random_ip}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE16_DEST_PORT_INPUT}    ${random_port}

    # ${checkbox_checked}=    Run Keyword And Return Status    Checkbox Should Not Be Selected    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE16_PRIVATE_ADDRESS_CHECKBOX_XPATH}
    # Log To Console    ${checkbox_checked}

    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE16_ADDRESS1_ENABLE_CHECKBOX_XPATH}
    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE16_ADDRESS2_ENABLE_CHECKBOX_XPATH}
    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE16_ADDRESS3_ENABLE_CHECKBOX_XPATH}

    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE16_ADDRESS1_IP_INPUT_XPATH}    ${random_ip}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE16_ADDRESS1_MASK_INPUT_XPATH}    ${random_subnet_mask}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE16_ADDRESS2_IP_INPUT_XPATH}    ${random_ip}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE16_ADDRESS2_MASK_INPUT_XPATH}    ${random_subnet_mask}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE16_ADDRESS3_IP_INPUT_XPATH}    ${random_ip}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE16_ADDRESS3_MASK_INPUT_XPATH}    ${random_subnet_mask}

    # RULE 17 variables
    Select Options By    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE17_SOURCE_ADDRESS_DROPDOWN}    value    1
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE17_SOURCE_PORT_INPUT}    ${random_port}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE17_DEST_ADDRESS_INPUT}    ${random_ip}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE17_DEST_PORT_INPUT}    ${random_port}

    # ${checkbox_checked}=    Run Keyword And Return Status    Checkbox Should Not Be Selected    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE17_PRIVATE_ADDRESS_CHECKBOX_XPATH}
    # Log To Console    ${checkbox_checked}

    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE17_ADDRESS1_ENABLE_CHECKBOX_XPATH}
    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE17_ADDRESS2_ENABLE_CHECKBOX_XPATH}
    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE17_ADDRESS3_ENABLE_CHECKBOX_XPATH}

    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE17_ADDRESS1_IP_INPUT_XPATH}    ${random_ip}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE17_ADDRESS1_MASK_INPUT_XPATH}    ${random_subnet_mask}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE17_ADDRESS2_IP_INPUT_XPATH}    ${random_ip}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE17_ADDRESS2_MASK_INPUT_XPATH}    ${random_subnet_mask}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE17_ADDRESS3_IP_INPUT_XPATH}    ${random_ip}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE17_ADDRESS3_MASK_INPUT_XPATH}    ${random_subnet_mask}

    # RULE 18 variables
    Select Options By    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE18_SOURCE_ADDRESS_DROPDOWN}    value    1
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE18_SOURCE_PORT_INPUT}    ${random_port}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE18_DEST_ADDRESS_INPUT}    ${random_ip}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE18_DEST_PORT_INPUT}    ${random_port}

    # ${checkbox_checked}=    Run Keyword And Return Status    Checkbox Should Not Be Selected    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE18_PRIVATE_ADDRESS_CHECKBOX_XPATH}
    # Log To Console    ${checkbox_checked}

    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE18_ADDRESS1_ENABLE_CHECKBOX_XPATH}
    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE18_ADDRESS2_ENABLE_CHECKBOX_XPATH}
    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE18_ADDRESS3_ENABLE_CHECKBOX_XPATH}

    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE18_ADDRESS1_IP_INPUT_XPATH}    ${random_ip}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE18_ADDRESS1_MASK_INPUT_XPATH}    ${random_subnet_mask}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE18_ADDRESS2_IP_INPUT_XPATH}    ${random_ip}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE18_ADDRESS2_MASK_INPUT_XPATH}    ${random_subnet_mask}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE18_ADDRESS3_IP_INPUT_XPATH}    ${random_ip}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE18_ADDRESS3_MASK_INPUT_XPATH}    ${random_subnet_mask}

    # RULE 19 variables
    Select Options By    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE19_SOURCE_ADDRESS_DROPDOWN}    value    1
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE19_SOURCE_PORT_INPUT}    ${random_port}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE19_DEST_ADDRESS_INPUT}    ${random_ip}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE19_DEST_PORT_INPUT}    ${random_port}

    # ${checkbox_checked}=    Run Keyword And Return Status    Checkbox Should Not Be Selected    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE19_PRIVATE_ADDRESS_CHECKBOX_XPATH}
    # Log To Console    ${checkbox_checked}

    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE19_ADDRESS1_ENABLE_CHECKBOX_XPATH}
    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE19_ADDRESS2_ENABLE_CHECKBOX_XPATH}
    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE19_ADDRESS3_ENABLE_CHECKBOX_XPATH}

    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE19_ADDRESS1_IP_INPUT_XPATH}    ${random_ip}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE19_ADDRESS1_MASK_INPUT_XPATH}    ${random_subnet_mask}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE19_ADDRESS2_IP_INPUT_XPATH}    ${random_ip}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE19_ADDRESS2_MASK_INPUT_XPATH}    ${random_subnet_mask}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE19_ADDRESS3_IP_INPUT_XPATH}    ${random_ip}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE19_ADDRESS3_MASK_INPUT_XPATH}    ${random_subnet_mask}

    # RULE 20 variables
    Select Options By    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE20_SOURCE_ADDRESS_DROPDOWN}    value    1
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE20_SOURCE_PORT_INPUT}    ${random_port}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE20_DEST_ADDRESS_INPUT}    ${random_ip}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE20_DEST_PORT_INPUT}    ${random_port}

    # ${checkbox_checked}=    Run Keyword And Return Status    Checkbox Should Not Be Selected    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE20_PRIVATE_ADDRESS_CHECKBOX_XPATH}
    # Log To Console    ${checkbox_checked}

    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE20_ADDRESS1_ENABLE_CHECKBOX_XPATH}
    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE20_ADDRESS2_ENABLE_CHECKBOX_XPATH}
    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE20_ADDRESS3_ENABLE_CHECKBOX_XPATH}

    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE20_ADDRESS1_IP_INPUT_XPATH}    ${random_ip}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE20_ADDRESS1_MASK_INPUT_XPATH}    ${random_subnet_mask}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE20_ADDRESS2_IP_INPUT_XPATH}    ${random_ip}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE20_ADDRESS2_MASK_INPUT_XPATH}    ${random_subnet_mask}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE20_ADDRESS3_IP_INPUT_XPATH}    ${random_ip}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE20_ADDRESS3_MASK_INPUT_XPATH}    ${random_subnet_mask}

    # RULE 21 variables
    Select Options By    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE21_SOURCE_ADDRESS_DROPDOWN}    value    1
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE21_SOURCE_PORT_INPUT}    ${random_port}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE21_DEST_ADDRESS_INPUT}    ${random_ip}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE21_DEST_PORT_INPUT}    ${random_port}

    # ${checkbox_checked}=    Run Keyword And Return Status    Checkbox Should Not Be Selected    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE21_PRIVATE_ADDRESS_CHECKBOX_XPATH}
    # Log To Console    ${checkbox_checked}

    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE21_ADDRESS1_ENABLE_CHECKBOX_XPATH}
    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE21_ADDRESS2_ENABLE_CHECKBOX_XPATH}
    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE21_ADDRESS3_ENABLE_CHECKBOX_XPATH}

    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE21_ADDRESS1_IP_INPUT_XPATH}    ${random_ip}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE21_ADDRESS1_MASK_INPUT_XPATH}    ${random_subnet_mask}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE21_ADDRESS2_IP_INPUT_XPATH}    ${random_ip}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE21_ADDRESS2_MASK_INPUT_XPATH}    ${random_subnet_mask}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE21_ADDRESS3_IP_INPUT_XPATH}    ${random_ip}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE21_ADDRESS3_MASK_INPUT_XPATH}    ${random_subnet_mask}

    # RULE 22 variables
    Select Options By    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE22_SOURCE_ADDRESS_DROPDOWN}    value    1
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE22_SOURCE_PORT_INPUT}    ${random_port}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE22_DEST_ADDRESS_INPUT}    ${random_ip}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE22_DEST_PORT_INPUT}    ${random_port}

    # ${checkbox_checked}=    Run Keyword And Return Status    Checkbox Should Not Be Selected    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE22_PRIVATE_ADDRESS_CHECKBOX_XPATH}
    # Log To Console    ${checkbox_checked}

    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE22_ADDRESS1_ENABLE_CHECKBOX_XPATH}
    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE22_ADDRESS2_ENABLE_CHECKBOX_XPATH}
    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE22_ADDRESS3_ENABLE_CHECKBOX_XPATH}

    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE22_ADDRESS1_IP_INPUT_XPATH}    ${random_ip}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE22_ADDRESS1_MASK_INPUT_XPATH}    ${random_subnet_mask}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE22_ADDRESS2_IP_INPUT_XPATH}    ${random_ip}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE22_ADDRESS2_MASK_INPUT_XPATH}    ${random_subnet_mask}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE22_ADDRESS3_IP_INPUT_XPATH}    ${random_ip}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE22_ADDRESS3_MASK_INPUT_XPATH}    ${random_subnet_mask}

    # RULE 23 variables
    Select Options By    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE23_SOURCE_ADDRESS_DROPDOWN}    value    1
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE23_SOURCE_PORT_INPUT}    ${random_port}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE23_DEST_ADDRESS_INPUT}    ${random_ip}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE23_DEST_PORT_INPUT}    ${random_port}

    # ${checkbox_checked}=    Run Keyword And Return Status    Checkbox Should Not Be Selected    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE23_PRIVATE_ADDRESS_CHECKBOX_XPATH}
    # Log To Console    ${checkbox_checked}

    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE23_ADDRESS1_ENABLE_CHECKBOX_XPATH}
    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE23_ADDRESS2_ENABLE_CHECKBOX_XPATH}
    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE23_ADDRESS3_ENABLE_CHECKBOX_XPATH}

    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE23_ADDRESS1_IP_INPUT_XPATH}    ${random_ip}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE23_ADDRESS1_MASK_INPUT_XPATH}    ${random_subnet_mask}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE23_ADDRESS2_IP_INPUT_XPATH}    ${random_ip}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE23_ADDRESS2_MASK_INPUT_XPATH}    ${random_subnet_mask}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE23_ADDRESS3_IP_INPUT_XPATH}    ${random_ip}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE23_ADDRESS3_MASK_INPUT_XPATH}    ${random_subnet_mask}

    # RULE 24 variables
    Select Options By    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE24_SOURCE_ADDRESS_DROPDOWN}    value    1
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE24_SOURCE_PORT_INPUT}    ${random_port}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE24_DEST_ADDRESS_INPUT}    ${random_ip}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE24_DEST_PORT_INPUT}    ${random_port}

    # ${checkbox_checked}=    Run Keyword And Return Status    Checkbox Should Not Be Selected    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE24_PRIVATE_ADDRESS_CHECKBOX_XPATH}
    # Log To Console    ${checkbox_checked}

    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE24_ADDRESS1_ENABLE_CHECKBOX_XPATH}
    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE24_ADDRESS2_ENABLE_CHECKBOX_XPATH}
    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE24_ADDRESS3_ENABLE_CHECKBOX_XPATH}

    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE24_ADDRESS1_IP_INPUT_XPATH}    ${random_ip}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE24_ADDRESS1_MASK_INPUT_XPATH}    ${random_subnet_mask}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE24_ADDRESS2_IP_INPUT_XPATH}    ${random_ip}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE24_ADDRESS2_MASK_INPUT_XPATH}    ${random_subnet_mask}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE24_ADDRESS3_IP_INPUT_XPATH}    ${random_ip}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE24_ADDRESS3_MASK_INPUT_XPATH}    ${random_subnet_mask}

    # RULE 25 variables
    Select Options By    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE25_SOURCE_ADDRESS_DROPDOWN}    value    1
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE25_SOURCE_PORT_INPUT}    ${random_port}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE25_DEST_ADDRESS_INPUT}    ${random_ip}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE25_DEST_PORT_INPUT}    ${random_port}

    # ${checkbox_checked}=    Run Keyword And Return Status    Checkbox Should Not Be Selected    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE25_PRIVATE_ADDRESS_CHECKBOX_XPATH}
    # Log To Console    ${checkbox_checked}

    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE25_ADDRESS1_ENABLE_CHECKBOX_XPATH}
    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE25_ADDRESS2_ENABLE_CHECKBOX_XPATH}
    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE25_ADDRESS3_ENABLE_CHECKBOX_XPATH}

    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE25_ADDRESS1_IP_INPUT_XPATH}    ${random_ip}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE25_ADDRESS1_MASK_INPUT_XPATH}    ${random_subnet_mask}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE25_ADDRESS2_IP_INPUT_XPATH}    ${random_ip}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE25_ADDRESS2_MASK_INPUT_XPATH}    ${random_subnet_mask}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE25_ADDRESS3_IP_INPUT_XPATH}    ${random_ip}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE25_ADDRESS3_MASK_INPUT_XPATH}    ${random_subnet_mask}

    # RULE 26 variables
    Select Options By    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE26_SOURCE_ADDRESS_DROPDOWN}    value    1
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE26_SOURCE_PORT_INPUT}    ${random_port}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE26_DEST_ADDRESS_INPUT}    ${random_ip}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE26_DEST_PORT_INPUT}    ${random_port}

    # ${checkbox_checked}=    Run Keyword And Return Status    Checkbox Should Not Be Selected    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE26_PRIVATE_ADDRESS_CHECKBOX_XPATH}
    # Log To Console    ${checkbox_checked}

    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE26_ADDRESS1_ENABLE_CHECKBOX_XPATH}
    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE26_ADDRESS2_ENABLE_CHECKBOX_XPATH}
    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE26_ADDRESS3_ENABLE_CHECKBOX_XPATH}

    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE26_ADDRESS1_IP_INPUT_XPATH}    ${random_ip}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE26_ADDRESS1_MASK_INPUT_XPATH}    ${random_subnet_mask}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE26_ADDRESS2_IP_INPUT_XPATH}    ${random_ip}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE26_ADDRESS2_MASK_INPUT_XPATH}    ${random_subnet_mask}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE26_ADDRESS3_IP_INPUT_XPATH}    ${random_ip}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE26_ADDRESS3_MASK_INPUT_XPATH}    ${random_subnet_mask}

    # RULE 27 variables
    Select Options By    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE27_SOURCE_ADDRESS_DROPDOWN}    value    1
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE27_SOURCE_PORT_INPUT}    ${random_port}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE27_DEST_ADDRESS_INPUT}    ${random_ip}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE27_DEST_PORT_INPUT}    ${random_port}

    # ${checkbox_checked}=    Run Keyword And Return Status    Checkbox Should Not Be Selected    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE27_PRIVATE_ADDRESS_CHECKBOX_XPATH}
    # Log To Console    ${checkbox_checked}

    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE27_ADDRESS1_ENABLE_CHECKBOX_XPATH}
    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE27_ADDRESS2_ENABLE_CHECKBOX_XPATH}
    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE27_ADDRESS3_ENABLE_CHECKBOX_XPATH}

    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE27_ADDRESS1_IP_INPUT_XPATH}    ${random_ip}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE27_ADDRESS1_MASK_INPUT_XPATH}    ${random_subnet_mask}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE27_ADDRESS2_IP_INPUT_XPATH}    ${random_ip}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE27_ADDRESS2_MASK_INPUT_XPATH}    ${random_subnet_mask}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE27_ADDRESS3_IP_INPUT_XPATH}    ${random_ip}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE27_ADDRESS3_MASK_INPUT_XPATH}    ${random_subnet_mask}

    # RULE 28 variables
    Select Options By    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE28_SOURCE_ADDRESS_DROPDOWN}    value    1
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE28_SOURCE_PORT_INPUT}    ${random_port}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE28_DEST_ADDRESS_INPUT}    ${random_ip}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE28_DEST_PORT_INPUT}    ${random_port}

    # ${checkbox_checked}=    Run Keyword And Return Status    Checkbox Should Not Be Selected    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE28_PRIVATE_ADDRESS_CHECKBOX_XPATH}
    # Log To Console    ${checkbox_checked}

    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE28_ADDRESS1_ENABLE_CHECKBOX_XPATH}
    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE28_ADDRESS2_ENABLE_CHECKBOX_XPATH}
    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE28_ADDRESS3_ENABLE_CHECKBOX_XPATH}

    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE28_ADDRESS1_IP_INPUT_XPATH}    ${random_ip}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE28_ADDRESS1_MASK_INPUT_XPATH}    ${random_subnet_mask}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE28_ADDRESS2_IP_INPUT_XPATH}    ${random_ip}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE28_ADDRESS2_MASK_INPUT_XPATH}    ${random_subnet_mask}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE28_ADDRESS3_IP_INPUT_XPATH}    ${random_ip}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE28_ADDRESS3_MASK_INPUT_XPATH}    ${random_subnet_mask}

    # RULE 29 variables
    Select Options By    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE29_SOURCE_ADDRESS_DROPDOWN}    value    1
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE29_SOURCE_PORT_INPUT}    ${random_port}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE29_DEST_ADDRESS_INPUT}    ${random_ip}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE29_DEST_PORT_INPUT}    ${random_port}

    # ${checkbox_checked}=    Run Keyword And Return Status    Checkbox Should Not Be Selected    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE29_PRIVATE_ADDRESS_CHECKBOX_XPATH}
    # Log To Console    ${checkbox_checked}

    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE29_ADDRESS1_ENABLE_CHECKBOX_XPATH}
    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE29_ADDRESS2_ENABLE_CHECKBOX_XPATH}
    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE29_ADDRESS3_ENABLE_CHECKBOX_XPATH}

    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE29_ADDRESS1_IP_INPUT_XPATH}    ${random_ip}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE29_ADDRESS1_MASK_INPUT_XPATH}    ${random_subnet_mask}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE29_ADDRESS2_IP_INPUT_XPATH}    ${random_ip}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE29_ADDRESS2_MASK_INPUT_XPATH}    ${random_subnet_mask}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE29_ADDRESS3_IP_INPUT_XPATH}    ${random_ip}
    Fill text    ${SELECTOR_SETTINGS_NETWORK_NAT_RULE29_ADDRESS3_MASK_INPUT_XPATH}    ${random_subnet_mask}

    ${button_result}=    Action Button Or Cancel Button
    ...    ${SELECTOR_SETTINGS_NETWORK_NAT_SAVE_BUTTON}
    ...    ${SELECTOR_SETTINGS_NETWORK_NAT_CANCEL_BUTTON}
    ...    ${save}
    Log To Console    ${button_result}
