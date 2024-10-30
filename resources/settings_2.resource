*** Settings ***
Library     Browser
Resource    navigate.resource
Resource    login.resource
Resource    settings_id.resource
Resource    point_locators.resource
Resource    settings_locators.resource
Resource    global_variables.resource


*** Variables ***
${MIN_PORT_NUMBER}      1
${MAX_PORT_NUMBER}      65535


*** Keywords ***
Settings Network NAT Settings
    [Arguments]    ${mode}    ${save}
    Go to settings
    Sleep    ${SLEEP_TIME}

    Browser.Click    ${selector_settings_network_btn}
    Sleep    ${SLEEP_TIME}

    Browser.Click    ${selector_settings_network_nat_item}
    Sleep    ${SLEEP_TIME}

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

    ${possible_values}=    Create List    254    252    248    240    224    192    128    0
    ${list_length}=    Get Length    ${possible_values}
    ${mask_octets}=    Set Variable    255.255.255.

    # NAT rule #1

    Keyboard Key    press    Tab
    Sleep    ${SLEEP_TIME}

    IF    ${mode} == 1
        FOR    ${i}    IN RANGE    1    30
            Keyboard Key    press    ArrowDown
            Sleep    ${SLEEP_TIME}
            Sleep    ${SLEEP_TIME}
            Keyboard Key    press    Tab
            Sleep    ${SLEEP_TIME}

            ${random_port}=    Evaluate    random.randint(int('${MIN_PORT_NUMBER}'), int('${MAX_PORT_NUMBER}'))
            Keyboard Input    insertText    ${random_port}
            Keyboard Key    press    Tab
            Sleep    ${SLEEP_TIME}

            ${random_ip}=    Evaluate    '.'.join(map(str, random.sample(range(1, 256), 4)))
            Keyboard Input    type    ${random_ip}
            Keyboard Key    press    Tab
            Sleep    ${SLEEP_TIME}

            ${random_port}=    Evaluate    random.randint(int('${MIN_PORT_NUMBER}'), int('${MAX_PORT_NUMBER}'))
            Keyboard Input    type    ${random_port}
            Keyboard Key    press    Tab
            Sleep    ${SLEEP_TIME}
            Keyboard Key    press    Space
            Sleep    ${SLEEP_TIME}
            Keyboard Key    press    Space
            Sleep    ${SLEEP_TIME}
            Keyboard Key    press    Tab
            Sleep    ${SLEEP_TIME}

            Keyboard Key    press    Space
            Sleep    ${SLEEP_TIME}
            Keyboard Key    press    Tab
            Sleep    ${SLEEP_TIME}
            ${random_ip}=    Evaluate    '.'.join(map(str, random.sample(range(1, 255), 4)))
            Keyboard Input    type    ${random_ip}
            Keyboard Key    press    Tab
            Sleep    ${SLEEP_TIME}

            ${random_index}=    Evaluate    random.randint(0, ${list_length} - 1)
            ${random_value}=    Set Variable    ${possible_values}[${random_index}]
            ${random_mask_octet}=    Convert To String    ${possible_values}[${random_index}]
            ${random_subnet_mask}=    Set Variable    ${mask_octets}${random_mask_octet}

            Keyboard Input    type    ${random_subnet_mask}
            Keyboard Key    press    Tab
            Sleep    ${SLEEP_TIME}

            Keyboard Key    press    Space
            Sleep    ${SLEEP_TIME}
            Keyboard Key    press    Tab
            Sleep    ${SLEEP_TIME}
            ${random_ip}=    Evaluate    '.'.join(map(str, random.sample(range(1, 255), 4)))
            Keyboard Input    type    ${random_ip}
            Keyboard Key    press    Tab
            Sleep    ${SLEEP_TIME}

            ${random_index}=    Evaluate    random.randint(0, ${list_length} - 1)
            ${random_value}=    Set Variable    ${possible_values}[${random_index}]
            ${random_mask_octet}=    Convert To String    ${possible_values}[${random_index}]
            ${random_subnet_mask}=    Set Variable    ${mask_octets}${random_mask_octet}

            Keyboard Input    type    ${random_subnet_mask}
            Keyboard Key    press    Tab
            Sleep    ${SLEEP_TIME}

            Keyboard Key    press    Space
            Sleep    ${SLEEP_TIME}
            Keyboard Key    press    Tab
            Sleep    ${SLEEP_TIME}
            ${random_ip}=    Evaluate    '.'.join(map(str, random.sample(range(1, 256), 3)))
            Keyboard Input    type    ${random_ip}.${i}
            Keyboard Key    press    Tab
            Sleep    ${SLEEP_TIME}

            ${random_index}=    Evaluate    random.randint(0, ${list_length} - 1)
            ${random_value}=    Set Variable    ${possible_values}[${random_index}]
            ${random_mask_octet}=    Convert To String    ${possible_values}[${random_index}]
            ${random_subnet_mask}=    Set Variable    ${mask_octets}${random_mask_octet}

            Keyboard Input    type    ${random_subnet_mask}
            Keyboard Key    press    Tab
            Sleep    ${SLEEP_TIME}
        END
    ELSE IF    ${mode} == 2
        Log To Console    Mode : ${mode}
    END

    IF    ${save} == 1
        ${element_visible}=    Run Keyword And Return Status
        ...    Wait for Elements State
        ...    ${selector_settings_network_nat_save_active_btn}
        ...    visible
        ...    timeout=2s
        IF    ${element_visible}
            Log To Console    Saving button active. Saving...
            Browser.Click    ${selector_settings_network_nat_save_active_btn}
            Sleep    ${SLEEP_TIME}
            ${snack-bar_visible}=    Run Keyword And Return Status
            ...    Wait For Elements State
            ...    xpath=//div[contains(@class, "mat-simple-snackbar")]
            ...    visible
            ...    timeout=5s
            IF    ${snack-bar_visible}
                Log To Console    Save succesful. Snack-bar visible
            ELSE
                Log To Console    Snack-bar not visible
            END
        ELSE
            Log To Console    Saving button not active. Cancelling...
            Browser.Click    ${selector_settings_network_port_cancel_btn}
            Sleep    ${SLEEP_TIME}
        END
        Sleep    ${SLEEP_TIME}
    ELSE
        Log To Console    Saving not requested. Cancelling...
        Browser.Click    ${selector_settings_network_port_cancel_btn}
        Sleep    ${SLEEP_TIME}
    END

