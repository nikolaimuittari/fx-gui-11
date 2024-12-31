*** Settings ***
Library     Browser
Resource    navigate.resource
Resource    login.resource
Resource    point_locators.resource
Resource    settings_locators.resource
Resource    global_variables.resource


*** Keywords ***
Settings Main Page
    Go to settings

    ${header_visible}=    Run Keyword And Return Status
    ...    Wait for Elements State
    ...    ${selector_settings_device_header}
    ...    visible
    ...    timeout=2s
    IF    ${header_visible}
        Log To Console    Device settings header visible
    ELSE
        Log To Console    Device settings header NOT visible
    END

    ${header_visible}=    Run Keyword And Return Status
    ...    Wait for Elements State
    ...    ${selector_settings_clock_header}
    ...    visible
    ...    timeout=2s
    IF    ${header_visible}    Log To Console    Clock settings header visible

    ${header_visible}=    Run Keyword And Return Status
    ...    Wait for Elements State
    ...    ${selector_settings_activations_header}
    ...    visible
    ...    timeout=2s
    IF    ${header_visible}    Log To Console    Activations header visible

    ${header_visible}=    Run Keyword And Return Status
    ...    Wait for Elements State
    ...    ${selector_settings_gsm_header}
    ...    visible
    ...    timeout=2s
    IF    ${header_visible}    Log To Console    GSM-settings header visible

    ${header_visible}=    Run Keyword And Return Status
    ...    Wait for Elements State
    ...    ${selector_settings_system_header}
    ...    visible
    ...    timeout=2s
    IF    ${header_visible}    Log To Console    SYSTEM header visible

    ${header_visible}=    Run Keyword And Return Status
    ...    Wait for Elements State
    ...    ${selector_settings_port_header}
    ...    visible
    ...    timeout=2s
    IF    ${header_visible}    Log To Console    Port settings header visible

    ${header_visible}=    Run Keyword And Return Status
    ...    Wait for Elements State
    ...    ${selector_settings_firewall_header}
    ...    visible
    ...    timeout=2s
    IF    ${header_visible}
        Log To Console    Firewall settings header visible
    END

    ${header_visible}=    Run Keyword And Return Status
    ...    Wait for Elements State
    ...    ${selector_settings_synchronization_header}
    ...    visible
    ...    timeout=2s
    IF    ${header_visible}
        Log To Console    Information syncronization header visible
    END

Settings System Walkthrough
    Go to settings

    Browser.Click    ${selector_settings_system_btn}
    Browser.Click    ${selector_settings_system_status_item}
    
    ${header_visible}=    Run Keyword And Return Status
    ...    Wait for Elements State
    ...    ${selector_settings_system_status_header}
    ...    visible
    ...    timeout=2s
    IF    ${header_visible}
        Log To Console    System status header visible
    ELSE
        Log To Console    System status header NOT visible
    END

    Browser.Click    ${selector_settings_system_event_item}
    
    ${header_visible}=    Run Keyword And Return Status
    ...    Wait for Elements State
    ...    ${selector_settings_system_event_header}
    ...    visible
    ...    timeout=2s
    IF    ${header_visible}
        Log To Console    Event log settings header visible
    ELSE
        Log To Console    Event log settings header NOT visible
    END

    Browser.Click    ${selector_settings_system_clock_item}
    
    ${header_visible}=    Run Keyword And Return Status
    ...    Wait for Elements State
    ...    ${selector_settings_system_clock_header}
    ...    visible
    ...    timeout=2s
    IF    ${header_visible}
        Log To Console    Clock settings header visible
    ELSE
        Log To Console    Clock settings header NOT visible
    END

    Browser.Click    ${selector_settings_system_activations_item}
    
    ${header_visible}=    Run Keyword And Return Status
    ...    Wait for Elements State
    ...    ${selector_settings_system_activations_header}
    ...    visible
    ...    timeout=2s
    IF    ${header_visible}
        Log To Console    Activations header visible
    ELSE
        Log To Console    Activations header NOT visible
    END

    Browser.Click    ${selector_settings_system_sms_item}
    
    ${header_visible}=    Run Keyword And Return Status
    ...    Wait for Elements State
    ...    ${selector_settings_system_sms_header}
    ...    visible
    ...    timeout=2s
    IF    ${header_visible}
        Log To Console    SMS settings header visible
    ELSE
        Log To Console    SMS settings header NOT visible
    END

    Browser.Click    ${selector_settings_system_synchronization_item}
    
    ${header_visible}=    Run Keyword And Return Status
    ...    Wait for Elements State
    ...    ${selector_settings_system_synchronization_header}
    ...    visible
    ...    timeout=2s
    IF    ${header_visible}
        Log To Console    Information synchronization header visible
    ELSE
        Log To Console    Information synchronization header NOT visible
    END

    Browser.Click    ${selector_settings_system_device_item}
    
    ${header_visible}=    Run Keyword And Return Status
    ...    Wait for Elements State
    ...    ${selector_settings_system_device_header}
    ...    visible
    ...    timeout=2s
    IF    ${header_visible}
        Log To Console    Device settings header visible
    ELSE
        Log To Console    Device settings header NOT visible
    END

    Browser.Click    ${selector_settings_system_backup_btn}
    
    ${header_visible}=    Run Keyword And Return Status
    ...    Wait for Elements State
    ...    ${selector_settings_system_backup_form_header}
    ...    visible
    ...    timeout=2s
    IF    ${header_visible}
        Log To Console    Backup form header visible
    ELSE
        Log To Console    Backup form header NOT visible
    END
    Browser.Click    ${selector_settings_system_backup_form_cancel_btn}
    

