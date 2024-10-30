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
Settings Network Email Checkbox
    ${save}=    Set Variable    save
    Go to settings

    Browser.Click    ${selector_settings_network_btn}
    Sleep    ${SLEEP_TIME}

    Browser.Click    ${selector_settings_network_alarm_item}
    Sleep    ${SLEEP_TIME}

    ${title}=    Run Keyword and Return status
    ...    Wait for Elements State
    ...    ${SELECTOR_SETTINGS_NETWORK_EMAIL_SERVER_TITLE_1}
    ...    visible
    ...    timeout=5s
    IF    ${title}    Log To Console    Title visible

    Browser.Click    ${SELECTOR_SETTINGS_NETWORK_EMAIL_WEBVISION_CHECKBOX_1}

    ${button_result}=    Action Button Or Cancel Button
    ...    ${SELECTOR_SETTINGS_NETWORK_EMAIL_SAVE_BTN}
    ...    ${SELECTOR_SETTINGS_NETWORK_EMAIL_CANCEL_BTN}
    ...    ${save}
    Log To Console    ${button_result}
    ${snack-bar_visible}=    Check Xpath visible    xpath=//span[@class='mdc-button__label']
    Log To Console    Snack-bar: ${snack-bar_visible}
    ${snack-bar_text}=    Get Text From XPath    xpath=//span[@class='mdc-button__label']
    Log To Console    Snack-bar text: ${snack-bar_text}

    ${checkbox_checked}=    Run Keyword And Return Status
    ...    Wait for Elements State
    ...    ${CHECKED_CHECKBOX_XPATH}
    ...    visible
    ...    timeout=2s
    IF    $checkbox_checked
        Log To Console    Checked xpath ${checkbox_checked}
    END

    IF    ${checkbox_checked} == ${True}
        Log To Console    1 is CHECKED
    ELSE
        Log To Console    1 Checked is invisible
    END

    ${checkbox_unchecked}=    Run Keyword And Return Status
    ...    Wait for Elements State
    ...    ${UNCHECKED_CHECKBOX_XPATH}
    ...    visible
    ...    timeout=2s
    IF    $checkbox_unchecked
        Log To Console    UN_Checked xpath ${checkbox_unchecked}
    END

    IF    ${checkbox_unchecked} == ${True}
        Log To Console    1 is UN_CHECKED
    ELSE
        Log To Console    1 UNChecked is invisible
    END

    Browser.Click    ${SELECTOR_SETTINGS_NETWORK_EMAIL_WEBVISION_CHECKBOX_1}

    ${button_result}=    Action Button Or Cancel Button
    ...    ${SELECTOR_SETTINGS_NETWORK_EMAIL_SAVE_BTN}
    ...    ${SELECTOR_SETTINGS_NETWORK_EMAIL_CANCEL_BTN}
    ...    ${save}
    Log To Console    ${button_result}

    Sleep    5s

    ${checkbox_checked}=    Run Keyword And Return Status
    ...    Wait for Elements State
    ...    ${CHECKED_CHECKBOX_XPATH}
    ...    visible
    ...    timeout=2s
    IF    $checkbox_checked
        Log To Console    Checked xpath ${checkbox_checked}
    END

    IF    ${checkbox_checked} == ${True}
        Log To Console    2 is CHECKED
    ELSE
        Log To Console    2 Checked is invisible
    END

    ${checkbox_unchecked}=    Run Keyword And Return Status
    ...    Wait for Elements State
    ...    ${UNCHECKED_CHECKBOX_XPATH}
    ...    visible
    ...    timeout=2s
    IF    $checkbox_unchecked
        Log To Console    Checked xpath ${checkbox_unchecked}
    END

    IF    ${checkbox_unchecked} == ${True}
        Log To Console    2 is UN_CHECKED
    ELSE
        Log To Console    2 UNChecked is invisible
    END