Settings Network Alarm Email Settings
    [Arguments]    ${save}
    Go to settings
    Sleep    ${SLEEP_TIME}

    Browser.Click    ${selector_settings_network_btn}
    Sleep    ${SLEEP_TIME}

    Browser.Click    ${selector_settings_network_alarm_item}
    Sleep    ${SLEEP_TIME}

    ${header_visible}=    Run Keyword And Return Status
    ...    Wait for Elements State
    ...    ${selector_settings_network_alarm_header}
    ...    visible
    ...    timeout=2s
    IF    ${header_visible}
        Log To Console    Alarm email settings header visible
    ELSE
        Log To Console    Alarm email settings header NOT visible
    END

    ${i}=    Set Variable    1

    Keyboard Key    press    Tab
    Sleep    ${SLEEP_TIME}

    FOR    ${i}    IN RANGE    1    6
        Keyboard Input    type    Server_${i}
        Sleep    ${SLEEP_TIME}
        Keyboard Key    press    Tab
        Sleep    ${SLEEP_TIME}

        Keyboard Input    type    smtp.server_${i}.fi
        Sleep    ${SLEEP_TIME}
        Keyboard Key    press    Tab
        Sleep    ${SLEEP_TIME}

        Keyboard Input    type    25${i}
        Sleep    ${SLEEP_TIME}
        Keyboard Key    press    Tab
        Sleep    ${SLEEP_TIME}

        Keyboard Key    press    Space
        Sleep    ${SLEEP_TIME}
        Keyboard Key    press    Tab
        Sleep    ${SLEEP_TIME}

        Keyboard Input    type    example@server_${i}.fi
        Sleep    ${SLEEP_TIME}
        Keyboard Key    press    Tab
        Sleep    ${SLEEP_TIME}

        Keyboard Input    type    Name_${i}
        Sleep    ${SLEEP_TIME}
        Keyboard Key    press    Tab
        Sleep    ${SLEEP_TIME}

        Keyboard Input    type    Subject_${i}
        Sleep    ${SLEEP_TIME}
        Keyboard Key    press    Tab
        Sleep    ${SLEEP_TIME}

        Keyboard Key    press    Space
        Sleep    ${SLEEP_TIME}
        Keyboard Key    press    Tab
        Sleep    ${SLEEP_TIME}

        Keyboard Input    type    Domain_${i}.server_${i}.fi
        Sleep    ${SLEEP_TIME}
        Keyboard Key    press    Tab
        Sleep    ${SLEEP_TIME}

        Keyboard Input    type    username_${i}
        Sleep    ${SLEEP_TIME}
        Keyboard Key    press    Tab
        Sleep    ${SLEEP_TIME}

        Keyboard Input    type    password_${i}
        Sleep    ${SLEEP_TIME}
        Keyboard Key    press    Tab
        Sleep    ${SLEEP_TIME}

        Keyboard Key    press    Space
        Sleep    ${SLEEP_TIME}
        Keyboard Key    press    Tab
        Sleep    ${SLEEP_TIME}

        Keyboard Input    type    ${i}00
        Sleep    ${SLEEP_TIME}
        Keyboard Key    press    Tab
        Sleep    ${SLEEP_TIME}

        Keyboard Input    type    Subject_${i}
        Sleep    ${SLEEP_TIME}
        Keyboard Key    press    Tab
        Sleep    ${SLEEP_TIME}

        Keyboard Input    type    example@server_${i}.fi
        Sleep    ${SLEEP_TIME}
        Keyboard Key    press    Tab
        Sleep    ${SLEEP_TIME}
    END

    IF    ${save} == 1
        ${element_visible}=    Run Keyword And Return Status
        ...    Wait for Elements State
        ...    ${selector_settings_network_port_save_active_btn}
        ...    visible
        ...    timeout=2s
        IF    ${element_visible}
            Log To Console    Saving button active. Saving...
            Browser.Click    ${selector_settings_network_ip_save_active_btn}
            Sleep    ${SLEEP_TIME}
            ${snack-bar_visible}=    Run Keyword And Return Status
            ...    Wait For Elements State
            ...    xpath=//div[contains(@class, "mat-simple-snackbar")]
            ...    visible
            ...    timeout=5s
            IF    ${snack-bar_visible}
                Log To Console    Save succesful. Snack-bar visible
            ELSE
                Log To Console    Snack-bar not visible
            END
        ELSE
            Log To Console    Saving button not active. Cancelling...
            Browser.Click    ${selector_settings_network_port_cancel_btn}
            Sleep    ${SLEEP_TIME}
        END
        Sleep    ${SLEEP_TIME}
    ELSE
        Log To Console    Saving not requested. Cancelling...
        Browser.Click    ${selector_settings_network_port_cancel_btn}
        Sleep    ${SLEEP_TIME}
    END

