*** Settings ***
# Resource        ../../resources/cpu.resource
# Resource        ../../resources/login.resource
# Resource        ../../resources/navigate.resource
# Resource        ../../resources/settings/user_settings/user.resource
# Resource        ../../resources/env.resource

Resource        resources\\login.resource
Resource        resources\\navigate.resource
Resource        resources\\env.resource

Library         Browser
Library         String
Library         Collections
Library         OperatingSystem
Library         DateTime
Library         SSHLibrary

Suite Setup     Settings tab system settings page


*** Variables ***
${user}                         system
${user_password}                24680

${timestamp_format}    %Y-%m-%d %H:%M:%S.%f

${host}             10.78.185.37
${username}         fx3000
${password}         ${EMPTY}
${alias}            fx3000x

${SPACE}    
@{RESTRICTED_SYMBOLS}    -    _    +    @    $    ^    &    *
@{DEVICE_NAME_VALUES}    xXx    abcd1234    This_is_30_symbols_text_303030    This_is_64_symbols_text_646464646464646464646464646464646464646
@{SESSION_TIME_VALUES}    0    1    9999    999999    ABCD
@{PASSWORD_VALUES}    0    24680    Systemuser!    This_is_a_VERY_long_password_phrase_with_digits_and_symbols_0123456789_!@£$€    256_This_is_a_VERY_long_password_phrase_with_digits_and_symbols_0123456789_!@£$€_This_is_a_VERY_long_password_phrase_with_digits_and_symbols_0123456789_!@£$€_This_is_a_VERY_long_password_phrase_with_digits_and_symbols_0123456789_!@£$€_This_is_a_VE
@{AUTHENTICATION_VALUES}    FdxAuth    This_is_30_symbols_text_303030    This_is_33_symbols_text_33333333    This_is_64_symbols_text_646464646464646464646464646464646464646


# Locators
${selector_settings_system_device_settings_header}                          xpath=//div[@class="sub_settings_toolbar ng-star-inserted"]
${selector_start_page_login_container}                                      xpath=//div[@class="login_container"]

${selector_settings_system_device_settings_device_name_input}               xpath=//input[@data-qa-id='settings-system-device-station-name']
${selector_settings_system_device_settings_session_time_input}              xpath=//input[@data-qa-id='settings-system-device-session-timeout']
${selector_settings_system_device_settings_password_input}                  xpath=//input[@data-qa-id='settings-system-device-ssh-password']
${selector_settings_system_device_settings_authentication_input}            xpath=//input[@data-qa-id='settings-system-device-webvision-auth-key']

${selector_settings_system_device_settings_save_button}                     xpath=//button[@data-qa-id='settings-system-device-save-button']
${selector_settings_system_device_settings_save_button_enabled}             xpath=//button[@data-qa-id='settings-system-device-save-button' and contains(@class, 'active')]
${selector_settings_system_device_settings_save_button_disabled}            xpath=//button[@data-qa-id='settings-system-device-save-button' and @disabled]

${selector_settings_system_device_settings_cancel_button}                   xpath=//button[@data-qa-id='settings-system-device-cancel-button']

${selector_settings_system_device_settings_device_error_message}            xpath=//span[@class='error-message-container']

${selector_settings_system_device_settings_device_snackbar_container}       xpath=//div[contains(@class, 'snackbar-container')]
${selector_settings_system_device_settings_device_snackbar_left_message}    xpath=//div[@class='snackbar-container']//div[@class='item left']
${selector_settings_system_device_settings_device_snackbar_action_message}  xpath=//div[@class='snackbar-container']//div[@class='item action']

${selector_settings_system_device_settings_notification_dialog}             xpath=//div[contains(@class, 'cdk-overlay-pane') and contains(@class, 'custom-dialog-container')]/mat-dialog-container
# Doesn't work cause of "-1" in new form xpath=//mat-dialog-container[@id="mat-mdc-dialog-0"]

