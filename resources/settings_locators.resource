*** Settings ***
Library     Browser
Resource    navigate.resource
Resource    login.resource


*** Variables ***
${selector_settings_device_header}                                              xpath=//div[@class='header' and text()='Device settings']
${selector_settings_clock_header}                                               xpath=//div[@class='header' and text()='Clock settings']
${selector_settings_system_header}                                              xpath=//div[@class='header' and text()='SYSTEM']
${selector_settings_activations_header}                                         xpath=//div[@class='header' and text()='Activations']
${selector_settings_network_header}                                             xpath=//div[@class='header' and text()='Network settings']
${selector_settings_gsm_header}                                                 xpath=//div[@class='header' and text()='GSM-Settings']
${selector_settings_port_header}                                                xpath=//div[@class='header' and text()='Port settings']
${selector_settings_firewall_header}                                            xpath=//div[@class='header' and text()='Firewall settings']
${selector_settings_synchronization_header}                                     xpath=//div[@class='header' and text()='Information synchronization']

${selector_settings_system_btn}                                                 xpath=//div[@class='menu_item ng-star-inserted']/div[@class='ng-star-inserted' and text()='System settings']
${selector_settings_network_btn}                                                xpath=//div[@class='menu_item ng-star-inserted']/div[@class='ng-star-inserted' and text()='Network settings']
${selector_settings_user_btn}                                                   xpath=//div[@class='menu_item ng-star-inserted']/div[@class='ng-star-inserted' and text()='User settings']
${selector_settings_dashboard_btn}                                              xpath=//div[@class='menu_item ng-star-inserted']/div[@class='ng-star-inserted' and text()='Dashboard']

### SYSTEM
${selector_settings_system_device_item}                                         xpath=//div[contains(@class, 'item_title') and text()=' Device settings ']
${selector_settings_system_device_header}                                       xpath=//div[@class='settings_toolbar_title']//div[text()=' Device settings ']
${selector_settings_system_status_item}                                         xpath=//div[contains(@class, 'item_title') and text()=' System status ']
${selector_settings_system_status_header}                                       xpath=//div[@class='settings_toolbar_title']//span[text()=' System status ']
${selector_settings_system_event_item}                                          xpath=//div[contains(@class, 'item')]//div[contains(@class, 'item_title') and contains(text(), 'Event log settings')]
${selector_settings_system_event_header}                                        xpath=//div[@class='settings_toolbar_title']//span[text()=' Event log settings ']
${selector_settings_system_clock_item}                                          xpath=//div[contains(@class, 'item')]//div[contains(@class, 'item_title') and contains(text(), 'Clock settings')]
${selector_settings_system_clock_header}                                        xpath=//div[@class='settings_toolbar_title']//span[text()=' Clock settings ']
${selector_settings_system_activations_item}                                    xpath=//div[contains(@class, 'item')]/div[contains(@class, 'item_title') and contains(text(), 'Activations')]
${selector_settings_system_activation_header}                                   xpath=//div[@class='settings_toolbar_title']//span[contains(text(), 'Activations')]
${selector_settings_system_sms_item}                                            xpath=//div[contains(@class, 'item')]/div[contains(@class, 'item_title') and contains(text(), 'SMS settings')]
${selector_settings_system_sms_header}                                          xpath=//div[@class='settings_toolbar_title']//span[text()=' SMS settings ']
${selector_settings_system_synchronization_item}                                xpath=//div[contains(@class, 'item')]/div[contains(@class, 'item_title') and contains(text(), 'Information synchronization')]
${selector_settings_system_synchronization_header}                              xpath=//div[@class='settings_toolbar_title']//span[text()=' Information synchronization ']
${selector_settings_system_weather_item}                                        xpath=//div[contains(@class, '_ngcontent-wjg-c') and contains(@class, 'item_title') and contains(text(), ' Weather Forecast ')]
${selector_settings_system_backup_btn}                                          xpath=//div[contains(@class, 'backup_button_container')]//button
${selector_settings_system_backup_form_header}                                  xpath=//div[@class='dialog_header']//div[@class='dialog_title' and text()='Backup']
${selector_settings_system_backup_form_start_btn}                               xpath=//button[contains(@class, '_ngcontent-wjg-c') and contains(@class, 'form_btn_save') and contains(@class, 'active') and contains(text(), 'Start')]
${selector_settings_system_backup_form_cancel_btn}                              xpath=//button[contains(@class, 'form_btn_cancel') and @type='button']
${selector_settings_system_backup_form_close_btn}                               xpath=//mat-icon[contains(@class, 'close_icon') and contains(@class, 'icon-delete-x')]

${selector_settings_system_device_stationName_input}                            xpath=//input[@formcontrolname='stationName']
${selector_settings_system_device_sessionTimeout_input}                         xpath=//input[@type='number' and @formcontrolname='sessionTimeout']
${selector_settings_system_device_webVisionAuthKey_input}                       xpath=//input[@formcontrolname='webVisionAuthKey']
${selector_settings_system_device_save_active_btn}                              xpath=//button[@class='form_btn_save active']
${selector_settings_system_device_save_passive_btn}                             xpath=//button[@class='form_btn_save']
${selector_settings_system_device_cancel_btn}                                   xpath=//button[@class='form_btn_cancel']

${selector_settings_system_status_reboot_execute_btn}                           xpath=//button[@class='settings_action_btn']
${selector_settings_system_status_information_text}                             xpath=//div[@class='form_title ng-star-inserted' and text()='System information']
${selector_settings_system_status_reboot_form}                                  xpath=//div[@class='dialog_title' and text()='Reboot device']
${selector_settings_system_status_reboot_form_reboot_btn}                       xpath=//button[@class='form_btn_save active' and text()=' Reboot ']
${selector_settings_system_status_reboot_form_cancel_btn}                       xpath=//button[@class='form_btn_cancel' and @type='button' and text()=' Cancel ']

${selector_settings_system_event_log_save_active_btn}                           xpath=//button[contains(@class, 'form_btn_save') and contains(@class, 'active')]
${selector_settings_system_event_log_save_passive_btn}                          xpath=//button[@class='form_btn_save']
${selector_settings_system_event_log_cancel_btn}                                xpath=//button[@class='form_btn_cancel']
${selector_settings_system_event_log_event_max_input}                           xpath=//div[@class='form_item' and span[@class='form_item_description' and text()='Max size of file:']]//input[@formcontrolname='maxSize']
${selector_settings_system_event_log_pointUpdates_chkbx}                        xpath=//mat-checkbox[@formcontrolname='pointUpdates']
${selector_settings_system_event_log_calendar_chkbx}                            xpath=//mat-checkbox[@formcontrolname='calender']
${selector_settings_system_event_log_timeSchedules_chkbx}                       xpath=//mat-checkbox[@formcontrolname='timeSchedules']
${selector_settings_system_event_log_settings_chkbx}                            xpath=//mat-checkbox[@formcontrolname='settings']
${selector_settings_system_event_log_logins_chkbx}                              xpath=//mat-checkbox[@formcontrolname='logins']
${selector_settings_system_event_log_userInterface_chkbx}                       xpath=//mat-checkbox[@formcontrolname='userInterface']

${selector_settings_system_clock_extServer_input}                               xpath=//input[@formcontrolname='address']
${selector_settings_system_clock_useGsmTime_chkbx}                              xpath=//mat-checkbox[@formcontrolname='useGsmTime']
${selector_settings_system_clock_FXtimeServer_chkbx}                            xpath=//mat-checkbox[@formcontrolname='enable']
${selector_settings_system_clock_automaticSummerTime_chkbx}                     xpath=//mat-checkbox[@formcontrolname='automaticSummerTime']
${selector_settings_system_clock_timeZone_ddwn}                                 xpath=//select[@formcontrolname='timeZone']
${selector_settings_system_clock_latitudeDegrees_input}                         xpath=//input[@formcontrolname='latitudeDegrees']
${selector_settings_system_clock_latitudeMinutes_input}                         xpath=//input[@formcontrolname='latitudeMinutes']
${selector_settings_system_clock_latitudeDirection_ddwn}                        xpath=//select[@formcontrolname='latitudeDirection']
${selector_settings_system_clock_longitudeDegrees_input}                        xpath=//input[@formcontrolname='longitudeDegrees']
${selector_settings_system_clock_longitudeMinutes_input}                        xpath=//input[@formcontrolname='longitudeMinutes']
${selector_settings_system_clock_longitudeDirection_ddwn}                       xpath=//select[@formcontrolname='longitudeDirection']
${selector_settings_system_clock_currentTime_input}                             xpath=//input[@formcontrolname='currentTime']
${selector_settings_system_clock_currentDate_input}                             xpath=//input[@formcontrolname='currentDate']
${selector_settings_system_clock_save_active_btn}                               xpath=//button[contains(@class, 'form_btn_save') and contains(@class, 'active')]
${selector_settings_system_clock_save_passive_btn}                              xpath=//button[contains(@class, 'form_btn_save') and not(contains(@class, 'active'))]
${selector_settings_system_clock_cancel_btn}                                    xpath=//button[contains(@class, 'form_btn_cancel')]

# Elements have same ids. Waiting for fixing by GUI team.

${selector_settings_system_sms_header_input}                                    xpath=//input[@formcontrolname='header']
${selector_settings_system_sms_send_web_chkbx}                                  xpath=//div[@class='form_item']//mat-checkbox[@formcontrolname='enabled']
${selector_settings_system_sms_server1_input}                                   xpath=//input[@formcontrolname='server1']
${selector_settings_system_sms_server2_input}                                   xpath=//input[@formcontrolname='server2']
${selector_settings_system_sms_server3_input}                                   xpath=//input[@formcontrolname='server3']
${selector_settings_system_sms_server4_input}                                   xpath=//input[@formcontrolname='server4']
${selector_settings_system_sms_activationId_input}                              xpath=//input[@formcontrolname='activationId']
${selector_settings_system_sms_validityTime_ddwn}                               xpath=//select[@formcontrolname='validityTime']
${selector_settings_system_sms_debug_chkbx}                                     xpath=//div[@class='form_item']//mat-checkbox[@formcontrolname='debugGSMModem']
${selector_settings_system_sms_save_active_btn}                                 xpath=//button[@type='submit' and contains(@class, 'form_btn_save') and contains(@class, 'active')]
${selector_settings_system_sms_save_passive_btn}                                xpath=//button[@type='submit' and contains(@class, 'form_btn_save')]
${selector_settings_system_sms_cancel_btn}                                      xpath=//button[contains(@class, 'form_btn_cancel')]

${selector_settings_system_synchronization_calendar_chkbx}                      xpath=//mat-checkbox[@formcontrolname='calendar']
${selector_settings_system_synchronization_denyWebvisionCalendar_chkbx}         xpath=//mat-checkbox[@formcontrolname='denyWebvisionCalendar']
${selector_settings_system_synchronization_statetexts_chkbx}                    xpath=//mat-checkbox[@formcontrolname='statetexts']
${selector_settings_system_synchronization_timetables_chkbx}                    xpath=//mat-checkbox[@formcontrolname='timetables']
${selector_settings_system_synchronization_userrights_chkbx}                    xpath=//mat-checkbox[@formcontrolname='userrights']
${selector_settings_system_synchronization_alarmgroups_chkbx}                   xpath=//mat-checkbox[@formcontrolname='alarmgroups']
${selector_settings_system_synchronization_save_active_btn}                     xpath=//button[@class='form_btn_save active' and @type='submit']
${selector_settings_system_synchronization_save_passive_btn}                    xpath=//button[@type='submit' and contains(@class, 'form_btn_save')]
${selector_settings_system_synchronization_cancel_btn}                          xpath=//button[contains(@class, 'form_btn_cancel')]

### SYSTEM

### NETWORK
${selector_settings_network_ip_item}                                            xpath=//div[contains(@class, 'item_title') and text()=' IP-Settings ']
${selector_settings_network_ip_header}                                          xpath=//span[@aria-label='Settings' and contains(text(), 'IP-address settings')]