Settings Network History Settings
    [Arguments]
    ...    ${username}
    ...    ${password}
    ...    ${ip_address}
    ...    ${ip_port}
    ...    ${timeout}
    ...    ${databasename}
    ...    ${databaseurl}
    ...    ${savemode}
    ...    ${save}
    Go to settings
    Sleep    ${SLEEP_TIME}

    Browser.Click    ${selector_settings_network_btn}
    Sleep    ${SLEEP_TIME}

    Browser.Click    ${selector_settings_network_history_item}
    Sleep    ${SLEEP_TIME}

    ${header_visible}=    Run Keyword And Return Status
    ...    Wait for Elements State
    ...    ${selector_settings_network_history_header}
    ...    visible
    ...    timeout=2s
    IF    ${header_visible}
        Log To Console    History settings header visible
    ELSE
        Log To Console    History settings header NOT visible
    END

    Keyboard Key    press    Tab
    Keyboard Key    press    Space
    #    Browser.Click    ${selector_settings_network_history_save_sql_chkbx}
    Sleep    ${SLEEP_TIME}

    Fill Text    ${selector_settings_network_history_username_input}    ${username}
    Sleep    ${SLEEP_TIME}
    Fill Text    ${selector_settings_network_history_password_input}    ${password}
    Sleep    ${SLEEP_TIME}
    Fill Text    ${selector_settings_network_history_ip_address_input}    ${ip_address}
    Sleep    ${SLEEP_TIME}
    Fill Text    ${selector_settings_network_history_ip_port_input}    ${ip_port}
    Sleep    ${SLEEP_TIME}
    Fill Text    ${selector_settings_network_history_timeout_input}    ${timeout}
    Sleep    ${SLEEP_TIME}
    Fill Text    ${selector_settings_network_history_databaseName_input}    ${databasename}
    Sleep    ${SLEEP_TIME}
    Fill Text    ${selector_settings_network_history_databaseUrl_input}    ${databaseurl}
    Sleep    ${SLEEP_TIME}
    Browser.Click    ${selector_settings_network_history_saveMode_ddwn}
    Sleep    ${SLEEP_TIME}
    Keyboard Key    press    ArrowDown
    Sleep    ${SLEEP_TIME}
    Keyboard Key    press    Enter
    Sleep    ${SLEEP_TIME}

    IF    ${save} == 1
        ${element_visible}=    Run Keyword And Return Status
        ...    Wait for Elements State
        ...    ${selector_settings_network_port_save_active_btn}
        ...    visible
        ...    timeout=2s
        IF    ${element_visible}
            Log To Console    Saving button active. Saving...
            Browser.Click    ${selector_settings_network_ip_save_active_btn}
            Sleep    ${SLEEP_TIME}
            ${snack-bar_visible}=    Run Keyword And Return Status
            ...    Wait For Elements State
            ...    xpath=//div[contains(@class, "mat-simple-snackbar")]
            ...    visible
            ...    timeout=5s
            IF    ${snack-bar_visible}
                Log To Console    Save succesful. Snack-bar visible
            ELSE
                Log To Console    Snack-bar not visible
            END
        ELSE
            Log To Console    Saving button not active. Cancelling...
            Browser.Click    ${selector_settings_network_port_cancel_btn}
            Sleep    ${SLEEP_TIME}
        END
        Sleep    ${SLEEP_TIME}
    ELSE
        Log To Console    Saving not requested. Cancelling...
        Browser.Click    ${selector_settings_network_port_cancel_btn}
        Sleep    ${SLEEP_TIME}
    END

