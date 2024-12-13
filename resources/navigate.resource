*** Comments ***
# This file contains keywords to easily navigate between UI. Note that most of
# keywords does not do login. These commands will also validate that we are
# correct place.

# TODO: Many command do not do validations yet.


*** Settings ***
Resource    env.resource
Resource    language.resource
Resource    login.resource
Library     Browser
Library     RPA.Browser.Selenium
# Library    RPA.Browser.Selenium
Resource    global_variables.resource


*** Variables ***
# TODO: Currently there is two elements with smartphone.
${selector_navbar_dashboard}                        xpath=//a[@routerlink='/main/dashboard']
${selector_navbar_processes}                        xpath=//a[@routerlink='/main/processes']
${selector_navbar_automation}                       xpath=//a[@routerlink='/main/points']
${selector_navbar_history}                          xpath=//a[@routerlink='/main/history']
${selector_navbar_logs}                             xpath=//a[@routerlink='/main/events']
${selector_navbar_settings}                         xpath=//a[@routerlink='/main/settings']
# TODO: reports navigation is hidden if there is no reports to display
${selector_navbar_reports}                          xpath=//a[@routerlink='/main/reports']

# We use these to validate page is loaded
${selector_dashboard_visible}                       xpath=//mat-icon[@title='Open dashboard settings']
${selector_processes_visible}                       xpath=//div[contains(@class, "content_toolbar")]    # xpath=//div[@class='process_toolbar_title'] | //div[@id='process_empty_info']
${selector_automation_visible}                      xpath=//div[@class='automation-toolbar-header'] | //div[@class='automation-menu']
${selector_history_visible}                         xpath=//div[@id="history-toolbar"]
${selector_logs_visible}                            xpath=//div[@class='event_details_container ng-star-inserted']

# xpath=//mat-toolbar[@class='mat-toolbar events_new_toolbar mat-toolbar-single-row']
${selector_reports_visible}                         xpath=//button[@id='settings-reports']
${selector_settings_visible}                        xpath=//div[@class='top_menu']//app-settings-top-menu

# Automation menu
${selector_automation_menu}                         xpath=//div[@class='automation_menu']
${selector_automation_points}                       xpath=//div[@class='automation_menu']//a[@routerlink='indications']
${selector_automation_alarms}                       xpath=//div[@class='automation_menu']//a[@routerlink='alarmpoint']
${selector_automation_devices}                      xpath=//div[@class='automation_menu']//a[@routerlink='modules']

# Automation sub pages
${selector_automation_indications}                  xpath=//a[@routerlink='indications']
${selector_automation_measurements}                 xpath=//a[@routerlink='measurements']
${selector_automation_control_points}               xpath=//a[@routerlink='controlpoints']
${selector_automation_ao_points}                    xpath=//a[@routerlink='aopoints']
${selector_automation_do_points}                    xpath=//a[@routerlink='dopoints']
${selector_automation_state_texts}                  xpath=//a[@routerlink='statetext']
${selector_automation_lookup_tables}                xpath=//a[@routerlink='lookuptable']
${selector_automation_time_schedules}               xpath=//a[@routerlink='timeschedule']
${selector_automation_all_points}                   xpath=//a[@routerlink='allpoints']
${selector_automation_alarm_points}                 xpath=//a[@routerlink='alarmpoint']
${selector_automation_alarm_devices}                xpath=//a[@routerlink='alarmdevices']
${selector_automation_alarm_groups}                 xpath=//a[@routerlink='alarmgroup']
${selector_automation_modules}                      xpath=//a[@routerlink='modules']
${selector_automation_modbus_devices}               xpath=//a[@routerlink='modbus']
${selector_automation_freeze_protectors}            xpath=//a[@routerlink='freeze']
${selector_automation_calendar}                     xpath=//a[@routerlink='calender']

