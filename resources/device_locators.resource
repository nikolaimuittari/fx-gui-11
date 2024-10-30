*** Settings ***
Library     Browser
Resource    navigate.resource
Resource    login.resource


*** Variables ***
${selector_automation_print}                                        xpath=//*[@svgicon="print-icon"]

${selector_automation_addnew}                                       xpath=//*[@svgicon="icon-add"]
${selector_automation_remove}                                       xpath=//*[@svgicon="remove-icon"]
${selector_automation_delete_form}                                  xpath=//div[contains(@class, 'dialog_header')]//div[contains(@class, 'dialog_title')]

### Modules

${selector_module_create_form_port_ddwn}                            xpath=//mat-select[@formcontrolname='port']
${selector_module_create_form_address_ddwn}                         xpath=//mat-select[@formcontrolname='address']
${selector_module_create_form_moduletype_ddwn}                      xpath=//mat-select[@formcontrolname='moduleType']

${selector_module_create_form_tcpudpmodule_chkbx}                   xpath=//mat-checkbox[@formcontrolname='tcpUdpModule']

${selector_module_create_form_ipAddress_input}                      xpath=//input[@formcontrolname='ipAddress']
${selector_module_create_form_ipPort_input}                         xpath=//input[@formcontrolname='ipPort']
${selector_module_create_form_timeout_input}                        xpath=//input[@formcontrolname='timeout']
${selector_module_create_form_debug_chkbx}                          xpath=//mat-checkbox[@formcontrolname='debug']

${selector_module_create_form_port_header}                          xpath=//th[contains(text(), 'Port')]
${selector_module_create_form_add_btn}                              xpath=//div[@class='bottom_buttons']//button[contains(@class, 'aut_btn') and span[text()='Add']]
${selector_devices_module_remove_btn}                               xpath=//button[mat-icon[contains(@data-mat-icon-name, 'remove-icon')] and span[text()='Remove']]

${selector_devices_module_addnew_btn}                               xpath=//button[@class='btn']//span[text()='Add new']

${selector_devices_module_find_modules_btn}                         xpath=//button[@class='btn ng-star-inserted']/mat-icon[@svgicon='icon-search']

${selector_devices_module_find_modules_form}                        xpath=//div[contains(@class, 'dialog_title') and text()='Searching modules']

${selector_devices_module_no_modules_form}                          xpath=//div[contains(@class, 'no-points-text') and text()='No modules created']
${selector_devices_module_connections_btn}                          xpath=//button[contains(@class, 'btn') and .//mat-icon[@svgicon='connections-icon']]
${selector_devices_module_connections_form}                         xpath=//div[contains(@class, 'dialog_toolbar')]/span[text()='Module details']
${selector_device_module_connections_print_btn}                     xpath=//button[contains(@class, 'aut_btn') and contains(@class, 'active')]/span[text()='Print']
${selector_device_module_connections_cancel_btn}                    xpath=//button[@class='aut_btn_cancel']/span[text()='Cancel']
${selector_device_module_connections_close_icon}                    xpath=//mat-icon[@class='mat-icon notranslate close_icon mat-icon-no-color' and @svgicon='icon-delete-x']

${selector_device_module_clear_errors_icon}                         xpath=//button[@class='btn']/mat-icon[@class='mat-icon notranslate mat-icon-no-color' and @svgicon='icon-delete-x']