# ${selector_settings_network_ip_internet_LAN_btn}    xpath=//div[contains(@class, 'select_item') and text()=' LAN ']
# ${selector_settings_network_ip_internet_WWAN_btn}    xpath=//div[contains(@class, 'select_item') and text()=' WWAN ']
# ${selector_settings_network_ip_internet_WAN_btn}    xpath=//div[contains(@class, 'select_item') and text()=' WAN ']
# ${selector_settings_network_ip_DHCP_chkbx}    xpath=//div[@class='form_item'][span[text()='DHCP in use:']]//mat-checkbox[@formcontrolname='enable']
# ${selector_settings_network_ip_WAN_ip_input}    xpath=//input[@formcontrolname='ip']
# ${selector_settings_network_ip_WAN_mask_input}    xpath=//div[@formgroupname='wan']//div[@class='form_item'][span[text()='Mask : ']]//input[@formcontrolname='mask']
# ${selector_settings_network_ip_WAN_gateway_input}    xpath=//div[@formgroupname='wan']//div[@class='form_item'][span[text()='Gateway:']]//input[@formcontrolname='gateway']
# ${selector_settings_network_ip_WAN_dns_input}    xpath=//div[@formgroupname='wan']//div[@class='form_item'][span[text()='DNS : ']]//input[@formcontrolname='dns']
# ${selector_settings_network_ip_LAN_ip_input}    xpath=//div[@formgroupname='lan']//div[@class='form_item'][span[text()='IP-Address:']]//input[@formcontrolname='ip']
# ${selector_settings_network_ip_LAN_mask_input}    xpath=//div[@formgroupname='lan']//div[@class='form_item'][span[text()='Gateway:']]//input[@formcontrolname='gateway']
# ${selector_settings_network_ip_LAN_gateway_input}    xpath=//div[@formgroupname='lan']//div[@class='form_item'][span[text()='Mask : ']]//input[@formcontrolname='mask']
# ${selector_settings_network_ip_LAN_dns_input}    xpath=//div[@formgroupname='lan']//div[@class='form_item'][span[text()='MAC address:']]//input[@formcontrolname='mac']
# ${selector_settings_network_ip_WLAN_enabled_chkbx}    xpath=//div[@class='form_item'][span[text()='WiFi in use:']]//mat-checkbox[@formcontrolname='enable']
# ${selector_settings_network_ip_WLAN_ip_input}    xpath=//div[@formgroupname='wlan']//div[@class='form_item'][span[text()='IP-Address:']]//input[@formcontrolname='ip']
# ${selector_settings_network_ip_WLAN_mask_input}    xpath=//div[@formgroupname='wlan']//div[@class='form_item'][span[text()='Mask : ']]//input[@formcontrolname='mask']
# ${selector_settings_network_ip_WLAN_networkName_input}    xpath=//div[@formgroupname='wlan']//div[@class='form_item'][span[text()='Network name:']]//input[@formcontrolname='networkName']
# ${selector_settings_network_ip_WLAN_networkKey_input}    xpath=//div[@formgroupname='wlan']//div[@class='form_item'][span[text()='Password :']]//input[@formcontrolname='networkKey']
# ${selector_settings_network_ip_WLAN_MAC_input}    xpath=//div[@formgroupname='wlan']//div[@class='form_item'][span[text()='MAC address:']]//input[@formcontrolname='mac']
# ${selector_settings_network_ip_WWAN_4G_btn}    xpath=//div[@class="select_item" and text()=" 4g "]
# ${selector_settings_network_ip_WWAN_3G_btn}    xpath=//div[@class="select_item" and text()=" 3g "]
# ${selector_settings_network_ip_WWAN_disabled_btn}    xpath=//div[@class="select_item" and text()=" disabled "]
# ${selector_settings_network_ip_WWAN_auto_btn}    xpath=//div[@class="select_item" and text()=" Auto "]
# ${selector_settings_network_ip_WWAN_APN_input}    xpath=//input[@id and contains(@id, 'mat-input') and @formcontrolname="apn"]
# ${selector_settings_network_ip_WWAN_PIN_input}    xpath=//input[@id and contains(@id, 'mat-input') and @formcontrolname="pin"]
# ${selector_settings_network_ip_WWAN_healtCheckIp_input}    xpath=//input[@id and contains(@id, 'mat-input') and @formcontrolname="healtCheckIp"]
# ${selector_settings_network_ip_WWAN_ip_input}    xpath=//div[@formgroupname="wwan"]//input[@id and contains(@id, 'mat-input') and @formcontrolname="ip"]
# ${selector_settings_network_ip_remote_ip_input}    xpath=//div[@formgroupname="remoteServer"]//input[@id and contains(@id, 'mat-input') and @formcontrolname="ip"]
# ${selector_settings_network_ip_remote_routertype_input}    xpath=//input[@formcontrolname="routerType" and @disabled and contains(@id, 'mat-input')]
# ${selector_settings_network_ip_domain_chkbx}    xpath=//mat-checkbox[@formcontrolname="domainLoginInUse" and contains(@id, 'checkbox')]
# ${selector_settings_network_ip_domain_proxyIP_input}    xpath=//input[@formcontrolname="proxyIP"]
# ${selector_settings_network_ip_domain_serverIP_input}    xpath=//input[@formcontrolname="serverIP"]
# ${selector_settings_network_ip_domain_domainName_input}    xpath=//input[@formcontrolname="domainName"]
# ${selector_settings_network_ip_domain_userName_input}    xpath=//input[@formcontrolname="userName"]
# ${selector_settings_network_ip_domain_password_input}    xpath=//input[@formcontrolname="password"]
${selector_settings_network_ip_save_active_btn}                                 xpath=//button[@type='submit' and contains(@class, 'form_btn_save')]
${selector_settings_network_ip_save_passive_btn}                                xpath=//button[@class="form_btn_save"]
${selector_settings_network_ip_cancel_btn}                                      xpath=//button[contains(@class, 'form_btn_cancel')]

### NETWORK

### PORT
${selector_settings_network_port_item}                                          xpath=//div[contains(@class, 'item_title') and text()=' Port settings ']
${selector_settings_network_port_header}                                        xpath=//span[@aria-label='Settings' and contains(text(), ' Port settings ')]
${selector_settings_network_port_1_speed_ddwn}                                  xpath=//tr[@formgroupname='1']//mat-select[@name='portSpeed']

${selector_settings_network_port_3_type_ddwn}                                   xpath=//tr[@formgroupname='3']//mat-select[@name='portType']
${selector_settings_network_port_3_data_ddwn}                                   xpath=//tr[@formgroupname='3']//mat-select[@name='portDataType']
${selector_settings_network_port_3_speed_ddwn}                                  xpath=//tr[@formgroupname='3']//mat-select[@name='portSpeed']
${selector_settings_network_port_3_delay_input}                                 xpath=//tr[@formgroupname='3']//input[@formcontrolname='sendDelay']
${selector_settings_network_port_3_address_input}                               xpath=//tr[@formgroupname='3']//input[@formcontrolname='address']

${selector_settings_network_port_4_type_ddwn}                                   xpath=//tr[@formgroupname='4']//mat-select[@name='portType']
${selector_settings_network_port_4_data_ddwn}                                   xpath=//tr[@formgroupname='4']//mat-select[@name='portDataType']
${selector_settings_network_port_4_speed_ddwn}                                  xpath=//tr[@formgroupname='4']//mat-select[@name='portSpeed']
${selector_settings_network_port_4_delay_input}                                 xpath=//tr[@formgroupname='4']//input[@formcontrolname='sendDelay']
${selector_settings_network_port_4_address_input}                               xpath=//tr[@formgroupname='4']//input[@formcontrolname='address']

${selector_settings_network_port_5_type_ddwn}                                   xpath=//tr[@formgroupname='5']//mat-select[@name='portType']
${selector_settings_network_port_5_data_ddwn}                                   xpath=//tr[@formgroupname='5']//mat-select[@name='portDataType']
${selector_settings_network_port_5_speed_ddwn}                                  xpath=//tr[@formgroupname='5']//mat-select[@name='portSpeed']
${selector_settings_network_port_5_delay_input}                                 xpath=//tr[@formgroupname='5']//input[@formcontrolname='sendDelay']
${selector_settings_network_port_5_address_input}                               xpath=//tr[@formgroupname='5']//input[@formcontrolname='address']

${selector_settings_network_port_6_type_ddwn}                                   xpath=//tr[@formgroupname='6']//mat-select[@name='portType']
${selector_settings_network_port_6_delay_input}                                 xpath=//tr[@formgroupname='6']//input[@formcontrolname='sendDelay']

${selector_settings_network_port_7_type_ddwn}                                   xpath=//tr[@formgroupname='7']//mat-select[@name='portType']
${selector_settings_network_port_7_delay_input}                                 xpath=//tr[@formgroupname='7']//input[@formcontrolname='sendDelay']

${selector_settings_network_port_8_type_ddwn}                                   xpath=//tr[@formgroupname='8']//mat-select[@name='portType']
${selector_settings_network_port_8_delay_input}                                 xpath=//tr[@formgroupname='8']//input[@formcontrolname='sendDelay']

${selector_settings_network_port_9_type_ddwn}                                   xpath=//tr[@formgroupname='9']//mat-select[@name='portType']
${selector_settings_network_port_9_delay_input}                                 xpath=//tr[@formgroupname='9']//input[@formcontrolname='sendDelay']

${selector_settings_network_port_10_type_ddwn}                                  xpath=//tr[@formgroupname='10']//mat-select[@name='portType']
${selector_settings_network_port_10_delay_input}                                xpath=//tr[@formgroupname='10']//input[@formcontrolname='sendDelay']

${selector_settings_network_port_mbusSendDelay_input}                           xpath=//input[@formcontrolname='mbusSendDelay']
${selector_settings_network_port_move_from_ddwn}                                xpath=//div[@class='form_item'][span[@class='form_item_description' and text()=' Move from port: ']]//select[@class='form_input']

${selector_settings_network_port_first_input}                                   xpath=//div[@class='form_item'][span[@class='form_item_description' and text()=' First module ']]//input[@class='mat-input-element mat-form-field-autofill-control form_input cdk-text-field-autofill-monitored']
${selector_settings_network_port_last_input}                                    xpath=//div[@class='form_item'][span[@class='form_item_description' and text()=' Last module ']]//input[@class='mat-input-element mat-form-field-autofill-control form_input cdk-text-field-autofill-monitored']

${selector_settings_network_port_move_to_ddwn}                                  xpath=//div[@class='form_item'][span[@class='form_item_description' and text()=' Move to port: ']]//select[@class='form_input']

${selector_settings_network_port_save_inactive_btn}                             xpath=//button[@class='form_btn_save']
${selector_settings_network_port_save_active_btn}                               xpath=//button[@class='form_btn_save active']
${selector_settings_network_port_cancel_btn}                                    xpath=//button[@class='form_btn_cancel']

${selector_settings_network_firewall_item}                                      xpath=//div[contains(@class, 'item_title') and contains(text(), 'Firewall settings')]
${selector_settings_network_firewall_header}                                    xpath=//span[contains(@aria-label, 'Settings') and contains(text(), 'Firewall settings')]
${selector_settings_network_firewall_in_use_chkbx}                              xpath=//div[@class='form_item']//span[text()='Firewall in use :']/following-sibling::mat-checkbox//input[@type='checkbox']

${selector_settings_network_nat_rule1_source_select_ddwn}                       xpath=//select[@data-qa-id='settings-network-nat-rule1-source-select']
${selector_settings_network_nat_rule1_source_port_input}                        xpath=//input[@data-qa-id='settings-network-nat-rule1-source-port']
${selector_settings_network_nat_rule1_destination_address_input}                xpath=//input[@data-qa-id='settings-network-nat-rule1-destination-address']
${selector_settings_network_nat_rule1_destination_port_input}                   xpath=//input[@data-qa-id='settings-network-nat-rule1-destination-port']

${selector_settings_network_nat_rule1_firewall_private_address_checkbox}        xpath=//*[@data-qa-id='settings-network-nat-rule1-firewall-private-address']
${selector_settings_network_nat_rule1_firewall_address1_enable_checkbox}        xpath=//*[@data-qa-id='settings-network-nat-rule1-firewall-address1-enable']
${selector_settings_network_nat_rule1_firewall_address1_ip_input}               xpath=//input[@data-qa-id='settings-network-nat-rule1-firewall-address1-ip']
${selector_settings_network_nat_rule1_firewall_address1_mask_input}             xpath=//input[@data-qa-id='settings-network-nat-rule1-firewall-address1-mask']