Settings Network Walkthrough
    Go to settings
    Browser.Click    ${selector_settings_network_btn}
    Browser.Click    ${selector_settings_network_port_item}
    
    ${header_visible}=    Run Keyword And Return Status
    ...    Wait for Elements State
    ...    ${selector_settings_network_port_header}
    ...    visible
    ...    timeout=2s
    IF    ${header_visible}    Log To Console    Port settings header visible

    Browser.Click    ${selector_settings_network_firewall_item}
    
    ${header_visible}=    Run Keyword And Return Status
    ...    Wait for Elements State
    ...    ${selector_settings_network_firewall_header}
    ...    visible
    ...    timeout=2s
    IF    ${header_visible}
        Log To Console    Firewall settings header visible
    END

    Browser.Click    ${selector_settings_network_nat_item}
    
    ${header_visible}=    Run Keyword And Return Status
    ...    Wait for Elements State
    ...    ${selector_settings_network_nat_header}
    ...    visible
    ...    timeout=2s
    IF    ${header_visible}    Log To Console    NAT settings header visible

    Browser.Click    ${selector_settings_network_alarm_item}
    
    ${header_visible}=    Run Keyword And Return Status
    ...    Wait for Elements State
    ...    ${selector_settings_network_alarm_header}
    ...    visible
    ...    timeout=2s
    IF    ${header_visible}
        Log To Console    Alarm email settings header visible
    END

    Browser.Click    ${selector_settings_network_history_item}
    
    ${header_visible}=    Run Keyword And Return Status
    ...    Wait for Elements State
    ...    ${selector_settings_network_history_header}
    ...    visible
    ...    timeout=2s
    IF    ${header_visible}    Log To Console    History settings header visible

    Browser.Click    ${selector_settings_network_tosibox_item}
    
    ${header_visible}=    Run Keyword And Return Status
    ...    Wait for Elements State
    ...    ${selector_settings_network_tosibox_header}
    ...    visible
    ...    timeout=2s
    IF    ${header_visible}
        Log To Console    Tosibox Readiness header visible
    END

    Browser.Click    ${selector_settings_network_ip_item}
    
    ${header_visible}=    Run Keyword And Return Status
    ...    Wait for Elements State
    ...    ${selector_settings_network_ip_header}
    ...    visible
    ...    timeout=2s
    IF    ${header_visible}
        Log To Console    IP-address settings header visible
    END

Settings User Walkthrough
    Go to settings
    Browser.Click    ${selector_settings_user_btn}
    Browser.Click    ${selector_settings_user_usergroups_item}
    
    ${header_visible}=    Run Keyword And Return Status
    ...    Wait for Elements State
    ...    ${selector_settings_user_usergroups_header}
    ...    visible
    ...    timeout=2s
    IF    ${header_visible}    Log To Console    User groups header visible

    Browser.Click    ${selector_settings_user_users_item}
    
    ${header_visible}=    Run Keyword And Return Status
    ...    Wait for Elements State
    ...    ${selector_settings_user_user_header}
    ...    visible
    ...    timeout=2s
    IF    ${header_visible}    Log To Console    User header visible

Settings System Device
    [Arguments]    ${device_name}    ${session_time_limit}    ${auth_key}    ${save}
    Go to settings
    Browser.Click    ${selector_settings_system_btn}
    
    Wait for Elements State    ${selector_settings_system_device_stationName_input}    visible    timeout=2s
    Fill Text    ${selector_settings_system_device_stationName_input}    ${device_name}
    
    Fill Text    ${selector_settings_system_device_sessionTimeout_input}    ${session_time_limit}
    
    Fill Text    ${selector_settings_system_device_webVisionAuthKey_input}    ${auth_key}
    IF    ${save}==1
        ${save_active}=    Run Keyword And Return Status
        ...    Wait For Elements State
        ...    ${selector_settings_system_device_save_active_btn}
        ...    visible
        ...    timeout=2s
        IF    ${save_active}
            Log To Console    Save button is active, saving...
            Browser.Click    ${selector_settings_system_device_save_active_btn}
            
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
            Log To Console    Save button is not active, cancelling...
            Browser.Click    ${selector_settings_system_device_cancel_btn}
            
        END
    ELSE
        Log To Console    Changes will not be saved. Cancelling...
        Browser.Click    ${selector_settings_system_device_cancel_btn}
        
    END

Settings System Status
    [Arguments]    ${reboot}
    Go to settings
    Browser.Click    ${selector_settings_system_btn}
    Browser.Click    ${selector_settings_system_status_item}
    
    ${header_visible}=    Run Keyword And Return Status
    ...    Wait for Elements State
    ...    ${selector_settings_system_status_header}
    ...    visible
    ...    timeout=2s
    IF    ${header_visible}    Log To Console    System status header visible
    

    Wait for Elements State    ${selector_settings_system_status_reboot_execute_btn}    visible    timeout=2s
    Browser.Click    ${selector_settings_system_status_reboot_execute_btn}
    
    ${element_visible}=    Run Keyword And Return Status
    ...    Wait for Elements State
    ...    ${selector_settings_system_status_reboot_form}
    ...    visible
    ...    timeout=2s
    IF    ${element_visible}    Log To Console    Reboot form visible
    

    IF    ${reboot} == 1
        Log To Console    Rebooting the system
        Browser.Click    ${selector_settings_system_status_reboot_form_reboot_btn}
    ELSE
        Log To Console    Rebooting cancelled
        Browser.Click    ${selector_settings_system_status_reboot_form_cancel_btn}
    END
    