Settings Network Email QA-ID
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
    Sleep    ${SLEEP_TIME}

    Browser.Click    ${selector_settings_network_alarm_item}
    Sleep    ${SLEEP_TIME}

    Wait for Elements State    ${SELECTOR_SETTINGS_NETWORK_EMAIL_SERVER_TITLE_1}    visible    timeout=5s

    Fill Text    ${SELECTOR_SETTINGS_NETWORK_EMAIL_NAME_INPUT_1}    Server_1_name
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_EMAIL_ADDRESS_INPUT_1}    ${random_ip}
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_EMAIL_PORT_INPUT_1}    ${random_port}
    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_EMAIL_WEBVISION_CHECKBOX_1}

    Fill Text    ${SELECTOR_SETTINGS_NETWORK_EMAIL_SENDER_EMAIL_INPUT_1}    sender_1@fidelix.com
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_EMAIL_SENDER_NAME_INPUT_1}    Sender_1
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_EMAIL_EMAIL_SUBJECT_INPUT_1}    Alarm at ${random_ip}. Email from Sender_1
    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_EMAIL_AUTHENTICATING_SERVER_CHECKBOX_1}

    Fill Text    ${SELECTOR_SETTINGS_NETWORK_EMAIL_DOMAIN_INPUT_1}    ${random_ip}
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_EMAIL_AUTH_USERNAME_INPUT_1}    User_1
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_EMAIL_AUTH_PASSWORD_INPUT_1}    Password_1
    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_EMAIL_MONITORING_CHECKBOX_1}
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_EMAIL_SEND_INTERVAL_INPUT_1}    300
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_EMAIL_MONITOR_MESSAGE_SUBJECT_INPUT_1}    ${random_ip} Subject
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_EMAIL_RECIPIENT_INPUT_1}    recipient_1@fidelix.com

    Fill Text    ${SELECTOR_SETTINGS_NETWORK_EMAIL_NAME_INPUT_2}    Server_2_name
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_EMAIL_ADDRESS_INPUT_2}    ${random_ip}
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_EMAIL_PORT_INPUT_2}    ${random_port}
    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_EMAIL_WEBVISION_CHECKBOX_2}
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_EMAIL_SENDER_EMAIL_INPUT_2}    sender_2@fidelix.com
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_EMAIL_SENDER_NAME_INPUT_2}    Sender_2
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_EMAIL_EMAIL_SUBJECT_INPUT_2}    Alarm at ${random_ip}. Email from Sender_2
    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_EMAIL_AUTHENTICATING_SERVER_CHECKBOX_2}
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_EMAIL_DOMAIN_INPUT_2}    ${random_ip}
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_EMAIL_AUTH_USERNAME_INPUT_2}    User_2
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_EMAIL_AUTH_PASSWORD_INPUT_2}    Password_2
    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_EMAIL_MONITORING_CHECKBOX_2}
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_EMAIL_SEND_INTERVAL_INPUT_2}    300
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_EMAIL_MONITOR_MESSAGE_SUBJECT_INPUT_2}    ${random_ip} Subject
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_EMAIL_RECIPIENT_INPUT_2}    recipient_2@fidelix.com

    Fill Text    ${SELECTOR_SETTINGS_NETWORK_EMAIL_NAME_INPUT_3}    Server_3_name
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_EMAIL_ADDRESS_INPUT_3}    ${random_ip}
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_EMAIL_PORT_INPUT_3}    ${random_port}
    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_EMAIL_WEBVISION_CHECKBOX_3}
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_EMAIL_SENDER_EMAIL_INPUT_3}    sender_3@fidelix.com
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_EMAIL_SENDER_NAME_INPUT_3}    Sender_3
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_EMAIL_EMAIL_SUBJECT_INPUT_3}    Alarm at ${random_ip}. Email from Sender_3
    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_EMAIL_AUTHENTICATING_SERVER_CHECKBOX_3}
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_EMAIL_DOMAIN_INPUT_3}    ${random_ip}
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_EMAIL_AUTH_USERNAME_INPUT_3}    User_3
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_EMAIL_AUTH_PASSWORD_INPUT_3}    Password_3
    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_EMAIL_MONITORING_CHECKBOX_3}
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_EMAIL_SEND_INTERVAL_INPUT_3}    300
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_EMAIL_MONITOR_MESSAGE_SUBJECT_INPUT_3}    ${random_ip} Subject
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_EMAIL_RECIPIENT_INPUT_3}    recipient_3@fidelix.com

    Fill Text    ${SELECTOR_SETTINGS_NETWORK_EMAIL_NAME_INPUT_4}    Server_4_name
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_EMAIL_ADDRESS_INPUT_4}    ${random_ip}
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_EMAIL_PORT_INPUT_4}    ${random_port}
    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_EMAIL_WEBVISION_CHECKBOX_4}
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_EMAIL_SENDER_EMAIL_INPUT_4}    sender_4@fidelix.com
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_EMAIL_SENDER_NAME_INPUT_4}    Sender_4
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_EMAIL_EMAIL_SUBJECT_INPUT_4}    Alarm at ${random_ip}. Email from Sender_4
    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_EMAIL_AUTHENTICATING_SERVER_CHECKBOX_4}
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_EMAIL_DOMAIN_INPUT_4}    ${random_ip}
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_EMAIL_AUTH_USERNAME_INPUT_4}    User_4
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_EMAIL_AUTH_PASSWORD_INPUT_4}    Password_4
    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_EMAIL_MONITORING_CHECKBOX_4}
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_EMAIL_SEND_INTERVAL_INPUT_4}    300
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_EMAIL_MONITOR_MESSAGE_SUBJECT_INPUT_4}    ${random_ip} Subject
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_EMAIL_RECIPIENT_INPUT_4}    recipient_4@fidelix.com

    Fill Text    ${SELECTOR_SETTINGS_NETWORK_EMAIL_NAME_INPUT_5}    Server_5_name
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_EMAIL_ADDRESS_INPUT_5}    ${random_ip}
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_EMAIL_PORT_INPUT_5}    ${random_port}
    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_EMAIL_WEBVISION_CHECKBOX_5}
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_EMAIL_SENDER_EMAIL_INPUT_5}    sender_5@fidelix.com
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_EMAIL_SENDER_NAME_INPUT_5}    Sender_5
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_EMAIL_EMAIL_SUBJECT_INPUT_5}    Alarm at ${random_ip}. Email from Sender_5
    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_EMAIL_AUTHENTICATING_SERVER_CHECKBOX_5}
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_EMAIL_DOMAIN_INPUT_5}    ${random_ip}
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_EMAIL_AUTH_USERNAME_INPUT_5}    User_5
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_EMAIL_AUTH_PASSWORD_INPUT_5}    Password_5
    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_EMAIL_MONITORING_CHECKBOX_5}
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_EMAIL_SEND_INTERVAL_INPUT_5}    300
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_EMAIL_MONITOR_MESSAGE_SUBJECT_INPUT_5}    ${random_ip} Subject
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_EMAIL_RECIPIENT_INPUT_5}    recipient_5@fidelix.com

    ${button_result}=    Action Button Or Cancel Button
    ...    ${SELECTOR_SETTINGS_NETWORK_EMAIL_SAVE_BTN}
    ...    ${SELECTOR_SETTINGS_NETWORK_EMAIL_CANCEL_BTN}
    ...    ${save}
    Log To Console    ${button_result}

    Fill Text    ${SELECTOR_SETTINGS_NETWORK_EMAIL_NAME_INPUT_1}    Server 1
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_EMAIL_ADDRESS_INPUT_1}    smtp.tele.fi
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_EMAIL_PORT_INPUT_1}    25

    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_EMAIL_WEBVISION_CHECKBOX_1}

    Fill Text    ${SELECTOR_SETTINGS_NETWORK_EMAIL_SENDER_EMAIL_INPUT_1}    ${EMPTY}
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_EMAIL_SENDER_NAME_INPUT_1}    ${EMPTY}
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_EMAIL_EMAIL_SUBJECT_INPUT_1}    ${EMPTY}

    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_EMAIL_AUTHENTICATING_SERVER_CHECKBOX_1}

    Fill Text    ${SELECTOR_SETTINGS_NETWORK_EMAIL_DOMAIN_INPUT_1}    ${EMPTY}
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_EMAIL_AUTH_USERNAME_INPUT_1}    ${EMPTY}
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_EMAIL_AUTH_PASSWORD_INPUT_1}    ${EMPTY}

    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_EMAIL_MONITORING_CHECKBOX_1}

    Fill Text    ${SELECTOR_SETTINGS_NETWORK_EMAIL_SEND_INTERVAL_INPUT_1}    ${EMPTY}
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_EMAIL_MONITOR_MESSAGE_SUBJECT_INPUT_1}    ${EMPTY}
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_EMAIL_RECIPIENT_INPUT_1}    ${EMPTY}

    Fill Text    ${SELECTOR_SETTINGS_NETWORK_EMAIL_NAME_INPUT_2}    ${EMPTY}
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_EMAIL_ADDRESS_INPUT_2}    ${EMPTY}
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_EMAIL_PORT_INPUT_2}    ${EMPTY}

    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_EMAIL_WEBVISION_CHECKBOX_2}

    Fill Text    ${SELECTOR_SETTINGS_NETWORK_EMAIL_SENDER_EMAIL_INPUT_2}    ${EMPTY}
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_EMAIL_SENDER_NAME_INPUT_2}    ${EMPTY}
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_EMAIL_EMAIL_SUBJECT_INPUT_2}    ${EMPTY}

    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_EMAIL_AUTHENTICATING_SERVER_CHECKBOX_2}

    Fill Text    ${SELECTOR_SETTINGS_NETWORK_EMAIL_DOMAIN_INPUT_2}    ${EMPTY}
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_EMAIL_AUTH_USERNAME_INPUT_2}    ${EMPTY}
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_EMAIL_AUTH_PASSWORD_INPUT_2}    ${EMPTY}

    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_EMAIL_MONITORING_CHECKBOX_2}

    Fill Text    ${SELECTOR_SETTINGS_NETWORK_EMAIL_SEND_INTERVAL_INPUT_2}    ${EMPTY}
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_EMAIL_MONITOR_MESSAGE_SUBJECT_INPUT_2}    ${EMPTY}
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_EMAIL_RECIPIENT_INPUT_2}    ${EMPTY}

    Fill Text    ${SELECTOR_SETTINGS_NETWORK_EMAIL_NAME_INPUT_3}    ${EMPTY}
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_EMAIL_ADDRESS_INPUT_3}    ${EMPTY}
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_EMAIL_PORT_INPUT_3}    ${EMPTY}

    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_EMAIL_WEBVISION_CHECKBOX_3}

    Fill Text    ${SELECTOR_SETTINGS_NETWORK_EMAIL_SENDER_EMAIL_INPUT_3}    ${EMPTY}
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_EMAIL_SENDER_NAME_INPUT_3}    ${EMPTY}
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_EMAIL_EMAIL_SUBJECT_INPUT_3}    ${EMPTY}

    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_EMAIL_AUTHENTICATING_SERVER_CHECKBOX_3}

    Fill Text    ${SELECTOR_SETTINGS_NETWORK_EMAIL_DOMAIN_INPUT_3}    ${EMPTY}
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_EMAIL_AUTH_USERNAME_INPUT_3}    ${EMPTY}
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_EMAIL_AUTH_PASSWORD_INPUT_3}    ${EMPTY}

    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_EMAIL_MONITORING_CHECKBOX_3}

    Fill Text    ${SELECTOR_SETTINGS_NETWORK_EMAIL_SEND_INTERVAL_INPUT_3}    3${EMPTY}
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_EMAIL_MONITOR_MESSAGE_SUBJECT_INPUT_3}    ${EMPTY}
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_EMAIL_RECIPIENT_INPUT_3}    ${EMPTY}

    Fill Text    ${SELECTOR_SETTINGS_NETWORK_EMAIL_NAME_INPUT_4}    ${EMPTY}
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_EMAIL_ADDRESS_INPUT_4}    ${EMPTY}
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_EMAIL_PORT_INPUT_4}    ${EMPTY}

    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_EMAIL_WEBVISION_CHECKBOX_4}

    Fill Text    ${SELECTOR_SETTINGS_NETWORK_EMAIL_SENDER_EMAIL_INPUT_4}    ${EMPTY}
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_EMAIL_SENDER_NAME_INPUT_4}    ${EMPTY}
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_EMAIL_EMAIL_SUBJECT_INPUT_4}    ${EMPTY}

    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_EMAIL_AUTHENTICATING_SERVER_CHECKBOX_4}

    Fill Text    ${SELECTOR_SETTINGS_NETWORK_EMAIL_DOMAIN_INPUT_4}    ${EMPTY}
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_EMAIL_AUTH_USERNAME_INPUT_4}    ${EMPTY}
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_EMAIL_AUTH_PASSWORD_INPUT_4}    ${EMPTY}

    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_EMAIL_MONITORING_CHECKBOX_4}

    Fill Text    ${SELECTOR_SETTINGS_NETWORK_EMAIL_SEND_INTERVAL_INPUT_4}    ${EMPTY}
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_EMAIL_MONITOR_MESSAGE_SUBJECT_INPUT_4}    ${EMPTY}
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_EMAIL_RECIPIENT_INPUT_4}    ${EMPTY}

    Fill Text    ${SELECTOR_SETTINGS_NETWORK_EMAIL_NAME_INPUT_5}    ${EMPTY}
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_EMAIL_ADDRESS_INPUT_5}    ${EMPTY}
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_EMAIL_PORT_INPUT_5}    ${EMPTY}

    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_EMAIL_WEBVISION_CHECKBOX_5}

    Fill Text    ${SELECTOR_SETTINGS_NETWORK_EMAIL_SENDER_EMAIL_INPUT_5}    ${EMPTY}
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_EMAIL_SENDER_NAME_INPUT_5}    ${EMPTY}
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_EMAIL_EMAIL_SUBJECT_INPUT_5}    ${EMPTY}

    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_EMAIL_AUTHENTICATING_SERVER_CHECKBOX_5}

    Fill Text    ${SELECTOR_SETTINGS_NETWORK_EMAIL_DOMAIN_INPUT_5}    ${EMPTY}
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_EMAIL_AUTH_USERNAME_INPUT_5}    ${EMPTY}
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_EMAIL_AUTH_PASSWORD_INPUT_5}    ${EMPTY}

    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_EMAIL_MONITORING_CHECKBOX_5}

    Fill Text    ${SELECTOR_SETTINGS_NETWORK_EMAIL_SEND_INTERVAL_INPUT_5}    ${EMPTY}
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_EMAIL_MONITOR_MESSAGE_SUBJECT_INPUT_5}    ${EMPTY}
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_EMAIL_RECIPIENT_INPUT_5}    ${EMPTY}

    ${button_result}=    Action Button Or Cancel Button
    ...    ${SELECTOR_SETTINGS_NETWORK_EMAIL_SAVE_BTN}
    ...    ${SELECTOR_SETTINGS_NETWORK_EMAIL_CANCEL_BTN}
    ...    ${save}
    Log To Console    ${button_result}