${selector_device_module_sw_update_icon}                            xpath=//div[@class='ng-star-inserted']/mat-icon[@class='mat-icon notranslate update-icon mat-icon-no-color' and @svgicon='module-upgrade']
${selector_device_module_sw_update_form}                            xpath=//div[@class='dialog_header']/div[@class='dialog_title' and text()='Choose version']/following-sibling::mat-icon[@class='mat-icon notranslate close_icon mat-icon-no-color' and @svgicon='icon-delete-x']
${selector_device_module_sw_update_version_cell}                    xpath=//div[@class='list_item_content'][contains(., '2.81')]/div[@_ngcontent-oxi-c285='']
${selector_device_module_sw_update_version_choose_btn}              xpath=//button[@class='mat-focus-indicator form_btn_save mat-flat-button mat-button-base active']/span[text()=' Choose ']
${selector_device_module_sw_update_version_cancel_btn}              xpath=//button[@class='mat-focus-indicator form_btn_cancel mat-stroked-button mat-button-base']/span[text()='Cancel']
${selector_device_module_sw_update_version_close_icon}              xpath=//mat-icon[@svgicon='icon-delete-x' and @class='mat-icon notranslate close_icon mat-icon-no-color']
${selector_device_module_program_btn}                               xpath=//button[@class='btn ng-star-inserted']//mat-icon[@svgicon='install-icon']
${selector_device_module_sw_update_ready_icon}                      xpath=//mat-icon[@class='mat-icon notranslate new-version-icon mat-icon-no-color' and @svgicon='icon-arrow-right']

${selector_device_module_program_form}                              xpath=//div[@class='dialog_header']/div[@class='dialog_title' and text()='Program modules']
${selector_device_module_program_chkbx}                             xpath=//tr[.//td[text()='3'] and .//td[text()='7']]//mat-checkbox[@class='mat-checkbox']
${selector_device_module_program_program_btn}                       xpath=//button[@class='form_btn_save active ng-star-inserted' and text()='Program']
${selector_device_module_program_cancel_btn}                        xpath=//button[@class='form_btn_cancel']
${selector_device_module_program_progress_bar}                      xpath=//div[@class='mat-progress-bar-buffer']
${selector_device_module_program_ready_bar}                         xpath=//div[@class='status_detail' and text()='Ready']

${selector_device_module_details_icon}                              xpath=//button[@mat-icon-button='' and @class='mat-focus-indicator mat-icon-button mat-button-base']//mat-icon[@svgicon='icon-automation-device' and @class='mat-icon notranslate actions-icon mat-icon-no-color']
${selector_device_module_details_form}                              xpath=//div[@class='custom-dialog-container']//div[@class='dialog_toolbar']//span[text()='Module details']
${selector_device_module_details_print_btn}                         xpath=//button[@class='aut_btn active ng-star-inserted']/span[text()='Print']
${selector_device_module_details_cancel_btn}                        xpath=//button[@class='aut_btn_cancel']/span[text()='Cancel']
${selector_device_module_details_close_icon}                        xpath=//mat-icon[@class='mat-icon notranslate close_icon mat-icon-no-color' and @svgicon='icon-delete-x']

### Modbus

${selector_device_modbus_addnew_icon}                               xpath=//button[@class='btn']/mat-icon[@svgicon='icon-add']
${selector_device_modbus_remove_icon}                               xpath=//button[contains(@class, 'btn') and .//mat-icon[@svgicon='remove-icon']]
${selector_device_modbus_create_form}                               xpath=//mat-toolbar[contains(., 'Create new modbus')]
${selector_device_modbus_create_form_port_ddwn}                     xpath=//mat-select[@formcontrolname='port']
${selector_device_modbus_create_form_address_input}                 xpath=//input[@type='number' and @formcontrolname='address']
${selector_device_modbus_create_form_busAddress_input}              xpath=//input[@type='number' and @formcontrolname='busAddress']
${selector_device_modbus_create_form_registerType_ddwn}             xpath=//mat-select[@formcontrolname='registerType']
${selector_device_modbus_create_form_startRegister_input}           xpath=//input[@formcontrolname='startRegister']
${selector_device_modbus_create_form_registerCount_input}           xpath=//input[@formcontrolname='registerCount']
${selector_device_modbus_create_form_debug_chkbx}                   xpath=//mat-checkbox[@formcontrolname='debug']
${selector_device_modbus_create_form_tcpIpModule_chkbx}             xpath=//mat-checkbox[@formcontrolname='tcpIpModule']
${selector_device_modbus_create_form_sendOnly_chkbx}                xpath=//mat-checkbox[@formcontrolname='sendOnly']
${selector_device_modbus_create_form_ipPort_input}                  xpath=//input[@formcontrolname='ipPort']
${selector_device_modbus_create_form_ipAddress_input}               xpath=//input[@formcontrolname='ipAddress']
${selector_device_modbus_create_form_timeout_input}                 xpath=//input[@formcontrolname='timeout']