Settings System Event
    [Arguments]    ${save}
    Go to settings
    Browser.Click    ${selector_settings_system_btn}
    Browser.Click    ${selector_settings_system_event_item}
    
    ${header_visible}=    Run Keyword And Return Status
    ...    Wait for Elements State
    ...    ${selector_settings_system_event_header}
    ...    visible
    ...    timeout=2s
    IF    ${header_visible}
        Log To Console    Event log settings header visible
    END

    Browser.Click    ${selector_settings_system_event_log_pointUpdates_chkbx}
    Browser.Click    ${selector_settings_system_event_log_calendar_chkbx}
    Browser.Click    ${selector_settings_system_event_log_timeSchedules_chkbx}
    Browser.Click    ${selector_settings_system_event_log_settings_chkbx}
    Browser.Click    ${selector_settings_system_event_log_logins_chkbx}
    Browser.Click    ${selector_settings_system_event_log_userInterface_chkbx}

    IF    ${save} == 1
        ${element_visible}=    Run Keyword And Return Status
        ...    Wait for Elements State
        ...    ${selector_settings_system_event_log_save_active_btn}
        ...    visible
        ...    timeout=2s
        IF    ${element_visible}
            Log To Console    Saving button active. Saving...
            Browser.Click    ${selector_settings_system_event_log_save_active_btn}
        ELSE
            Log To Console    Saving button not active. Cancelling...
            Browser.Click    ${selector_settings_system_event_log_cancel_btn}
        END
        
    ELSE
        Log To Console    Saving not requested. Cancelling...
        Browser.Click    ${selector_settings_system_event_log_cancel_btn}
    END

Settings System Clock
    [Arguments]
    ...    ${ext_server}
    ...    ${time_gsm}
    ...    ${fx_server}
    ...    ${daylight}
    ...    ${timezone}
    ...    ${latitude_degrees}
    ...    ${latitude_minutes}
    ...    ${latitude_direction}
    ...    ${longitude_degrees}
    ...    ${longitude_minutes}
    ...    ${longitude_direction}
    ...    ${current_time}
    ...    ${current_date}
    ...    ${save}

    Go to settings
    Browser.Click    ${selector_settings_system_btn}
    Browser.Click    ${selector_settings_system_clock_item}
    
    ${header_visible}=    Run Keyword And Return Status
    ...    Wait for Elements State
    ...    ${selector_settings_system_clock_header}
    ...    visible
    ...    timeout=2s
    IF    ${header_visible}    Log To Console    Clock settings header visible

    Fill Text    ${selector_settings_system_clock_extServer_input}    ${ext_server}
    
    IF    ${time_gsm} != 0
        Browser.Click    ${selector_settings_system_clock_useGsmTime_chkbx}
        
    END

    IF    ${fx_server} != 0
        Browser.Click    ${selector_settings_system_clock_FXtimeServer_chkbx}
        
    END

    IF    ${daylight} != 0
        Browser.Click    ${selector_settings_system_clock_automaticSummerTime_chkbx}
        
    END

    IF    ${timezone} == 1
        Browser.Click    ${selector_settings_system_clock_timeZone_ddwn}
        Keyboard Key    press    ArrowDown
        Keyboard Key    press    Enter
        
    ELSE IF    ${timezone} == -1
        Browser.Click    ${selector_settings_system_clock_timeZone_ddwn}
        Keyboard Key    press    ArrowUp
        Keyboard Key    press    Enter
        
    ELSE IF    ${timezone} == -2
        Browser.Click    ${selector_settings_system_clock_timeZone_ddwn}
        Keyboard Key    press    ArrowUp
        Keyboard Key    press    ArrowUp
        Keyboard Key    press    Enter
        
    ELSE
        Browser.Click    ${selector_settings_system_clock_timeZone_ddwn}
        Keyboard Key    press    Enter
        
    END

    Fill Text    ${selector_settings_system_clock_latitudeDegrees_input}    ${latitude_degrees}
    Fill Text    ${selector_settings_system_clock_latitudeMinutes_input}    ${latitude_minutes}
    

    IF    ${latitude_direction} == 1
        Browser.Click    ${selector_settings_system_clock_latitudeDirection_ddwn}
        Keyboard Key    press    ArrowDown
        Keyboard Key    press    Enter
        
    ELSE
        Browser.Click    ${selector_settings_system_clock_latitudeDirection_ddwn}
        Keyboard Key    press    Enter
        
    END

    Fill Text    ${selector_settings_system_clock_longitudeDegrees_input}    ${longitude_degrees}
    Fill Text    ${selector_settings_system_clock_longitudeMinutes_input}    ${longitude_minutes}
    

    IF    ${longitude_direction} == 1
        Browser.Click    ${selector_settings_system_clock_longitudeDirection_ddwn}
        Keyboard Key    press    ArrowDown
        Keyboard Key    press    Enter
        
    ELSE
        Browser.Click    ${selector_settings_system_clock_longitudeDirection_ddwn}
        Keyboard Key    press    Enter
        
    END

    Fill Text    ${selector_settings_system_clock_currentTime_input}    ${current_time}
    Fill Text    ${selector_settings_system_clock_currentDate_input}    ${current_date}
    

    IF    ${save} == 1
        ${element_visible}=    Run Keyword And Return Status
        ...    Wait for Elements State
        ...    ${selector_settings_system_clock_save_active_btn}
        ...    visible
        ...    timeout=2s
        IF    ${element_visible}
            Log To Console    Saving button active. Saving...
            Browser.Click    ${selector_settings_system_clock_save_active_btn}
            
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
            Browser.Click    ${selector_settings_system_clock_cancel_btn}
            
        END
        
    ELSE
        Log To Console    Saving not requested. Cancelling...
        Browser.Click    ${selector_settings_system_clock_cancel_btn}
        
    END