${selector_settings_system_device_settings_notification_dialog_close_btn}   xpath=//button[@data-qa-id="notification-dialog-close-button"]


*** Test Cases ***
Open settings system sevice tab and check content
    [Documentation]    Check operation in Settings -> System Settings Device -> Device Settings
    Browser.Wait For Elements State    ${selector_settings_system_device_settings_header}    visible    1s
    ${settings_header_text}    Browser.Get Text    ${selector_settings_system_device_settings_header}
    Log To Console    Text in header: ${settings_header_text}
    
    #    Test "Device name" inputs with non-ANSI (resticted) characters inserted into different places
    Input Value With Restricted Symbols To Input Save And Read Back    ${selector_settings_system_device_settings_device_name_input}    ${DEVICE_NAME_VALUES[1]}    ${RESTRICTED_SYMBOLS[0]}    0
    Input Value With Restricted Symbols To Input Save And Read Back    ${selector_settings_system_device_settings_device_name_input}    ${DEVICE_NAME_VALUES[1]}    ${RESTRICTED_SYMBOLS[1]}    0
    Input Value With Restricted Symbols To Input Save And Read Back    ${selector_settings_system_device_settings_device_name_input}    ${DEVICE_NAME_VALUES[1]}    ${RESTRICTED_SYMBOLS[2]}    0
    Input Value With Restricted Symbols To Input Save And Read Back    ${selector_settings_system_device_settings_device_name_input}    ${DEVICE_NAME_VALUES[1]}    ${RESTRICTED_SYMBOLS[3]}    0
    Input Value With Restricted Symbols To Input Save And Read Back    ${selector_settings_system_device_settings_device_name_input}    ${DEVICE_NAME_VALUES[1]}    ${RESTRICTED_SYMBOLS[4]}    0
    Input Value With Restricted Symbols To Input Save And Read Back    ${selector_settings_system_device_settings_device_name_input}    ${DEVICE_NAME_VALUES[1]}    ${RESTRICTED_SYMBOLS[5]}    0
    Input Value With Restricted Symbols To Input Save And Read Back    ${selector_settings_system_device_settings_device_name_input}    ${DEVICE_NAME_VALUES[1]}    ${RESTRICTED_SYMBOLS[6]}    0
    Input Value With Restricted Symbols To Input Save And Read Back    ${selector_settings_system_device_settings_device_name_input}    ${DEVICE_NAME_VALUES[1]}    ${RESTRICTED_SYMBOLS[7]}    0

    Input Value With Restricted Symbols To Input Save And Read Back    ${selector_settings_system_device_settings_device_name_input}    ${DEVICE_NAME_VALUES[1]}    ${RESTRICTED_SYMBOLS[3]}    0
    Input Value With Restricted Symbols To Input Save And Read Back    ${selector_settings_system_device_settings_device_name_input}    ${DEVICE_NAME_VALUES[1]}    ${RESTRICTED_SYMBOLS[3]}    1
    Input Value With Restricted Symbols To Input Save And Read Back    ${selector_settings_system_device_settings_device_name_input}    ${DEVICE_NAME_VALUES[1]}    ${RESTRICTED_SYMBOLS[3]}    2
    Input Value With Restricted Symbols To Input Save And Read Back    ${selector_settings_system_device_settings_device_name_input}    ${DEVICE_NAME_VALUES[1]}    ${RESTRICTED_SYMBOLS[3]}    3
    Input Value With Restricted Symbols To Input Save And Read Back    ${selector_settings_system_device_settings_device_name_input}    ${DEVICE_NAME_VALUES[1]}    ${RESTRICTED_SYMBOLS[3]}    4
    Input Value With Restricted Symbols To Input Save And Read Back    ${selector_settings_system_device_settings_device_name_input}    ${DEVICE_NAME_VALUES[1]}    ${RESTRICTED_SYMBOLS[3]}    5
    Input Value With Restricted Symbols To Input Save And Read Back    ${selector_settings_system_device_settings_device_name_input}    ${DEVICE_NAME_VALUES[1]}    ${RESTRICTED_SYMBOLS[3]}    6
    Input Value With Restricted Symbols To Input Save And Read Back    ${selector_settings_system_device_settings_device_name_input}    ${DEVICE_NAME_VALUES[1]}    ${RESTRICTED_SYMBOLS[3]}    7

    #    Test "Device name" inputs
    Input Value To Field Save And Read Back    ${selector_settings_system_device_settings_device_name_input}    ${DEVICE_NAME_VALUES[0]}
    Input Value To Field Save And Read Back    ${selector_settings_system_device_settings_device_name_input}    ${DEVICE_NAME_VALUES[1]}
    Input Value To Field Save And Read Back    ${selector_settings_system_device_settings_device_name_input}    ${DEVICE_NAME_VALUES[2]}
    Input Value To Field Save And Read Back    ${selector_settings_system_device_settings_device_name_input}    ${DEVICE_NAME_VALUES[3]}

    #    Test special symbols and empty symbols as "Device name" input
    Input Value To Field Save And Read Back    ${selector_settings_system_device_settings_device_name_input}    ´
    Input Value To Field Save And Read Back    ${selector_settings_system_device_settings_device_name_input}    '
    Input Value To Field Save And Read Back    ${selector_settings_system_device_settings_device_name_input}    ' '
    Input Value To Field Save And Read Back    ${selector_settings_system_device_settings_device_name_input}    ${EMPTY}
    Input Value To Field Save And Read Back    ${selector_settings_system_device_settings_device_name_input}    ${SPACE}
    Input Value To Field Save And Read Back    ${selector_settings_system_device_settings_device_name_input}    ${SPACE}

    # Return valid value [1]
    Input Value To Field Save And Read Back    ${selector_settings_system_device_settings_device_name_input}    ${DEVICE_NAME_VALUES[1]}


    #    Test "Session time" values
    Input Value To Field Save And Read Back    ${selector_settings_system_device_settings_session_time_input}    ${SESSION_TIME_VALUES[0]}
    Input Value To Field Save And Read Back    ${selector_settings_system_device_settings_session_time_input}    ${SESSION_TIME_VALUES[1]}
    Input Value To Field Save And Read Back    ${selector_settings_system_device_settings_session_time_input}    ${SESSION_TIME_VALUES[2]}
    Input Value To Field Save And Read Back    ${selector_settings_system_device_settings_session_time_input}    ${SESSION_TIME_VALUES[3]}
    Input Value To Field Save And Read Back    ${selector_settings_system_device_settings_session_time_input}    ${SESSION_TIME_VALUES[4]}
    # Return to valid value [1]
    Input Value To Field Save And Read Back    ${selector_settings_system_device_settings_session_time_input}    ${SESSION_TIME_VALUES[1]}

    #    Test "Password" inputs
    Input Value To Password Field Save And Read Back    ${selector_settings_system_device_settings_password_input}    ${PASSWORD_VALUES[0]}    ${selector_settings_system_device_settings_device_error_message}
    Input Value To Password Field Save And Read Back    ${selector_settings_system_device_settings_password_input}    ${PASSWORD_VALUES[1]}    ${selector_settings_system_device_settings_device_error_message}
    Input Value To Password Field Save And Read Back    ${selector_settings_system_device_settings_password_input}    ${PASSWORD_VALUES[2]}    ${selector_settings_system_device_settings_device_error_message}
    Input Value To Password Field Save And Read Back    ${selector_settings_system_device_settings_password_input}    ${PASSWORD_VALUES[3]}    ${selector_settings_system_device_settings_device_error_message}
    # Return to valid value [2]
    Input Value To Password Field Save And Read Back    ${selector_settings_system_device_settings_password_input}    ${PASSWORD_VALUES[2]}    ${selector_settings_system_device_settings_device_error_message}


    #    Test "Authentication key" inputs
    Input Value To Field Save And Read Back    ${selector_settings_system_device_settings_authentication_input}    ${AUTHENTICATION_VALUES[0]}
    Input Value To Field Save And Read Back    ${selector_settings_system_device_settings_authentication_input}    ${AUTHENTICATION_VALUES[1]}
    Input Value To Field Save And Read Back    ${selector_settings_system_device_settings_authentication_input}    ${AUTHENTICATION_VALUES[2]}
    Input Value To Field Save And Read Back    ${selector_settings_system_device_settings_authentication_input}    ${AUTHENTICATION_VALUES[3]}
    Input Value To Field Save And Read Back    ${selector_settings_system_device_settings_authentication_input}    ${EMPTY}
    Input Value To Field Save And Read Back    ${selector_settings_system_device_settings_authentication_input}    ${SPACE}

    # Return to valid value [0]
    Input Value To Field Save And Read Back    ${selector_settings_system_device_settings_authentication_input}    ${AUTHENTICATION_VALUES[0]}
    Test Input Value Read Back After Go-Back And Go-Forward    ${selector_settings_system_device_settings_authentication_input}

    #    Test SSH connection with given password
    Test SSH Connection    ${host}    ${alias}    ${username}    ${PASSWORD_VALUES[2]}   5

    #    Test session delay
    Session Delay Wait And Test Return On Start page    ${selector_settings_system_device_settings_session_time_input}    ${selector_settings_system_device_settings_save_button_enabled}    1

    [Teardown]    Browser.Close Browser