${selector_device_modbus_create_form_add_btn}                       xpath=//button[@class='aut_btn active ng-star-inserted']
${selector_device_modbus_create_form_cancel_btn}                    xpath=//button[@class='aut_btn_cancel']
${selector_device_modbus_create_form_close_btn}                     xpath=//mat-icon[@class='mat-icon notranslate close_icon mat-icon-no-color']

${selector_device_modbus_clear_errors_btn}                          xpath=//button[@class='btn']/mat-icon[@class='mat-icon notranslate mat-icon-no-color' and @svgicon='icon-delete-x']
${selector_device_modbus_edit_btn}                                  xpath=//button[@class='btn']/mat-icon[@class='mat-icon notranslate mat-icon-no-color' and @svgicon='icon-automation-edit']

### Freeze protect

${selector_device_freeze_addnew_icon}                               xpath=//button[@class='btn ng-star-inserted']//mat-icon[@svgicon='icon-add']
${selector_device_freeze_create_form}                               xpath=//span[text()='Create new point']

${selector_device_freeze_pointname_header}                          xpath=//th[@class='col-xl' and text()='Pointname']
${selector_device_freeze_remove_btn}                                xpath=//button[@class='btn']//mat-icon[@svgicon='remove-icon']

${selector_device_freeze_delete_form}                               xpath=//div[@class='dialog_title' and text()='Delete point']
${selector_device_freeze_delete_btn}                                xpath=//button[@class='form_btn_save active' and text()='Delete']

${selector_device_freeze_create_form_pointid_input}                 xpath=//input[@name='pointId']
${selector_device_freeze_create_form_description_input}             xpath=//input[@name='pointDescription']
${selector_device_freeze_create_form_port_input}                    xpath=//input[@type='number' and @name='port']

${selector_device_freeze_create_form_module_input}                  xpath=//input[@type='number' and @name='modNumber']
${selector_device_freeze_create_form_moduledetails_icon}            xpath=//span[@class='link_icon']

${selector_device_freeze_create_form_moduledetails_form}            xpath=//span[text()='Module details']
${selector_device_freeze_create_form_moduledetails_cancel_btn}      xpath=//button[@class='aut_btn_cancel']//span[@class='icon_text']
${selector_device_freeze_create_form_moduledetails_choose_btn}      xpath=//button[@class='aut_btn active disabled ng-star-inserted']
${selector_device_freeze_create_form_moduledetails_close_icon}      xpath=//mat-icon[@svgicon='icon-delete-x']

${selector_device_freeze_create_form_point_input}                   xpath=//input[@type='number' and @name='modPoint']
${selector_device_freeze_create_form_setvalue_input}                xpath=//input[@type='number' and @name='setting']
${selector_device_freeze_create_form_PBand_input}                   xpath=//input[@type='number' and @name='PBand']
${selector_device_freeze_create_form_alarmLimit_input}              xpath=//input[@type='number' and @name='alarmLimit']
${selector_device_freeze_create_form_freezeReturnWaterAI_input}     xpath=//input[@type='text' and @name='freezeReturnWaterAI']
${selector_device_freeze_create_form_freezeFanDO_input}             xpath=//input[@type='text' and @name='freezeFanDO']
${selector_device_freeze_create_form_freezeValveAO_input}           xpath=//input[@type='text' and @name='freezeValveAO']
${selector_device_freeze_create_form_freezeAlarmDO_input}           xpath=//input[@type='text' and @name='freezeAlarmDO']
${selector_device_freeze_create_form_freezeFanDO_input}             xpath=//input[@type='text' and @name='freezeFanDO']
${selector_device_freeze_create_form_freezeWarningAlarm_input}      xpath=//input[@type='text' and @name='freezeWarningAlarm']
${selector_device_freeze_create_form_freezeAck_input}               xpath=//input[@type='text' and @name='freezeAck']
${selector_device_freeze_create_form_ackByButton_chkbx}             xpath=//mat-checkbox[@name='ackByButton']