# Logs sub pages
# TODO: Better identifiers
# TODO: Naming: Events vs Event as in Alarm/Debug.
${selector_logs_events}                             xpath=//div[@class='event_type_container']//div[contains(normalize-space(text()), 'Events')]
${selector_logs_alarms}                             xpath=//div[@class='event_type_container']//div[contains(normalize-space(text()), 'Alarm')]
${selector_logs_debugs}                             xpath=//div[@class='event_type_container']//div[contains(normalize-space(text()), 'Debug')]

# Settings sub pages
# TODO: Many these fails with other language. We need better identifiers in code.
# New selectors created with "data-qa-id" attribute

# ${selector_settings_dashboard}                      xpath=//app-settings-top-menu//div[text()='Dashboard']
# ${selector_settings_system}                         xpath=//app-settings-top-menu//div[text()='System settings']
# ${selector_settings_network}                        xpath=//app-settings-top-menu//div[text()='Network settings']
# ${selector_settings_user}                           xpath=//app-settings-top-menu//div[text()='User settings']

${selector_settings_dashboard}                      xpath=//div[@data-qa-id='settings-top-menu-dashboard']
${selector_settings_system}                         xpath=//div[@data-qa-id='settings-top-menu-system']
${selector_settings_network}                        xpath=//div[@data-qa-id='settings-top-menu-network']
${selector_settings_user}                           xpath=//div[@data-qa-id='settings-top-menu-user']

${selector_settings_system_device}                  xpath=//div[@class='item_title' and contains(normalize-space(text()), 'Device settings')]
${selector_settings_system_status}                  xpath=//div[@class='item_title' and contains(normalize-space(text()), 'System status')]
${selector_settings_system_clock}                   xpath=//div[@class='item_title' and contains(normalize-space(text()), 'Clock settings')]
${selector_settings_system_activations}             xpath=//div[@class='item_title' and contains(normalize-space(text()), 'Activations')]
${selector_settings_system_sms}                     xpath=//div[@class='item_title' and contains(normalize-space(text()), 'SMS settings')]
${selector_settings_system_sync}                    xpath=//div[@class='item_title' and contains(normalize-space(text()), 'Information synchronization')]
${selector_settings_system_priority_table}          xpath=//div[@class='item_title' and contains(normalize-space(text()), 'Priority table')]
${selector_settings_system_weather}                 xpath=//div[@class='item_title' and contains(normalize-space(text()), 'Weather forecast')]

${selector_settings_system_backup}                  xpath=//div[@class='backup_button_container']

${selector_settings_system_device_visible}          xpath=//app-device-settings
${selector_settings_system_status_visible}          xpath=//app-system-status
${selector_settings_system_clock_visible}           xpath=//app-clock-settings
${selector_settings_system_activations_visible}     xpath=//app-activations
${selector_settings_system_sms_visible}             xpath=//app-sms-settings
${selector_settings_system_sync_visible}            xpath=//app-synchronization-settings

# TODO: test releted to bacnet activation
# ${selector_settings_system_priority_table_visible}    xpath=//app-priority-settings
# TODO: Was not activated
# ${selector_settings_system_weather_visible}    xpath=//app-weather-settings

${selector_settings_network_ip}                     xpath=//div[@class='item_title' and contains(normalize-space(text()), 'IP-Settings')]
${selector_settings_network_port}                   xpath=//div[@class='item_title' and contains(normalize-space(text()), 'Port settings')]
${selector_settings_network_firewall}               xpath=//div[@class='item_title' and contains(normalize-space(text()), 'Firewall settings')]
${selector_settings_network_nat}                    xpath=//div[@class='item_title' and contains(normalize-space(text()), 'Nat settings')]
${selector_settings_network_alarm_email}            xpath=//div[@class='item_title' and contains(normalize-space(text()), 'Alarm email settings')]
${selector_settings_network_history}                xpath=//div[@class='item_title' and contains(normalize-space(text()), 'History settings')]
${selector_settings_network_tosibox}                xpath=//div[@class='item_title' and contains(normalize-space(text()), 'Tosibox Readiness')]

${selector_settings_user_settings}                  xpath=//div[@class='item_title' and contains(normalize-space(text()), 'Users')]
${selector_settings_user_groups}                    xpath=//div[@class='item_title' and contains(normalize-space(text()), 'User groups')]