Settings Network History QA-ID
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
    Sleep    ${SLEEP_TIME}

    Browser.Click    ${selector_settings_network_history_item}
    Sleep    ${SLEEP_TIME}

    Check Checkbox    ${SELECTOR_SETTINGS_NETWORK_HISTORY_SAVE_HISTORY_CHECKBOX}
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_HISTORY_USERNAME_INPUT}    username
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_HISTORY_PASSWORD_INPUT}    pass_word
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_HISTORY_IP_ADDRESS_INPUT}    ${random_ip}
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_HISTORY_PORT_INPUT}    ${random_port}
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_HISTORY_TIMEOUT_INPUT}    100
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_HISTORY_DATABASE_NAME_INPUT}    database_name
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_HISTORY_DATABASE_URL_INPUT}    http://www.fidelix.com

    Wait For Elements State    ${SELECTOR_SETTINGS_NETWORK_HISTORY_STORING_FORMAT_SELECT}    visible    timeout=2s
    Select Options By    ${SELECTOR_SETTINGS_NETWORK_HISTORY_STORING_FORMAT_SELECT}    value    1

    Fill Text    ${SELECTOR_SETTINGS_NETWORK_HISTORY_USERNAME_INPUT}    ${EMPTY}
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_HISTORY_PASSWORD_INPUT}    ${EMPTY}
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_HISTORY_IP_ADDRESS_INPUT}    0.0.0.0
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_HISTORY_PORT_INPUT}    1433
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_HISTORY_TIMEOUT_INPUT}    10
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_HISTORY_DATABASE_NAME_INPUT}    ${EMPTY}
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_HISTORY_DATABASE_URL_INPUT}    ${EMPTY}

    Wait For Elements State    ${SELECTOR_SETTINGS_NETWORK_HISTORY_STORING_FORMAT_SELECT}    visible    timeout=2s
    Select Options By    ${SELECTOR_SETTINGS_NETWORK_HISTORY_STORING_FORMAT_SELECT}    value    0

    ${button_result}=    Action Button Or Cancel Button
    ...    ${SELECTOR_SETTINGS_NETWORK_HISTORY_SAVE_BUTTON}
    ...    ${SELECTOR_SETTINGS_NETWORK_HISTORY_CANCEL_BUTTON}
    ...    ${save}
    Log To Console    ${button_result}