${selector_device_freeze_create_form_add_btn}                       xpath=//button[@class='aut_btn ng-star-inserted active']
${selector_device_freeze_create_form_cancel_btn}                    xpath=//button[@class='aut_btn_cancel']

### Calendar
${selector_calendar_header}                                         xpath=//div[@class='automation-toolbar-header' and span[text()='Calendar']]
${selector_calendar_event_form_close_icon}                          xpath=//mat-icon[@svgicon='icon-delete-x']

${selector_calendar_events_btn}                                     xpath=//button[@title='Events' and contains(@class, 'fc-eventCustomButton-button')]
${selector_calendar_today_btn}                                      xpath=//button[@title='This month' and @class='fc-today-button']
${selector_calendar_previous_btn}                                   xpath=//button[@title='Previous month' and contains(@class, 'fc-prev-button')]
${selector_calendar_next_btn}                                       xpath=//button[@title='Next month' and contains(@class, 'fc-next-button')]

${selector_calendar_today_cell}                                     xpath=//td[contains(@class, 'fc-day-today')]

${selector_calendar_event_form_event_detail_header}                 xpath=//div[@class='point_info_class']//div[@class='point_info_title' and text()=' Event detail ']

${selector_calendar_event_form}                                     xpath=//div[@class='toolbar_title' and text()='Calendar event']
${selector_calendar_event_form_add_event_btn}                       xpath=//div[@class='buttons']//button[text()=' Add event ']
${selector_calendar_event_form_add_btn}                             xpath=//div[@class='buttons']//button[@class='btn ng-star-inserted' and text()=' Add ']
${selector_calendar_event_form_description_input}                   xpath=//input[@id='comment']
${selector_calendar_event_form_timetable_btn}                       xpath=//div[@class='event_detail_type']//span[@class='wizard_list_item' and text()='Target timetable']
${selector_calendar_event_form_weekday_btn}                         xpath=//div[@class='event_detail_type']//span[@class='wizard_list_item' and text()='Weekday']

${selector_calendar_event_form_timetable_ddwn}                      xpath=//mat-select[@name='timeTableId']

${selector_calendar_event_form_events_time_1_input}                 xpath=//input[@name='time1' and @type='time']
${selector_calendar_event_form_events_value_1_input}                xpath=//input[@name='value1' and @type='number']
${selector_calendar_event_form_events_time_2_input}                 xpath=//input[@name='time2' and @type='time']
${selector_calendar_event_form_events_value_2_input}                xpath=//input[@name='value2' and @type='number']
${selector_calendar_event_form_events_time_3_input}                 xpath=//input[@name='time3' and @type='time']
${selector_calendar_event_form_events_value_3_input}                xpath=//input[@name='value3' and @type='number']
${selector_calendar_event_form_events_time_4_input}                 xpath=//input[@name='time4' and @type='time']
${selector_calendar_event_form_events_value_4_input}                xpath=//input[@name='value4' and @type='number']
${selector_calendar_event_form_events_time_5_input}                 xpath=//input[@name='time5' and @type='time']
${selector_calendar_event_form_events_value_5_input}                xpath=//input[@name='value5' and @type='number']
${selector_calendar_event_form_events_time_6_input}                 xpath=//input[@name='time6' and @type='time']
${selector_calendar_event_form_events_value_6_input}                xpath=//input[@name='value6' and @type='number']

${selector_calendar_event_form_validity_ddwn}                       xpath=//mat-select[@name='mode']
${selector_calendar_event_form_date_day_ddwn}                       xpath=//mat-select[@name='day']
${selector_calendar_event_form_date_month_ddwn}                     xpath=//mat-select[@name='month']
${selector_calendar_event_form_date_year_ddwn}                      xpath=//mat-select[@name='year']
${selector_calendar_event_form_date_calendar_btn}                   xpath=//button[@aria-label='Open calendar']

${selector_calendar_event_form_date_calendar_today_btn}             xpath=//button[@aria-label='December 23, 2023']