Settings System SMS
    [Arguments]
    ...    ${message_header}
    ...    ${web_sending}
    ...    ${server_1}
    ...    ${server_2}
    ...    ${server_3}
    ...    ${server_4}
    ...    ${activation}
    ...    ${sending_time}
    ...    ${debug}
    ...    ${save}
    Go to settings
    Browser.Click    ${selector_settings_system_btn}
    Browser.Click    ${selector_settings_system_sms_item}
    
    ${header_visible}=    Run Keyword And Return Status
    ...    Wait for Elements State
    ...    ${selector_settings_system_sms_header}
    ...    visible
    ...    timeout=2s
    IF    ${header_visible}    Log To Console    SMS settings header visible

    Fill Text    ${selector_settings_system_sms_header_input}    ${message_header}

    IF    ${web_sending} == 1
        Keyboard Key    press    Tab
        Keyboard Key    press    Space
    END

    Fill Text    ${selector_settings_system_sms_server1_input}    ${server_1}
    Fill Text    ${selector_settings_system_sms_server2_input}    ${server_2}
    Fill Text    ${selector_settings_system_sms_server3_input}    ${server_3}
    Fill Text    ${selector_settings_system_sms_server4_input}    ${server_4}
    Fill Text    ${selector_settings_system_sms_activationId_input}    ${activation}

    IF    ${sending_time} == 1
        Browser.Click    ${selector_settings_system_sms_validityTime_ddwn}
        Keyboard Key    press    ArrowUp
        Keyboard Key    press    ArrowUp
        Keyboard Key    press    ArrowUp
        Keyboard Key    press    ArrowUp
        Keyboard Key    press    Enter
    ELSE IF    ${sending_time} == 2
        Browser.Click    ${selector_settings_system_sms_validityTime_ddwn}
        Keyboard Key    press    ArrowUp
        Keyboard Key    press    ArrowUp
        Keyboard Key    press    ArrowUp
        Keyboard Key    press    ArrowUp
        Keyboard Key    press    ArrowDown
        Keyboard Key    press    Enter
    ELSE IF    ${sending_time} == 3
        Browser.Click    ${selector_settings_system_sms_validityTime_ddwn}
        Keyboard Key    press    ArrowUp
        Keyboard Key    press    ArrowUp
        Keyboard Key    press    ArrowUp
        Keyboard Key    press    ArrowUp
        Keyboard Key    press    ArrowDown
        Keyboard Key    press    ArrowDown
        Keyboard Key    press    Enter
    ELSE
        Browser.Click    ${selector_settings_system_sms_validityTime_ddwn}
        Keyboard Key    press    Enter
    END

    Wait for Elements State    ${selector_settings_system_sms_debug_chkbx}    visible    timeout=2s
    IF    ${debug} == 1
        Browser.Click    ${selector_settings_system_sms_debug_chkbx}
    END

    IF    ${save} == 1
        ${element_visible}=    Run Keyword And Return Status
        ...    Wait for Elements State
        ...    ${selector_settings_system_sms_save_active_btn}
        ...    visible
        ...    timeout=2s
        IF    ${element_visible}
            Log To Console    Saving button active. Saving...
            Browser.Click    ${selector_settings_system_sms_save_active_btn}
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
            Browser.Click    ${selector_settings_system_sms_cancel_btn}
        END
    ELSE
        Log To Console    Saving not requested. Cancelling...
        Browser.Click    ${selector_settings_system_sms_cancel_btn}
    END

Settings System Information Synchronization
    [Arguments]
    ...    ${calendar}
    ...    ${disable_update}
    ...    ${state_texts}
    ...    ${timetables}
    ...    ${user_rights}
    ...    ${alarm_groups}
    ...    ${save}

    Go to settings
    Browser.Click    ${selector_settings_system_btn}
    Browser.Click    ${selector_settings_system_synchronization_item}
    ${header_visible}=    Run Keyword And Return Status
    ...    Wait for Elements State
    ...    ${selector_settings_system_synchronization_header}
    ...    visible
    ...    timeout=2s
    IF    ${header_visible}
        Log To Console    Info Synchronization settings header visible
    ELSE
        Log To Console    Info Synchronization settings header NOT visible
    END

    Keyboard Key    press    Tab
    Keyboard Key    press    Tab
    Keyboard Key    press    Space

    Keyboard Key    press    Tab
    Keyboard Key    press    Space

    Keyboard Key    press    Tab
    Keyboard Key    press    Space

    Keyboard Key    press    Tab
    Keyboard Key    press    Space

    Keyboard Key    press    Tab
    Keyboard Key    press    Space

    Keyboard Key    press    Tab
    Keyboard Key    press    Space

    IF    ${save} == 1
        ${element_visible}=    Run Keyword And Return Status
        ...    Wait for Elements State
        ...    ${selector_settings_system_synchronization_save_active_btn}
        ...    visible
        ...    timeout=2s
        IF    ${element_visible}
            Log To Console    Saving button active. Saving...
            Browser.Click    ${selector_settings_system_synchronization_save_active_btn}
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
            Browser.Click    ${selector_settings_system_synchronization_cancel_btn}
        END
    ELSE
        Log To Console    Saving not requested. Cancelling...
        Browser.Click    ${selector_settings_system_synchronization_cancel_btn}
    END