${selector_settings_network_nat_rule1_firewall_address2_enable_checkbox}        xpath=//mat-checkbox[@data-qa-id='settings-network-nat-rule1-firewall-address2-enable']
${selector_settings_network_nat_rule1_firewall_address2_ip_input}               xpath=//input[@data-qa-id='settings-network-nat-rule1-firewall-address2-ip']
${selector_settings_network_nat_rule1_firewall_address2_mask_input}             xpath=//input[@data-qa-id='settings-network-nat-rule1-firewall-address2-mask']

${selector_settings_network_nat_rule1_firewall_address3_enable_checkbox}        xpath=//mat-checkbox[@data-qa-id='settings-network-nat-rule1-firewall-address3-enable']
${selector_settings_network_nat_rule1_firewall_address3_ip_input}               xpath=//input[@data-qa-id='settings-network-nat-rule1-firewall-address3-ip']
${selector_settings_network_nat_rule1_firewall_address3_mask_input}             xpath=//input[@data-qa-id='settings-network-nat-rule1-firewall-address3-mask']

${selector_settings_network_nat_rule2_source_select_ddwn}                       xpath=//select[@data-qa-id='settings-network-nat-rule2-source-select']
${selector_settings_network_nat_rule2_source_port_input}                        xpath=//input[@data-qa-id='settings-network-nat-rule2-source-port']
${selector_settings_network_nat_rule2_destination_address_input}                xpath=//input[@data-qa-id='settings-network-nat-rule2-destination-address']
${selector_settings_network_nat_rule2_destination_port_input}                   xpath=//input[@data-qa-id='settings-network-nat-rule2-destination-port']

${selector_settings_network_nat_rule2_firewall_private_address_checkbox}        xpath=//*[@data-qa-id='settings-network-nat-rule2-firewall-private-address']
${selector_settings_network_nat_rule2_firewall_address1_enable_checkbox}        xpath=//*[@data-qa-id='settings-network-nat-rule2-firewall-address1-enable']
${selector_settings_network_nat_rule2_firewall_address1_ip_input}               xpath=//input[@data-qa-id='settings-network-nat-rule2-firewall-address1-ip']
${selector_settings_network_nat_rule2_firewall_address1_mask_input}             xpath=//input[@data-qa-id='settings-network-nat-rule2-firewall-address1-mask']

${selector_settings_network_nat_rule2_firewall_address2_enable_checkbox}        xpath=//mat-checkbox[@data-qa-id='settings-network-nat-rule2-firewall-address2-enable']
${selector_settings_network_nat_rule2_firewall_address2_ip_input}               xpath=//input[@data-qa-id='settings-network-nat-rule2-firewall-address2-ip']
${selector_settings_network_nat_rule2_firewall_address2_mask_input}             xpath=//input[@data-qa-id='settings-network-nat-rule2-firewall-address2-mask']

${selector_settings_network_nat_rule2_firewall_address3_enable_checkbox}        xpath=//mat-checkbox[@data-qa-id='settings-network-nat-rule2-firewall-address3-enable']
${selector_settings_network_nat_rule2_firewall_address3_ip_input}               xpath=//input[@data-qa-id='settings-network-nat-rule2-firewall-address3-ip']
${selector_settings_network_nat_rule2_firewall_address3_mask_input}             xpath=//input[@data-qa-id='settings-network-nat-rule2-firewall-address3-mask']

${selector_settings_network_nat_rule3_source_select_ddwn}                       xpath=//select[@data-qa-id='settings-network-nat-rule3-source-select']
${selector_settings_network_nat_rule3_source_port_input}                        xpath=//input[@data-qa-id='settings-network-nat-rule3-source-port']
${selector_settings_network_nat_rule3_destination_address_input}                xpath=//input[@data-qa-id='settings-network-nat-rule3-destination-address']
${selector_settings_network_nat_rule3_destination_port_input}                   xpath=//input[@data-qa-id='settings-network-nat-rule3-destination-port']

${selector_settings_network_nat_rule3_firewall_private_address_checkbox}        xpath=//*[@data-qa-id='settings-network-nat-rule3-firewall-private-address']
${selector_settings_network_nat_rule3_firewall_address1_enable_checkbox}        xpath=//*[@data-qa-id='settings-network-nat-rule3-firewall-address1-enable']
${selector_settings_network-nat_rule3_firewall_address1_ip_input}               xpath=//input[@data-qa-id='settings-network-nat-rule3-firewall-address1-ip']
${selector_settings_network-nat_rule3_firewall_address1_mask_input}             xpath=//input[@data-qa-id='settings-network-nat-rule3-firewall-address1-mask']

${selector_settings_network-nat_rule3_firewall_address2_enable_checkbox}        xpath=//mat-checkbox[@data-qa-id='settings-network-nat-rule3-firewall-address2-enable']
${selector_settings_network-nat_rule3_firewall_address2_ip_input}               xpath=//input[@data-qa-id='settings-network-nat-rule3-firewall-address2-ip']
${selector_settings_network-nat_rule3_firewall_address2_mask_input}             xpath=//input[@data-qa-id='settings-network-nat-rule3-firewall-address2-mask']

${selector_settings_network-nat_rule3_firewall_address3_enable_checkbox}        xpath=//mat-checkbox[@data-qa-id='settings-network-nat-rule3-firewall-address3-enable']
${selector_settings_network-nat_rule3_firewall_address3_ip_input}               xpath=//input[@data-qa-id='settings-network-nat-rule3-firewall-address3-ip']
${selector_settings_network-nat_rule3_firewall_address3_mask_input}             xpath=//input[@data-qa-id='settings-network-nat-rule3-firewall-address3-mask']

${selector_settings_network_nat_rule4_source_select_ddwn}                       xpath=//select[@data-qa-id='settings-network-nat-rule4-source-select']
${selector_settings_network_nat_rule4_source_port_input}                        xpath=//input[@data-qa-id='settings-network-nat-rule4-source-port']
${selector_settings_network_nat_rule4_destination_address_input}                xpath=//input[@data-qa-id='settings-network-nat-rule4-destination-address']
${selector_settings_network_nat_rule4_destination_port_input}                   xpath=//input[@data-qa-id='settings-network-nat-rule4-destination-port']

${selector_settings_network_nat_rule4_firewall_private_address_checkbox}        xpath=//*[@data-qa-id='settings-network-nat-rule4-firewall-private-address']
${selector_settings_network_nat_rule4_firewall_address1_enable_checkbox}        xpath=//*[@data-qa-id='settings-network-nat-rule4-firewall-address1-enable']
${selector_settings_network-nat_rule4_firewall_address1_ip_input}               xpath=//input[@data-qa-id='settings-network-nat-rule4-firewall-address1-ip']
${selector_settings_network-nat_rule4_firewall_address1_mask_input}             xpath=//input[@data-qa-id='settings-network-nat-rule4-firewall-address1-mask']

${selector_settings_network-nat_rule4_firewall_address2_enable_checkbox}        xpath=//mat-checkbox[@data-qa-id='settings-network-nat-rule4-firewall-address2-enable']
${selector_settings_network-nat_rule4_firewall_address2_ip_input}               xpath=//input[@data-qa-id='settings-network-nat-rule4-firewall-address2-ip']
${selector_settings_network-nat_rule4_firewall_address2_mask_input}             xpath=//input[@data-qa-id='settings-network-nat-rule4-firewall-address2-mask']

${selector_settings_network-nat_rule4_firewall_address3_enable_checkbox}        xpath=//mat-checkbox[@data-qa-id='settings-network-nat-rule4-firewall-address3-enable']
${selector_settings_network-nat_rule4_firewall_address3_ip_input}               xpath=//input[@data-qa-id='settings-network-nat-rule4-firewall-address3-ip']
${selector_settings_network-nat_rule4_firewall_address3_mask_input}             xpath=//input[@data-qa-id='settings-network-nat-rule4-firewall-address3-mask']

${selector_settings_network_nat_rule5_source_select_ddwn}                       xpath=//select[@data-qa-id='settings-network-nat-rule5-source-select']
${selector_settings_network_nat_rule5_source_port_input}                        xpath=//input[@data-qa-id='settings-network-nat-rule5-source-port']
${selector_settings_network_nat_rule5_destination_address_input}                xpath=//input[@data-qa-id='settings-network-nat-rule5-destination-address']
${selector_settings_network_nat_rule5_destination_port_input}                   xpath=//input[@data-qa-id='settings-network-nat-rule5-destination-port']

${selector_settings_network_nat_rule5_firewall_private_address_checkbox}        xpath=//*[@data-qa-id='settings-network-nat-rule5-firewall-private-address']
${selector_settings_network_nat_rule5_firewall_address1_enable_checkbox}        xpath=//*[@data-qa-id='settings-network-nat-rule5-firewall-address1-enable']
${selector_settings_network-nat_rule5_firewall_address1_ip_input}               xpath=//input[@data-qa-id='settings-network-nat-rule5-firewall-address1-ip']
${selector_settings_network-nat_rule5_firewall_address1_mask_input}             xpath=//input[@data-qa-id='settings-network-nat-rule5-firewall-address1-mask']

${selector_settings_network-nat_rule5_firewall_address2_enable_checkbox}        xpath=//mat-checkbox[@data-qa-id='settings-network-nat-rule5-firewall-address2-enable']
${selector_settings_network-nat_rule5_firewall_address2_ip_input}               xpath=//input[@data-qa-id='settings-network-nat-rule5-firewall-address2-ip']
${selector_settings_network-nat_rule5_firewall_address2_mask_input}             xpath=//input[@data-qa-id='settings-network-nat-rule5-firewall-address2-mask']

${selector_settings_network-nat_rule5_firewall_address3_enable_checkbox}        xpath=//mat-checkbox[@data-qa-id='settings-network-nat-rule5-firewall-address3-enable']
${selector_settings_network-nat_rule5_firewall_address3_ip_input}               xpath=//input[@data-qa-id='settings-network-nat-rule5-firewall-address3-ip']
${selector_settings_network-nat_rule5_firewall_address3_mask_input}             xpath=//input[@data-qa-id='settings-network-nat-rule5-firewall-address3-mask']

${selector_settings_network_nat_rule6_source_select_ddwn}                       xpath=//select[@data-qa-id='settings-network-nat-rule6-source-select']
${selector_settings_network_nat_rule6_source_port_input}                        xpath=//input[@data-qa-id='settings-network-nat-rule6-source-port']
${selector_settings_network_nat_rule6_destination_address_input}                xpath=//input[@data-qa-id='settings-network-nat-rule6-destination-address']
${selector_settings_network_nat_rule6_destination_port_input}                   xpath=//input[@data-qa-id='settings-network-nat-rule6-destination-port']

${selector_settings_network_nat_rule6_firewall_private_address_checkbox}        xpath=//*[@data-qa-id='settings-network-nat-rule6-firewall-private-address']
${selector_settings_network_nat_rule6_firewall_address1_enable_checkbox}        xpath=//*[@data-qa-id='settings-network-nat-rule6-firewall-address1-enable']
${selector_settings_network_nat_rule6_firewall_address1_ip_input}               xpath=//input[@data-qa-id='settings-network-nat-rule6-firewall-address1-ip']
${selector_settings_network_nat_rule6_firewall_address1_mask_input}             xpath=//input[@data-qa-id='settings-network-nat-rule6-firewall-address1-mask']

${selector_settings_network_nat_rule6_firewall_address2_enable_checkbox}        xpath=//mat-checkbox[@data-qa-id='settings-network-nat-rule6-firewall-address2-enable']
${selector_settings_network_nat_rule6_firewall_address2_ip_input}               xpath=//input[@data-qa-id='settings-network-nat-rule6-firewall-address2-ip']
${selector_settings_network_nat_rule6_firewall_address2_mask_input}             xpath=//input[@data-qa-id='settings-network-nat-rule6-firewall-address2-mask']

${selector_settings_network_nat_rule6_firewall_address3_enable_checkbox}        xpath=//mat-checkbox[@data-qa-id='settings-network-nat-rule6-firewall-address3-enable']
${selector_settings_network_nat_rule6_firewall_address3_ip_input}               xpath=//input[@data-qa-id='settings-network-nat-rule6-firewall-address3-ip']
${selector_settings_network_nat_rule6_firewall_address3_mask_input}             xpath=//input[@data-qa-id='settings-network-nat-rule6-firewall-address3-mask']

