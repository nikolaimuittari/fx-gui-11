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

Suite Setup     Settings tab system settings page


*** Variables ***
${user}                         system
${user_password}                24680

${MIN_LENGTH}    1
${MAX_LENGTH}    29
@{RESTRICTED_SYMBOLS}    -    _    +    @    $    ^    &    *
@{VALID_VALUES}    aBc    abcd1234    This_is_30_symbols_text_303030    This_is_29_symbols_text_29292
${SPACE}    ' '

# Locators
${selector_settings_system_device_settings_header}                          xpath=//div[@class="sub_settings_toolbar ng-star-inserted"]

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

*** Test Cases ***
Open settings system sevice tab and check content
    [Documentation]    Check operation in Settings -> System Settings Device -> Device Settings
    Browser.Wait For Elements State    ${selector_settings_system_device_settings_header}    visible    1s
    ${settings_header_text}    Browser.Get Text    ${selector_settings_system_device_settings_header}
    Log To Console    Text in header: ${settings_header_text}
    
    Input Value With Restricted Symbols To Input Save And Read Back    ${selector_settings_system_device_settings_device_name_input}    ${VALID_VALUES[1]}    ${RESTRICTED_SYMBOLS[0]}    0
    Input Value With Restricted Symbols To Input Save And Read Back    ${selector_settings_system_device_settings_device_name_input}    ${VALID_VALUES[1]}    ${RESTRICTED_SYMBOLS[1]}    1
    Input Value With Restricted Symbols To Input Save And Read Back    ${selector_settings_system_device_settings_device_name_input}    ${VALID_VALUES[1]}    ${RESTRICTED_SYMBOLS[2]}    2
    Input Value With Restricted Symbols To Input Save And Read Back    ${selector_settings_system_device_settings_device_name_input}    ${VALID_VALUES[1]}    ${RESTRICTED_SYMBOLS[3]}    3
    Input Value With Restricted Symbols To Input Save And Read Back    ${selector_settings_system_device_settings_device_name_input}    ${VALID_VALUES[1]}    ${RESTRICTED_SYMBOLS[4]}    4
    Input Value With Restricted Symbols To Input Save And Read Back    ${selector_settings_system_device_settings_device_name_input}    ${VALID_VALUES[1]}    ${RESTRICTED_SYMBOLS[5]}    5
    Input Value With Restricted Symbols To Input Save And Read Back    ${selector_settings_system_device_settings_device_name_input}    ${VALID_VALUES[1]}    ${RESTRICTED_SYMBOLS[6]}    6
    Input Value With Restricted Symbols To Input Save And Read Back    ${selector_settings_system_device_settings_device_name_input}    ${VALID_VALUES[1]}    ${RESTRICTED_SYMBOLS[7]}    7

    Input Value To Field Save And Read Back    ${selector_settings_system_device_settings_device_name_input}    ${VALID_VALUES[0]}
    Input Value To Field Save And Read Back    ${selector_settings_system_device_settings_device_name_input}    ${VALID_VALUES[1]}
    Input Value To Field Save And Read Back    ${selector_settings_system_device_settings_device_name_input}    ${VALID_VALUES[2]}
    Input Value To Field Save And Read Back    ${selector_settings_system_device_settings_device_name_input}    ${VALID_VALUES[3]}

    Input Value To Field Save And Read Back    ${selector_settings_system_device_settings_device_name_input}    ´
    Input Value To Field Save And Read Back    ${selector_settings_system_device_settings_device_name_input}    '
    Input Value To Field Save And Read Back    ${selector_settings_system_device_settings_device_name_input}    ' '
    Input Value To Field Save And Read Back    ${selector_settings_system_device_settings_device_name_input}    ${EMPTY}
    Input Value To Field Save And Read Back    ${selector_settings_system_device_settings_device_name_input}    ${SPACE}

    [Teardown]    Browser.Close Browser




# TODO test where points with different user level and validate content with access rights


*** Keywords ***
Settings tab dashboard page
    navigate.Go to login page
    login.Login with credentials    ${user}    ${user_password}

    navigate.Go to settings

Settings tab system settings page
    navigate.Go to login page
    login.Login with credentials    ${user}    ${user_password}

    navigate.Go to system settings