# Loading spinner
${selector_loading_spinner}                         xpath=//mat-spinner[@role='progressbar']

${BROWSER}                                          Firefox    # Default browser is Chrome
${version_info}                                     2X.X.XX


*** Keywords ***
Wait until loading spinner is gone
    Wait For Elements State    ${selector_loading_spinner}    hidden

Go to login page
    # New Browser    browser=firefox    headless=${False}    slowMo=500ms
    ${first_browser}=    New Browser    browser=chromium    headless=${False}    slowMo=250ms
    # New Browser    browser=webkit    headless=${False}    slowMo=500ms

    # Browser.Open Browser    http://${TARGET_FRONTEND_IP}:${TARGET_FRONTEND_PORT}
    # New Context baseURL=https://192.168.1.3/#/login ignoreHTTPSErrors=${True}
    ${first_context}=    New Context    viewport={'width': 1920, 'height': 1000}    deviceScaleFactor=0.7    # screen={'width': 1900, 'height': 896}
    # Maximize Browser Window
    # ${first_page}=    New Page    http://${TARGET_FRONTEND_IP}:${TARGET_FRONTEND_PORT}
    # Switch Context    ${first_context}
    # Set Viewport Size    1900    800
    Set Browser Timeout    10s
    New Page    http://${TARGET_FRONTEND_IP}:${TARGET_FRONTEND_PORT}
    # RPA.Browser.Selenium.Open Browser    http://${TARGET_FRONTEND_IP}:${TARGET_FRONTEND_PORT}    ${BROWSER}

Go to main view
    [Documentation]
    ...    This will make sure we are logged in
    # ${passed}    Run Keyword And Return Status    Validate logged in
    # IF    ${passed}    RETURN

    Go to login page
    ${login_page}    Run Keyword And Return Status
    ...    Wait For Elements State
    ...    ${selector_dashboard_visible}
    ...    visible
    ...    timeout=2s
    Sleep    1s
    # Autologin
    IF    ${login_page} == ${FALSE}
        Login with credentials    ${TARGET_USER}    ${TARGET_USER_PASSWORD}
    END

    Validate logged in

    # TODO: Sometimes when we Browser.Click links too fast we do not get correct
    # page without these. This is some bug in UI. We might get other bugs
    # when we finally remove these.
    Run Keyword And Ignore Error    Wait For Load State
    Wait For Elements State    ${selector_dashboard_visible}    visible

    # TODO: Currently only english works as our selectors use text.
    Change language to english
    # Set Zoom Level    0.7

Go to dashboard
    Browser.Click    ${selector_navbar_dashboard}
    Wait For Elements State    ${selector_dashboard_visible}    visible

Go to processes
    Browser.Click    ${selector_navbar_processes}
    Wait For Elements State    ${selector_processes_visible}    visible

Go to automation
    Sleep    10ms
    Browser.Click    ${selector_navbar_automation}
    Wait For Elements State    ${selector_automation_visible}    visible

Go to history
    Browser.Click    ${selector_navbar_history}
    Wait For Elements State    ${selector_history_visible}    visible

Go to logs
    Browser.Click    ${selector_navbar_logs}
    Wait For Elements State    ${selector_logs_visible}    visible

Go to reports
    Browser.Click    ${selector_navbar_reports}
    Wait For Elements State    ${selector_reports_visible}    visible

Go to settings
    Browser.Click    ${selector_navbar_settings}
    Wait For Elements State    ${selector_settings_visible}    visible

# Automation pages

Go to automation indications
    Go to automation
    # Hack so we do not get strict warning
    Go to automation state texts
    Browser.Click    ${selector_automation_indications}

Go to automation measurements
    Go to automation
    Browser.Click    ${selector_automation_measurements}

Go to automation control points
    Go to automation
    Browser.Click    ${selector_automation_control_points}

Go to automation ao points
    Go to automation
    Browser.Click    ${selector_automation_ao_points}

Go to automation do points
    Go to automation
    Browser.Click    ${selector_automation_do_points}