${selector_settings_network_nat_rule7_source_select_ddwn}                       xpath=//select[@data-qa-id='settings-network-nat-rule7-source-select']
${selector_settings_network_nat_rule7_source_port_input}                        xpath=//input[@data-qa-id='settings-network-nat-rule7-source-port']
${selector_settings_network_nat_rule7_destination_address_input}                xpath=//input[@data-qa-id='settings-network-nat-rule7-destination-address']
${selector_settings_network_nat_rule7_destination_port_input}                   xpath=//input[@data-qa-id='settings-network-nat-rule7-destination-port']

${selector_settings_network_nat_rule7_firewall_private_address_checkbox}        xpath=//*[@data-qa-id='settings-network-nat-rule7-firewall-private-address']
${selector_settings_network_nat_rule7_firewall_address1_enable_checkbox}        xpath=//*[@data-qa-id='settings-network-nat-rule7-firewall-address1-enable']
${selector_settings_network-nat_rule7_firewall_address1_ip_input}               xpath=//input[@data-qa-id='settings-network-nat-rule7-firewall-address1-ip']
${selector_settings_network-nat_rule7_firewall_address1_mask_input}             xpath=//input[@data-qa-id='settings-network-nat-rule7-firewall-address1-mask']

${selector_settings_network-nat_rule7_firewall_address2_enable_checkbox}        xpath=//mat-checkbox[@data-qa-id='settings-network-nat-rule7-firewall-address2-enable']
${selector_settings_network-nat_rule7_firewall_address2_ip_input}               xpath=//input[@data-qa-id='settings-network-nat-rule7-firewall-address2-ip']
${selector_settings_network-nat_rule7_firewall_address2_mask_input}             xpath=//input[@data-qa-id='settings-network-nat-rule7-firewall-address2-mask']

${selector_settings_network-nat_rule7_firewall_address3_enable_checkbox}        xpath=//mat-checkbox[@data-qa-id='settings-network-nat-rule7-firewall-address3-enable']
${selector_settings_network-nat_rule7_firewall_address3_ip_input}               xpath=//input[@data-qa-id='settings-network-nat-rule7-firewall-address3-ip']
${selector_settings_network-nat_rule7_firewall_address3_mask_input}             xpath=//input[@data-qa-id='settings-network-nat-rule7-firewall-address3-mask']

${selector_settings_network_nat_rule8_source_select_ddwn}                       xpath=//select[@data-qa-id='settings-network-nat-rule8-source-select']
${selector_settings_network_nat_rule8_source_port_input}                        xpath=//input[@data-qa-id='settings-network-nat-rule8-source-port']
${selector_settings_network_nat_rule8_destination_address_input}                xpath=//input[@data-qa-id='settings-network-nat-rule8-destination-address']
${selector_settings_network_nat_rule8_destination_port_input}                   xpath=//input[@data-qa-id='settings-network-nat-rule8-destination-port']

${selector_settings_network_nat_rule8_firewall_private_address_checkbox}        xpath=//*[@data-qa-id='settings-network-nat-rule8-firewall-private-address']
${selector_settings_network_nat_rule8_firewall_address1_enable_checkbox}        xpath=//*[@data-qa-id='settings-network-nat-rule8-firewall-address1-enable']
${selector_settings_network-nat_rule8_firewall_address1_ip_input}               xpath=//input[@data-qa-id='settings-network-nat-rule8-firewall-address1-ip']
${selector_settings_network-nat_rule8_firewall_address1_mask_input}             xpath=//input[@data-qa-id='settings-network-nat-rule8-firewall-address1-mask']

${selector_settings_network-nat_rule8_firewall_address2_enable_checkbox}        xpath=//mat-checkbox[@data-qa-id='settings-network-nat-rule8-firewall-address2-enable']
${selector_settings_network-nat_rule8_firewall_address2_ip_input}               xpath=//input[@data-qa-id='settings-network-nat-rule8-firewall-address2-ip']
${selector_settings_network-nat_rule8_firewall_address2_mask_input}             xpath=//input[@data-qa-id='settings-network-nat-rule8-firewall-address2-mask']

${selector_settings_network-nat_rule8_firewall_address3_enable_checkbox}        xpath=//mat-checkbox[@data-qa-id='settings-network-nat-rule8-firewall-address3-enable']
${selector_settings_network-nat_rule8_firewall_address3_ip_input}               xpath=//input[@data-qa-id='settings-network-nat-rule8-firewall-address3-ip']
${selector_settings_network-nat_rule8_firewall_address3_mask_input}             xpath=//input[@data-qa-id='settings-network-nat-rule8-firewall-address3-mask']

${selector_settings_network_nat_rule9_source_select_ddwn}                       xpath=//select[@data-qa-id='settings-network-nat-rule9-source-select']
${selector_settings_network_nat_rule9_source_port_input}                        xpath=//input[@data-qa-id='settings-network-nat-rule9-source-port']
${selector_settings_network_nat_rule9_destination_address_input}                xpath=//input[@data-qa-id='settings-network-nat-rule9-destination-address']
${selector_settings_network_nat_rule9_destination_port_input}                   xpath=//input[@data-qa-id='settings-network-nat-rule9-destination-port']

${selector_settings_network_nat_rule9_firewall_private_address_checkbox}        xpath=//*[@data-qa-id='settings-network-nat-rule9-firewall-private-address']
${selector_settings_network_nat_rule9_firewall_address1_enable_checkbox}        xpath=//*[@data-qa-id='settings-network-nat-rule9-firewall-address1-enable']
${selector_settings_network-nat_rule9_firewall_address1_ip_input}               xpath=//input[@data-qa-id='settings-network-nat-rule9-firewall-address1-ip']
${selector_settings_network-nat_rule9_firewall_address1_mask_input}             xpath=//input[@data-qa-id='settings-network-nat-rule9-firewall-address1-mask']

${selector_settings_network-nat_rule9_firewall_address2_enable_checkbox}        xpath=//mat-checkbox[@data-qa-id='settings-network-nat-rule9-firewall-address2-enable']
${selector_settings_network-nat_rule9_firewall_address2_ip_input}               xpath=//input[@data-qa-id='settings-network-nat-rule9-firewall-address2-ip']
${selector_settings_network-nat_rule9_firewall_address2_mask_input}             xpath=//input[@data-qa-id='settings-network-nat-rule9-firewall-address2-mask']

${selector_settings_network-nat_rule9_firewall_address3_enable_checkbox}        xpath=//mat-checkbox[@data-qa-id='settings-network-nat-rule9-firewall-address3-enable']
${selector_settings_network-nat_rule9_firewall_address3_ip_input}               xpath=//input[@data-qa-id='settings-network-nat-rule9-firewall-address3-ip']
${selector_settings_network-nat_rule9_firewall_address3_mask_input}             xpath=//input[@data-qa-id='settings-network-nat-rule9-firewall-address3-mask']

${selector_settings_network_nat_rule10_source_select_ddwn}                      xpath=//select[@data-qa-id='settings-network-nat-rule10-source-select']
${selector_settings_network_nat_rule10_source_port_input}                       xpath=//input[@data-qa-id='settings-network-nat-rule10-source-port']
${selector_settings_network_nat_rule10_destination_address_input}               xpath=//input[@data-qa-id='settings-network-nat-rule10-destination-address']
${selector_settings_network_nat_rule10_destination_port_input}                  xpath=//input[@data-qa-id='settings-network-nat-rule10-destination-port']

${selector_settings_network_nat_rule10_firewall_private_address_checkbox}       xpath=//*[@data-qa-id='settings-network-nat-rule10-firewall-private-address']
${selector_settings_network_nat_rule10_firewall_address1_enable_checkbox}       xpath=//*[@data-qa-id='settings-network-nat-rule10-firewall-address1-enable']
${selector_settings_network-nat_rule10_firewall_address1_ip_input}              xpath=//input[@data-qa-id='settings-network-nat-rule10-firewall-address1-ip']
${selector_settings_network-nat_rule10_firewall_address1_mask_input}            xpath=//input[@data-qa-id='settings-network-nat-rule10-firewall-address1-mask']

${selector_settings_network-nat_rule10_firewall_address2_enable_checkbox}       xpath=//mat-checkbox[@data-qa-id='settings-network-nat-rule10-firewall-address2-enable']
${selector_settings_network-nat_rule10_firewall_address2_ip_input}              xpath=//input[@data-qa-id='settings-network-nat-rule10-firewall-address2-ip']
${selector_settings_network-nat_rule10_firewall_address2_mask_input}            xpath=//input[@data-qa-id='settings-network-nat-rule10-firewall-address2-mask']

${selector_settings_network-nat_rule10_firewall_address3_enable_checkbox}       xpath=//mat-checkbox[@data-qa-id='settings-network-nat-rule10-firewall-address3-enable']
${selector_settings_network-nat_rule10_firewall_address3_ip_input}              xpath=//input[@data-qa-id='settings-network-nat-rule10-firewall-address3-ip']
${selector_settings_network-nat_rule10_firewall_address3_mask_input}            xpath=//input[@data-qa-id='settings-network-nat-rule10-firewall-address3-mask']

${selector_settings_network_nat_rule11_source_select_ddwn}                      xpath=//select[@data-qa-id='settings-network-nat-rule11-source-select']
${selector_settings_network_nat_rule11_source_port_input}                       xpath=//input[@data-qa-id='settings-network-nat-rule11-source-port']
${selector_settings_network_nat_rule11_destination_address_input}               xpath=//input[@data-qa-id='settings-network-nat-rule11-destination-address']
${selector_settings_network_nat_rule11_destination_port_input}                  xpath=//input[@data-qa-id='settings-network-nat-rule11-destination-port']

${selector_settings_network_nat_rule11_firewall_private_address_checkbox}       xpath=//*[@data-qa-id='settings-network-nat-rule11-firewall-private-address']
${selector_settings_network_nat_rule11_firewall_address1_enable_checkbox}       xpath=//*[@data-qa-id='settings-network-nat-rule11-firewall-address1-enable']
${selector_settings_network-nat_rule11_firewall_address1_ip_input}              xpath=//input[@data-qa-id='settings-network-nat-rule11-firewall-address1-ip']
${selector_settings_network-nat_rule11_firewall_address1_mask_input}            xpath=//input[@data-qa-id='settings-network-nat-rule11-firewall-address1-mask']

${selector_settings_network-nat_rule11_firewall_address2_enable_checkbox}       xpath=//mat-checkbox[@data-qa-id='settings-network-nat-rule11-firewall-address2-enable']
${selector_settings_network-nat_rule11_firewall_address2_ip_input}              xpath=//input[@data-qa-id='settings-network-nat-rule11-firewall-address2-ip']
${selector_settings_network-nat_rule11_firewall_address2_mask_input}            xpath=//input[@data-qa-id='settings-network-nat-rule11-firewall-address2-mask']

${selector_settings_network-nat_rule11_firewall_address3_enable_checkbox}       xpath=//mat-checkbox[@data-qa-id='settings-network-nat-rule11-firewall-address3-enable']
${selector_settings_network-nat_rule11_firewall_address3_ip_input}              xpath=//input[@data-qa-id='settings-network-nat-rule11-firewall-address3-ip']
${selector_settings_network-nat_rule11_firewall_address3_mask_input}            xpath=//input[@data-qa-id='settings-network-nat-rule11-firewall-address3-mask']

${selector_settings_network_nat_rule12_source_select_ddwn}                      xpath=//select[@data-qa-id='settings-network-nat-rule12-source-select']
${selector_settings_network_nat_rule12_source_port_input}                       xpath=//input[@data-qa-id='settings-network-nat-rule12-source-port']
${selector_settings_network_nat_rule12_destination_address_input}               xpath=//input[@data-qa-id='settings-network-nat-rule12-destination-address']
${selector_settings_network_nat_rule12_destination_port_input}                  xpath=//input[@data-qa-id='settings-network-nat-rule12-destination-port']

${selector_settings_network_nat_rule12_firewall_private_address_checkbox}       xpath=//*[@data-qa-id='settings-network-nat-rule12-firewall-private-address']
${selector_settings_network_nat_rule12_firewall_address1_enable_checkbox}       xpath=//*[@data-qa-id='settings-network-nat-rule12-firewall-address1-enable']
${selector_settings_network-nat_rule12_firewall_address1_ip_input}              xpath=//input[@data-qa-id='settings-network-nat-rule12-firewall-address1-ip']
${selector_settings_network-nat_rule12_firewall_address1_mask_input}            xpath=//input[@data-qa-id='settings-network-nat-rule12-firewall-address1-mask']

