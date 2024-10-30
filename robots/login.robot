*** Settings ***
Resource    resources\\env.resource
Resource    resources\\login.resource
Resource    resources\\navigate.resource
Library     Browser


*** Variables ***
${invalid_cred}     1234567890


*** Test Cases ***
Login with valid credentials
    Go to login page
    Login with credentials    ${TARGET_USER}    ${TARGET_USER_PASSWORD}

Login with enter key
    Go to login page
    Fill text to username field    ${TARGET_USER}
    Fill text to password field    ${TARGET_USER_PASSWORD}
    Keyboard Key    press    Enter
    Validate logged in

Login fail with invalid credentials
    [Tags]    slow
    [Template]    Enter wrong credentials and expect fail

    ${TARGET_USER}    ${invalid_cred}
    ${invalid_cred}    ${TARGET_USER_PASSWORD}
    ${TARGET_USER}    ${EMPTY}
    ${EMPTY}    ${TARGET_USER_PASSWORD}

Login works after timeout text unvisible
    [Documentation]
    ...    When we login with invalid credentials timeout text will
    ...    be shown x seconds. After that login should succeed.

    Go to login page
    Login with wrong credentials    ${TARGET_USER}    ${invalid_cred}
    Wait login snackbar info is hidden
    Login with credentials    ${TARGET_USER}    ${TARGET_USER_PASSWORD}

Correct type fields
    [Template]    Selector correct type template
    ${selector_username_field}    text
    ${selector_password_field}    password

Logout works
    Go to main view
    Logout


*** Keywords ***
Enter wrong credentials and expect fail
    [Documentation]
    ...    This keyword is used to test login with wrong credentials. This has
    ...    benefit that this will reset timeout timer with correct login so it
    ...    does not increase.
    [Arguments]    ${username}    ${password}

    Go to login page
    Login with wrong credentials    ${username}    ${password}
    Wait login snackbar info is hidden

    [Teardown]    Login with credentials    ${TARGET_USER}    ${TARGET_USER_PASSWORD}

Selector correct type template
    [Arguments]    ${selector}    ${type}

    Go to login page
    ${actual_type}    Get Attribute    ${selector}    type
    Should Be Equal    ${actual_type}    ${type}