*** Keywords ***

Settings tab dashboard page
    navigate.Go to login page
    login.Login with credentials    ${user}    ${user_password}

    navigate.Go to settings

Settings tab system settings page
    navigate.Go to login page
    login.Login with credentials    ${user}    ${user_password}

    navigate.Go to system settings

Insert String
    [Arguments]    ${original}    ${insert}    ${index} 
    ${result}=    Set Variable    ${original}[0:${index}]${insert}${original}[${index}:]    # ${original}${insert}${index}    # ${result}[0:${index}] + ${insert} + ${result}[${index}:]
    [Return]    ${result}

Check Snackbar And Return Messages
    [Arguments]    ${calling_message}
    ${snackbar_visible}=    Run Keyword And Return Status    Browser.Wait For Elements State    ${selector_settings_system_device_settings_device_snackbar_container}    visible    1s
    IF    $snackbar_visible
        ${snackbar_left_message}=    Browser.Get Text    ${selector_settings_system_device_settings_device_snackbar_left_message} 
        ${snackbar_action_message}=    Browser.Get Text    ${selector_settings_system_device_settings_device_snackbar_action_message} 
        Return From Keyword    After "${calling_message}" Snackbar left message: "${snackbar_left_message}"; action message: "${snackbar_action_message}"\n
    ELSE
        Return From Keyword    After "${calling_message}" Snackbar is not visible\n
    END