Settings Network IP-Settings
    [Arguments]
    ...    ${dhcp}
    ...    ${wan_ip}
    ...    ${wan_mask}
    ...    ${wan_gw}
    ...    ${wan_dns}
    ...    ${lan_ip}
    ...    ${lan_gw}
    ...    ${lan_mask}
    ...    ${wifi_in_use}
    ...    ${wifi_ip}
    ...    ${wifi_mask}
    ...    ${wifi_name}
    ...    ${wifi_pass}
    ...    ${apn}
    ...    ${pin}
    ...    ${helthcheck}
    ...    ${wwan_ip}
    ...    ${remote_ip}
    ...    ${remote_router}
    ...    ${domain_in_use}
    ...    ${domain_proxy_ip}
    ...    ${domain_controller_ip}
    ...    ${domain_name}
    ...    ${domain_username}
    ...    ${domain_pass}
    ...    ${save}

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

    Browser.Click    ${selector_settings_network_ip_internet_LAN_btn}
    Browser.Click    ${selector_settings_network_ip_internet_WWAN_btn}
    Browser.Click    ${selector_settings_network_ip_internet_WAN_btn}

    Keyboard Key    press    Tab
    

    IF    ${dhcp} == 1
        Keyboard Key    press    Space
        
    ELSE
        Keyboard Key    press    Space
        
        Keyboard Key    press    Space
        
    END

    Keyboard Key    press    Tab
    
    Keyboard Input    type    ${wan_ip}
    

    Keyboard Key    press    Tab
    
    Keyboard Input    type    ${wan_mask}
    

    Keyboard Key    press    Tab
    
    Keyboard Input    type    ${wan_gw}
    

    Keyboard Key    press    Tab
    
    Keyboard Input    type    ${wan_dns}
    

    Keyboard Key    press    Tab
    
    Keyboard Input    type    ${lan_ip}
    

    Keyboard Key    press    Tab
    
    Keyboard Input    type    ${lan_gw}
    

    Keyboard Key    press    Tab
    
    Keyboard Input    type    ${lan_mask}
    

    Keyboard Key    press    Tab
    IF    ${wifi_in_use} == 1
        Keyboard Key    press    Space
        

        Keyboard Key    press    Tab
        
        Keyboard Input    type    ${wifi_ip}
        

        Keyboard Key    press    Tab
        
        Keyboard Input    type    ${wifi_mask}
        

        Keyboard Key    press    Tab
        
        Keyboard Input    type    ${wifi_name}
        

        Keyboard Key    press    Tab
        
        Keyboard Input    type    ${wifi_pass}
        
    ELSE
        Keyboard Key    press    Space
        
        Keyboard Key    press    Space
        
    END

    Browser.Click    ${selector_settings_network_ip_WWAN_4G_btn}
    Browser.Click    ${selector_settings_network_ip_WWAN_3G_btn}
    Browser.Click    ${selector_settings_network_ip_WWAN_disabled_btn}
    Browser.Click    ${selector_settings_network_ip_WWAN_auto_btn}

    Keyboard Key    press    Tab
    
    Keyboard Input    type    ${apn}
    

    Keyboard Key    press    Tab
    
    Keyboard Input    type    ${pin}
    

    Keyboard Key    press    Tab
    
    Keyboard Input    type    ${helthcheck}
    

    Keyboard Key    press    Tab
    
    Keyboard Input    type    ${wwan_ip}
    

    Keyboard Key    press    Tab
    
    Keyboard Input    type    ${remote_ip}
    

    Keyboard Key    press    Tab
    IF    ${domain_in_use} == 1
        Keyboard Key    press    Space
        

        Keyboard Key    press    Tab
        
        Keyboard Input    type    ${domain_proxy_ip}
        

        Keyboard Key    press    Tab
        
        Keyboard Input    type    ${domain_controller_ip}
        

        Keyboard Key    press    Tab
        
        Keyboard Input    type    ${domain_name}
        

        Keyboard Key    press    Tab
        
        Keyboard Input    type    ${domain_username}
        

        Keyboard Key    press    Tab
        
        Keyboard Input    type    ${domain_pass}
        
    ELSE
        Keyboard Key    press    Space
        
        Keyboard Key    press    Space
        
    END

    IF    ${save} == 1
        ${element_visible}=    Run Keyword And Return Status
        ...    Wait for Elements State
        ...    ${selector_settings_network_ip_save_active_btn}
        ...    visible
        ...    timeout=2s
        IF    ${element_visible}
            Log To Console    Saving button active. Saving...
            Browser.Click    ${selector_settings_network_ip_save_active_btn}
            
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
            Browser.Click    ${selector_settings_network_ip_cancel_btn}
            
        END
        
    ELSE
        Log To Console    Saving not requested. Cancelling...
        Browser.Click    ${selector_settings_network_ip_cancel_btn}
        
    END