Settings Network Tosibox QA-ID
    [Arguments]    ${save}

    Go to settings

    Browser.Click    ${selector_settings_network_btn}
    Sleep    ${SLEEP_TIME}

    Browser.Click    ${selector_settings_network_tosibox_item}
    Sleep    ${SLEEP_TIME}

    Fill Text    ${SELECTOR_SETTINGS_NETWORK_TOSIBOX_ACTIVATION_CODE_INPUT}    1234567890abcdef
    Fill Text    ${SELECTOR_SETTINGS_NETWORK_TOSIBOX_NETMAP_ADDRESS_INPUT}    10.10.10.10

    IF    $save==1 or $save=='save' or $save=='Save'
        ${visibility}=    Run Keyword And Return Status
        ...    Check Xpath Visible
        ...    ${SELECTOR_SETTINGS_NETWORK_TOSIBOX_SAVE_BUTTON}
        IF    ${visibility}
            Browser.Click    ${SELECTOR_SETTINGS_NETWORK_TOSIBOX_SAVE_BUTTON}
            ${return text}=    Set Variable    Action visible and Browser.Clicked
        ELSE
            ${return text}=    Set Variable    Action not visible and not Browser.Clicked
        END
    END

    Snack-bar Visibility And Content
    # ${snack-bar_visible}=    Check Xpath visible    xpath=//span[@class='mdc-button__label']
    # Log To Console    Snack-bar: ${snack-bar_visible}
    # ${snack-bar_text}=    Get Text From XPath    xpath=//span[@class='mdc-button__label']
    # Log To Console    Snack-bar text: ${snack-bar_text}

    ${element_visible}=    Run Keyword And Return Status
    ...    Wait for Elements State
    ...    ${SELECTOR_SETTINGS_NETWORK_TOSIBOX_ACTIVATED_CIRCLE_IMG}
    ...    visible
    ...    5s
    Log To Console    Activated circle element visible: ${element_visible}

    ${element_visible}=    Run Keyword And Return Status
    ...    Wait for Elements State
    ...    ${SELECTOR_SETTINGS_NETWORK_TOSIBOX_START_BUTTON}
    ...    visible
    ...    5s
    Log To Console    Stsrt button visible: ${element_visible}

