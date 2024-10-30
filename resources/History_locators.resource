*** Settings ***
Library     Browser
Resource    navigate.resource
Resource    login.resource


*** Variables ***
${selector_history_header}                                              xpath=//div[@class='history_toolbar_title']
${selector_history_points_btn}                                          xpath=//button[@id='open_history']
${selector_history_addgroup_btn}                                        xpath=//button[contains(@class, 'btn') and .//mat-icon[@svgicon='icon-add']]

${selector_history_pointsettings_form}                                  xpath=//span[contains(@class, 'ng-star-inserted') and contains(text(), 'Point settings')]
${selector_history_pointsettings_form_close_icon}                       xpath=//mat-icon[contains(@class, 'mat-icon') and contains(@class, 'close_icon') and contains(@class, 'icon-delete-x') and contains(@ngcontent-xds-c265, 'svgicon="icon-delete-x"')]

${selector_history_pointsettings_form_allpoints_btn}                    xpath=//div[contains(@class, 'tab_item') and contains(text(), 'All points')]
${selector_history_pointsettings_form_histpoints_btn}                   xpath=//div[contains(@class, 'tab_item') and contains(text(), 'HISTORY.HISTORY_POINTS')]

${selector_history_pointsettings_form_close_btn}                        xpath=//mat-icon[@svgicon="icon-delete-x" and contains(@class, "close_icon")]

${selector_history_pointsettings_form_allpoints_search_input}           xpath=//input[@type='text' and @label='search points']
${selector_history_pointsettings_form_allpoints_add_btn}                xpath=//button[contains(@class, 'btn') and contains(@class, 'active')]//mat-icon[contains(@class, 'point_settings_icon')]
${selector_history_pointsettings_form_histpoints_cancel_btn}            xpath=//button[contains(@class, 'btn') and contains(@class, 'cancel')]
${selector_history_pointsettings_form_histpoints_save_btn}              xpath=//button[contains(@class, 'btn') and contains(@class, 'active') and normalize-space(text())='Save']

${selector_history_pointsettings_form_histpoints_close_btn}             xpath=//button[contains(@class, 'btn') and contains(@class, 'round_btn') and contains(@class, 'ng-star-inserted')]/mat-icon[@svgicon='icon-delete-x']
${selector_history_pointsettings_form_histpoints_remove_btn}            xpath=//button[contains(@class, 'btn') and contains(@class, 'round_btn')]/mat-icon[@svgicon='remove-icon']

${selector_history_pointsettings_form_histpoints_remove_form}           xpath=//div[@class="dialog_title" and text()="Remove history point"]

${selector_history_pointsettings_form_histpoints_remove_cancel_btn}     xpath=//button[@class="form_btn_cancel"]
${selector_history_pointsettings_form_histpoints_remove_delete_btn}     xpath=//button[@class="form_btn_save active"]

${selector_history_pointsettings_form_tolerance_input}                  xpath=//input[@formcontrolname='tolerance']
${selector_history_pointsettings_form_sampleCount_input}                xpath=//input[@formcontrolname='sampleCount']
${selector_history_pointsettings_form_sampleTime_input}                 xpath=//input[@formcontrolname='samplingRate']

${selector_history_pointsettings_form_sampleTime_ddwn}                  xpath=//select[@formcontrolname='samplingRateUnit']
${selector_history_pointsettings_form_recording_chkbx}                  xpath=//div[@class='detail_item']//mat-checkbox[@formcontrolname='enable']
${selector_history_pointsettings_form_energy_ddwn}                      xpath=//select[contains(@class, 'form_select') and contains(@formcontrolname, 'pointType')]

${selector_history_pointsettings_form_histpoints_remove_form}           xpath=//div[contains(@class, 'dialog_header')]/mat-icon[contains(@class, 'close_icon') and @svgicon='icon-delete-x']
${selector_history_pointsettings_form_histpoints_delete_btn}            xpath=//button[contains(text(), ' Delete ')]
${selector_history_pointsettings_form_histpoints_edit_btn}              xpath=//button[contains(@class, 'round_btn') and .//mat-icon[contains(@svgicon, 'icon-automation-edit')]]
${selector_history_pointsettings_form_histpoints_cancel_form}           xpath=//button[contains(@class, 'form_btn_cancel')]
${selector_history_pointsettings_form_histpoints_edit_icon}             xpath=//button[contains(@class, 'btn') and contains(@class, 'round_btn') and .//mat-icon[contains(@class, 'mat-icon') and contains(@class, 'point_settings_icon') and contains(@class, 'icon-automation-edit')]]