Settings Network Port Settings
    [Arguments]    ${com1_speed}    ${save}

    Go to settings
    

    Browser.Click    ${selector_settings_network_btn}
    

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

    Browser.Click    ${selector_settings_network_port_1_speed_ddwn}
    
    Keyboard Key    press    ArrowDown
    
    Keyboard Key    press    ArrowDown
    
    Keyboard Key    press    ArrowDown
    
    Keyboard Key    press    ArrowDown
    
    Keyboard Key    press    Enter
    

    Browser.Click    ${selector_settings_network_port_3_type_ddwn}
    
    Keyboard Key    press    ArrowDown
    
    Keyboard Key    press    ArrowDown
    
    Keyboard Key    press    ArrowDown
    
    Keyboard Key    press    ArrowDown
    
    Keyboard Key    press    ArrowDown
    
    Keyboard Key    press    Enter
    

    Browser.Click    ${selector_settings_network_port_3_speed_ddwn}
    
    Keyboard Key    press    ArrowDown
    
    Keyboard Key    press    ArrowDown
    
    Keyboard Key    press    Enter

    
    Fill Text    ${selector_settings_network_port_3_address_input}    3
    

    Browser.Click    ${selector_settings_network_port_4_type_ddwn}
    
    Keyboard Key    press    ArrowDown
    
    Keyboard Key    press    ArrowDown
    
    Keyboard Key    press    ArrowDown
    
    Keyboard Key    press    ArrowDown
    
    Keyboard Key    press    ArrowDown
    
    Keyboard Key    press    Enter
    

    Browser.Click    ${selector_settings_network_port_4_speed_ddwn}
    
    Keyboard Key    press    ArrowDown
    
    Keyboard Key    press    ArrowDown
    
    Keyboard Key    press    Enter

    
    Fill Text    ${selector_settings_network_port_4_address_input}    4
    

    Browser.Click    ${selector_settings_network_port_5_type_ddwn}
    
    Keyboard Key    press    ArrowDown
    
    Keyboard Key    press    ArrowDown
    
    Keyboard Key    press    ArrowDown
    
    Keyboard Key    press    ArrowDown
    
    Keyboard Key    press    ArrowDown
    
    Keyboard Key    press    Enter
    

    Browser.Click    ${selector_settings_network_port_5_speed_ddwn}
    
    Keyboard Key    press    ArrowDown
    
    Keyboard Key    press    ArrowDown
    
    Keyboard Key    press    Enter

    
    Fill Text    ${selector_settings_network_port_5_address_input}    5
    

    Browser.Click    ${selector_settings_network_port_6_type_ddwn}
    
    Keyboard Key    press    ArrowDown
    
    Keyboard Key    press    ArrowDown
    
    Keyboard Key    press    Enter
    

    Fill Text    ${selector_settings_network_port_6_delay_input}    600
    

    Browser.Click    ${selector_settings_network_port_7_type_ddwn}
    
    Keyboard Key    press    ArrowDown
    
    Keyboard Key    press    Enter
    

    Fill Text    ${selector_settings_network_port_7_delay_input}    700
    

    Browser.Click    ${selector_settings_network_port_8_type_ddwn}
    
    Keyboard Key    press    ArrowDown
    
    Keyboard Key    press    ArrowDown
    
    Keyboard Key    press    Enter
    

    Fill Text    ${selector_settings_network_port_8_delay_input}    800
    

    Browser.Click    ${selector_settings_network_port_9_type_ddwn}
    
    Keyboard Key    press    ArrowDown
    
    Keyboard Key    press    ArrowDown
    
    Keyboard Key    press    Enter
    

    Fill Text    ${selector_settings_network_port_9_delay_input}    900
    

    Browser.Click    ${selector_settings_network_port_10_type_ddwn}
    
    Keyboard Key    press    ArrowDown
    
    Keyboard Key    press    Enter
    

    Fill Text    ${selector_settings_network_port_10_delay_input}    1000
    

    Fill Text    ${selector_settings_network_port_mbusSendDelay_input}    12345

    Browser.Click    ${selector_settings_network_port_move_from_ddwn}
    
    Keyboard Key    press    ArrowDown
    
    Keyboard Key    press    Enter
    

    Fill Text    ${selector_settings_network_port_first_input}    2
    

    Fill Text    ${selector_settings_network_port_last_input}    64
    

    Browser.Click    ${selector_settings_network_port_move_to_ddwn}
    
    Keyboard Key    press    ArrowDown
    
    Keyboard Key    press    ArrowDown
    
    Keyboard Key    press    Enter
    

    IF    ${save} == 1
        ${element_visible}=    Run Keyword And Return Status
        ...    Wait for Elements State
        ...    ${selector_settings_network_port_save_active_btn}
        ...    visible
        ...    timeout=2s
        IF    ${element_visible}
            Log To Console    Saving button active. Saving...
            Browser.Click    ${selector_settings_network_ip_save_active_btn}
            
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
            
        END
        
    ELSE
        Log To Console    Saving not requested. Cancelling...
        Browser.Click    ${selector_settings_network_port_cancel_btn}
        
    END