${selector_settings_network-nat_rule12_firewall_address2_enable_checkbox}       xpath=//mat-checkbox[@data-qa-id='settings-network-nat-rule12-firewall-address2-enable']
${selector_settings_network-nat_rule12_firewall_address2_ip_input}              xpath=//input[@data-qa-id='settings-network-nat-rule12-firewall-address2-ip']
${selector_settings_network-nat_rule12_firewall_address2_mask_input}            xpath=//input[@data-qa-id='settings-network-nat-rule12-firewall-address2-mask']

${selector_settings_network-nat_rule12_firewall_address3_enable_checkbox}       xpath=//mat-checkbox[@data-qa-id='settings-network-nat-rule12-firewall-address3-enable']
${selector_settings_network-nat_rule12_firewall_address3_ip_input}              xpath=//input[@data-qa-id='settings-network-nat-rule12-firewall-address3-ip']
${selector_settings_network-nat_rule12_firewall_address3_mask_input}            xpath=//input[@data-qa-id='settings-network-nat-rule12-firewall-address3-mask']

${selector_settings_network_nat_rule13_source_select_ddwn}                      xpath=//select[@data-qa-id='settings-network-nat-rule13-source-select']
${selector_settings_network_nat_rule13_source_port_input}                       xpath=//input[@data-qa-id='settings-network-nat-rule13-source-port']
${selector_settings_network_nat_rule13_destination_address_input}               xpath=//input[@data-qa-id='settings-network-nat-rule13-destination-address']
${selector_settings_network_nat_rule13_destination_port_input}                  xpath=//input[@data-qa-id='settings-network-nat-rule13-destination-port']

${selector_settings_network_nat_rule13_firewall_private_address_checkbox}       xpath=//*[@data-qa-id='settings-network-nat-rule13-firewall-private-address']
${selector_settings_network_nat_rule13_firewall_address1_enable_checkbox}       xpath=//*[@data-qa-id='settings-network-nat-rule13-firewall-address1-enable']
${selector_settings_network-nat_rule13_firewall_address1_ip_input}              xpath=//input[@data-qa-id='settings-network-nat-rule13-firewall-address1-ip']
${selector_settings_network-nat_rule13_firewall_address1_mask_input}            xpath=//input[@data-qa-id='settings-network-nat-rule13-firewall-address1-mask']

${selector_settings_network-nat_rule13_firewall_address2_enable_checkbox}       xpath=//mat-checkbox[@data-qa-id='settings-network-nat-rule13-firewall-address2-enable']
${selector_settings_network-nat_rule13_firewall_address2_ip_input}              xpath=//input[@data-qa-id='settings-network-nat-rule13-firewall-address2-ip']
${selector_settings_network-nat_rule13_firewall_address2_mask_input}            xpath=//input[@data-qa-id='settings-network-nat-rule13-firewall-address2-mask']

${selector_settings_network-nat_rule13_firewall_address3_enable_checkbox}       xpath=//mat-checkbox[@data-qa-id='settings-network-nat-rule13-firewall-address3-enable']
${selector_settings_network-nat_rule13_firewall_address3_ip_input}              xpath=//input[@data-qa-id='settings-network-nat-rule13-firewall-address3-ip']
${selector_settings_network-nat_rule13_firewall_address3_mask_input}            xpath=//input[@data-qa-id='settings-network-nat-rule13-firewall-address3-mask']

${selector_settings_network_nat_rule14_source_select_ddwn}                      xpath=//select[@data-qa-id='settings-network-nat-rule14-source-select']
${selector_settings_network_nat_rule14_source_port_input}                       xpath=//input[@data-qa-id='settings-network-nat-rule14-source-port']
${selector_settings_network_nat_rule14_destination_address_input}               xpath=//input[@data-qa-id='settings-network-nat-rule14-destination-address']
${selector_settings_network_nat_rule14_destination_port_input}                  xpath=//input[@data-qa-id='settings-network-nat-rule14-destination-port']

${selector_settings_network_nat_rule14_firewall_private_address_checkbox}       xpath=//*[@data-qa-id='settings-network-nat-rule14-firewall-private-address']
${selector_settings_network_nat_rule14_firewall_address1_enable_checkbox}       xpath=//*[@data-qa-id='settings-network-nat-rule14-firewall-address1-enable']
${selector_settings_network_nat_rule14_firewall_address1_ip_input}              xpath=//input[@data-qa-id='settings-network-nat-rule14-firewall-address1-ip']
${selector_settings_network_nat_rule14_firewall_address1_mask_input}            xpath=//input[@data-qa-id='settings-network-nat-rule14-firewall-address1-mask']

${selector_settings_network_nat_rule14_firewall_address2_enable_checkbox}       xpath=//mat-checkbox[@data-qa-id='settings-network-nat-rule14-firewall-address2-enable']
${selector_settings_network_nat_rule14_firewall_address2_ip_input}              xpath=//input[@data-qa-id='settings-network-nat-rule14-firewall-address2-ip']
${selector_settings_network_nat_rule14_firewall_address2_mask_input}            xpath=//input[@data-qa-id='settings-network-nat-rule14-firewall-address2-mask']

${selector_settings_network_nat_rule14_firewall_address3_enable_checkbox}       xpath=//mat-checkbox[@data-qa-id='settings-network-nat-rule14-firewall-address3-enable']
${selector_settings_network_nat_rule14_firewall_address3_ip_input}              xpath=//input[@data-qa-id='settings-network-nat-rule14-firewall-address3-ip']
${selector_settings_network_nat_rule14_firewall_address3_mask_input}            xpath=//input[@data-qa-id='settings-network-nat-rule14-firewall-address3-mask']

${selector_settings_network_nat_rule15_source_select_ddwn}                      xpath=//select[@data-qa-id='settings-network-nat-rule15-source-select']
${selector_settings_network_nat_rule15_source_port_input}                       xpath=//input[@data-qa-id='settings-network-nat-rule15-source-port']
${selector_settings_network_nat_rule15_destination_address_input}               xpath=//input[@data-qa-id='settings-network-nat-rule15-destination-address']
${selector_settings_network_nat_rule15_destination_port_input}                  xpath=//input[@data-qa-id='settings-network-nat-rule15-destination-port']

${selector_settings_network_nat_rule15_Firewall_private_address_checkbox}       xpath=//*[@data-qa-id='settings-network-nat-rule15-Firewall-private-address']
${selector_settings_network_nat_rule15_Firewall_address1_enable_checkbox}       xpath=//*[@data-qa-id='settings-network-nat-rule15-Firewall-address1-enable']
${selector_settings_network-nat_rule15_Firewall_address1_ip_input}              xpath=//input[@data-qa-id='settings-network-nat-rule15-Firewall-address1-ip']
${selector_settings_network-nat_rule15_Firewall_address1_mask_input}            xpath=//input[@data-qa-id='settings-network-nat-rule15-Firewall-address1-mask']

${selector_settings_network-nat_rule15_Firewall_address2_enable_checkbox}       xpath=//mat-checkbox[@data-qa-id='settings-network-nat-rule15-Firewall-address2-enable']
${selector_settings_network-nat_rule15_Firewall_address2_ip_input}              xpath=//input[@data-qa-id='settings-network-nat-rule15-Firewall-address2-ip']
${selector_settings_network-nat_rule15_Firewall_address2_mask_input}            xpath=//input[@data-qa-id='settings-network-nat-rule15-Firewall-address2-mask']

${selector_settings_network-nat_rule15_Firewall_address3_enable_checkbox}       xpath=//mat-checkbox[@data-qa-id='settings-network-nat-rule15-Firewall-address3-enable']
${selector_settings_network-nat_rule15_Firewall_address3_ip_input}              xpath=//input[@data-qa-id='settings-network-nat-rule15-Firewall-address3-ip']
${selector_settings_network-nat_rule15_Firewall_address3_mask_input}            xpath=//input[@data-qa-id='settings-network-nat-rule15-Firewall-address3-mask']

${selector_settings_network_nat_rule16_source_select_ddwn}                      xpath=//select[@data-qa-id='settings-network-nat-rule16-source-select']
${selector_settings_network_nat_rule16_source_port_input}                       xpath=//input[@data-qa-id='settings-network-nat-rule16-source-port']
${selector_settings_network_nat_rule16_destination_address_input}               xpath=//input[@data-qa-id='settings-network-nat-rule16-destination-address']
${selector_settings_network_nat_rule16_destination_port_input}                  xpath=//input[@data-qa-id='settings-network-nat-rule16-destination-port']

${selector_settings_network_nat_rule16_firewall_private_address_checkbox}       xpath=//*[@data-qa-id='settings-network-nat-rule16-firewall-private-address']
${selector_settings_network_nat_rule16_firewall_address1_enable_checkbox}       xpath=//*[@data-qa-id='settings-network-nat-rule16-firewall-address1-enable']
${selector_settings_network-nat_rule16_firewall_address1_ip_input}              xpath=//input[@data-qa-id='settings-network-nat-rule16-firewall-address1-ip']
${selector_settings_network-nat_rule16_firewall_address1_mask_input}            xpath=//input[@data-qa-id='settings-network-nat-rule16-firewall-address1-mask']

${selector_settings_network-nat_rule16_firewall_address2_enable_checkbox}       xpath=//mat-checkbox[@data-qa-id='settings-network-nat-rule16-firewall-address2-enable']
${selector_settings_network-nat_rule16_firewall_address2_ip_input}              xpath=//input[@data-qa-id='settings-network-nat-rule16-firewall-address2-ip']
${selector_settings_network-nat_rule16_firewall_address2_mask_input}            xpath=//input[@data-qa-id='settings-network-nat-rule16-firewall-address2-mask']

${selector_settings_network-nat_rule16_firewall_address3_enable_checkbox}       xpath=//mat-checkbox[@data-qa-id='settings-network-nat-rule16-firewall-address3-enable']
${selector_settings_network-nat_rule16_firewall_address3_ip_input}              xpath=//input[@data-qa-id='settings-network-nat-rule16-firewall-address3-ip']
${selector_settings_network-nat_rule16_firewall_address3_mask_input}            xpath=//input[@data-qa-id='settings-network-nat-rule16-firewall-address3-mask']

${selector_settings_network_nat_rule17_source_select_ddwn}                      xpath=//select[@data-qa-id='settings-network-nat-rule17-source-select']
${selector_settings_network_nat_rule17_source_port_input}                       xpath=//input[@data-qa-id='settings-network-nat-rule17-source-port']
${selector_settings_network_nat_rule17_destination_address_input}               xpath=//input[@data-qa-id='settings-network-nat-rule17-destination-address']
${selector_settings_network_nat_rule17_destination_port_input}                  xpath=//input[@data-qa-id='settings-network-nat-rule17-destination-port']

${selector_settings_network_nat_rule17_firewall_private_address_checkbox}       xpath=//*[@data-qa-id='settings-network-nat-rule17-firewall-private-address']
${selector_settings_network_nat_rule17_firewall_address1_enable_checkbox}       xpath=//*[@data-qa-id='settings-network-nat-rule17-firewall-address1-enable']
${selector_settings_network-nat_rule17_firewall_address1_ip_input}              xpath=//input[@data-qa-id='settings-network-nat-rule17-firewall-address1-ip']
${selector_settings_network-nat_rule17_firewall_address1_mask_input}            xpath=//input[@data-qa-id='settings-network-nat-rule17-firewall-address1-mask']

${selector_settings_network-nat_rule17_firewall_address2_enable_checkbox}       xpath=//mat-checkbox[@data-qa-id='settings-network-nat-rule17-firewall-address2-enable']
${selector_settings_network-nat_rule17_firewall_address2_ip_input}              xpath=//input[@data-qa-id='settings-network-nat-rule17-firewall-address2-ip']
${selector_settings_network-nat_rule17_firewall_address2_mask_input}            xpath=//input[@data-qa-id='settings-network-nat-rule17-firewall-address2-mask']

${selector_settings_network-nat_rule17_firewall_address3_enable_checkbox}       xpath=//mat-checkbox[@data-qa-id='settings-network-nat-rule17-firewall-address3-enable']
${selector_settings_network-nat_rule17_firewall_address3_ip_input}              xpath=//input[@data-qa-id='settings-network-nat-rule17-firewall-address3-ip']
${selector_settings_network-nat_rule17_firewall_address3_mask_input}            xpath=//input[@data-qa-id='settings-network-nat-rule17-firewall-address3-mask']