${selector_group_settings_from_name_input}                              xpath=//input[@formcontrolname='groupId']
${selector_group_settings_form_header}                                  xpath=//span[text()='Group settings']
${selector_group_settings_form_timeSpan_input}                          xpath=//input[@formcontrolname='timeSpan']
${selector_group_settings_form_timeUnit_ddwn}                           xpath=//select[@formcontrolname='timeUnit']
${selector_group_settings_form_sampleCount_input}                       xpath=//input[@formcontrolname='sampleCount']

${selector_group_settings_form_email_chkbx}                             xpath=//div[@class="mdc-checkbox"]/input[@type="checkbox"]

${selector_group_settings_form_server_ddwn}                             xpath=//select[@formcontrolname='emailServer']

${selector_group_settings_form_emailAddress_input}                      xpath=//input[@formcontrolname='emailAddress']
${selector_group_settings_form_emailTimeSpan_ddwn}                      xpath=//select[@formcontrolname='emailTimeSpan']
${selector_group_settings_form_emailSamplesDay_input}                   xpath=//input[@formcontrolname='emailSamplesDay']

${selector_group_settings_form_addgroup_btn}                            xpath=//button[@class='btn ng-star-inserted active' and contains(text(), 'Add group')]

${selector_group_settings_form_cancel_btn}                              xpath=//button[contains(@class, 'btn') and contains(@class, 'btn_cancel') and text()='Cancel']
${selector_group_settings_form_point_settings_btn}                      xpath=//button[.//span[text()='Group point settings']]

${selector_group_settings_form_point_settings_header}                   xpath=//span[contains(@class, 'ng-star-inserted') and text()='Group settings']

${selector_group_settings_form_point_settings_plus_btn}                 xpath=//button[contains(@class, 'btn') and contains(@class, 'round_btn') and contains(@class, 'ng-star-inserted') and mat-icon[@svgicon='icon-add']]
${selector_group_settings_form_point_settings_minus_btn}                xpath=//button[contains(@class, 'btn') and contains(@class, 'round_btn') and mat-icon[@svgicon='remove-line-icon']]

${selector_group_settings_form_point_settings_save_btn}                 xpath=//button[@class='btn active' and contains(text(), 'Save')]
${selector_group_settings_form_point_settings_cancel_btn}               xpath=//div[contains(@class, 'button_row')]//button[contains(@class, 'btn') and contains(@class, 'cancel') and text()='Cancel']

${selector_group_delete_btn}                                            xpath=//button[@class='button cancel' and .//span[text()=' Remove ']]
# xpath=//span[@class='text ng-star-inserted' and contains(text(), 'Delete group')]
${selector_group_edit_btn}                                              xpath=//button[@class='button active']//span[@class='text' and contains(text(), 'Edit')]
${selector_group_fullscreen_btn}                                        xpath=//button[@class='button active']//span[@class='text' and contains(text(), 'Fullscreen')]

${selector_remove_group_form_header}                                    xpath=//button[@class='button cancel' and .//span[text()=' Remove ']]
# //div[@class='dialog_title' and contains(text(), 'Remove History group')]
${selector_remove_group_form_delete_btn}                                xpath=//button[@class='form_btn_save active' and contains(text(), 'Delete')]
${selector_remove_group_form_cancel_btn}                                xpath=//button[@class='form_btn_cancel' and @type='button' and contains(text(), 'Cancel')]
${selector_remove_group_form_close_btn}                                 xpath=//mat-icon[@class='mat-icon notranslate close_icon mat-icon-no-color' and @role='img' and @svgicon='icon-delete-x']

${selector_group_card}                                                  xpath=//div[contains(@class, 'card_title') and text()='TE']