Input Value To Field Save And Read Back
    [Arguments]    ${xpath}    ${value}
    ${entered_length}=    Get Length    ${value}
    Clear Text    selector=${xpath}
    Browser.Type Text    ${xpath}    txt=${value}
    # Fill Text    selector=${xpath}    txt=${value}
    Log To Console    Trying to type in text: "${value}"\n


    ${dialog_visible}=    Run Keyword And Return Status    Browser.Wait For Elements State    ${selector_settings_system_device_settings_notification_dialog}    visible    2s
    IF    $dialog_visible
        Browser.Click    ${selector_settings_system_device_settings_notification_dialog_close_btn}
    END

    ${save_enabled}=    Run Keyword And Return Status    Browser.Wait For Elements State    ${selector_settings_system_device_settings_save_button_enabled}    visible    2s
    IF    $save_enabled
        
        ${dialog_visible}=    Run Keyword And Return Status    Browser.Wait For Elements State    ${selector_settings_system_device_settings_notification_dialog}    visible    2s
        IF    $dialog_visible
            Browser.Click    ${selector_settings_system_device_settings_notification_dialog_close_btn}
        END

        
        Browser.Click    ${selector_settings_system_device_settings_save_button_enabled}

        ${dialog_visible}=    Run Keyword And Return Status    Browser.Wait For Elements State    ${selector_settings_system_device_settings_notification_dialog}    visible    2s
        IF    $dialog_visible
            Browser.Click    ${selector_settings_system_device_settings_notification_dialog_close_btn}
        END

        ${calling_message}    Set Variable    Setting ${xpath} with ${value}
        ${snackbar_status}=    Check Snackbar And Return Messages    calling_message=${calling_message}
        Log To Console    ${snackbar_status}

        ${check_text_is_same}    Browser.Get Text    selector=${xpath}
        ${uppercase_value}=    Convert To Uppercase    ${value}
        
        ${displayed_length}    Get Length    ${check_text_is_same}

        IF    $check_text_is_same == $uppercase_value
            Log To Console    Entered text: "${value}" \(${entered_length}\) is accepted and displayed as: "${check_text_is_same}" \(${displayed_length}\)\n
        ELSE
            Log To Console    Entered text: "${value}" \(${entered_length}\) and text red from field: "${check_text_is_same}" \(${displayed_length}\) are not the same\n
        END
    ELSE
        ${error_message}=    Run Keyword And Return Status    Browser.Get Text    ${selector_settings_system_device_settings_device_error_message}
        Run Keyword If    ${error_message}
        ...    Log To Console    Input value "${value}" \(${entered_length}\) is not accepted. Error message: "${error_message}". Save button is disabled\n
        ...  ELSE
        ...    Log To Console    Input value "${value}" \(${entered_length}\) is not accepted. No Error message. Save button is disabled\n
        
    END

