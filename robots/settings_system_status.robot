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

Suite Setup     Settings tab system settings status page

*** Variables ***
${user}                         system
${user_password}                24680

${timestamp_format}    %Y-%m-%d %H:%M:%S.%f

${host}             10.100.1.199
${username}         fx3000
${password}         ${EMPTY}
${alias}            fx3000x

${SPACE}    
@{RESTRICTED_SYMBOLS}    -    _    +    @    $    ^    &    *
@{DEVICE_NAME_VALUES}    aBc    abcd1234    This_is_30_symbols_text_303030    This_is_29_symbols_text_29292
@{SESSION_TIME_VALUES}    0    1    9999    999999    ABCD
@{PASSWORD_VALUES}    0    24680    Systemuser!    This_is_a_VERY_long_password_phrase_with_digits_and_symbols_0123456789_!@£$€    256_This_is_a_VERY_long_password_phrase_with_digits_and_symbols_0123456789_!@£$€_This_is_a_VERY_long_password_phrase_with_digits_and_symbols_0123456789_!@£$€_This_is_a_VERY_long_password_phrase_with_digits_and_symbols_0123456789_!@£$€_This_is_a_VE
@{AUTHENTICATION_VALUES}    FdxAuth    This_is_30_symbols_text_303030    This_is_33_symbols_text_33333333    This_is_64_symbols_text_646464646464646464646464646464646464646


# Locators
${selector_settings_system_device_settings_header}                          xpath=//div[@class="sub_settings_toolbar ng-star-inserted"]
${selector_start_page_login_container}                                      xpath=//div[@class="login_container"]

*** Test Cases ***
Open settings system sevice tab and check content
    [Documentation]    Check operation in Settings -> System Settings Device -> Device Settings
    Browser.Wait For Elements State    ${selector_settings_system_device_settings_header}    visible    1s
    ${settings_header_text}    Browser.Get Text    ${selector_settings_system_device_settings_header}
    Log To Console    Text in header: ${settings_header_text}

    [Teardown]    Browser.Close Browser


*** Keywords ***

Settings tab dashboard page
    navigate.Go to login page
    login.Login with credentials    ${user}    ${user_password}

    navigate.Go to settings

Settings tab system settings status page
    navigate.Go to login page
    login.Login with credentials    ${user}    ${user_password}

    navigate.Go to system status settings