${selector_settings_network_nat_rule18_source_select_ddwn}                      xpath=//select[@data-qa-id='settings-network-nat-rule18-source-select']
${selector_settings_network_nat_rule18_source_port_input}                       xpath=//input[@data-qa-id='settings-network-nat-rule18-source-port']
${selector_settings_network_nat_rule18_destination_address_input}               xpath=//input[@data-qa-id='settings-network-nat-rule18-destination-address']
${selector_settings_network_nat_rule18_destination_port_input}                  xpath=//input[@data-qa-id='settings-network-nat-rule18-destination-port']

${selector_settings_network_nat_rule18_firewall_private_address_checkbox}       xpath=//*[@data-qa-id='settings-network-nat-rule18-firewall-private-address']
${selector_settings_network_nat_rule18_firewall_address1_enable_checkbox}       xpath=//*[@data-qa-id='settings-network-nat-rule18-firewall-address1-enable']
${selector_settings_network-nat_rule18_firewall_address1_ip_input}              xpath=//input[@data-qa-id='settings-network-nat-rule18-firewall-address1-ip']
${selector_settings_network-nat_rule18_firewall_address1_mask_input}            xpath=//input[@data-qa-id='settings-network-nat-rule18-firewall-address1-mask']

${selector_settings_network-nat_rule18_firewall_address2_enable_checkbox}       xpath=//mat-checkbox[@data-qa-id='settings-network-nat-rule18-firewall-address2-enable']
${selector_settings_network-nat_rule18_firewall_address2_ip_input}              xpath=//input[@data-qa-id='settings-network-nat-rule18-firewall-address2-ip']
${selector_settings_network-nat_rule18_firewall_address2_mask_input}            xpath=//input[@data-qa-id='settings-network-nat-rule18-firewall-address2-mask']

${selector_settings_network-nat_rule18_firewall_address3_enable_checkbox}       xpath=//mat-checkbox[@data-qa-id='settings-network-nat-rule18-firewall-address3-enable']
${selector_settings_network-nat_rule18_firewall_address3_ip_input}              xpath=//input[@data-qa-id='settings-network-nat-rule18-firewall-address3-ip']
${selector_settings_network-nat_rule18_firewall_address3_mask_input}            xpath=//input[@data-qa-id='settings-network-nat-rule18-firewall-address3-mask']

${selector_settings_network_nat_rule19_source_select_ddwn}                      xpath=//select[@data-qa-id='settings-network-nat-rule19-source-select']
${selector_settings_network_nat_rule19_source_port_input}                       xpath=//input[@data-qa-id='settings-network-nat-rule19-source-port']
${selector_settings_network_nat_rule19_destination_address_input}               xpath=//input[@data-qa-id='settings-network-nat-rule19-destination-address']
${selector_settings_network_nat_rule19_destination_port_input}                  xpath=//input[@data-qa-id='settings-network-nat-rule19-destination-port']

${selector_settings_network_nat_rule19_firewall_private_address_checkbox}       xpath=//*[@data-qa-id='settings-network-nat-rule19-firewall-private-address']
${selector_settings_network_nat_rule19_firewall_address1_enable_checkbox}       xpath=//*[@data-qa-id='settings-network-nat-rule19-firewall-address1-enable']
${selector_settings_network-nat_rule19_firewall_address1_ip_input}              xpath=//input[@data-qa-id='settings-network-nat-rule19-firewall-address1-ip']
${selector_settings_network-nat_rule19_firewall_address1_mask_input}            xpath=//input[@data-qa-id='settings-network-nat-rule19-firewall-address1-mask']

${selector_settings_network-nat_rule19_firewall_address2_enable_checkbox}       xpath=//mat-checkbox[@data-qa-id='settings-network-nat-rule19-firewall-address2-enable']
${selector_settings_network-nat_rule19_firewall_address2_ip_input}              xpath=//input[@data-qa-id='settings-network-nat-rule19-firewall-address2-ip']
${selector_settings_network-nat_rule19_firewall_address2_mask_input}            xpath=//input[@data-qa-id='settings-network-nat-rule19-firewall-address2-mask']

${selector_settings_network-nat_rule19_firewall_address3_enable_checkbox}       xpath=//mat-checkbox[@data-qa-id='settings-network-nat-rule19-firewall-address3-enable']
${selector_settings_network-nat_rule19_firewall_address3_ip_input}              xpath=//input[@data-qa-id='settings-network-nat-rule19-firewall-address3-ip']
${selector_settings_network-nat_rule19_firewall_address3_mask_input}            xpath=//input[@data-qa-id='settings-network-nat-rule19-firewall-address3-mask']

${selector_settings_network_nat_rule20_source_select_ddwn}                      xpath=//select[@data-qa-id='settings-network-nat-rule20-source-select']
${selector_settings_network_nat_rule20_source_port_input}                       xpath=//input[@data-qa-id='settings-network-nat-rule20-source-port']
${selector_settings_network_nat_rule20_destination_address_input}               xpath=//input[@data-qa-id='settings-network-nat-rule20-destination-address']
${selector_settings_network_nat_rule20_destination_port_input}                  xpath=//input[@data-qa-id='settings-network-nat-rule20-destination-port']

${selector_settings_network_nat_rule20_firewall_private_address_checkbox}       xpath=//*[@data-qa-id='settings-network-nat-rule20-firewall-private-address']
${selector_settings_network_nat_rule20_firewall_address1_enable_checkbox}       xpath=//*[@data-qa-id='settings-network-nat-rule20-firewall-address1-enable']
${selector_settings_network-nat_rule20_firewall_address1_ip_input}              xpath=//input[@data-qa-id='settings-network-nat-rule20-firewall-address1-ip']
${selector_settings_network-nat_rule20_firewall_address1_mask_input}            xpath=//input[@data-qa-id='settings-network-nat-rule20-firewall-address1-mask']

${selector_settings_network-nat_rule20_firewall_address2_enable_checkbox}       xpath=//mat-checkbox[@data-qa-id='settings-network-nat-rule20-firewall-address2-enable']
${selector_settings_network-nat_rule20_firewall_address2_ip_input}              xpath=//input[@data-qa-id='settings-network-nat-rule20-firewall-address2-ip']
${selector_settings_network-nat_rule20_firewall_address2_mask_input}            xpath=//input[@data-qa-id='settings-network-nat-rule20-firewall-address2-mask']

${selector_settings_network-nat_rule20_firewall_address3_enable_checkbox}       xpath=//mat-checkbox[@data-qa-id='settings-network-nat-rule20-firewall-address3-enable']
${selector_settings_network-nat_rule20_firewall_address3_ip_input}              xpath=//input[@data-qa-id='settings-network-nat-rule20-firewall-address3-ip']
${selector_settings_network-nat_rule20_firewall_address3_mask_input}            xpath=//input[@data-qa-id='settings-network-nat-rule20-firewall-address3-mask']

${selector_settings_network_nat_rule21_source_select_ddwn}                      xpath=//select[@data-qa-id='settings-network-nat-rule21-source-select']
${selector_settings_network_nat_rule21_source_port_input}                       xpath=//input[@data-qa-id='settings-network-nat-rule21-source-port']
${selector_settings_network_nat_rule21_destination_address_input}               xpath=//input[@data-qa-id='settings-network-nat-rule21-destination-address']
${selector_settings_network_nat_rule21_destination_port_input}                  xpath=//input[@data-qa-id='settings-network-nat-rule21-destination-port']

${selector_settings_network_nat_rule21_firewall_private_address_checkbox}       xpath=//*[@data-qa-id='settings-network-nat-rule21-firewall-private-address']
${selector_settings_network_nat_rule21_firewall_address1_enable_checkbox}       xpath=//*[@data-qa-id='settings-network-nat-rule21-firewall-address1-enable']
${selector_settings_network_nat_rule21_firewall_address1_ip_input}              xpath=//input[@data-qa-id='settings-network-nat-rule21-firewall-address1-ip']
${selector_settings_network_nat_rule21_firewall_address1_mask_input}            xpath=//input[@data-qa-id='settings-network-nat-rule21-firewall-address1-mask']

${selector_settings_network_nat_rule21_firewall_address2_enable_checkbox}       xpath=//mat-checkbox[@data-qa-id='settings-network-nat-rule21-firewall-address2-enable']
${selector_settings_network_nat_rule21_firewall_address2_ip_input}              xpath=//input[@data-qa-id='settings-network-nat-rule21-firewall-address2-ip']
${selector_settings_network_nat_rule21_firewall_address2_mask_input}            xpath=//input[@data-qa-id='settings-network-nat-rule21-firewall-address2-mask']

${selector_settings_network_nat_rule21_firewall_address3_enable_checkbox}       xpath=//mat-checkbox[@data-qa-id='settings-network-nat-rule21-firewall-address3-enable']
${selector_settings_network_nat_rule21_firewall_address3_ip_input}              xpath=//input[@data-qa-id='settings-network-nat-rule21-firewall-address3-ip']
${selector_settings_network_nat_rule21_firewall_address3_mask_input}            xpath=//input[@data-qa-id='settings-network-nat-rule21-firewall-address3-mask']

${selector_settings_network_nat_rule22_source_select_ddwn}                      xpath=//select[@data-qa-id='settings-network-nat-rule22-source-select']
${selector_settings_network_nat_rule22_source_port_input}                       xpath=//input[@data-qa-id='settings-network-nat-rule22-source-port']
${selector_settings_network_nat_rule22_destination_address_input}               xpath=//input[@data-qa-id='settings-network-nat-rule22-destination-address']
${selector_settings_network_nat_rule22_destination_port_input}                  xpath=//input[@data-qa-id='settings-network-nat-rule22-destination-port']

${selector_settings_network_nat_rule22_firewall_private_address_checkbox}       xpath=//*[@data-qa-id='settings-network-nat-rule22-firewall-private-address']
${selector_settings_network_nat_rule22_firewall_address1_enable_checkbox}       xpath=//*[@data-qa-id='settings-network-nat-rule22-firewall-address1-enable']
${selector_settings_network-nat_rule22_firewall_address1_ip_input}              xpath=//input[@data-qa-id='settings-network-nat-rule22-firewall-address1-ip']
${selector_settings_network-nat_rule22_firewall_address1_mask_input}            xpath=//input[@data-qa-id='settings-network-nat-rule22-firewall-address1-mask']

${selector_settings_network-nat_rule22_firewall_address2_enable_checkbox}       xpath=//mat-checkbox[@data-qa-id='settings-network-nat-rule22-firewall-address2-enable']
${selector_settings_network-nat_rule22_firewall_address2_ip_input}              xpath=//input[@data-qa-id='settings-network-nat-rule22-firewall-address2-ip']
${selector_settings_network-nat_rule22_firewall_address2_mask_input}            xpath=//input[@data-qa-id='settings-network-nat-rule22-firewall-address2-mask']

${selector_settings_network-nat_rule22_firewall_address3_enable_checkbox}       xpath=//mat-checkbox[@data-qa-id='settings-network-nat-rule22-firewall-address3-enable']
${selector_settings_network-nat_rule22_firewall_address3_ip_input}              xpath=//input[@data-qa-id='settings-network-nat-rule22-firewall-address3-ip']
${selector_settings_network-nat_rule22_firewall_address3_mask_input}            xpath=//input[@data-qa-id='settings-network-nat-rule22-firewall-address3-mask']

${selector_settings_network_nat_rule23_source_select_ddwn}                      xpath=//select[@data-qa-id='settings-network-nat-rule23-source-select']
${selector_settings_network_nat_rule23_source_port_input}                       xpath=//input[@data-qa-id='settings-network-nat-rule23-source-port']
${selector_settings_network_nat_rule23_destination_address_input}               xpath=//input[@data-qa-id='settings-network-nat-rule23-destination-address']
${selector_settings_network_nat_rule23_destination_port_input}                  xpath=//input[@data-qa-id='settings-network-nat-rule23-destination-port']

${selector_settings_network_nat_rule23_firewall_private_address_checkbox}       xpath=//*[@data-qa-id='settings-network-nat-rule23-firewall-private-address']
${selector_settings_network_nat_rule23_firewall_address1_enable_checkbox}       xpath=//*[@data-qa-id='settings-network-nat-rule23-firewall-address1-enable']
${selector_settings_network-nat_rule23_firewall_address1_ip_input}              xpath=//input[@data-qa-id='settings-network-nat-rule23-firewall-address1-ip']
${selector_settings_network-nat_rule23_firewall_address1_mask_input}            xpath=//input[@data-qa-id='settings-network-nat-rule23-firewall-address1-mask']