Input Value To Password Field Save And Read Back
    [Arguments]    ${xpath}    ${value}    ${xpath_error}
    Clear Text    selector=${xpath}
    Browser.Type Text    ${xpath}    txt=${value}
    # Fill Text    selector=${xpath}    txt=${value}
    Log To Console    Trying to type in text: "${value}"\n
    ${error_visible}=    Run Keyword And Return Status    Browser.Wait For Elements State    ${xpath_error}    visible    1s
    IF    $error_visible
        ${error_message}=    Browser.Get Text    ${xpath_error}
        Log To Console    Error message: "${error_message}".\n
    END

    ${dialog_visible}=    Run Keyword And Return Status    Browser.Wait For Elements State    ${selector_settings_system_device_settings_notification_dialog}    visible    2s
    IF    $dialog_visible
        Browser.Click    ${selector_settings_system_device_settings_notification_dialog_close_btn}
    END

   ${save_enabled}=    Run Keyword And Return Status    Browser.Wait For Elements State    ${selector_settings_system_device_settings_save_button_enabled}    visible    1s
    IF    $save_enabled
        Browser.Click    ${selector_settings_system_device_settings_save_button_enabled}

        ${calling_message}    Set Variable    Setting ${xpath} with ${value}
        ${snackbar_status}=    Check Snackbar And Return Messages    calling_message=${calling_message}
        Log To Console    ${snackbar_status}

        ${check_text_is_same}    Browser.Get Text    selector=${xpath}
        ${secret_value}=    Set Variable    ********
        
        IF    $check_text_is_same == $secret_value
            Log To Console    Entered text: "${value}" is accepted and displayed as: "${check_text_is_same}"\n
        ELSE
            Log To Console    Entered text: "${value}" and text red from field: "${check_text_is_same}" are not the same\n
        END
    ELSE
        ${error_message}=    Browser.Get Text    ${xpath_error}
        Log To Console    Input value "${value}" is not accepted. Error message: "${error_message}". Save button is disabled\n
    END