Settings Network Tosibox Readiness
    [Arguments]    ${activation}    ${netmap}    ${save}

    Go to settings
    Sleep    ${SLEEP_TIME}

    Browser.Click    ${selector_settings_network_btn}
    Sleep    ${SLEEP_TIME}

    Browser.Click    ${selector_settings_network_tosibox_item}
    Sleep    ${SLEEP_TIME}

    ${header_visible}=    Run Keyword And Return Status
    ...    Wait for Elements State
    ...    ${selector_settings_network_tosibox_header}
    ...    visible
    ...    timeout=2s
    IF    ${header_visible}
        Log To Console    Tosibox readiness header visible
    ELSE
        Log To Console    Tosibox readiness header NOT visible
    END

    Fill Text    ${selector_settings_network_tosibox_activation_input}    ${activation}
    Sleep    ${SLEEP_TIME}

    Fill Text    ${selector_settings_network_tosibox_netmap_input}    ${netmap}
    Sleep    ${SLEEP_TIME}

    Keyboard Key    press    Tab
    IF    ${save} == 1
        ${element_visible}=    Run Keyword And Return Status
        ...    Wait for Elements State
        ...    ${selector_settings_network_tosibox_btn}
        ...    visible
        ...    timeout=2s
        IF    ${element_visible}
            Log To Console    Saving button active. Saving...
            Browser.Click    ${selector_settings_network_ip_save_active_btn}
            Sleep    ${SLEEP_TIME}
            ${snack-bar_visible}=    Run Keyword And Return Status
            ...    Wait For Elements State
            ...    xpath=//div[contains(@class, "mat-simple-snackbar")]
            ...    visible
            ...    timeout=5s
            IF    ${snack-bar_visible}
                Log To Console    Save succesful. Snack-bar visible
            ELSE
                Log To Console    Snack-bar not visible
            END
        ELSE
            Log To Console    Saving button not active. Cancelling...
            Sleep    ${SLEEP_TIME}
        END
        Sleep    ${SLEEP_TIME}
    ELSE
        Log To Console    Saving not requested. Cancelling...
        Sleep    ${SLEEP_TIME}
    END

