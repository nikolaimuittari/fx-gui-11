*** Settings ***
Library     Browser


*** Variables ***
${selector_username_field}      xpath=//input[@type="text"]
${selector_password_field}      xpath=//input[@type="password"]
${selector_login_button}        xpath=//button[@class="login_button"]
${selector_timeout_snackbar}    xpath=//div[@class="cdk-overlay-container"]

${selector_topbar}              xpath=//mat-toolbar[@id='header']
${selector_logout_usermenu}     xpath=//div[@id="user_menu"]
${selector_logout_button}       xpath=//button[@aria-label='Logout']
${selector_version_info}        xpath=//div[@class='version_info']


*** Keywords ***
Login with credentials
    [Documentation]
    ...    This keyword will login to the application with the given credentials.
    ...    This only works if we are in the login page.
    [Arguments]    ${username}    ${password}

    Fill text to username field    ${username}
    Fill text to password field    ${password}
    Click login button
    Validate logged in

Login with wrong credentials
    [Documentation]
    ...    Same as "Login with credentials", but will expect login to fail.
    ...    We do little magic so we do not get extra screenshots.
    [Arguments]    ${username}    ${password}

    Run Keyword And Expect Error    TimeoutError*    Login with credentials    ${username}    ${password}

Check login page is active
    [Documentation]
    ...    This keyword will check if we are in login page
    Wait For Elements State    ${selector_username_field}    visible
    Wait For Elements State    ${selector_login_button}    visible
    Wait For Elements State    ${selector_version_info}    visible    timeout=5s
    ${version_info}=    Get Text    ${selector_version_info}
    Log To Console    ${version_info}

Validate logged in
    # TODO: For some reason selector is not working when we call this second
    # times
    Wait For Elements State    ${selector_topbar}    visible    2s

Fill text to username field
    [Documentation]
    ...    This keyword will input text to username field
    [Arguments]    ${username}

    Fill Text    ${selector_username_field}    ${username}

Fill text to password field
    [Documentation]
    ...    This keyword will input text to password field
    [Arguments]    ${password}

    Fill Text    ${selector_password_field}    ${password}

Click login button
    Browser.Click    ${selector_login_button}

Login snackbar info is visible
    [Documentation]
    ...    Check if the snackbar is visible. Snackbar info will come
    ...    when the user tries to login with wrong credentials.

    Wait For Elements State    ${selector_timeout_snackbar}    visible

Wait login snackbar info is hidden
    [Documentation]
    ...    Check if the snackbar is hidden.

    Login snackbar info is visible
    Wait For Elements State    ${selector_timeout_snackbar}    hidden    6s

Logout
    [Documentation]
    ...    This keyword will logout from the application. This only works if
    ...    we are logged in.

    Click    ${selector_logout_usermenu}
    Click    ${selector_logout_button}
    Check login page is active