Add Symbol To Value At Place
    [Arguments]    ${value}    ${symbol}    ${place}
    ${insert_index}=    Set Variable    ${place}
    ${new_value}=    Insert String    ${value}    ${symbol}    ${insert_index}
    [Return]    ${new_value}


Input Value With Restricted Symbols To Input Save And Read Back
    [Arguments]    ${xpath}    ${value}    ${symbol}    ${place}
    Clear Text    selector=${xpath}
    ${value_with_symbol}=    Add Symbol To Value At Place    ${value}    ${symbol}    ${place}
    Browser.Type Text    selector=${xpath}    txt=${value_with_symbol}
    # Fill Text    selector=${xpath}    txt=${value_with_symbol}
    Log To Console    Trying to type in text: "${value}"\n

    ${dialog_visible}=    Run Keyword And Return Status    Browser.Wait For Elements State    ${selector_settings_system_device_settings_notification_dialog}    visible    2s
    IF    $dialog_visible
        Browser.Click    ${selector_settings_system_device_settings_notification_dialog_close_btn}
    END

    ${save_enabled}=    Run Keyword And Return Status    Browser.Wait For Elements State    ${selector_settings_system_device_settings_save_button_enabled}    visible    1s
    IF    $save_enabled
        Browser.Click    ${selector_settings_system_device_settings_save_button_enabled}

        ${dialog_visible}=    Run Keyword And Return Status    Browser.Wait For Elements State    ${selector_settings_system_device_settings_notification_dialog}    visible    2s
        IF    $dialog_visible
            Browser.Click    ${selector_settings_system_device_settings_notification_dialog_close_btn}
        END

        ${calling_message}    Set Variable    Setting ${xpath} with ${value}
        ${snackbar_status}=    Check Snackbar And Return Messages    calling_message=${calling_message}
        Log To Console    ${snackbar_status}

        ${check_text_is_same}    Browser.Get Text    selector=${xpath}
        ${uppercase_value}=    Convert To Uppercase    ${value_with_symbol}
        ${entered_length}=    Get Length    ${value_with_symbol}
        ${displayed_length}    Get Length    ${check_text_is_same}


        IF    $check_text_is_same == $uppercase_value
            Log To Console    Entered text "${value_with_symbol}" \(${entered_length}\) is accepted and displayed as: "${check_text_is_same}" \(${displayed_length}\)\n
        ELSE
            Log To Console    Entered text "${value_with_symbol}" \(${entered_length}\) and text red from field: "${check_text_is_same}" \(${displayed_length}\) are not the same\n
        END

    ELSE
        ${error_message}=    Browser.Get Text    ${selector_settings_system_device_settings_device_error_message}
        Log To Console    Input value "${value_with_symbol}" is not accepted. Error message: "${error_message}". Save button is disabled\n
    END