Settings User Users Edit
    [Arguments]    ${username}    ${password}    ${usergroup}    ${save}

    Go to settings
    Sleep    ${SLEEP_TIME}

    Browser.Click    ${selector_settings_user_btn}
    Sleep    ${SLEEP_TIME}

    Browser.Click    ${selector_settings_user_users_item}
    Sleep    ${SLEEP_TIME}

    ${header_visible}=    Run Keyword And Return Status
    ...    Wait for Elements State
    ...    ${selector_settings_user_user_header}
    ...    visible
    ...    timeout=2s
    IF    ${header_visible}
        Log To Console    Users header visible
    ELSE
        Log To Console    Users header NOT visible
    END
    ${user_cell}=    Set Variable    xpath=//tr[contains(@class, 'settings-table-row')]/td[text()='${username}']
    Browser.Click    ${user_cell}
    Sleep    ${SLEEP_TIME}

    Browser.Click    ${selector_settings_user_users_edit_btn}
    Sleep    ${SLEEP_TIME}

    Wait for Elements State    ${selector_settings_user_users_edit_form}    visible    timeout=2s
    Fill Text    ${selector_settings_user_users_edit_username_input}    ${username}
    Sleep    ${SLEEP_TIME}

    Keyboard Key    press    Tab
    Keyboard Key    press    Space
    Wait for Elements State    ${selector_settings_user_users_edit_password_input}    visible    timeout=2s
    Fill Text    ${selector_settings_user_users_edit_password_input}    ${password}
    Sleep    ${SLEEP_TIME}

    Browser.Click    ${selector_settings_user_users_edit_usergroup_ddwn}
    IF    ${usergroup} == 1
        Keyboard Key    press    ArrowDown
        Keyboard Key    press    Enter
        Sleep    ${SLEEP_TIME}
    ELSE
        Keyboard Key    press    Enter
        Sleep    ${SLEEP_TIME}
    END

    Browser.Click    ${selector_settings_user_users_edit_startpage_ddwn}
    Keyboard Key    press    ArrowDown
    Keyboard Key    press    Enter
    Sleep    ${SLEEP_TIME}

    Keyboard Key    press    Tab
    Keyboard Key    press    Space
    Sleep    ${SLEEP_TIME}

    IF    ${save} == 1
        ${element_visible}=    Run Keyword And Return Status
        ...    Wait for Elements State
        ...    ${selector_settings_user_users_edit_save_btn}
        ...    visible
        ...    timeout=2s
        IF    ${element_visible}
            Log To Console    Saving button active. Saving...
            Browser.Click    ${selector_settings_user_users_edit_save_btn}
            Sleep    ${SLEEP_TIME}
            ${snack-bar_visible}=    Run Keyword And Return Status
            ...    Wait For Elements State
            ...    xpath=//div[contains(@class, "mat-simple-snackbar")]
            ...    visible
            ...    timeout=5s
            IF    ${snack-bar_visible}
                Log To Console    Save succesful. Snack-bar visible
            ELSE
                Log To Console    Snack-bar not visible
            END
        ELSE
            Log To Console    Saving button not active. Cancelling...
            Browser.Click    ${selector_settings_user_users_edit_cancel_btn}
            Sleep    ${SLEEP_TIME}
        END
        Sleep    ${SLEEP_TIME}
    ELSE
        Log To Console    Saving not requested. Cancelling...
        Browser.Click    ${selector_settings_user_users_edit_cancel_btn}
        Sleep    ${SLEEP_TIME}
    END