Settings User Users Add QA-ID
    [Arguments]    ${username}    ${password}    ${usergroup}    ${save}

    Go to settings

    Browser.Click    ${selector_settings_user_btn}
    Sleep    ${SLEEP_TIME}

    Browser.Click    ${selector_settings_user_users_item}
    Sleep    ${SLEEP_TIME}
    Browser.Click    ${SELECTOR_SETTINGS_USER_USERS_ADD_USER_BUTTON}

    Fill Text    ${SELECTOR_SETTINGS_USER_USERS_ADD_DIALOG_USER_NAME}    ${username}
    Fill Text    ${SELECTOR_SETTINGS_USER_USERS_ADD_DIALOG_PASSWORD}    ${password}
    Browser.Click    ${SELECTOR_SETTINGS_USER_USERS_ADD_DIALOG_USER_GROUP}
    Keyboard Key    press    ArrowDown
    Keyboard Key    press    ArrowDown
    Keyboard Key    press    Enter

    Browser.Click    ${SELECTOR_SETTINGS_USER_USERS_ADD_DIALOG_START_PAGE}
    Keyboard Key    press    ArrowDown
    Keyboard Key    press    Enter

    Check Checkbox    ${SELECTOR_SETTINGS_USER_USERS_ADD_DIALOG_SYNCHRONIZE_CHECKBOX}

    ${button_result}=    Action Button Or Cancel Button
    ...    ${SELECTOR_SETTINGS_USER_USERS_ADD_DIALOG_ADD_BUTTON}
    ...    ${SELECTOR_SETTINGS_USER_USERS_ADD_DIALOG_CANCEL_BUTTON}
    ...    ${save}
    Log To Console    ${button_result}

Settings User Users Edit QA-ID
    [Arguments]    ${username}    ${editname}    ${save}

    Go to settings

    Browser.Click    ${selector_settings_user_btn}
    Sleep    ${SLEEP_TIME}

    Browser.Click    ${selector_settings_user_users_item}
    Sleep    ${SLEEP_TIME}

    ${xpath}=    Catenate    SEPARATOR=    xpath=//td[normalize-space(text())='${username}']
    ${username_is_created}=    Run Keyword And Return Status
    ...    Wait For Elements State
    ...    ${xpath}
    ...    visible
    ...    timeout=2s
    IF    ${username_is_created}
        Log To Console    User ${username} is created and visible

        Browser.Click    ${xpath}

        Wait For Elements State    ${SELECTOR_SETTINGS_USER_USERS_EDIT_BUTTON}    visible    timeout=2s
        Browser.Click    ${SELECTOR_SETTINGS_USER_USERS_EDIT_BUTTON}

        Fill Text    ${SELECTOR_SETTINGS_USER_USERS_EDIT_DIALOG_USERNAME_INPUT}    ${editname}
        Check Checkbox    ${SELECTOR_SETTINGS_USER_USERS_EDIT_DIALOG_UPDATE_PASSWORD_CHECKBOX}
        Wait For Elements State
        ...    ${SELECTOR_SETTINGS_USER_USERS_EDIT_DIALOG_NEW_PASSWORD_INPUT}
        ...    visible
        ...    timeout=2s
        Fill Text    ${SELECTOR_SETTINGS_USER_USERS_EDIT_DIALOG_NEW_PASSWORD_INPUT}    word_pass

        Select Options By    ${SELECTOR_SETTINGS_USER_USERS_EDIT_DIALOG_USER_GROUP_SELECT}    value    SYSTEM
        Keyboard Key    press    ArrowDown
        Keyboard Key    press    Enter

        Browser.Click    ${SELECTOR_SETTINGS_USER_USERS_EDIT_DIALOG_START_PAGE_SELECT}
        Keyboard Key    press    ArrowDown
        Keyboard Key    press    Enter

        Browser.Click    ${SELECTOR_SETTINGS_USER_USERS_EDIT_DIALOG_SYNCHRONIZE_CHECKBOX}

        ${button_result}=    Action Button Or Cancel Button
        ...    ${SELECTOR_SETTINGS_USER_USERS_EDIT_DIALOG_SAVE_BUTTON}
        ...    ${SELECTOR_SETTINGS_USER_USERS_EDIT_DIALOG_CANCEL_BUTTON}
        ...    ${save}
        Log To Console    ${button_result}
    ELSE
        Log To Console    User ${username} is not created
    END