Go to automation state texts
    Go to automation
    Browser.Click    ${selector_automation_state_texts}

Go to automation lookup tables
    Go to automation
    Browser.Click    ${selector_automation_lookup_tables}

Go to automation time schedules
    Go to automation
    Browser.Click    ${selector_automation_time_schedules}

Go to automation all points
    Go to automation
    Browser.Click    ${selector_automation_all_points}

Go to automation alarm points
    Go to automation
    Browser.Click    ${selector_automation_alarm_points}

Go to automation alarm devices
    Go to automation
    Browser.Click    ${selector_automation_alarm_devices}

Go to automation alarm groups
    Go to automation
    Browser.Click    ${selector_automation_alarm_groups}

Go to automation modules
    Go to automation
    Browser.Click    ${selector_automation_modules}

Go to automation modbus devices
    Go to automation
    Browser.Click    ${selector_automation_modbus_devices}

Go to automation freeze protectors
    Go to automation
    Browser.Click    ${selector_automation_freeze_protectors}

Go to automation calendar
    Go to automation
    Browser.Click    ${selector_automation_calendar}

# Logs pages

Go to logs events
    Go to logs
    Browser.Click    ${selector_logs_events}

Go to logs alarms
    Go to logs
    Browser.Click    ${selector_logs_alarms}

Go to logs debugs
    Go to logs
    Browser.Click    ${selector_logs_debugs}

# Settings pages

Go to settings dashboard
    Go to settings
    Browser.Click    ${selector_settings_dashboard}

Go to system settings
    Go to settings
    Browser.Click    ${selector_settings_system}

Go to system device settings
    Go to system settings
    Browser.Click    ${selector_settings_system_device}
    Wait For Elements State    ${selector_settings_system_device_visible}    visible

Go to system status settings
    Go to system settings
    Browser.Click    ${selector_settings_system_status}
    Wait For Elements State    ${selector_settings_system_status_visible}    visible

Go to system clock settings
    Go to system settings
    Browser.Click    ${selector_settings_system_clock}
    Wait For Elements State    ${selector_settings_system_clock_visible}    visible

Go to system activations settings
    Go to system settings
    Browser.Click    ${selector_settings_system_activations}
    Wait For Elements State    ${selector_settings_system_activations_visible}    visible

Go to system sms settings
    Go to system settings
    Browser.Click    ${selector_settings_system_sms}
    Wait For Elements State    ${selector_settings_system_sms_visible}    visible

Go to system sync settings
    Go to system settings
    Browser.Click    ${selector_settings_system_sync}
    Wait For Elements State    ${selector_settings_system_sync_visible}    visible

Go to system priority table settings
    Go to system settings
    Browser.Click    ${selector_settings_system_priority_table}
    Wait For Elements State    ${selector_settings_system_priority_table}    visible

Go to system weather settings
    Go to system settings
    Browser.Click    ${selector_settings_system_weather}

Go to system backup settings dialog
    [Documentation]
    ...    This is backup dialog so we need to get back from this
    Go to system settings
    Browser.Click    ${selector_settings_system_backup}

Go to network settings
    Go to settings
    Browser.Click    ${selector_settings_network}

Go to network ip settings
    Go to network settings
    Browser.Click    ${selector_settings_network_ip}

Go to network port settings
    Go to network settings
    Browser.Click    ${selector_settings_network_port}

Go to network firewall settings
    Go to network settings
    Browser.Click    ${selector_settings_network_firewall}

Go to network nat settings
    Go to network settings
    Browser.Click    ${selector_settings_network_nat}

Go to network alarm email settings
    Go to network settings
    Browser.Click    ${selector_settings_network_alarm_email}

Go to network history settings
    Go to network settings
    Browser.Click    ${selector_settings_network_history}

Go to network tosibox settings
    Go to network settings
    Browser.Click    ${selector_settings_network_tosibox}

Go to user settings
    Go to settings
    Browser.Click    ${selector_settings_user}
    Browser.Click    ${selector_settings_user_settings}

Go to user groups settings
    Go to user settings
    Browser.Click    ${selector_settings_user_groups}