Settings User Users Add
    [Arguments]    ${username}    ${password}    ${usergroup}    ${save}

    Go to settings
    Sleep    ${SLEEP_TIME}

    Browser.Click    ${selector_settings_user_btn}
    Sleep    ${SLEEP_TIME}

    Browser.Click    ${selector_settings_user_users_item}
    Sleep    ${SLEEP_TIME}

    ${header_visible}=    Run Keyword And Return Status
    ...    Wait for Elements State
    ...    ${selector_settings_user_user_header}
    ...    visible
    ...    timeout=2s
    IF    ${header_visible}
        Log To Console    Users header visible
    ELSE
        Log To Console    Users header NOT visible
    END

    Browser.Click    ${selector_settings_user_users_add_btn}
    Sleep    ${SLEEP_TIME}

    Wait for Elements State    ${selector_settings_user_users_new_user_username_input}    visible    timeout=2s
    Fill Text    ${selector_settings_user_users_new_user_username_input}    ${username}
    Sleep    ${SLEEP_TIME}

    Fill Text    ${selector_settings_user_users_new_user_password_input}    ${password}
    Sleep    ${SLEEP_TIME}

    Browser.Click    ${selector_settings_user_users_new_user_group_ddwn}
    IF    ${usergroup} == 1
        Keyboard Key    press    ArrowDown
        Keyboard Key    press    ArrowDown
        Keyboard Key    press    Enter
        Sleep    ${SLEEP_TIME}
    ELSE
        Keyboard Key    press    Enter
        Sleep    ${SLEEP_TIME}
    END

    Browser.Click    ${selector_settings_user_users_new_user_startpage_ddwn}
    Keyboard Key    press    ArrowDown
    Keyboard Key    press    Enter
    Sleep    ${SLEEP_TIME}

    Keyboard Key    press    Tab
    Keyboard Key    press    Space
    Sleep    ${SLEEP_TIME}

    Wait for Elements State    ${selector_settings_user_users_new_user_add_btn}    visible    timeout=2s

    IF    ${save} == 1
        ${element_visible}=    Run Keyword And Return Status
        ...    Wait for Elements State
        ...    ${selector_settings_user_users_new_user_add_btn}
        ...    visible
        ...    timeout=2s
        IF    ${element_visible}
            Log To Console    Saving button active. Saving...
            Browser.Click    ${selector_settings_user_users_new_user_add_btn}
            Sleep    ${SLEEP_TIME}
            ${snack-bar_visible}=    Run Keyword And Return Status
            ...    Wait For Elements State
            ...    xpath=//div[contains(@class, "mat-simple-snackbar")]
            ...    visible
            ...    timeout=5s
            IF    ${snack-bar_visible}
                Log To Console    Save succesful. Snack-bar visible
            ELSE
                Log To Console    Snack-bar not visible
            END
        ELSE
            Log To Console    Saving button not active. Cancelling...
            Browser.Click    ${selector_settings_user_users_new_user_cancel_btn}
            Sleep    ${SLEEP_TIME}
        END
        Sleep    ${SLEEP_TIME}
    ELSE
        Log To Console    Saving not requested. Cancelling...
        Browser.Click    ${selector_settings_user_users_new_user_cancel_btn}
        Sleep    ${SLEEP_TIME}
    END

Settings User Users Remove
    [Arguments]    ${username}    ${save}

    Go to settings
    Sleep    ${SLEEP_TIME}

    Browser.Click    ${selector_settings_user_btn}
    Sleep    ${SLEEP_TIME}

    Browser.Click    ${selector_settings_user_users_item}
    Sleep    ${SLEEP_TIME}

    ${header_visible}=    Run Keyword And Return Status
    ...    Wait for Elements State
    ...    ${selector_settings_user_user_header}
    ...    visible
    ...    timeout=2s
    IF    ${header_visible}
        Log To Console    Users header visible
    ELSE
        Log To Console    Users header NOT visible
    END

    ${user_cell}=    Set Variable    xpath=//tr[contains(@class, 'settings-table-row')]/td[text()="${username}"]
    ${cell_visible}=    Run Keyword And Return Status
    ...    Wait for Elements State
    ...    ${user_cell}
    ...    visible
    ...    timeout=2s
    IF    ${cell_visible}
        Log To Console    User cell visible
    ELSE
        Log To Console    User cell NOT visible
    END
    Browser.Click    ${user_cell}
    Sleep    ${SLEEP_TIME}

    Browser.Click    ${selector_settings_user_users_remove_btn}
    Sleep    ${SLEEP_TIME}

    IF    ${save} == 1
        Keyboard Key    press    Tab
        Sleep    ${SLEEP_TIME}
        Keyboard Key    press    ArrowDown
        Sleep    ${SLEEP_TIME}
        Keyboard Key    press    ArrowDown
        Sleep    ${SLEEP_TIME}
        Keyboard Key    press    Enter
        Sleep    ${SLEEP_TIME}
        Log To Console    Saving button active. Saving...

        ${snack-bar_visible}=    Run Keyword And Return Status
        ...    Wait For Elements State
        ...    xpath=//div[contains(@class, "mat-simple-snackbar")]
        ...    visible
        ...    timeout=5s
        IF    ${snack-bar_visible}
            Log To Console    Save succesful. Snack-bar visible
        ELSE
            Log To Console    Snack-bar not visible
        END
    ELSE
        Log To Console    Saving not requested. Cancelling...
        Browser.Click    ${selector_settings_user_users_remove_user_cancel_btn}
        Sleep    ${SLEEP_TIME}
    END