${selector_settings_network-nat_rule23_firewall_address2_enable_checkbox}       xpath=//mat-checkbox[@data-qa-id='settings-network-nat-rule23-firewall-address2-enable']
${selector_settings_network-nat_rule23_firewall_address2_ip_input}              xpath=//input[@data-qa-id='settings-network-nat-rule23-firewall-address2-ip']
${selector_settings_network-nat_rule23_firewall_address2_mask_input}            xpath=//input[@data-qa-id='settings-network-nat-rule23-firewall-address2-mask']

${selector_settings_network-nat_rule23_firewall_address3_enable_checkbox}       xpath=//mat-checkbox[@data-qa-id='settings-network-nat-rule23-firewall-address3-enable']
${selector_settings_network-nat_rule23_firewall_address3_ip_input}              xpath=//input[@data-qa-id='settings-network-nat-rule23-firewall-address3-ip']
${selector_settings_network-nat_rule23_firewall_address3_mask_input}            xpath=//input[@data-qa-id='settings-network-nat-rule23-firewall-address3-mask']

${selector_settings_network_nat_rule24_source_select_ddwn}                      xpath=//select[@data-qa-id='settings-network-nat-rule24-source-select']
${selector_settings_network_nat_rule24_source_port_input}                       xpath=//input[@data-qa-id='settings-network-nat-rule24-source-port']
${selector_settings_network_nat_rule24_destination_address_input}               xpath=//input[@data-qa-id='settings-network-nat-rule24-destination-address']
${selector_settings_network_nat_rule24_destination_port_input}                  xpath=//input[@data-qa-id='settings-network-nat-rule24-destination-port']

${selector_settings_network_nat_rule24_firewall_private_address_checkbox}       xpath=//*[@data-qa-id='settings-network-nat-rule24-firewall-private-address']
${selector_settings_network_nat_rule24_firewall_address1_enable_checkbox}       xpath=//*[@data-qa-id='settings-network-nat-rule24-firewall-address1-enable']
${selector_settings_network_nat_rule24_firewall_address1_ip_input}              xpath=//input[@data-qa-id='settings-network-nat-rule24-firewall-address1-ip']
${selector_settings_network_nat_rule24_firewall_address1_mask_input}            xpath=//input[@data-qa-id='settings-network-nat-rule24-firewall-address1-mask']

${selector_settings_network_nat_rule24_firewall_address2_enable_checkbox}       xpath=//mat-checkbox[@data-qa-id='settings-network-nat-rule24-firewall-address2-enable']
${selector_settings_network_nat_rule24_firewall_address2_ip_input}              xpath=//input[@data-qa-id='settings-network-nat-rule24-firewall-address2-ip']
${selector_settings_network_nat_rule24_firewall_address2_mask_input}            xpath=//input[@data-qa-id='settings-network-nat-rule24-firewall-address2-mask']

${selector_settings_network_nat_rule24_firewall_address3_enable_checkbox}       xpath=//mat-checkbox[@data-qa-id='settings-network-nat-rule24-firewall-address3-enable']
${selector_settings_network_nat_rule24_firewall_address3_ip_input}              xpath=//input[@data-qa-id='settings-network-nat-rule24-firewall-address3-ip']
${selector_settings_network_nat_rule24_firewall_address3_mask_input}            xpath=//input[@data-qa-id='settings-network-nat-rule24-firewall-address3-mask']

${selector_settings_network_nat_rule25_source_select_ddwn}                      xpath=//select[@data-qa-id='settings-network-nat-rule25-source-select']
${selector_settings_network_nat_rule25_source_port_input}                       xpath=//input[@data-qa-id='settings-network-nat-rule25-source-port']
${selector_settings_network_nat_rule25_destination_address_input}               xpath=//input[@data-qa-id='settings-network-nat-rule25-destination-address']
${selector_settings_network_nat_rule25_destination_port_input}                  xpath=//input[@data-qa-id='settings-network-nat-rule25-destination-port']

${selector_settings_network_nat_rule25_firewall_private_address_checkbox}       xpath=//*[@data-qa-id='settings-network-nat-rule25-firewall-private-address']
${selector_settings_network_nat_rule25_firewall_address1_enable_checkbox}       xpath=//*[@data-qa-id='settings-network-nat-rule25-firewall-address1-enable']
${selector_settings_network-nat_rule25_firewall_address1_ip_input}              xpath=//input[@data-qa-id='settings-network-nat-rule25-firewall-address1-ip']
${selector_settings_network-nat_rule25_firewall_address1_mask_input}            xpath=//input[@data-qa-id='settings-network-nat-rule25-firewall-address1-mask']

${selector_settings_network-nat_rule25_firewall_address2_enable_checkbox}       xpath=//mat-checkbox[@data-qa-id='settings-network-nat-rule25-firewall-address2-enable']
${selector_settings_network-nat_rule25_firewall_address2_ip_input}              xpath=//input[@data-qa-id='settings-network-nat-rule25-firewall-address2-ip']
${selector_settings_network-nat_rule25_firewall_address2_mask_input}            xpath=//input[@data-qa-id='settings-network-nat-rule25-firewall-address2-mask']

${selector_settings_network-nat_rule25_firewall_address3_enable_checkbox}       xpath=//mat-checkbox[@data-qa-id='settings-network-nat-rule25-firewall-address3-enable']
${selector_settings_network-nat_rule25_firewall_address3_ip_input}              xpath=//input[@data-qa-id='settings-network-nat-rule25-firewall-address3-ip']
${selector_settings_network-nat_rule25_firewall_address3_mask_input}            xpath=//input[@data-qa-id='settings-network-nat-rule25-firewall-address3-mask']

${selector_settings_network_nat_rule26_source_select_ddwn}                      xpath=//select[@data-qa-id='settings-network-nat-rule26-source-select']
${selector_settings_network_nat_rule26_source_port_input}                       xpath=//input[@data-qa-id='settings-network-nat-rule26-source-port']
${selector_settings_network_nat_rule26_destination_address_input}               xpath=//input[@data-qa-id='settings-network-nat-rule26-destination-address']
${selector_settings_network_nat_rule26_destination_port_input}                  xpath=//input[@data-qa-id='settings-network-nat-rule26-destination-port']

${selector_settings_network_nat_rule26_firewall_private_address_checkbox}       xpath=//*[@data-qa-id='settings-network-nat-rule26-firewall-private-address']
${selector_settings_network_nat_rule26_firewall_address1_enable_checkbox}       xpath=//*[@data-qa-id='settings-network-nat-rule26-firewall-address1-enable']
${selector_settings_network-nat_rule26_firewall_address1_ip_input}              xpath=//input[@data-qa-id='settings-network-nat-rule26-firewall-address1-ip']
${selector_settings_network-nat_rule26_firewall_address1_mask_input}            xpath=//input[@data-qa-id='settings-network-nat-rule26-firewall-address1-mask']

${selector_settings_network-nat_rule26_firewall_address2_enable_checkbox}       xpath=//mat-checkbox[@data-qa-id='settings-network-nat-rule26-firewall-address2-enable']
${selector_settings_network-nat_rule26_firewall_address2_ip_input}              xpath=//input[@data-qa-id='settings-network-nat-rule26-firewall-address2-ip']
${selector_settings_network-nat_rule26_firewall_address2_mask_input}            xpath=//input[@data-qa-id='settings-network-nat-rule26-firewall-address2-mask']

${selector_settings_network-nat_rule26_firewall_address3_enable_checkbox}       xpath=//mat-checkbox[@data-qa-id='settings-network-nat-rule26-firewall-address3-enable']
${selector_settings_network-nat_rule26_firewall_address3_ip_input}              xpath=//input[@data-qa-id='settings-network-nat-rule26-firewall-address3-ip']
${selector_settings_network-nat_rule26_firewall_address3_mask_input}            xpath=//input[@data-qa-id='settings-network-nat-rule26-firewall-address3-mask']

${selector_settings_network_nat_rule27_source_select_ddwn}                      xpath=//select[@data-qa-id='settings-network-nat-rule27-source-select']
${selector_settings_network_nat_rule27_source_port_input}                       xpath=//input[@data-qa-id='settings-network-nat-rule27-source-port']
${selector_settings_network_nat_rule27_destination_address_input}               xpath=//input[@data-qa-id='settings-network-nat-rule27-destination-address']
${selector_settings_network_nat_rule27_destination_port_input}                  xpath=//input[@data-qa-id='settings-network-nat-rule27-destination-port']

${selector_settings_network_nat_rule27_firewall_private_address_checkbox}       xpath=//*[@data-qa-id='settings-network-nat-rule27-firewall-private-address']
${selector_settings_network_nat_rule27_firewall_address1_enable_checkbox}       xpath=//*[@data-qa-id='settings-network-nat-rule27-firewall-address1-enable']
${selector_settings_network_nat_rule27_firewall_address1_ip_input}              xpath=//input[@data-qa-id='settings-network-nat-rule27-firewall-address1-ip']
${selector_settings_network_nat_rule27_firewall_address1_mask_input}            xpath=//input[@data-qa-id='settings-network-nat-rule27-firewall-address1-mask']

${selector_settings_network_nat_rule27_firewall_address2_enable_checkbox}       xpath=//mat-checkbox[@data-qa-id='settings-network-nat-rule27-firewall-address2-enable']
${selector_settings_network_nat_rule27_firewall_address2_ip_input}              xpath=//input[@data-qa-id='settings-network-nat-rule27-firewall-address2-ip']
${selector_settings_network_nat_rule27_firewall_address2_mask_input}            xpath=//input[@data-qa-id='settings-network-nat-rule27-firewall-address2-mask']

${selector_settings_network_nat_rule27_firewall_address3_enable_checkbox}       xpath=//mat-checkbox[@data-qa-id='settings-network-nat-rule27-firewall-address3-enable']
${selector_settings_network_nat_rule27_firewall_address3_ip_input}              xpath=//input[@data-qa-id='settings-network-nat-rule27-firewall-address3-ip']
${selector_settings_network_nat_rule27_firewall_address3_mask_input}            xpath=//input[@data-qa-id='settings-network-nat-rule27-firewall-address3-mask']

${selector_settings_network_nat_rule28_source_select_ddwn}                      xpath=//select[@data-qa-id='settings-network-nat-rule28-source-select']
${selector_settings_network_nat_rule28_source_port_input}                       xpath=//input[@data-qa-id='settings-network-nat-rule28-source-port']
${selector_settings_network_nat_rule28_destination_address_input}               xpath=//input[@data-qa-id='settings-network-nat-rule28-destination-address']
${selector_settings_network_nat_rule28_destination_port_input}                  xpath=//input[@data-qa-id='settings-network-nat-rule28-destination-port']

${selector_settings_network_nat_rule28_firewall_private_address_checkbox}       xpath=//*[@data-qa-id='settings-network-nat-rule28-firewall-private-address']
${selector_settings_network_nat_rule28_firewall_address1_enable_checkbox}       xpath=//*[@data-qa-id='settings-network-nat-rule28-firewall-address1-enable']
${selector_settings_network-nat_rule28_firewall_address1_ip_input}              xpath=//input[@data-qa-id='settings-network-nat-rule28-firewall-address1-ip']
${selector_settings_network-nat_rule28_firewall_address1_mask_input}            xpath=//input[@data-qa-id='settings-network-nat-rule28-firewall-address1-mask']

${selector_settings_network-nat_rule28_firewall_address2_enable_checkbox}       xpath=//mat-checkbox[@data-qa-id='settings-network-nat-rule28-firewall-address2-enable']
${selector_settings_network-nat_rule28_firewall_address2_ip_input}              xpath=//input[@data-qa-id='settings-network-nat-rule28-firewall-address2-ip']
${selector_settings_network-nat_rule28_firewall_address2_mask_input}            xpath=//input[@data-qa-id='settings-network-nat-rule28-firewall-address2-mask']

${selector_settings_network-nat_rule28_firewall_address3_enable_checkbox}       xpath=//mat-checkbox[@data-qa-id='settings-network-nat-rule28-firewall-address3-enable']
${selector_settings_network-nat_rule28_firewall_address3_ip_input}              xpath=//input[@data-qa-id='settings-network-nat-rule28-firewall-address3-ip']
${selector_settings_network-nat_rule28_firewall_address3_mask_input}            xpath=//input[@data-qa-id='settings-network-nat-rule28-firewall-address3-mask']