Session Delay Wait And Test Return On Start page
    [Arguments]    ${delay_input_xpath}    ${save_xpath}    ${value}
    Clear Text    selector=${delay_input_xpath}
    Browser.Type Text    selector=${delay_input_xpath}    txt=${value}
    
    ${dialog_visible}=    Run Keyword And Return Status    Browser.Wait For Elements State    ${selector_settings_system_device_settings_notification_dialog}    visible    2s
    IF    $dialog_visible
        Browser.Click    ${selector_settings_system_device_settings_notification_dialog_close_btn}
    END

    ${save_enabled}=    Run Keyword And Return Status    Browser.Wait For Elements State    ${selector_settings_system_device_settings_save_button_enabled}    visible    1s
    IF    $save_enabled
        Browser.Click    ${selector_settings_system_device_settings_save_button_enabled}

        ${dialog_visible}=    Run Keyword And Return Status    Browser.Wait For Elements State    ${selector_settings_system_device_settings_notification_dialog}    visible    2s
        IF    $dialog_visible
            Browser.Click    ${selector_settings_system_device_settings_notification_dialog_close_btn}
        END

        ${calling_message}    Set Variable    Setting ${delay_input_xpath} with ${value}
        ${start_time}=    Get Current Date    result_format=${timestamp_format}
        ${snackbar_status}=    Check Snackbar And Return Messages    calling_message=${calling_message}
        Log To Console    Snackbar: ${snackbar_status}
    ELSE
        Log To Console    Save Button disabled
    END

    Logout
    Login with credentials    system    24680

    ${seconds}=    Evaluate    (${value} * 60)
    ${seconds_to_wait}=    Evaluate    (${value} * 60) + 60

    # Sleep    ${seconds}
    
    ${start_page}=    Run Keyword And Return Status    Browser.Wait For Elements State    ${selector_start_page_login_container}    visible    ${seconds_to_wait}s
    IF    $start_page
        ${stop_time}=    Get Current Date    result_format=${timestamp_format}
        ${duration}=    Evaluate    (datetime.datetime.strptime('${stop_time}', '${timestamp_format}') - datetime.datetime.strptime('${start_time}', '${timestamp_format}')).total_seconds()
        Log To Console    Session delay is set to ${value} min (${seconds} sec). Start page is displayed after ${duration} sec
    ELSE
        ${stop_time}=    Get Current Date    result_format=${timestamp_format}
        ${duration}=    Evaluate    (datetime.datetime.strptime('${stop_time}', '${timestamp_format}') - datetime.datetime.strptime('${start_time}', '${timestamp_format}')).total_seconds()
        Log To Console    Session delay is set to ${value} min (${seconds} sec). Start page is not displayed after ${duration} sec
    END

Test Input Value Read Back After Go-Back And Go-Forward
    [Arguments]    ${input_xpath}
    ${input_xpath_visible}=    Run Keyword And Return Status    Browser.Wait For Elements State    ${input_xpath}    visible    1s
    IF    $input_xpath_visible
        ${original_text}    Browser.Get Text    selector=${input_xpath}
        ${original_text_length}    Get Length    ${original_text}
        Browser.Go Back
        Browser.Go Forward

        ${input_xpath_visible_after_back_forward}=    Run Keyword And Return Status    Browser.Wait For Elements State    ${input_xpath}    visible    1s
        IF    $input_xpath_visible_after_back_forward
            ${updated_text}    Browser.Get Text    selector=${input_xpath}
            ${updated_text_length}    Get Length    ${updated_text}
        ELSE
            Log To Console    Input xpath not visible after going back - forward
        END
        
        ${uppercase_original_text}=    Convert To Uppercase    ${original_text}
        
        IF    $updated_text == $uppercase_original_text or $updated_text == $original_text
            Log To Console    After going back - forward, text "${original_text}" \(${original_text_length}\) is accepted and displayed as: "${updated_text}" \(${updated_text_length}\)\n
        ELSE
            Log To Console    After going back - forward, Entered text "${original_text}" \(${original_text_length}\) and text red from field: "${updated_text}" \(${updated_text_length}\) are not the same\n
        END

    ELSE
        Log To Console    Input xpath not visible on original page
    END

Test SSH Connection
    [Arguments]    ${host}    ${alias}    ${username}    ${password}    ${delay}
    Open Connection    ${host}        alias=${alias}
    Login              ${username}    ${password}    delay=${delay}
    ${connection_info}=    Get Connection
    Log To Console    Connection info: ${connection_info}
    # ${response_ok}=    Run Keyword And Return Status    Execute Command    hostname
    
    # IF    $response_ok
    #     ${response}=    Execute Command    hostname
    #     Log To Console    SSH connection OK, host responded:  ${response}
    # ELSE
    #     Log To Console    SSH connection Not OK, host did not respond
    # END
    @{files}= 	OperatingSystem.List Files In Directory 	/tmp 	absolute=True
    Log To Console    Files in tmp: @{files}
    Close All Connections