Settings User Usergroups Add
    [Arguments]    ${usergroup}    ${userlevel}    ${save}

    Go to settings
    Sleep    ${SLEEP_TIME}

    Browser.Click    ${selector_settings_user_btn}
    Sleep    ${SLEEP_TIME}

    Browser.Click    ${selector_settings_user_usergroups_item}
    Sleep    ${SLEEP_TIME}

    ${header_visible}=    Run Keyword And Return Status
    ...    Wait for Elements State
    ...    ${selector_settings_user_usergroups_header}
    ...    visible
    ...    timeout=2s
    IF    ${header_visible}
        Log To Console    Usergroups header visible
    ELSE
        Log To Console    Usergroups header NOT visible
    END

    Browser.Click    ${selector_settings_user_usergroups_add_usergroup_btn}
    Sleep    ${SLEEP_TIME}

    Wait For Elements State    ${selector_settings_user_usergroups_add_form}    visible    timeout=2s
    Fill Text    ${selector_settings_user_usergroups_add_form_name_input}    ${usergroup}
    Sleep    ${SLEEP_TIME}
    Fill Text    ${selector_settings_user_usergroups_add_form_level_input}    ${userlevel}
    Sleep    ${SLEEP_TIME}

    Keyboard Key    press    Tab
    Keyboard Key    press    Space
    Sleep    ${SLEEP_TIME}

    Keyboard Key    press    Tab
    Keyboard Key    press    Space
    Sleep    ${SLEEP_TIME}

    Keyboard Key    press    Tab
    Sleep    ${SLEEP_TIME}
    Keyboard Key    press    Tab
    Sleep    ${SLEEP_TIME}
    Keyboard Key    press    Tab
    Sleep    ${SLEEP_TIME}
    Keyboard Key    press    Tab
    Sleep    ${SLEEP_TIME}
    Keyboard Key    press    Tab
    Sleep    ${SLEEP_TIME}
    Keyboard Key    press    Tab
    Sleep    ${SLEEP_TIME}
    Keyboard Key    press    Tab
    Sleep    ${SLEEP_TIME}
    Keyboard Key    press    Tab
    Sleep    ${SLEEP_TIME}

    Keyboard Key    press    Tab
    Keyboard Key    press    Space
    Sleep    ${SLEEP_TIME}

    Keyboard Key    press    Tab
    Sleep    ${SLEEP_TIME}
    Keyboard Key    press    Tab
    Sleep    ${SLEEP_TIME}
    Keyboard Key    press    Tab
    Sleep    ${SLEEP_TIME}
    Keyboard Key    press    Tab
    Sleep    ${SLEEP_TIME}
    Keyboard Key    press    Tab
    Sleep    ${SLEEP_TIME}
    Keyboard Key    press    Tab
    Sleep    ${SLEEP_TIME}
    Keyboard Key    press    Tab
    Sleep    ${SLEEP_TIME}
    Keyboard Key    press    Tab
    Sleep    ${SLEEP_TIME}
    Keyboard Key    press    Tab
    Sleep    ${SLEEP_TIME}
    Keyboard Key    press    Tab
    Sleep    ${SLEEP_TIME}
    Keyboard Key    press    Tab
    Sleep    ${SLEEP_TIME}
    Keyboard Key    press    Tab
    Sleep    ${SLEEP_TIME}
    Keyboard Key    press    Tab
    Sleep    ${SLEEP_TIME}

    Keyboard Key    press    Tab
    Keyboard Key    press    Space
    Sleep    ${SLEEP_TIME}

    Keyboard Key    press    Tab
    Sleep    ${SLEEP_TIME}
    Keyboard Key    press    Tab
    Sleep    ${SLEEP_TIME}
    Keyboard Key    press    Tab
    Sleep    ${SLEEP_TIME}
    Keyboard Key    press    Tab
    Sleep    ${SLEEP_TIME}
    Keyboard Key    press    Tab
    Sleep    ${SLEEP_TIME}
    Keyboard Key    press    Tab
    Sleep    ${SLEEP_TIME}
    Keyboard Key    press    Tab
    Sleep    ${SLEEP_TIME}
    Keyboard Key    press    Tab
    Sleep    ${SLEEP_TIME}

    IF    ${save} == 1
        ${element_visible}=    Run Keyword And Return Status
        ...    Wait for Elements State
        ...    ${selector_settings_user_usergroups_add_form_add_btn}
        ...    visible
        ...    timeout=2s
        IF    ${element_visible}
            Log To Console    Saving button active. Saving...
            Browser.Click    ${selector_settings_user_usergroups_add_form_add_btn}
            Sleep    ${SLEEP_TIME}
            ${snack-bar_visible}=    Run Keyword And Return Status
            ...    Wait For Elements State
            ...    xpath=//div[contains(@class, "mat-simple-snackbar")]
            ...    visible
            ...    timeout=5s
            IF    ${snack-bar_visible}
                Log To Console    Save succesful. Snack-bar visible
            ELSE
                Log To Console    Snack-bar not visible
            END
        ELSE
            Log To Console    Saving button not active. Cancelling...
            Browser.Click    ${selector_settings_user_usergroups_add_form_cancel_btn}
            Sleep    ${SLEEP_TIME}
        END
        Sleep    ${SLEEP_TIME}
    ELSE
        Log To Console    Saving not requested. Cancelling...
        Browser.Click    ${selector_settings_user_usergroups_add_form_cancel_btn}
        Sleep    ${SLEEP_TIME}
    END