Settings tab system settings device settings device name tests
    [Documentation]    Verifies that entering fewer than minimum lengh characters triggers an error message.
    Log To Console    1

Insert String
    [Arguments]    ${original}    ${insert}    ${index} 
    ${result}=    Set Variable    ${original}[0:${index}]${insert}${original}[${index}:]    # ${original}${insert}${index}    # ${result}[0:${index}] + ${insert} + ${result}[${index}:]
    [Return]    ${result}

Check Snackbar And Return Messages
    ${snackbar_visible}=    Run Keyword And Return Status    Browser.Wait For Elements State    ${selector_settings_system_device_settings_device_snackbar_container}    visible    1s
    IF    $snackbar_visible
        ${snackbar_left_message}=    Browser.Get Text    ${selector_settings_system_device_settings_device_snackbar_left_message} 
        ${snackbar_action_message}=    Browser.Get Text    ${selector_settings_system_device_settings_device_snackbar_action_message} 
        Return From Keyword    Snackbar left message: "${snackbar_left_message}"; action message: "${snackbar_action_message}"
    ELSE
        Fail    Snackbar is not visible
    END


Input Value To Field Save And Read Back
    [Arguments]    ${xpath}    ${value}
    Clear Text    selector=${xpath}
    Fill Text    selector=${xpath}    txt=${value}

    ${save_enabled}=    Run Keyword And Return Status    Browser.Wait For Elements State    ${selector_settings_system_device_settings_save_button_enabled}    visible    1s
    IF    $save_enabled
        Browser.Click    ${selector_settings_system_device_settings_save_button_enabled}
    ELSE
        ${error_message}=    Browser.Get Text    ${selector_settings_system_device_settings_device_error_message}
        Log To Console    Input value "${value}" is not accepted. Error message: "${error_message}". Save button is disabled
    END

    ${snackbar_status}=    Check Snackbar And Return Messages
    Log To Console    ${snackbar_status}

    ${check_text_is_same}    Browser.Get Text    selector=${xpath}
    ${uppercase_value}=    Convert To Uppercase    ${value}
    
    IF    $check_text_is_same == $uppercase_value
        Log To Console    Entered text "${value}" is capitalized: "${uppercase_value}", accepted and displayed: "${check_text_is_same}" 
    ELSE
        Log To Console    Text red from field: "${check_text_is_same}" and entered text: "${value}" are not the same
    END

Add Symbol To Value At Place
    [Arguments]    ${value}    ${symbol}    ${place}
    IF    $place == random
        ${insert_index}=    Evaluate    ''.join(random.choices(string.digits, k=1))
    ELSE
        ${insert_index}=    Set Variable    ${place}
    END
    ${new_value}=    Insert String    ${value}    ${symbol}    ${insert_index}
    [Return]    ${new_value}


Input Value With Restricted Symbols To Input Save And Read Back
    [Arguments]    ${xpath}    ${value}    ${symbol}    ${place}
    Clear Text    selector=${xpath}
    ${value_with_symbol}=    Add Symbol To Value At Place    ${value}    ${symbol}    ${place}
    Fill Text    selector=${xpath}    txt=${value_with_symbol}
    
    ${save_enabled}=    Run Keyword And Return Status    Browser.Wait For Elements State    ${selector_settings_system_device_settings_save_button_enabled}    visible    1s
    IF    $save_enabled
        Browser.Click    ${selector_settings_system_device_settings_save_button_enabled}
    ELSE
        Log To Console    Save button is disabled
    END


    ${snackbar_status}=    Check Snackbar And Return Messages
    Log To Console    ${snackbar_status}

    ${check_text_is_same}    Browser.Get Text    selector=${xpath}
    ${uppercase_value}=    Convert To Uppercase    ${value_with_symbol}
    
    IF    $check_text_is_same == $uppercase_value
        Log To Console    Entered text "${value_with_symbol}" is capitalized: "${uppercase_value}", accepted and displayed: "${check_text_is_same}" 
    ELSE
        Log To Console    Text red from field: "${check_text_is_same}" and entered text: "${value_with_symbol}" are not the same
    END