${selector_calendar_event_form_date_calendar_next_btn}              xpath=//button[@aria-label='Next month']
${selector_calendar_event_form_date_calendar_prev_btn}              xpath=//button[@aria-label='Previous month']
${selector_calendar_event_form_date_calendar_select_ddwn}           xpath=//button[@aria-label='Choose month and year']
${selector_calendar_event_form_date_calendar_year_ddwn}             xpath=//button[contains(@class, 'mat-calendar-period-button')]

${selector_calendar_event_form_date_calendar_2024_btn}              xpath=//button[contains(@class, 'mat-calendar-body-cell') and contains(@aria-label, '2024')]
${selector_calendar_event_form_date_calendar_2024_june_btn}         xpath=//button[contains(@class, 'mat-calendar-body-cell') and contains(@aria-label, 'June 2024')]
${selector_calendar_event_form_date_calendar_2024_june_15_btn}      xpath=//button[contains(@class, 'mat-calendar-body-cell') and contains(@aria-label, 'June 15, 2024')]

${selector_calendar_event_form_monday_radio}                        xpath=//span[@class='mat-radio-label-content' and contains(text(), 'Monday')]
${selector_calendar_event_form_tuesday_radio}                       xpath=//span[@class='mat-radio-label-content' and contains(text(), 'Tuesday')]
${selector_calendar_event_form_wednesday_radio}                     xpath=//span[@class='mat-radio-label-content' and contains(text(), 'Wednesday')]
${selector_calendar_event_form_thursday_radio}                      xpath=//span[@class='mat-radio-label-content' and contains(text(), 'Thusrday')]
${selector_calendar_event_form_friday_radio}                        xpath=//span[@class='mat-radio-label-content' and contains(text(), 'Friday')]
${selector_calendar_event_form_saturday_radio}                      xpath=//span[@class='mat-radio-label-content' and contains(text(), 'Saturday')]
${selector_calendar_event_form_sunday_radio}                        xpath=//span[@class='mat-radio-label-content' and contains(text(), 'Sunday')]
${selector_calendar_event_form_e1_radio}                            xpath=//span[@class='mat-radio-label-content' and contains(text(), 'E1')]
${selector_calendar_event_form_e2_radio}                            xpath=//span[@class='mat-radio-label-content' and contains(text(), 'E2')]
${selector_calendar_event_form_e3_radio}                            xpath=//span[@class='mat-radio-label-content' and contains(text(), 'E3')]

${selector_calendar_event_form_back_btn}                            xpath=//button[contains(text(), 'Back to list')]
${selector_calendar_event_form_cancel_btn}                          xpath=//button[contains(text(), 'Cancel')]
${selector_calendar_event_form_add_btn}                             xpath=//button[contains(text(), 'Add')]

${selector_calendar_event_form_start_day_ddwn}                      xpath=//mat-select[@name='day']
${selector_calendar_event_form_start_month_ddwn}                    xpath=//mat-select[@name='month']
${selector_calendar_event_form_start_year_ddwn}                     xpath=//mat-select[@name='year']
${selector_calendar_event_form_start_include_chkbx}                 xpath=//mat-checkbox[@name='always']

${selector_calendar_event_form_stop_day_ddwn}                       xpath=//mat-select[@name='endDay']
${selector_calendar_event_form_stop_month_ddwn}                     xpath=//mat-select[@name='endMonth']
${selector_calendar_event_form_stop_year_ddwn}                      xpath=//mat-select[@name='endYear']

${selector_calendar_event_form_repeat_month_ddwn}                   xpath=//mat-select[@name='month' and contains(@class, 'day_select')]
${selector_calendar_event_form_repeat_days_month_ddwn}              xpath=//mat-select[@name='days' and contains(@class, 'month_select')]
${selector_calendar_event_form_repeat_day_week_ddwn}                xpath=//mat-select[@name='weekDay' and contains(@class, 'year_select')]

${selector_calendar_event_form_remove_btn}                          xpath=//button[@class='btn ng-star-inserted' and text()='Remove']