Settings User Usergroups Remove
    [Arguments]    ${usergroup}    ${save}

    Go to settings
    Sleep    ${SLEEP_TIME}

    Browser.Click    ${selector_settings_user_btn}
    Sleep    ${SLEEP_TIME}

    Browser.Click    ${selector_settings_user_usergroups_item}
    Sleep    ${SLEEP_TIME}

    ${header_visible}=    Run Keyword And Return Status
    ...    Wait for Elements State
    ...    ${selector_settings_user_usergroups_header}
    ...    visible
    ...    timeout=2s
    IF    ${header_visible}
        Log To Console    Usergroups header visible
    ELSE
        Log To Console    Usergroups header NOT visible
    END

    Browser.Click    ${selector_settings_user_usergroups_newgroup_cell}
    Sleep    ${SLEEP_TIME}

    Browser.Click    ${selector_settings_user_usergroups_remove_btn}
    Sleep    ${SLEEP_TIME}
    Wait for Elements State    ${selector_settings_user_usergroups_remove_form}    visible    timeout=2s

    IF    ${save} == 1
        Keyboard Key    press    Tab
        Sleep    ${SLEEP_TIME}
        Keyboard Key    press    ArrowDown
        Sleep    ${SLEEP_TIME}
        Keyboard Key    press    ArrowDown
        Sleep    ${SLEEP_TIME}
        Keyboard Key    press    Enter
        Sleep    ${SLEEP_TIME}
        Log To Console    Saving button active. Saving...

        ${snack-bar_visible}=    Run Keyword And Return Status
        ...    Wait For Elements State
        ...    xpath=//div[contains(@class, "mat-simple-snackbar")]
        ...    visible
        ...    timeout=5s
        IF    ${snack-bar_visible}
            Log To Console    Save succesful. Snack-bar visible
        ELSE
            Log To Console    Snack-bar not visible
        END
    ELSE
        Log To Console    Saving not requested. Cancelling...
        Browser.Click    ${selector_settings_user_users_remove_user_cancel_btn}
        Sleep    ${SLEEP_TIME}
    END