Settings User Users Remove QA-ID
    [Arguments]    ${username}    ${save}

    Go to settings

    Browser.Click    ${selector_settings_user_btn}
    Browser.Click    ${selector_settings_user_users_item}

    ${xpath}=    Catenate    SEPARATOR=    xpath=//td[normalize-space(text())='${username}']

    ${username_is_created}=    Run Keyword And Return Status
    ...    Wait For Elements State
    ...    ${xpath}
    ...    visible
    ...    timeout=2s
    #    Wait For Elements State    ${xpath}    visible    timeout=2s

    IF    ${username_is_created}
        Log To Console    User ${username} is created and visible

        Browser.Click    ${xpath}

        Browser.Click    ${SELECTOR_SETTINGS_USER_USERS_REMOVE_BUTTON}

        ${button_result}=    Action Button Or Cancel Button
        ...    ${SELECTOR_SETTINGS_USER_USERS_REMOVE_DIALOG_REMOVE_BUTTON}
        ...    ${SELECTOR_SETTINGS_USER_USERS_REMOVE_DIALOG_CANCEL_BUTTON}
        ...    ${save}
        Log To Console    ${button_result}

        ${remove_not_ok}=    Run Keyword And Return Status
        ...    Wait For Elements State
        ...    ${SELECTOR_SETTINGS_USER_USERS_TABLE_CELL_NEWUSER}
        ...    visible
        ...    timeout=3s
        IF    ${remove_not_ok}
            Log To Console    Remove not successful
        ELSE
            Log To Console    Remove OK
        END
    ELSE
        Log To Console    User ${username} is not created
    END

Settings User Usergroup Add QA-ID
    [Arguments]    ${groupname}    ${save}

    Go to settings

    Browser.Click    ${selector_settings_user_btn}
    Sleep    ${SLEEP_TIME}

    Browser.Click    ${selector_settings_user_usergroups_item}
    Sleep    ${SLEEP_TIME}

    Wait For Elements State    ${SELECTOR_SETTINGS_USER_USERGROUPS_ADD_BUTTON}    visible    timeout=2s
    Browser.Click    ${SELECTOR_SETTINGS_USER_USERGROUPS_ADD_BUTTON}

    Wait For Elements State    ${SELECTOR_SETTINGS_USER_USERGROUPS_NAME_INPUT}    visible    timeout=2s

    Fill Text    ${SELECTOR_SETTINGS_USER_USERGROUPS_NAME_INPUT}    ${groupname}
    Fill Text    ${SELECTOR_SETTINGS_USER_USERGROUPS_LEVEL_INPUT}    255
    Check Checkbox    ${SELECTOR_SETTINGS_USER_USERGROUPS_SYNCHRONIZE_CHKBX}

    Check Checkbox    ${SELECTOR_SETTINGS_USER_USERGROUPS_VIEW_MASTER_TOGGLE_CHKBX}
    Check Checkbox    ${SELECTOR_SETTINGS_USER_USERGROUPS_VIEW_MASTER_TOGGLE_CHKBX}

    Check Checkbox    ${SELECTOR_SETTINGS_USER_USERGROUPS_VIEW_PICTURE_CHKBX}
    Check Checkbox    ${SELECTOR_SETTINGS_USER_USERGROUPS_VIEW_ALARM_LOGS_CHKBX}
    Check Checkbox    ${SELECTOR_SETTINGS_USER_USERGROUPS_VIEW_POINT_LIST_CHKBX}
    Check Checkbox    ${SELECTOR_SETTINGS_USER_USERGROUPS_VIEW_DATABASE_CHKBX}
    Check Checkbox    ${SELECTOR_SETTINGS_USER_USERGROUPS_VIEW_SETUP_CHKBX}
    Check Checkbox    ${SELECTOR_SETTINGS_USER_USERGROUPS_VIEW_HISTORY_CHKBX}
    Check Checkbox    ${SELECTOR_SETTINGS_USER_USERGROUPS_VIEW_ENERGY_REPORTS_CHKBX}
    Check Checkbox    ${SELECTOR_SETTINGS_USER_USERGROUPS_VIEW_DASHBOARD_CHKBX}

    Check Checkbox    ${SELECTOR_SETTINGS_USER_USERGROUPS_MANUAL_MASTER_TOGGLE_CHKBX}
    Check Checkbox    ${SELECTOR_SETTINGS_USER_USERGROUPS_MANUAL_MASTER_TOGGLE_CHKBX}
    Check Checkbox    ${SELECTOR_SETTINGS_USER_USERGROUPS_MANUAL_SET_VALUE_CHKBX}
    Check Checkbox    ${SELECTOR_SETTINGS_USER_USERGROUPS_MANUAL_INDICATIONS_CHKBX}
    Check Checkbox    ${SELECTOR_SETTINGS_USER_USERGROUPS_MANUAL_DO_POINTS_CHKBX}
    Check Checkbox    ${SELECTOR_SETTINGS_USER_USERGROUPS_MANUAL_MEASUREMENTS_CHKBX}
    Check Checkbox    ${SELECTOR_SETTINGS_USER_USERGROUPS_MANUAL_AO_POINTS_CHKBX}
    Check Checkbox    ${SELECTOR_SETTINGS_USER_USERGROUPS_MANUAL_TIME_SCHEDULES_CHKBX}
    Check Checkbox    ${SELECTOR_SETTINGS_USER_USERGROUPS_MANUAL_ALARM_POINTS_CHKBX}
    Check Checkbox    ${SELECTOR_SETTINGS_USER_USERGROUPS_MANUAL_ALARM_ACKNOWLEDGEMENT_CHKBX}
    Check Checkbox    ${SELECTOR_SETTINGS_USER_USERGROUPS_MANUAL_LOOKUP_TABLE_CHKBX}
    Check Checkbox    ${SELECTOR_SETTINGS_USER_USERGROUPS_MANUAL_CONTROL_STATE_CHKBX}
    Check Checkbox    ${SELECTOR_SETTINGS_USER_USERGROUPS_MANUAL_CONTROL_SET_CHKBX}
    Check Checkbox    ${SELECTOR_SETTINGS_USER_USERGROUPS_MANUAL_CONTROL_TABLE_CHKBX}
    Check Checkbox    ${SELECTOR_SETTINGS_USER_USERGROUPS_MANUAL_CALENDAR_CHKBX}

    Check Checkbox    ${SELECTOR_SETTINGS_USER_USERGROUPS_EDIT_MASTER_TOGGLE_CHKBX}
    Check Checkbox    ${SELECTOR_SETTINGS_USER_USERGROUPS_EDIT_MASTER_TOGGLE_CHKBX}
    Check Checkbox    ${SELECTOR_SETTINGS_USER_USERGROUPS_EDIT_DATABASE_FULL_CHKBX}
    Check Checkbox    ${SELECTOR_SETTINGS_USER_USERGROUPS_EDIT_DATABASE_LIMITED_CHKBX}
    Check Checkbox    ${SELECTOR_SETTINGS_USER_USERGROUPS_EDIT_USER_RIGHTS_CHKBX}
    Check Checkbox    ${SELECTOR_SETTINGS_USER_USERGROUPS_EDIT_SETUP_CHKBX}
    Check Checkbox    ${SELECTOR_SETTINGS_USER_USERGROUPS_EDIT_STATE_TEXTS_CHKBX}
    Check Checkbox    ${SELECTOR_SETTINGS_USER_USERGROUPS_EDIT_HISTORY_CHKBX}
    Check Checkbox    ${SELECTOR_SETTINGS_USER_USERGROUPS_EDIT_ENERGY_REPORTS_CHKBX}
    Check Checkbox    ${SELECTOR_SETTINGS_USER_USERGROUPS_EDIT_DASHBOARD_CHKBX}

    ${button_result}=    Action Button Or Cancel Button
    ...    ${SELECTOR_SETTINGS_USER_USERGROUPS_DIALOG_ADD_BUTTON}
    ...    ${SELECTOR_SETTINGS_USER_USERGROUPS_DIALOG_CANCEL_BUTTON}
    ...    ${save}
    Log To Console    ${button_result}