${selector_settings_network_nat_rule29_source_select_ddwn}                      xpath=//select[@data-qa-id='settings-network-nat-rule29-source-select']
${selector_settings_network_nat_rule29_source_port_input}                       xpath=//input[@data-qa-id='settings-network-nat-rule29-source-port']
${selector_settings_network_nat_rule29_destination_address_input}               xpath=//input[@data-qa-id='settings-network-nat-rule29-destination-address']
${selector_settings_network_nat_rule29_destination_port_input}                  xpath=//input[@data-qa-id='settings-network-nat-rule29-destination-port']

${selector_settings_network_nat_rule29_firewall_private_address_checkbox}       xpath=//*[@data-qa-id='settings-network-nat-rule29-firewall-private-address']
${selector_settings_network_nat_rule29_firewall_address1_enable_checkbox}       xpath=//*[@data-qa-id='settings-network-nat-rule29-firewall-address1-enable']
${selector_settings_network_nat_rule29_firewall_address1_ip_input}              xpath=//input[@data-qa-id='settings-network-nat-rule29-firewall-address1-ip']
${selector_settings_network_nat_rule29_firewall_address1_mask_input}            xpath=//input[@data-qa-id='settings-network-nat-rule29-firewall-address1-mask']

${selector_settings_network_nat_rule29_firewall_address2_enable_checkbox}       xpath=//mat-checkbox[@data-qa-id='settings-network-nat-rule29-firewall-address2-enable']
${selector_settings_network_nat_rule29_firewall_address2_ip_input}              xpath=//input[@data-qa-id='settings-network-nat-rule29-firewall-address2-ip']
${selector_settings_network_nat_rule29_firewall_address2_mask_input}            xpath=//input[@data-qa-id='settings-network-nat-rule29-firewall-address2-mask']

${selector_settings_network_nat_rule29_firewall_address3_enable_checkbox}       xpath=//mat-checkbox[@data-qa-id='settings-network-nat-rule29-firewall-address3-enable']
${selector_settings_network_nat_rule29_firewall_address3_ip_input}              xpath=//input[@data-qa-id='settings-network-nat-rule29-firewall-address3-ip']
${selector_settings_network_nat_rule29_firewall_address3_mask_input}            xpath=//input[@data-qa-id='settings-network-nat-rule29-firewall-address3-mask']

${selector_settings_network_nat_save_active_btn}                                xpath=//button[@class='form_btn_save active']

# Webserver
${selector_settings_network_webserver_chkbx}                                    xpath=//div[@formgroupname='www']//span[text()='Webserver in use:']/following-sibling::mat-checkbox//input[@type='checkbox']
# Main PC server
${selector_settings_network_main_pc_server_chkbx}                               xpath=//div[@formgroupname='webVision']//span[text()='Main PC server in use']/following-sibling::mat-checkbox//input[@type='checkbox']
# Open pcs server
${selector_settings_network_open_pcs_server_chkbx}                              xpath=//div[@formgroupname='openpcs']//span[text()='Open pcs server']/following-sibling::mat-checkbox//input[@type='checkbox']
# Ping server
${selector_settings_network_ping_server_chkbx}                                  xpath=//div[@formgroupname='ping']//span[text()='Ping server in use']/following-sibling::mat-checkbox//input[@type='checkbox']
# SMTP server
${selector_settings_network_smtp_server_chkbx}                                  xpath=//div[@formgroupname='smtp']//span[text()='SMTP server in use :']/following-sibling::mat-checkbox//input[@type='checkbox']
# Maintenance server
${selector_settings_network_maintenance_server_chkbx}                           xpath=//div[@formgroupname='ftp']//span[text()='Maintenance server:']/following-sibling::mat-checkbox//input[@type='checkbox']
# Time server
${selector_settings_network_time_server_chkbx}                                  xpath=//div[@formgroupname='sntp']//span[text()='Time server']/following-sibling::mat-checkbox//input[@type='checkbox']
# Modbus server
${selector_settings_network_modbus_server_msg}                                  xpath=//div[@formgroupname='modbusTcpServer']//span[text()='Modbus server is not activated']

${selector_settings_network_firewall_webserver_chkbx}                           xpath=//div[@class='form_item']//span[text()='Webserver in use:']//input[@type='checkbox']

${selector_settings_network_nat_item}                                           xpath=//div[contains(@class, 'item_title') and contains(text(), 'Nat settings')]
${selector_settings_network_nat_header}                                         xpath=//span[contains(@aria-label, 'Settings') and contains(text(), 'Nat settings')]

${selector_settings_network_alarm_item}                                         xpath=//div[contains(@class, 'item_title') and contains(text(), 'Alarm email settings')]
${selector_settings_network_alarm_header}                                       xpath=//span[contains(@aria-label, 'Settings') and contains(text(), 'Nat settings')]

${selector_settings_network_history_item}                                       xpath=//div[contains(@class, 'item_title') and contains(text(), 'History settings')]
${selector_settings_network_history_header}                                     xpath=//span[contains(@aria-label, 'Settings') and contains(text(), 'History settings')]

${selector_settings_network_tosibox_item}                                       xpath=//div[contains(@class, 'item_title') and contains(text(), 'Tosibox Readiness')]
${selector_settings_network_tosibox_header}                                     xpath=//span[contains(@aria-label, 'Settings') and contains(text(), 'Tosibox Readiness')]

${selector_settings_user_usergroups_item}                                       xpath=//div[contains(@class, 'item_title') and text()=' User groups ']
${selector_settings_user_usergroups_header}                                     xpath=//div[contains(@class, 'edit_title') and text()='User groups']

${selector_settings_user_users_item}                                            xpath=//div[contains(@class, 'item_title') and text()=' Users ']
${selector_settings_user_user_header}                                           xpath=//div[contains(@class, 'edit_title') and text()='Users']

${selector_settings_network_history_save_sql_chkbx}                             xpath=//mat-checkbox[@formcontrolname='enabled']/input[@type='checkbox']
${selector_settings_network_history_username_input}                             xpath=//input[@formcontrolname='username']
${selector_settings_network_history_password_input}                             xpath=//input[@formcontrolname='password']
${selector_settings_network_history_ip_address_input}                           xpath=//input[@formcontrolname='ipAddress']
${selector_settings_network_history_ip_port_input}                              xpath=//input[@formcontrolname='ipPort']
${selector_settings_network_history_timeout_input}                              xpath=//input[@formcontrolname='timeout']
${selector_settings_network_history_databaseName_input}                         xpath=//input[@formcontrolname='databaseName']
${selector_settings_network_history_databaseUrl_input}                          xpath=//input[@formcontrolname='databaseUrl']
${selector_settings_network_history_saveMode_ddwn}                              xpath=//select[@formcontrolname='saveMode']

${selector_settings_network_tosibox_activation_input}                           xpath=//input[@formcontrolname='activationKey']
${selector_settings_network_tosibox_netmap_input}                               xpath=//input[@formcontrolname='netmapAddress']
${selector_settings_network_tosibox_btn}                                        xpath=//button[@class='form_btn_save active']

${selector_settings_user_users_user_x_cell}                                     xpath=//tr[contains(@class, 'settings-table-row')]/td[text()='X']
${selector_settings_user_users_edit_btn}                                        xpath=//button[@class='form_btn_save active' and text()=' Edit ']
${selector_settings_user_users_remove_btn}                                      xpath=//button[@class='form_btn_save active' and text()=' Remove ']
${selector_settings_user_users_add_btn}                                         xpath=//button[contains(@class, 'form_btn_save') and contains(text(), ' Add user ')]

${selector_settings_user_users_edit_form}                                       xpath=//div[contains(@class, 'user_info_title') and text()=' User details ']
${selector_settings_user_users_edit_username_input}                             xpath=//input[@id='userName' and @name='userName' and contains(@class, 'form_input')]
${selector_settings_user_users_edit_update_pass_chkbx}                          xpath=//mat-checkbox[contains(@id, 'checkbox')][contains(@id, 'updatePassword')]
${selector_settings_user_users_edit_password_input}                             xpath=//input[@type='password' and contains(@id, 'passwd')]
${selector_settings_user_users_edit_usergroup_ddwn}                             xpath=//select[@name='userGroup']
${selector_settings_user_users_edit_startpage_ddwn}                             xpath=//select[@name='startPicture']
${selector_settings_user_users_edit_synchro_chkbx}                              xpath=//mat-checkbox[@name='synchronize']
${selector_settings_user_users_edit_save_btn}                                   xpath=//button[@type='submit' and contains(@class, 'form_btn_save') and contains(@class, 'active')]/span[text()='Save']
${selector_settings_user_users_edit_cancel_btn}                                 xpath=//button[contains(@class, 'form_btn_cancel')]

${selector_settings_user_users_new_user_form}                                   xpath=//div[contains(@class, 'dialog_header') and contains(@class, 'dialog_title') and contains(string(), 'Create new') and contains(string(), 'User')]
${selector_settings_user_users_new_user_username_input}                         xpath=//input[@id='userName' and @name='userName' and @required='']
${selector_settings_user_users_new_user_password_input}                         xpath=//input[@name='passwd']
${selector_settings_user_users_new_user_group_ddwn}                             xpath=//select[@name='userGroup']
${selector_settings_user_users_new_user_startpage_ddwn}                         xpath=//select[@name='startPicture']
${selector_settings_user_users_new_user_synchro_chkbx}                          xpath=//mat-checkbox[@name='synchronize']# xpath=//button[contains(text(), ' Add ')]
${selector_settings_user_users_new_user_add_btn}                                xpath=//button[@class='form_btn_save ng-star-inserted active']
${selector_settings_user_users_new_user_cancel_btn}                             xpath=//button[@class='form_btn_cancel']

${selector_settings_user_users_remove_user_form}                                xpath=//div[contains(@class, 'dialog_title') and text()='Remove user']
${selector_settings_user_users_remove_user_remove_btn}                          xpath=//button[contains(@class, 'form_btn_save active') and contains(string(), 'Remove')]
${selector_settings_user_users_remove_user_cancel_btn}                          xpath=//button[@class='form_btn_cancel']

${selector_settings_user_usergroups_add_usergroup_btn}                          xpath=//button[contains(@class, 'form_btn_save') and contains(@class, 'active') and contains(text(), 'Add user group')]
${selector_settings_user_usergroups_remove_btn}                                 xpath=//button[contains(@class, 'form_btn_save') and contains(@class, 'active') and contains(text(), 'Remove')]
${selector_settings_user_usergroups_edit_btn}                                   xpath=//button[contains(@class, 'form_btn_save') and contains(@class, 'active') and contains(text(), 'Edit')]

${selector_settings_user_usergroups_add_form}                                   xpath=//div[@class='dialog_title']/span[contains(@class, 'ng-star-inserted') and text()='User group']
${selector_settings_user_usergroups_add_form_name_input}                        xpath=//input[@id='userGroupName']
${selector_settings_user_usergroups_add_form_level_input}                       xpath=//input[@name='userLevel' and @id='userLevel' and @type='number']
${selector_settings_user_usergroups_add_form_synchro_chkbx}                     xpath=//mat-checkbox[@name='synchronize']
${selector_settings_user_usergroups_add_form_viewing_chkbx}                     xpath=//div[contains(@class, 'form_item')]//span[contains(@class, 'user_info_title') and text()='Viewing rights']/following-sibling::mat-checkbox
${selector_settings_user_usergroups_add_form_graphics_chkbx}                    xpath=//div[contains(@class, 'form_item')]//span[contains(@class, 'form_item_description') and text()='Graphics:']/following-sibling::mat-checkbox

${selector_settings_user_usergroups_add_form_add_btn}                           xpath=//div[contains(@class, 'button_row')]//button[contains(@class, 'form_btn_save') and text()=' Add ']
${selector_settings_user_usergroups_add_form_cancel_btn}                        xpath=//button[contains(@class, 'form_btn_cancel') and text()='Cancel']

${selector_settings_user_usergroups_newgroup_cell}                              xpath=//tr[contains(@class, 'settings-table-row')]/td[text()='NEWGROUP']

${selector_settings_user_usergroups_remove_form}                                xpath=//div[contains(@class, 'dialog_title') and text()='Remove user group']
${selector_settings_user_usergroups_remove_form_remove_btn}                     xpath=//button[@class='form_btn_save active' and text()=' Remove ']
