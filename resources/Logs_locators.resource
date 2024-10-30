*** Settings ***
Library     Browser
Resource    navigate.resource
Resource    login.resource


*** Variables ***
${temp_folder}                                      c:\\QA\\robot_tmp\\

${selector_logs_header}                             xpath=//span[@class='events_title' and @aria-label='Events']

${selector_logs_events_active_btn}                  xpath=//div[contains(@class, 'toggle') and text()=' Events ']
${selector_logs_events_btn}                         xpath=//div[@class='toggle active' and text()=' Events ']

${selector_logs_alarm_btn}                          xpath=//div[@class='toggle ng-star-inserted' and text()=' Alarm ']
${selector_logs_debug_btn}                          xpath=//div[@class='toggle ng-star-inserted' and text()=' Debug ']

${selector_logs_events_username_search_input}       xpath=//div[@class='new_filter ng-star-inserted'][mat-icon[@svgicon='icon-search']][div[@class='search_info' and text()='Username']]
${selector_logs_events_point_search_input}          xpath=//div[@class='new_filter ng-star-inserted'][mat-icon[@svgicon='icon-search']][div[@class='search_info' and text()='Pointname']]
${selector_logs_events_time_search_input}           xpath=//div[@class='new_filter ng-star-inserted'][mat-icon[@svgicon='icon-search']][div[@class='search_info' and text()='Time span']]
${selector_logs_events_search_input_delete_icon}    xpath=//mat-icon[@class='mat-icon notranslate clear_filter mat-icon-no-color active'][@svgicon='icon-delete-x']

${selector_logs_events_search_btn}                  xpath=//button[@class='search_btn active']

${selector_logs_events_search_user_btn}             xpath=//div[@class='toggle active']//mat-icon[@class='mat-icon notranslate mat-icon-no-color' and @svgicon='statusbar-person-icon']
${selector_logs_events_search_user_passive_btn}     xpath=//div[@class='toggle']/mat-icon[@class='mat-icon notranslate mat-icon-no-color' and @svgicon='statusbar-person-icon']

${selector_logs_events_search_point_btn}            xpath=//div[@class='toggle']/mat-icon[@class='mat-icon notranslate mat-icon-no-color' and @svgicon='mainmenu-points']
${selector_logs_events_search_date_btn}             xpath=//div[@class='toggle']/mat-icon[@class='mat-icon notranslate calendar_icon mat-icon-no-color' and @svgicon='statusbar-calender-icon']

# ${selector_logs_events_search_date_btn}    xpath=//td[text()='SYSTEM']

${selector_logs_alarms_search_user_btn}             xpath=//div[contains(@class, 'event_select_toggle')]//div[@class='toggle']/mat-icon[@data-mat-icon-name='statusbar-person-icon']
${selector_logs_alarms_search_point_btn}            xpath=//div[contains(@class, 'event_select_toggle')]//div[@class='toggle']/mat-icon[@data-mat-icon-name='mainmenu-points']
${selector_logs_alarms_search_date_btn}             xpath=//div[contains(@class, 'event_select_toggle')]//div[@class='toggle active']/mat-icon[@data-mat-icon-name='statusbar-calender-icon']

${selector_logs_alarm_search_btn}                   xpath=//button[@class='search_btn active']
${selector_logs_alarm_search_input}                 xpath=//div[@class='new_filter ng-star-inserted']

${selector_logs_alarms_username_search_input}       xpath=//div[@class='search_info' and text()='Username']
# xpath=//div[contains(@class, 'new_filter') and contains(@class, 'ng-star-inserted')]//input
# xpath=//div[contains(@class, 'new_filter')]//mat-icon[@data-mat-icon-name='icon-search']

${selector_logs_debug_watchdog_header}              xpath=//th[@class='debug_header' and contains(text(), 'Watchdog - Data')]
${selector_logs_debug_watchdog_csv_btn}             xpath=//mat-icon[@svgicon='install-icon']

${selector_logs_debug_empty_table_txt}              xpath=//div[contains(@class, 'new_table_area')]//div[contains(@class, 'spinner_container')]

${selector_logs_debug_watchdog_btn}                 xpath=//div[contains(@class, 'event_select_toggle')]//div[@class='name' and text()='Watchdog']
${selector_logs_debug_debug_btn}                    xpath=//div[contains(@class, 'event_select_toggle')]//div[@class='name' and text()='Debug']
${selector_logs_debug_mbus_btn}                     xpath=//div[contains(@class, 'event_select_toggle')]//div[@class='name' and text()='Mbus']
${selector_logs_debug_mail_btn}                     xpath=//div[contains(@class, 'event_select_toggle')]//div[@class='name' and text()='Mail']
${selector_logs_debug_gsm_btn}                      xpath=//div[contains(@class, 'event_select_toggle')]//div[@class='name' and text()='GSM']
${selector_logs_debug_modbus_btn}                   xpath=//div[contains(@class, 'event_select_toggle')]//div[@class='name' and text()='Modbus']
${selector_logs_debug_smsalarms_btn}                xpath=//div[contains(@class, 'event_select_toggle')]//div[@class='name' and text()='SMSAlarms']
${selector_logs_debug_mailalarms_btn}               xpath=//div[contains(@class, 'event_select_toggle')]//div[@class='name' and text()='MailAlarms']
${selector_logs_debug_alertalarms_btn}              xpath=//div[contains(@class, 'event_select_toggle')]//div[@class='name' and text()='AlertaAlarms']