Settings User Usergroup Edit QA-ID
    [Arguments]    ${groupname}    ${editname}    ${save}

    Go to settings

    Browser.Click    ${selector_settings_user_btn}
    Sleep    ${SLEEP_TIME}

    Browser.Click    ${selector_settings_user_usergroups_item}
    Sleep    ${SLEEP_TIME}

    ${xpath}=    Catenate    SEPARATOR=    xpath=//td[normalize-space(text())='${groupname}']
    # Wait For Elements State    ${xpath}    visible    timeout=2s
    ${usergroup_is_created}=    Run Keyword And Return Status
    ...    Wait For Elements State
    ...    ${xpath}
    ...    visible
    ...    timeout=2s

    IF    ${usergroup_is_created}
        Log To Console    Usergroup ${groupname} is created and visible
        Browser.Click    ${xpath}

        # Wait For Elements State    ${SELECTOR_SETTINGS_USER_USERGROUPS_TABLE_CELL_NEWGROUP}    visible    timeout=2s
        # Browser.Click    ${SELECTOR_SETTINGS_USER_USERGROUPS_TABLE_CELL_NEWGROUP}

        Browser.Click    ${SELECTOR_SETTINGS_USER_USERGROUPS_EDIT_BUTTON}

        Wait For Elements State    ${SELECTOR_SETTINGS_USER_USERGROUPS_NAME_INPUT}    visible    timeout=2s

        Fill Text    ${SELECTOR_SETTINGS_USER_USERGROUPS_NAME_INPUT}    ${editname}
        Fill Text    ${SELECTOR_SETTINGS_USER_USERGROUPS_LEVEL_INPUT}    111
        UnCheck Checkbox    ${SELECTOR_SETTINGS_USER_USERGROUPS_SYNCHRONIZE_CHKBX}

        UnCheck Checkbox    ${SELECTOR_SETTINGS_USER_USERGROUPS_VIEW_MASTER_TOGGLE_CHKBX}
        UnCheck Checkbox    ${SELECTOR_SETTINGS_USER_USERGROUPS_VIEW_MASTER_TOGGLE_CHKBX}

        # Check Checkbox    ${SELECTOR_SETTINGS_USER_USERGROUPS_VIEW_PICTURE_CHKBX}
        # Check Checkbox    ${SELECTOR_SETTINGS_USER_USERGROUPS_VIEW_ALARM_LOGS_CHKBX}
        # Check Checkbox    ${SELECTOR_SETTINGS_USER_USERGROUPS_VIEW_POINT_LIST_CHKBX}
        # Check Checkbox    ${SELECTOR_SETTINGS_USER_USERGROUPS_VIEW_DATABASE_CHKBX}
        # Check Checkbox    ${SELECTOR_SETTINGS_USER_USERGROUPS_VIEW_SETUP_CHKBX}
        # Check Checkbox    ${SELECTOR_SETTINGS_USER_USERGROUPS_VIEW_HISTORY_CHKBX}
        # Check Checkbox    ${SELECTOR_SETTINGS_USER_USERGROUPS_VIEW_ENERGY_REPORTS_CHKBX}
        # Check Checkbox    ${SELECTOR_SETTINGS_USER_USERGROUPS_VIEW_DASHBOARD_CHKBX}

        # Check Checkbox    ${SELECTOR_SETTINGS_USER_USERGROUPS_MANUAL_MASTER_TOGGLE_CHKBX}
        # Check Checkbox    ${SELECTOR_SETTINGS_USER_USERGROUPS_MANUAL_MASTER_TOGGLE_CHKBX}

        # Check Checkbox    ${SELECTOR_SETTINGS_USER_USERGROUPS_MANUAL_SET_VALUE_CHKBX}
        # Check Checkbox    ${SELECTOR_SETTINGS_USER_USERGROUPS_MANUAL_INDICATIONS_CHKBX}
        # Check Checkbox    ${SELECTOR_SETTINGS_USER_USERGROUPS_MANUAL_DO_POINTS_CHKBX}
        # Check Checkbox    ${SELECTOR_SETTINGS_USER_USERGROUPS_MANUAL_MEASUREMENTS_CHKBX}
        # Check Checkbox    ${SELECTOR_SETTINGS_USER_USERGROUPS_MANUAL_AO_POINTS_CHKBX}
        # Check Checkbox    ${SELECTOR_SETTINGS_USER_USERGROUPS_MANUAL_TIME_SCHEDULES_CHKBX}
        # Check Checkbox    ${SELECTOR_SETTINGS_USER_USERGROUPS_MANUAL_ALARM_POINTS_CHKBX}
        # Check Checkbox    ${SELECTOR_SETTINGS_USER_USERGROUPS_MANUAL_ALARM_ACKNOWLEDGEMENT_CHKBX}
        # Check Checkbox    ${SELECTOR_SETTINGS_USER_USERGROUPS_MANUAL_LOOKUP_TABLE_CHKBX}
        # Check Checkbox    ${SELECTOR_SETTINGS_USER_USERGROUPS_MANUAL_CONTROL_STATE_CHKBX}
        # Check Checkbox    ${SELECTOR_SETTINGS_USER_USERGROUPS_MANUAL_CONTROL_SET_CHKBX}
        # Check Checkbox    ${SELECTOR_SETTINGS_USER_USERGROUPS_MANUAL_CONTROL_TABLE_CHKBX}
        # Check Checkbox    ${SELECTOR_SETTINGS_USER_USERGROUPS_MANUAL_CALENDAR_CHKBX}

        # Check Checkbox    ${SELECTOR_SETTINGS_USER_USERGROUPS_EDIT_MASTER_TOGGLE_CHKBX}
        # Check Checkbox    ${SELECTOR_SETTINGS_USER_USERGROUPS_EDIT_MASTER_TOGGLE_CHKBX}

        # Check Checkbox    ${SELECTOR_SETTINGS_USER_USERGROUPS_EDIT_DATABASE_FULL_CHKBX}
        # Check Checkbox    ${SELECTOR_SETTINGS_USER_USERGROUPS_EDIT_DATABASE_LIMITED_CHKBX}
        # Check Checkbox    ${SELECTOR_SETTINGS_USER_USERGROUPS_EDIT_USER_RIGHTS_CHKBX}
        # Check Checkbox    ${SELECTOR_SETTINGS_USER_USERGROUPS_EDIT_SETUP_CHKBX}
        # Check Checkbox    ${SELECTOR_SETTINGS_USER_USERGROUPS_EDIT_STATE_TEXTS_CHKBX}
        # Check Checkbox    ${SELECTOR_SETTINGS_USER_USERGROUPS_EDIT_HISTORY_CHKBX}
        # Check Checkbox    ${SELECTOR_SETTINGS_USER_USERGROUPS_EDIT_ENERGY_REPORTS_CHKBX}
        # Check Checkbox    ${SELECTOR_SETTINGS_USER_USERGROUPS_EDIT_DASHBOARD_CHKBX}

        ${button_result}=    Action Button Or Cancel Button
        ...    ${SELECTOR_SETTINGS_USER_USERGROUPS_EDIT_DIALOG_SAVE_BUTTON}
        ...    ${SELECTOR_SETTINGS_USER_USERGROUPS_DIALOG_CANCEL_BUTTON}
        ...    ${save}
        Log To Console    ${button_result}
    ELSE
        Log To Console    Usergroup ${groupname} is not created
    END