Settings Network Firewall Settings
    [Arguments]
    ...    ${firewall_in_use}
    ...    ${webserver_in_use}
    ...    ${webserver_port}
    ...    ${subnet_1_ip}
    ...    ${subnet_1_mask}
    ...    ${subnet_2_ip}
    ...    ${subnet_2_mask}
    ...    ${subnet_3_ip}
    ...    ${subnet_3_mask}
    ...    ${main_pc_in_use}
    ...    ${main_pc_port}
    ...    ${openpcs_in_use}
    ...    ${openpcs_port}
    ...    ${ping_in_use}
    ...    ${smtp_in_use}
    ...    ${smtp_port}
    ...    ${maintenance_in_use}
    ...    ${time_in_use}
    ...    ${time_port}
    ...    ${save}
    Go to settings
    

    Browser.Click    ${selector_settings_network_btn}
    

    Browser.Click    ${selector_settings_network_firewall_item}
    

    ${header_visible}=    Run Keyword And Return Status
    ...    Wait for Elements State
    ...    ${selector_settings_network_firewall_header}
    ...    visible
    ...    timeout=2s
    IF    ${header_visible}
        Log To Console    Firewall settings header visible
    ELSE
        Log To Console    Firewall settings header NOT visible
    END

    # Firewall in use
    Keyboard Key    press    Tab
    

    IF    ${firewall_in_use} == 1
        Keyboard Key    press    Space
        
        Keyboard Key    press    Space
        
    ELSE
        Keyboard Key    press    Space
        
    END

    Keyboard Key    press    Tab
    

    # Webserver in use
    IF    ${webserver_in_use} == 1
        Keyboard Key    press    Space
        
        Keyboard Key    press    Space
        
    ELSE
        Keyboard Key    press    Space
        
    END

    # Webserver port
    Keyboard Key    press    Tab
    
    Keyboard Input    type    ${webserver_port}
    

    Keyboard Key    press    Tab
    

    # Webserver private address
    Keyboard Key    press    Space
    
    Keyboard Key    press    Space
    
    # Webserver limited address
    Keyboard Key    press    Tab
    
    Keyboard Key    press    Space
    
    Keyboard Key    press    Tab
    
    Keyboard Input    type    ${subnet_1_ip}
    
    Keyboard Key    press    Tab
    
    Keyboard Input    type    ${subnet_1_mask}
    

    Keyboard Key    press    Tab
    
    Keyboard Key    press    Space
    
    Keyboard Key    press    Tab
    
    Keyboard Input    type    ${subnet_2_ip}
    
    Keyboard Key    press    Tab
    
    Keyboard Input    type    ${subnet_2_mask}
    

    Keyboard Key    press    Tab
    
    Keyboard Key    press    Space
    
    Keyboard Key    press    Tab
    
    Keyboard Input    type    ${subnet_3_ip}
    
    Keyboard Key    press    Tab
    
    Keyboard Input    type    ${subnet_3_mask}
    

    # Main PC server enable
    Keyboard Key    press    Tab
    

    IF    ${main_pc_in_use} == 1
        Keyboard Key    press    Space
        
        Keyboard Key    press    Space
        
    ELSE
        Keyboard Key    press    Space
        
    END

    # Main PC port
    Keyboard Key    press    Tab
    
    Keyboard Input    type    ${main_pc_port}
    

    # Main PC private address
    Keyboard Key    press    Tab
    
    Keyboard Key    press    Space
    
    Keyboard Key    press    Space
    

    # Main PC limited address
    Keyboard Key    press    Tab
    
    Keyboard Key    press    Space
    
    Keyboard Key    press    Tab
    
    Keyboard Input    type    ${subnet_1_ip}
    
    Keyboard Key    press    Tab
    
    Keyboard Input    type    ${subnet_1_mask}
    

    Keyboard Key    press    Tab
    
    Keyboard Key    press    Space
    
    Keyboard Key    press    Tab
    
    Keyboard Input    type    ${subnet_2_ip}
    
    Keyboard Key    press    Tab
    
    Keyboard Input    type    ${subnet_2_mask}
    

    Keyboard Key    press    Tab
    
    Keyboard Key    press    Space
    
    Keyboard Key    press    Tab
    
    Keyboard Input    type    ${subnet_3_ip}
    
    Keyboard Key    press    Tab
    
    Keyboard Input    type    ${subnet_3_mask}
    

    # OpenPCS server enable
    Keyboard Key    press    Tab
    

    IF    ${openpcs_in_use} == 1
        Keyboard Key    press    Space
        
        Keyboard Key    press    Space
        
    ELSE
        Keyboard Key    press    Space
        
    END

    # OpenPCS port
    Keyboard Key    press    Tab
    
    Keyboard Input    type    ${openpcs_port}
    

    # OpenPCS private address
    Keyboard Key    press    Tab
    
    Keyboard Key    press    Space
    
    Keyboard Key    press    Space
    

    # OpenPCS limited address
    Keyboard Key    press    Tab
    
    Keyboard Key    press    Space
    
    Keyboard Key    press    Tab
    
    Keyboard Input    type    ${subnet_1_ip}
    
    Keyboard Key    press    Tab
    
    Keyboard Input    type    ${subnet_1_mask}
    

    Keyboard Key    press    Tab
    
    Keyboard Key    press    Space
    
    Keyboard Key    press    Tab
    
    Keyboard Input    type    ${subnet_2_ip}
    
    Keyboard Key    press    Tab
    
    Keyboard Input    type    ${subnet_2_mask}
    

    Keyboard Key    press    Tab
    
    Keyboard Key    press    Space
    
    Keyboard Key    press    Tab
    
    Keyboard Input    type    ${subnet_3_ip}
    
    Keyboard Key    press    Tab
    
    Keyboard Input    type    ${subnet_3_mask}
    

    # # Ping server enable
    Keyboard Key    press    Tab
    

    IF    ${ping_in_use} == 1
        Keyboard Key    press    Space
        
        Keyboard Key    press    Space
        
    ELSE
        Keyboard Key    press    Space
        
    END

    # Ping private address
    Keyboard Key    press    Tab
    
    Keyboard Key    press    Space
    
    Keyboard Key    press    Space
    

    # Ping limited address
    Keyboard Key    press    Tab
    
    Keyboard Key    press    Space
    
    Keyboard Key    press    Tab
    
    Keyboard Input    type    ${subnet_1_ip}
    
    Keyboard Key    press    Tab
    
    Keyboard Input    type    ${subnet_1_mask}
    

    Keyboard Key    press    Tab
    
    Keyboard Key    press    Space
    
    Keyboard Key    press    Tab
    
    Keyboard Input    type    ${subnet_2_ip}
    
    Keyboard Key    press    Tab
    
    Keyboard Input    type    ${subnet_2_mask}
    

    Keyboard Key    press    Tab
    
    Keyboard Key    press    Space
    
    Keyboard Key    press    Tab
    
    Keyboard Input    type    ${subnet_3_ip}
    
    Keyboard Key    press    Tab
    
    Keyboard Input    type    ${subnet_3_mask}
    

    # SMTP server enable
    Keyboard Key    press    Tab
    

    IF    ${smtp_in_use} == 1
        Keyboard Key    press    Space
        
        Keyboard Key    press    Space
        
    ELSE
        Keyboard Key    press    Space
        
    END

    # SMTP port
    Keyboard Key    press    Tab
    
    Keyboard Input    type    ${smtp_port}
    

    # SMTP private address
    Keyboard Key    press    Tab
    
    Keyboard Key    press    Space
    
    Keyboard Key    press    Space
    

    # SMTP limited address
    Keyboard Key    press    Tab
    
    Keyboard Key    press    Space
    
    Keyboard Key    press    Tab
    
    Keyboard Input    type    ${subnet_1_ip}
    
    Keyboard Key    press    Tab
    
    Keyboard Input    type    ${subnet_1_mask}
    

    Keyboard Key    press    Tab
    
    Keyboard Key    press    Space
    
    Keyboard Key    press    Tab
    
    Keyboard Input    type    ${subnet_2_ip}
    
    Keyboard Key    press    Tab
    
    Keyboard Input    type    ${subnet_2_mask}
    

    Keyboard Key    press    Tab
    
    Keyboard Key    press    Space
    
    Keyboard Key    press    Tab
    
    Keyboard Input    type    ${subnet_3_ip}
    
    Keyboard Key    press    Tab
    
    Keyboard Input    type    ${subnet_3_mask}
    

    # Maintenance server enable
    Keyboard Key    press    Tab
    

    IF    ${maintenance_in_use} == 1
        Keyboard Key    press    Space
        
        Keyboard Key    press    Space
        
    ELSE
        Keyboard Key    press    Space
        
    END

    # Maintenance private address
    Keyboard Key    press    Tab
    
    Keyboard Key    press    Space
    
    Keyboard Key    press    Space
    

    # Maintenance limited address
    Keyboard Key    press    Tab
    
    Keyboard Key    press    Space
    
    Keyboard Key    press    Tab
    
    Keyboard Input    type    ${subnet_1_ip}
    
    Keyboard Key    press    Tab
    
    Keyboard Input    type    ${subnet_1_mask}
    

    Keyboard Key    press    Tab
    
    Keyboard Key    press    Space
    
    Keyboard Key    press    Tab
    
    Keyboard Input    type    ${subnet_2_ip}
    
    Keyboard Key    press    Tab
    
    Keyboard Input    type    ${subnet_2_mask}
    

    Keyboard Key    press    Tab
    
    Keyboard Key    press    Space
    
    Keyboard Key    press    Tab
    
    Keyboard Input    type    ${subnet_3_ip}
    
    Keyboard Key    press    Tab
    
    Keyboard Input    type    ${subnet_3_mask}
    

    # Time server enable
    Keyboard Key    press    Tab
    

    IF    ${time_in_use} == 1
        Keyboard Key    press    Space
        
        Keyboard Key    press    Space
        
    ELSE
        Keyboard Key    press    Space
        
    END

    # Time port
    Keyboard Key    press    Tab
    
    Keyboard Input    type    ${time_port}
    

    # Time private address
    Keyboard Key    press    Tab
    
    Keyboard Key    press    Space
    
    Keyboard Key    press    Space
    

    # Time limited address
    Keyboard Key    press    Tab
    
    Keyboard Key    press    Space
    
    Keyboard Key    press    Tab
    
    Keyboard Input    type    ${subnet_1_ip}
    
    Keyboard Key    press    Tab
    
    Keyboard Input    type    ${subnet_1_mask}
    

    Keyboard Key    press    Tab
    
    Keyboard Key    press    Space
    
    Keyboard Key    press    Tab
    
    Keyboard Input    type    ${subnet_2_ip}
    
    Keyboard Key    press    Tab
    
    Keyboard Input    type    ${subnet_2_mask}
    

    Keyboard Key    press    Tab
    
    Keyboard Key    press    Space
    
    Keyboard Key    press    Tab
    
    Keyboard Input    type    ${subnet_3_ip}
    
    Keyboard Key    press    Tab
    
    Keyboard Input    type    ${subnet_3_mask}
    

    IF    ${save} == 1
        ${element_visible}=    Run Keyword And Return Status
        ...    Wait for Elements State
        ...    ${selector_settings_network_port_save_active_btn}
        ...    visible
        ...    timeout=2s
        IF    ${element_visible}
            Log To Console    Saving button active. Saving...
            Browser.Click    ${selector_settings_network_ip_save_active_btn}
            
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
            
        END
        
    ELSE
        Log To Console    Saving not requested. Cancelling...
        Browser.Click    ${selector_settings_network_port_cancel_btn}
        
    END