# ${selector_logs_debug_watchdog_btn}    xpath=//div[@class='toggle debug' and div[@class='name' and text()='Watchdog']]
# ${selector_logs_debug_debug_btn}    xpath=//div[@class='toggle debug']//div[@class='name' and contains(text(), 'Debug')]
# ${selector_logs_debug_mbus_btn}    xpath=//div[@class='toggle debug']//div[@class='name' and contains(text(), 'MBus')]
# ${selector_logs_debug_mail_btn}    xpath=//div[@class='toggle debug']//div[@class='name' and contains(text(), 'Mail')]
# ${selector_logs_debug_gsm_btn}    xpath=//div[@class='toggle debug']//div[@class='name' and contains(text(), 'GSM')]
# ${selector_logs_debug_modbus_btn}    xpath=//div[@class='toggle debug']//div[@class='name' and contains(text(), 'ModBus')]

${selector_logs_debug_debug_header}                 xpath=//th[@class='debug_header' and contains(., ' Debug - Data ')]
${selector_logs_debug_mbus_header}                  xpath=//th[@class='debug_header' and contains(., ' Mbus - Data ')]
${selector_logs_debug_mail_header}                  xpath=//th[@class='debug_header' and contains(., ' Mail - Data ')]
${selector_logs_debug_gsm_header}                   xpath=//th[@class='debug_header' and contains(., ' GSM - Data ')]
${selector_logs_debug_modbus_header}                xpath=//th[@class='debug_header' and contains(., ' Modbus - Data ')]
${selector_logs_debug_smsalarm_header}              xpath=//th[@class='debug_header' and contains(., ' SMSAlarms - Data ')]
${selector_logs_debug_mailalarm_header}             xpath=//th[@class='debug_header' and contains(., ' MailAlarms - Data ')]
${selector_logs_debug_alertaalarm_header}           xpath=//th[@class='debug_header' and contains(., ' AlertaAlarms - Data ')]

${selector_logs_debug_no_events_header}             xpath=//div[@class='spinner_container' and text()='No events']

${selector_logs_events_time_form}                   xpath=//div[@class='dialog_title' and div[@class='dialog_text' and text()='Choose time span']]
${selector_logs_events_time_19_btn}                 xpath=//button[@class='mat-calendar-body-cell'][@aria-label='November 19, 2023'][@tabindex='-1'][@aria-pressed='false']
${selector_logs_events_time_27_btn}                 xpath=//button[@class='mat-calendar-body-cell'][@aria-label='November 27, 2023'][@tabindex='-1'][@aria-pressed='false']

${selector_logs_events_time_years_btn}              xpath=//button[@type='button' and @class='mat-focus-indicator mat-calendar-period-button mat-button mat-button-base' and span[@class='mat-button-wrapper' and span[@id='mat-calendar-button-1' and text()='2023']]]
${selector_logs_events_time_2023_btn}               xpath=//td[@role='gridcell' and @class='mat-calendar-body-cell-container ng-star-inserted' and button/div[@class='mat-calendar-body-cell-content mat-focus-indicator' and text()='2023']]
${selector_logs_events_time_2024_btn}               xpath=//td[@role='gridcell' and @class='mat-calendar-body-cell-container ng-star-inserted' and button/div[@class='mat-calendar-body-cell-content mat-focus-indicator' and text()='2024']]

${selector_logs_events_time_OCT_btn}                xpath=//td[@role='gridcell' and @class='mat-calendar-body-cell-container ng-star-inserted' and button/div[@class='mat-calendar-body-cell-content mat-focus-indicator' and text()='OCT']]
${selector_logs_events_time_NOV_btn}                xpath=//td[@role='gridcell' and @class='mat-calendar-body-cell-container ng-star-inserted' and button/div[@class='mat-calendar-body-cell-content mat-focus-indicator' and text()='NOV']]

${selector_logs_events_time_prev_month_btn}         xpath=//button[@type='button' and @class='mat-focus-indicator mat-calendar-previous-button mat-icon-button mat-button-base' and @aria-label='Previous month']
${selector_logs_events_time_next_month_btn}         xpath=//button[@type='button' and @class='mat-focus-indicator mat-calendar-next-button mat-icon-button mat-button-base' and @aria-label='Next month']

${selector_logs_events_time_cancel_btn}             xpath=//button[@class='dialog_button active' and div[@class='btn_text' and text()='Cancel']]
${selector_logs_events_time_search_btn}             xpath=//button[@class='dialog_button active' and div[@class='btn_text' and text()='Search']]

${selector_logs_events_time_start_date_input}       xpath=//input[@type='text' and @class='date_input']
${selector_logs_events_time_start_date_input}       xpath=//input[@type='time' and @class='time_input']