Settings User Usergroup Remove QA-ID
    [Arguments]    ${groupname}    ${save}

    Go to settings

    Browser.Click    ${selector_settings_user_btn}

    Browser.Click    ${selector_settings_user_usergroups_item}

    # Browser.Click    ${SELECTOR_SETTINGS_USER_USERGROUPS_TABLE_CELL_NEWGROUP}
    ${xpath}=    Catenate    SEPARATOR=    xpath=//td[normalize-space(text())='${groupname}']
    ${usergroup_is_created}=    Run Keyword And Return Status
    ...    Wait For Elements State
    ...    ${xpath}
    ...    visible
    ...    timeout=2s

    IF    ${usergroup_is_created}
        Log To Console    Usergroup ${groupname} is created and visible
        #    Wait For Elements State    ${xpath}    visible    timeout=2s
        Browser.Click    ${xpath}

        Browser.Click    ${SELECTOR_SETTINGS_USER_USERGROUPS_REMOVE_BUTTON}

        ${button_result}=    Action Button Or Cancel Button
        ...    ${SELECTOR_SETTINGS_USER_USERGROUPS_REMOVE_DIALOG_BUTTON_REMOVE}
        ...    ${SELECTOR_SETTINGS_USER_USERGROUPS_REMOVE_DIALOG_BUTTON_CANCEL}
        ...    ${save}
        Log To Console    ${button_result}

        ${remove_not_ok}=    Run Keyword And Return Status
        ...    Wait For Elements State
        ...    ${xpath}
        ...    visible
        ...    timeout=3s
        IF    ${remove_not_ok}
            Log To Console    Remove not successful
        ELSE
            Log To Console    Remove OK
        END
    ELSE
        Log To Console    Usergroup ${groupname} is not created
    END
