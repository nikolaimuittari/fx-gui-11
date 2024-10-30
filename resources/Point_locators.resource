*** Settings ***
Library     Browser
Resource    navigate.resource
Resource    login.resource
Resource    global_variables.resource


*** Variables ***
${selector_automation_print}                                            xpath=//*[@svgicon="print-icon"]

${selector_automation_addnew}                                           xpath=//*[@svgicon="icon-add"]
${selector_automation_remove}                                           xpath=//*[@svgicon="remove-icon"]
${selector_automation_delete_form}                                      xpath=//div[contains(@class, 'dialog_header')]//div[contains(@class, 'dialog_title')]

${selector_automation_delete_form_delete_button}                        css=button.form_btn_save.active

${selector_point_create_new_point_form}                                 xpath=//span[text()='Create new point']
${selector_point_create_new_form}                                       xpath=//*[@class="dialog"]
${selector_create_form_pointname}                                       xpath=//*[@id="pointId"]
${selector_create_form_description}                                     xpath=//*[@id="pointDescription"]

${selector_create_form_level_view}                                      xpath=//*[@name="view"]
${selector_create_form_level_manual}                                    xpath=//*[@name="manual"]
${selector_create_form_level_programming}                               xpath=//*[@name="programming"]

${selector_create_form_type_local}                                      xpath=//span[contains(@class, 'wizard_list_item') and text()='Local']
${selector_create_form_type_global}                                     xpath=//span[contains(@class, 'wizard_list_item') and text()='Global']

${selector_create_form_module_port}                                     xpath=//input[@name="port"]
${selector_create_form_module_address}                                  xpath=//input[@name="modNumber"]
${selector_create_form_module_pointnr}                                  xpath=//input[@name="modPoint"]
${selector_create_form_module_details}                                  xpath=//*[@class="link_icon"]

${selector_module_details_form}                                         xpath=//*[contains(normalize-space(text()), "Module details")]

${selector_create_form_cancel}                                          xpath=//*[@class="aut_btn_cancel"]
${selector_create_form_close}                                           xpath=//*[@svgicon="icon-delete-x"]

${selector_create_form_picture}                                         xpath=//mat-select[@name="picture"]

${selector_create_form_add_active}                                      xpath=//button[@class='aut_btn ng-star-inserted active']//span[text()='Add']
${selector_point_list_pointname_header}                                 xpath=//th[text()='Pointname']

### AO point
${selector_AO_create_form_module_port}                                  xpath=//*[@name="port"]
${selector_AO_create_form_module_address}                               xpath=//*[@name="modNumber"]
${selector_AO_create_form_module_details}                               xpath=//*[@class="link_icon"]

${selector_module_details_form}                                         xpath=//*[contains(normalize-space(text()), "Module details")]

${selector_AO_create_form_module_details_form_close_icon}               xpath=//*[@svgicon="icon-delete-x"]
${selector_AO_create_form_module_details_form_clear}                    xpath=//*[@class="edit_buttons]//div[contains(normalize-space(text()), "Clear")]

${selector_AO_create_form_module_details_form_choose}                   xpath=//*[@class="edit_buttons"]//div[contains(normalize-space(text()), "Choose")]
${selector_AO_create_form_module_details_form_cancel}                   xpath=//*[@class="aut_btn_cancel" and contains(normalize-space(text()), "Cancel")]

${selector_AO_create_form_module_pointnr}                               xpath=//input[@name="modPoint"]

${selector_AO_create_form_minVoltage_input}                             xpath=//input[@name="minVoltage"]
${selector_AO_create_form_maxVoltage_input}                             xpath=//input[@name="maxVoltage"]

${selector_AO_create_form_old_value_btn}                                xpath=//span[contains(@class, 'wizard_list_item') and text()='Old value']
${selector_AO_create_form_fixed_btn}                                    xpath=//span[contains(@class, 'wizard_list_item') and text()='Fixed']

${selector_AO_create_form_tolerance_input}                              xpath=//input[@name="tolerance"]
${selector_AO_create_form_sampleSpace_input}                            xpath=//input[@name="sampleSpace"]

${selector_AO_create_form_picture}                                      xpath=//mat-select[@name="picture"]

${selector_AO_create_form_cancel}                                       xpath=//*[@class="aut_btn_cancel"]
${selector_AO_create_form_close}                                        xpath=//*[@svgicon="icon-delete-x"]

${selector_AO_point_list_pointname_header}                              xpath=//th[@class='col-l ng-star-inserted' and text()='Pointname']

### State Text
${selector_point_create_new_State_Text_form}                            xpath=//span[text()='Create new state text']
${selector_State_Text_create_form_pointname_input}                      xpath=//input[@formcontrolname='name']

${selector_State_Text_create_form_synchro_chbx}                         xpath=//mat-checkbox[@formcontrolname='synchronize']

${selector_State_Text_create_form_name1_input}                          xpath=//input[@formcontrolname='value']
${selector_State_Text_create_form_value1_input}                         xpath=//input[@formcontrolname='text']

${selector_State_Text_create_form_dialog1_input}                        xpath=//mat-checkbox[@formcontrolname='dialog']

${selector_State_Text_create_form_remove1_input}                        xpath=//button[@class='mat-focus-indicator button remove_button mat-button mat-button-base ng-star-inserted']

${selector_State_Text_create_form_add2_input}                           xpath=//button[@class='mat-focus-indicator button mat-button mat-button-base ng-star-inserted']/span[text()='Add']

${selector_AO_create_form_picture}                                      xpath=//mat-select[@name="picture"]

${selector_AO_create_form_cancel}                                       xpath=//*[@class="aut_btn_cancel"]
${selector_AO_create_form_close}                                        xpath=//*[@svgicon="icon-delete-x"]

${selector_point_list_State_Text_pointname_header}                      xpath=//td[contains(text(), 'Name')]

### AI
${AI_point_create_new_form}                                             xpath=//*[@class="dialog"]
${selector_AI_create_form_pointname}                                    xpath=//*[@id="pointId"]
${selector_AI_create_form_description}                                  xpath=//*[@id="pointDescription"]

${selector_AI_create_form_level_view}                                   xpath=//*[@name="view"]
${selector_AI_create_form_level_manual}                                 xpath=//*[@name="manual"]
${selector_AI_create_form_level_programming}                            xpath=//*[@name="programming"]
${selector_AI_create_form_type_local}                                   xpath=//span[contains(@class, "wizard_list_item") and text()="Local"]
${selector_AI_create_form_type_global}                                  xpath=//span[contains(@class, "wizard_list_item") and text()="Global"]

${selector_AI_create_form_setpoint_chkbx}                               xpath=//mat-checkbox[@name="setpoint"]
${selector_AI_create_form_decimal_input_down}                           xpath=//input[@name="decimal"]/following-sibling::button[@aria-label="Decrement"]

${selector_AI_create_form_analog_btn}                                   xpath=//div[@class="wizard_list"]//span[text()="Analog"]
${selector_AI_create_form_counter_btn}                                  xpath=//div[@class="wizard_list"]//span[text()="Counter"]

${selector_AI_create_form_module_details_form_close_icon}               xpath=//*[@svgicon="icon-delete-x"]
${selector_AI_create_form_module_details_form_clear}                    xpath=//*[@class="edit_buttons]//div[contains(normalize-space(text()), "Clear")]

${selector_AI_create_form_module_details_form_choose}                   xpath=//*[@class="edit_buttons"]//div[contains(normalize-space(text()), "Choose")]
${selector_AI_create_form_module_details_form_cancel}                   xpath=//*[@class="aut_btn_cancel" and contains(normalize-space(text()), "Cancel")]

${selector_AI_create_form_decimal_input}                                xpath=//input[@name="decimal"]
${selector_AI_create_form_unit_input}                                   xpath=//input[@name="unit"]
${selector_AI_create_form_tolerance_input}                              xpath=//input[@name="tolerance"]
${selector_AI_create_form_sampletime_input}                             xpath=//input[@name="sampleSpace"]
${selector_AI_create_form_convtable_ddwn}                               xpath=//mat-select[@name="conversionTable"]

${selector_AI_create_form_offset_input}                                 xpath=//input[@name="offset"]
${selector_AI_create_form_timeconstant_input}                           xpath=//input[@name="timeConstant"]
${selector_AI_create_form_runtime}                                      xpath=//input[@name="runTimePointId"]

${selector_AI_create_form_limitName1_input}                             xpath=//input[@name="limitName1"]
${selector_AI_create_form_limitValue1_input}                            xpath=//input[@name="limitValue1"]
${selector_AI_create_form_limitLockState1_chkbx}                        xpath=//mat-checkbox[@ng-reflect-name="limitLockstate1"]
${selector_AI_create_form_limitSetPoint1_chkbx}                         xpath=//mat-checkbox[@ng-reflect-name="limitSetPoint1"]

${selector_AI_create_form_limitName2_input}                             xpath=//input[@name="limitName2"]
${selector_AI_create_form_limitValue2_input}                            xpath=//input[@name="limitValue2"]
${selector_AI_create_form_limitLockState2_chkbx}                        xpath=//mat-checkbox[@name="limitLockstate2"]
${selector_AI_create_form_limitSetPoint2_chkbx}                         xpath=//mat-checkbox[@name="limitSetPoint2"]

${selector_AI_create_form_limitName3_input}                             xpath=//input[@name="limitName3"]
${selector_AI_create_form_limitValue3_input}                            xpath=//input[@name="limitValue3"]
${selector_AI_create_form_limitLockState3_chkbx}                        xpath=//mat-checkbox[@name="limitLockstate3"]
${selector_AI_create_form_limitSetPoint3_chkbx}                         xpath=//mat-checkbox[@name="limitSetPoint3"]

${selector_AI_create_form_limitName4_input}                             xpath=//input[@name="limitName4"]
${selector_AI_create_form_limitValue4_input}                            xpath=//input[@name="limitValue4"]
${selector_AI_create_form_limitLockState4_chkbx}                        xpath=//mat-checkbox[@name="limitLockstate4"]
${selector_AI_create_form_limitSetPoint4_chkbx}                         xpath=//mat-checkbox[@name="limitSetPoint4"]

${selector_AI_create_form_limitName5_input}                             xpath=//input[@name="limitName5"]
${selector_AI_create_form_limitValue5_input}                            xpath=//input[@name="limitValue5"]
${selector_AI_create_form_limitLockState5_chkbx}                        xpath=//mat-checkbox[@name="limitLockstate5"]
${selector_AI_create_form_limitSetPoint5_chkbx}                         xpath=//mat-checkbox[@name="limitSetPoint5"]

${selector_AI_create_form_limitName6_input}                             xpath=//input[@name="limitName6"]
${selector_AI_create_form_limitValue6_input}                            xpath=//input[@name="limitValue6"]
${selector_AI_create_form_limitLockState6_chkbx}                        xpath=//mat-checkbox[@name="limitLockstate6"]
${selector_AI_create_form_limitSetPoint6_chkbx}                         xpath=//mat-checkbox[@name="limitSetPoint6"]

${selector_AI_create_form_limitName7_input}                             xpath=//input[@name="limitName7"]
${selector_AI_create_form_limitValue7_input}                            xpath=//input[@name="limitValue7"]
${selector_AI_create_form_limitLockState7_chkbx}                        xpath=//mat-checkbox[@name="limitLockstate7"]
${selector_AI_create_form_limitSetPoint7_chkbx}                         xpath=//mat-checkbox[@name="limitSetPoint7"]

${selector_AI_create_form_limitName8_input}                             xpath=//input[@name="limitName8"]
${selector_AI_create_form_limitValue8_input}                            xpath=//input[@name="limitValue8"]
${selector_AI_create_form_limitLockState8_chkbx}                        xpath=//mat-checkbox[@name="limitLockstate8"]
${selector_AI_create_form_limitSetPoint8_chkbx}                         xpath=//mat-checkbox[@name="limitSetPoint8"]

${selector_AI_create_form_limitMaxValue7_chkbx}                         xpath=//mat-checkbox[@name="limitMaxValue7"]

${selector_AI_create_form_limitMinValue8_chkbx}                         xpath=//mat-checkbox[@name="limitMinValue8"]

${selector_point_list_AI_pointname_header}                              xpath=//th[@class="col-l ng-star-inserted" and text()="Pointname"]

### Control Point
${selector_CP_create_form_main_and_type_btn}                            xpath=//span[text()='Main and type']

${selector_CP_create_form_main_measurement_input}                       xpath=//input[@name='mainMeasurementId']
${selector_CP_create_form_outdoor_measurement_input}                    xpath=//input[@name='outdoorMeasurementId']

${selector_create_new_CP_form}                                          xpath=//div[contains(@class, 'mat-dialog-content')]

${selector_CP_create_form_constant_set_btn}                             xpath=//div[@class='select_item' and contains(text(), 'Constant set value')]
${selector_CP_create_form_cascade_control_btn}                          xpath=//div[@class='select_item' and contains(text(), 'Cascade control')]
${selector_CP_create_form_cascadePointId_input}                         xpath=//input[@name='cascadePointId']
${selector_CP_create_form_cascadeStage_input}                           xpath=//input[@name='cascadeStage']

${selector_CP_create_form_compensation_control_btn}                     xpath=//div[@class='select_item' and contains(text(), 'Compensation control')]
${selector_CP_create_form_lookupTableId_input}                          xpath=//input[@name='lookupTableId']
${selector_CP_create_form_compensationPointId_input}                    xpath=//input[@name='compensationPointId']

${selector_CP_create_form_default_value_input}                          xpath=//input[@name="defaultSetting"]
${selector_CP_create_form_copy_manual_default_chkbx}                    xpath=//mat-checkbox[@name="copyManualValueToDefault"]

${selector_CP_create_form_basic_settings_btn}                           xpath=//span[text()='Basic settings']
${selector_CP_create_form_indicationId_input}                           xpath=//input[@name='indicationId']
${selector_CP_create_form_decimal_input}                                xpath=//input[@name="decimal"]
${selector_CP_create_form_unit_input}                                   xpath=//input[@name="unit"]
${selector_CP_create_form_statetext_ddwn}                               xpath=//mat-select[@name="stateText"]
${selector_CP_create_form_picture_ddwn}                                 xpath=//mat-select[@name="picture"]
${selector_CP_create_form_control_mode_ddwn}                            xpath=//mat-select[@name='controlMode']
${selector_CP_create_form_slowSpeedFactor_input}                        xpath=//input[@name='slowSpeedFactor']
${selector_CP_create_form_integrationTime_input}                        xpath=//input[@name='integrationTime']
${selector_CP_create_form_integrationSensitivity_input}                 xpath=//input[@name='integrationSensitivity']
${selector_CP_create_form_coolingDeadZone_input}                        xpath=//input[@name='coolingDeadZone']
${selector_CP_create_form_sampleTime_input}                             xpath=//input[@name='sampleTime']
${selector_CP_create_form_stageNumber_input}                            xpath=//input[@name='stageNumber']
${selector_CP_create_form_stageValue_input}                             xpath=//input[@name='stageValue']

${selector_CP_create_form_control_stages_btn}                           xpath=//span[text()='Control stages']
${selector_CP_create_form_stageCount_input}                             xpath=//input[@name='stageCount']

${selector_CP_create_form_stage0Name_input}                             xpath=//input[@name='stage0Name']
${selector_CP_create_form_stage0PBand_input}                            xpath=//input[@name='stage0PBand']
${selector_CP_create_form_stage0PType_input}                            xpath=//input[@name='stage0PType']
${selector_CP_create_form_stage0OutdoorLimitationLimit_input}           xpath=//input[@name='stage0OutdoorLimitationLimit']
${selector_CP_create_form_stage0OutdoorLimitationPBand_input}           xpath=//input[@name='stage0OutdoorLimitationPBand']
${selector_CP_create_stage0OutputMin_input}                             xpath=//input[@name='stage0OutputMin']
${selector_CP_create_stage0OutputMax_input}                             xpath=//input[@name='stage0OutputMax']
${selector_CP_create_stage0OutputIdleValue_input}                       xpath=//input[@name='stage0OutputIdleValue']
${selector_CP_create_stage0OutputPointId_input}                         xpath=//input[@name='stage0OutputPointId']
${selector_CP_create_stage0LimitPointId_input}                          xpath=//input[@name='stage0LimitPointId']
${selector_CP_create_stage0LimitLimitValue_input}                       xpath=//input[@name='stage0LimitLimitValue']
${selector_CP_create_stage0LimitPBand_input}                            xpath=//input[@name='stage0LimitPBand']

${selector_CP_create_form_stage1Name_input}                             xpath=//input[@name='stage1Name']
${selector_CP_create_form_stage1PBand_input}                            xpath=//input[@name='stage1PBand']
${selector_CP_create_form_stage1PType_input}                            xpath=//input[@name='stage1PType']
${selector_CP_create_form_stage1OutdoorLimitationLimit_input}           xpath=//input[@name='stage1OutdoorLimitationLimit']
${selector_CP_create_form_stage1OutdoorLimitationPBand_input}           xpath=//input[@name='stage1OutdoorLimitationPBand']
${selector_CP_create_stage1OutputMin_input}                             xpath=//input[@name='stage1OutputMin']
${selector_CP_create_stage1OutputMax_input}                             xpath=//input[@name='stage1OutputMax']
${selector_CP_create_stage1OutputIdleValue_input}                       xpath=//input[@name='stage1OutputIdleValue']
${selector_CP_create_stage1OutputPointId_input}                         xpath=//input[@name='stage1OutputPointId']
${selector_CP_create_stage1LimitPointId_input}                          xpath=//input[@name='stage1LimitPointId']
${selector_CP_create_stage1LimitLimitValue_input}                       xpath=//input[@name='stage1LimitLimitValue']
${selector_CP_create_stage1LimitPBand_input}                            xpath=//input[@name='stage1LimitPBand']

${selector_CP_create_form_stage2Name_input}                             xpath=//input[@name='stage2Name']
${selector_CP_create_form_stage2PBand_input}                            xpath=//input[@name='stage2PBand']
${selector_CP_create_form_stage2PType_input}                            xpath=//input[@name='stage2PType']
${selector_CP_create_form_stage2OutdoorLimitationLimit_input}           xpath=//input[@name='stage2OutdoorLimitationLimit']
${selector_CP_create_form_stage2OutdoorLimitationPBand_input}           xpath=//input[@name='stage2OutdoorLimitationPBand']
${selector_CP_create_stage2OutputMin_input}                             xpath=//input[@name='stage2OutputMin']
${selector_CP_create_stage2OutputMax_input}                             xpath=//input[@name='stage2OutputMax']
${selector_CP_create_stage2OutputIdleValue_input}                       xpath=//input[@name='stage2OutputIdleValue']
${selector_CP_create_stage2OutputPointId_input}                         xpath=//input[@name='stage2OutputPointId']
${selector_CP_create_stage2LimitPointId_input}                          xpath=//input[@name='stage2LimitPointId']
${selector_CP_create_stage2LimitLimitValue_input}                       xpath=//input[@name='stage2LimitLimitValue']
${selector_CP_create_stage2LimitPBand_input}                            xpath=//input[@name='stage2LimitPBand']

${selector_CP_create_form_stage3Name_input}                             xpath=//input[@name='stage3Name']
${selector_CP_create_form_stage3PBand_input}                            xpath=//input[@name='stage3PBand']
${selector_CP_create_form_stage3PType_input}                            xpath=//input[@name='stage3PType']
${selector_CP_create_form_stage3OutdoorLimitationLimit_input}           xpath=//input[@name='stage3OutdoorLimitationLimit']
${selector_CP_create_form_stage3OutdoorLimitationPBand_input}           xpath=//input[@name='stage3OutdoorLimitationPBand']
${selector_CP_create_stage3OutputMin_input}                             xpath=//input[@name='stage3OutputMin']
${selector_CP_create_stage3OutputMax_input}                             xpath=//input[@name='stage3OutputMax']
${selector_CP_create_stage3OutputIdleValue_input}                       xpath=//input[@name='stage3OutputIdleValue']
${selector_CP_create_stage3OutputPointId_input}                         xpath=//input[@name='stage3OutputPointId']
${selector_CP_create_stage3LimitPointId_input}                          xpath=//input[@name='stage3LimitPointId']
${selector_CP_create_stage3LimitLimitValue_input}                       xpath=//input[@name='stage3LimitLimitValue']
${selector_CP_create_stage3LimitPBand_input}                            xpath=//input[@name='stage3LimitPBand']

${selector_CP_create_form_stage4Name_input}                             xpath=//input[@name='stage4Name']
${selector_CP_create_form_stage4PBand_input}                            xpath=//input[@name='stage4PBand']
${selector_CP_create_form_stage4PType_input}                            xpath=//input[@name='stage4PType']
${selector_CP_create_form_stage4OutdoorLimitationLimit_input}           xpath=//input[@name='stage4OutdoorLimitationLimit']
${selector_CP_create_form_stage4OutdoorLimitationPBand_input}           xpath=//input[@name='stage4OutdoorLimitationPBand']
${selector_CP_create_stage4OutputMin_input}                             xpath=//input[@name='stage4OutputMin']
${selector_CP_create_stage4OutputMax_input}                             xpath=//input[@name='stage4OutputMax']
${selector_CP_create_stage4OutputIdleValue_input}                       xpath=//input[@name='stage4OutputIdleValue']
${selector_CP_create_stage4OutputPointId_input}                         xpath=//input[@name='stage4OutputPointId']
${selector_CP_create_stage4LimitPointId_input}                          xpath=//input[@name='stage4LimitPointId']
${selector_CP_create_stage4LimitLimitValue_input}                       xpath=//input[@name='stage4LimitLimitValue']
${selector_CP_create_stage4LimitPBand_input}                            xpath=//input[@name='stage4LimitPBand']

${selector_CP_create_form_stage5Name_input}                             xpath=//input[@name='stage5Name']
${selector_CP_create_form_stage5PBand_input}                            xpath=//input[@name='stage5PBand']
${selector_CP_create_form_stage5PType_input}                            xpath=//input[@name='stage5PType']
${selector_CP_create_form_stage5OutdoorLimitationLimit_input}           xpath=//input[@name='stage5OutdoorLimitationLimit']
${selector_CP_create_form_stage5OutdoorLimitationPBand_input}           xpath=//input[@name='stage5OutdoorLimitationPBand']
${selector_CP_create_stage5OutputMin_input}                             xpath=//input[@name='stage5OutputMin']
${selector_CP_create_stage5OutputMax_input}                             xpath=//input[@name='stage5OutputMax']
${selector_CP_create_stage5OutputIdleValue_input}                       xpath=//input[@name='stage5OutputIdleValue']
${selector_CP_create_stage5OutputPointId_input}                         xpath=//input[@name='stage5OutputPointId']
${selector_CP_create_stage5LimitPointId_input}                          xpath=//input[@name='stage5LimitPointId']
${selector_CP_create_stage5LimitLimitValue_input}                       xpath=//input[@name='stage5LimitLimitValue']
${selector_CP_create_stage5LimitPBand_input}                            xpath=//input[@name='stage5LimitPBand']

${selector_CP_create_form_return_water_btn}                             xpath=//span[text()='Return water control']
${selector_CP_create_form_returnWaterControlStage_input}                xpath=//input[@name='returnWaterControlStage']
${selector_CP_create_form_returnWaterControlIdleSetting_input}          xpath=//input[@name='returnWaterControlIdleSetting']
${selector_CP_create_form_returnWaterControlIdlePBand_input}            xpath=//input[@name='returnWaterControlIdlePBand']
${selector_CP_create_form_returnWaterControlRunSetting_input}           xpath=//input[@name='returnWaterControlRunSetting']
${selector_CP_create_form_returnWaterControlRunPBand_input}             xpath=//input[@name='returnWaterControlRunPBand']
${selector_CP_create_form_returnWaterControlLimitPointId_input}         xpath=//input[@name='returnWaterControlLimitPointId']

### DI

${CREATE_NEW_POINT_HEADER_XPATH}                                        xpath=//div[contains(@class, 'dialog-toolbar')]//span[text()='Create new point']

# xpath=//*[@class="dialog"]
${DI_point_create_new_form}
...    xpath=//div[contains(@class, 'dialog-toolbar')]//span[text()='Create new point']
...    ${EMPTY}
${selector_DI_create_form_pointname}                                    xpath=//*[@id="pointId"]
${selector_DI_create_form_description}                                  xpath=//*[@id="pointDescription"]

${selector_DI_create_form_level_view}                                   xpath=//input[@type='number' and contains(@class, 'form_input') and @name='view']    # xpath=//*[@name="view"]
${selector_DI_create_form_level_manual}                                 xpath=//input[@type='number' and contains(@class, 'form_input') and @name='manual']    # xpath=//*[@name="manual"]
${selector_DI_create_form_level_programming}                            xpath=//input[@type='number' and contains(@class, 'form_input') and @name='programming']    # xpath=//*[@name="programming"]

${selector_DI_create_form_button_local}                                 xpath=//div[@class='form_item']/div/span[@class='select_item' and contains(text(),'Local')]
${selector_DI_create_form_button_global}                                xpath=//div[@class='form_item']/div/span[@class='select_item' and contains(text(),'Global')]

# xpath=//span[contains(@class, 'wizard_list_item') and text()='Local']
${selector_DI_create_form_type_local}
...    xpath=//div[@class='form_item']//span[@class='select_item' and contains(text(), 'Local')]
...    ${EMPTY}
# xpath=//span[contains(@class, 'wizard_list_item') and text()='Global']
${selector_DI_create_form_type_global}
...    xpath=//div[@class='form_item']//span[@class='select_item' and contains(text(), 'Global')]
...    ${EMPTY}

${selector_DI_create_form_module_port}                                  xpath=//*[@name="port"]
${selector_DI_create_form_module_address}                               xpath=//*[@name="modNumber"]
${selector_DI_create_form_module_details}                               xpath=//*[@class="link_icon"]

${selector_DI_create_form_module_details_form_close_icon}               xpath=//*[@svgicon="icon-delete-x"]
${selector_DI_create_form_module_details_form_clear}                    xpath=//*[@class="edit_buttons]//div[contains(normalize-space(text()), "Clear")]

${selector_DI_create_form_module_details_form_choose}                   xpath=//*[@class="edit_buttons"]//div[contains(normalize-space(text()), "Choose")]
${selector_DI_create_form_module_details_form_cancel}                   xpath=//*[@class="aut_btn_cancel" and contains(normalize-space(text()), "Cancel")]

${selector_DI_create_form_module_pointnr}                               xpath=//input[@name="modPoint"]

${selector_DI_create_form_statetext}                                    xpath=//mat-select[@name="stateText"]

${selector_DI_create_form_start_delay}                                  xpath=//*[@name="startDelay"]
${selector_DI_create_form_stop_delay}                                   xpath=//*[@name="stopDelay"]

${selector_DI_create_form_tristate}                                     xpath=//mat-checkbox[@name="tristate"]
${selector_DI_create_form_closedContact}                                xpath=//mat-checkbox[@name="closedContact"]

${selector_DI_create_form_picture}                                      xpath=//mat-select[@name="picture"]

${selector_DI_create_form_add_active}                                   xpath=//button[@class='aut_btn ng-star-inserted active']//span[text()='Add']

${selector_DI_create_form_picture}                                      xpath=//mat-select[@name="picture"]

${selector_DI_create_form_cancel}                                       xpath=//*[@class="aut_btn_cancel"]
${selector_DI_create_form_close}                                        xpath=//*[@svgicon="icon-delete-x"]

${selector_DI_point_list_pointname_header}                              xpath=//th[@class='col-l ng-star-inserted' and text()='Pointname']

### DO
# xpath=//div[contains(@class, 'mat-dialog-content')]
${selector_DO_create_new_point_form}
...    xpath=//div[contains(@class, 'dialog-toolbar')]//span[text()='Create new point']
...    ${EMPTY}

${DO_point_create_new_form}                                             xpath=//*[@class="dialog"]
${selector_DO_create_form_pointname}                                    xpath=//input[@id="pointId"]
${selector_DO_create_form_description}                                  xpath=//input[@id="pointDescription"]

${selector_DO_create_form_level_view}                                   xpath=//input[@name="view"]
${selector_DO_create_form_level_manual}                                 xpath=//input[@name="manual"]
${selector_DO_create_form_level_programming}                            xpath=//input[@name="programming"]

${selector_DO_create_form_type_local}                                   xpath=//span[contains(@class, 'wizard_list_item') and text()="Local"]

${selector_DO_create_form_type_global}                                  xpath=//span[contains(@class, 'wizard_list_item') and text()="Global"]

${selector_DO_create_form_module_port}                                  xpath=//*[@name="port"]
${selector_DO_create_form_module_address}                               xpath=//*[@name="modNumber"]
${selector_DO_create_form_module_details}                               xpath=//*[@class="link_icon"]

${selector_module_details_form}                                         xpath=//*[contains(normalize-space(text()), "Module details")]

${selector_DO_create_form_module_details_form_close_icon}               xpath=//mat-icon[@svgicon="icon-delete-x"]
${selector_DO_create_form_module_details_form_clear}                    ${EMPTY}

${selector_DO_create_form_module_details_form_choose}                   xpath=//*[@class="edit_buttons"]//div[contains(normalize-space(text()), "Choose")]
${selector_DO_create_form_module_details_form_cancel}                   xpath=//*[@class="aut_btn_cancel" and contains(normalize-space(text()), "Cancel")]

${selector_DO_create_form_module_pointnr}                               xpath=//*[@name="modPoint"]

${selector_DO_create_form_statetext}                                    xpath=//mat-select[@name="stateText"]

${selector_DO_create_form_start_delay}                                  xpath=//*[@name="startDelay"]
${selector_DO_create_form_stop_delay}                                   xpath=//*[@name="stopDelay"]

${selector_DO_create_form_time_schedule}                                xpath=//mat-select[@name="timeSchedule"]

${selector_DO_create_form_tristate}                                     xpath=//mat-checkbox[@name='tristate']

${selector_DO_create_form_default_state_on_button}                      xpath=//span[contains(@class, 'wizard_list_item') and text()='On']
${selector_DO_create_form_default_state_off_button}                     xpath=//span[contains(@class, 'wizard_list_item') and text()='Off']
${selector_DO_create_form_default_state_old_button}                     xpath=//span[contains(@class, 'wizard_list_item') and text()='Old value']

${selector_DO_create_form_special_type_normal_button}                   xpath=//span[contains(@class, 'wizard_list_item') and text()='Normal']
${selector_DO_create_form_special_type_limited_button}                  xpath=//span[contains(@class, 'wizard_list_item') and text()='Limited']
${selector_DO_create_form_special_type_override_button}                 xpath=//span[contains(@class, 'wizard_list_item') and text()='Override']

${selector_DO_create_form_picture}                                      xpath=//mat-select[@name="picture"]

${selector_DO_create_form_add_active}                                   xpath=//span[@class='icon_text'][text()='Add']
${selector_DO_create_form_cancel}                                       xpath=//*[@class="aut_btn_cancel"]
${selector_DO_create_form_close}                                        xpath=//*[@svgicon="icon-delete-x"]

${selector_DO_point_list_pointname_header}                              xpath=//th[@class='col-l ng-star-inserted' and text()='Pointname']

${selector_DO_point_list}                                               xpath=//*[@class="point_table striped ng-star-inserted"]

### Lookup Table

${selector_LT_addnew_icon}                                              xpath=//button[@class='btn' and .//span[text()='Add new']]
${selector_LT_create_form_pointname_input}                              xpath=//input[@formcontrolname='pointId']
${selector_LT_create_form_pointdescription_input}                       xpath=//input[@formcontrolname='pointDescription']

${selector_LT_create_form_sensor_type_ddwn}                             xpath=//select[@formcontrolname="sensorType"]
${selector_LT_create_form_offset_input}                                 xpath=//input[@formcontrolname="offset"]

${selector_LT_create_form_picture_ddwn}                                 xpath=//select[@formcontrolname='picture']

${selector_LT_create_form_xAxisName_input}                              xpath=//input[@formcontrolname="xAxisName"]
${selector_LT_create_form_yAxisName_input}                              xpath=//input[@formcontrolname="yAxisName"]

${selector_LT_create_form_table_btn}                                    xpath=//div[contains(@class, 'tab_item') and contains(text(), 'Table')]
${selector_LT_create_form_graph_btn}                                    xpath=//div[contains(@class, 'tab_item') and contains(text(), 'GRAPH')]

${selector_LT_create_form_remove_values_btn}                            xpath=//button[text()="Remove values"]

${selector_LT_create_form_measured_1_input}                             xpath=//td[@formcontrolname='in']//input[@type='number']
${selector_LT_create_form_converted_1_input}                            xpath=//td[@formcontrolname='out']//input[@type='number']
${selector_LT_create_form_add_icon_1_input}                             xpath=//button/mat-icon[@svgicon="icon-add"]

${selector_LT_create_form_xMin_input}                                   xpath=//input[@formcontrolname="xMin"]
${selector_LT_create_form_xMax_input}                                   xpath=//input[@formcontrolname="xMax"]
${selector_LT_create_form_yMin_input}                                   xpath=//input[@formcontrolname="yMin"]
${selector_LT_create_form_yMax_input}                                   xpath=//input[@formcontrolname="yMax"]

${selector_LT_create_form_refresh_btn}                                  xpath=//div[@class='graph-top-buttons']//button[text()='Refresh']
${selector_LT_create_form_remove_btn}                                   xpath=//div[@class='graph-top-buttons']//button[text()='Remove values']

${selector_LT_create_form_chart_context_btn}                            xpath=//g[@class="highcharts-button-symbol"]
${selector_LT_create_form_chart_legend_btn}                             xpath=//text[text()="Lookup table"]
${selector_LT_create_form_chart_offset_graph_btn}                       xpath=//text[text()='Offset graph']

### Time Schedule

${selector_TS_create_form_table_btn}                                    xpath=//div[contains(@class, 'tab_item') and contains(text(), 'Table')]
${selector_TS_create_form_details_btn}                                  xpath=//div[contains(@class, 'tab_item') and contains(text(), 'Details')]
${selector_TS_create_form_pointname_input}                              xpath=//input[@formcontrolname='pointId']
${selector_TS_create_form_description_input}                            xpath=//input[@formcontrolname='pointDescription']

${selector_TS_create_form_view_input}                                   xpath=//input[@formcontrolname='view']
${selector_TS_create_form_manual_input}                                 xpath=//input[@formcontrolname='manual']
${selector_TS_create_form_programming_input}                            xpath=//input[@formcontrolname='programming']

${selector_TS_create_form_statetext_ddwn}                               xpath=//select[@formcontrolname='stateTextId']
${selector_TS_create_form_exception_chkbx}                              xpath=//mat-checkbox[@formcontrolname='useSpecialDays']
${selector_TS_create_form_default_type_ddwn}                            xpath=//select[@formcontrolname='eventType']
${selector_TS_create_form_default_value_input}                          xpath=//input[@formcontrolname='value']
${selector_TS_create_form_default_value_select}                         xpath=//select[@formcontrolname='value']

${selector_TS_create_form_decimal_input}                                xpath=//input[@formcontrolname='decimals']
${selector_TS_create_form_default_value_btn}                            xpath=//div[@class='wizard_list']//span[text()='Default value']
${selector_TS_create_form_last_value_btn}                               xpath=//div[@class='wizard_list']//span[text()='Last value']
${selector_TS_create_form_synchronize_chkbx}                            xpath=//mat-checkbox[@formcontrolname='synchronize']
${selector_TS_create_form_picture_ddwn}                                 xpath=//select[@formcontrolname='picture']

# xpath=//div[@class='copy_dialog_row']/div[@class='open_btn'][contains(text(), 'Day copy')]
${selector_TS_create_form_day_copy_btn}
...                                                                     xpath=//div[@class='open_btn']
${selector_TS_create_form_day_copy_form}                                xpath=//div[@class='dialog_title'][contains(text(), 'Day copy')]

${selector_TS_create_form_day_copy_mon_radio}                           //input[@type="radio" and @tabindex="0" and @value="0"]
${selector_TS_create_form_day_copy_tue_radio}                           xpath=//input[@type='radio'][@value='1']
${selector_TS_create_form_day_copy_wed_radio}                           xpath=//input[@type='radio'][@value='2']
${selector_TS_create_form_day_copy_thu_radio}                           xpath=//input[@type='radio'][@value='3']
${selector_TS_create_form_day_copy_fri_radio}                           xpath=//input[@type='radio'][@value='4']
${selector_TS_create_form_day_copy_sat_radio}                           xpath=//input[@type='radio'][@value='5']
${selector_TS_create_form_day_copy_sun_radio}                           xpath=//input[@type='radio'][@value='6']

${selector_TS_create_form_day_copy_mon_chkbx}                           xpath=//span[contains(., 'Mo')]
${selector_TS_create_form_day_copy_tue_chkbx}                           xpath=//span[contains(., 'Tu')]
${selector_TS_create_form_day_copy_wed_chkbx}                           xpath=//span[contains(., 'We')]
${selector_TS_create_form_day_copy_thu_chkbx}                           xpath=//span[contains(., 'Th')]
${selector_TS_create_form_day_copy_fri_chkbx}                           xpath=//span[contains(., 'Fr')]
${selector_TS_create_form_day_copy_sat_chkbx}                           xpath=//span[contains(., 'Sa')]
${selector_TS_create_form_day_copy_sun_chkbx}                           xpath=//span[contains(., 'Su')]

${selector_TS_create_form_day_copy_mon_fri_chkbx}                       xpath=//span[contains(., 'Mo-Fr')]
${selector_TS_create_form_day_copy_mon_sun_chkbx}                       xpath=//span[contains(., 'Mo-Su')]

${selector_TS_create_form_day_copy_save_btn}                            xpath=//button[text()='Save']
${selector_TS_create_form_day_copy_cancel_btn}                          xpath=//button[@class='form_btn_cancel' and text()='Cancel']
${selector_TS_create_form_day_copy_close_icon}                          xpath=//mat-icon[@class='close_icon']

${selector_TS_create_form_save_btn}                                     ${EMPTY}    #    xpath=//button[contains(@class, 'aut_btn') and text()='Save']
${selector_TS_create_form_add_btn}                                      xpath=//button[contains(@class, 'active') and contains(@class, 'ng-star-inserted') and contains(text(), 'Add')]
${selector_TS_create_form_cancel_btn}                                   xpath=//button[text()='Cancel']

${selector_TS_create_form_table_td2_tr2_cell}                           xpath=//tr[4]/td[4]
${selector_TS_create_form_table_exception_td2_tr2_cell}                 xpath=//div[contains(@class, 'tab_content')]/table[@class='time_schedule']/tbody/tr[2]/td[2]

${selector_TS_create_form_table_cell_dialog}                            xpath=//app-time-schedule-dialog[@class="ng-star-inserted"]
${selector_TS_create_form_table_cell_dialog_add_item}                   xpath=//div[contains(@class, 'dialog_item') and text()='Add']
${selector_TS_create_form_table_cell_dialog_copy_item}                  xpath=//div[contains(@class, 'dialog_item') and text()='Copy']
${selector_TS_create_form_table_cell_dialog_paste_item}                 xpath=//div[contains(@class, 'dialog_item') and text()='Paste']
${selector_TS_create_form_table_cell_dialog_clear_item}                 xpath=//div[contains(@class, 'dialog_item') and text()='Clear']

${selector_TS_create_form_table_cell_create_event_form}                 xpath=//div[@class="dialog_title ng-star-inserted" and text()="Create time event"]
${selector_TS_create_form_table_cell_create_event_form_time_input}      xpath=//input[@formcontrolname='time']
${selector_TS_create_form_table_cell_create_event_form_set_ddwn}        xpath=//select[@formcontrolname='eventType']
${selector_TS_create_form_table_cell_create_event_form_set_input}       xpath=//input[@formcontrolname='value']
${selector_TS_create_form_table_cell_create_event_form_create_btn}      xpath=//button[contains(., 'Create')]
${selector_TS_create_form_table_cell_create_event_form_cancel_btn}      xpath=//button[contains(., 'Cancel')]

${selector_point_list_TS_pointname_header}                              xpath=//th[text()='Pointname']

### Alarm Point

${selector_AP_create_form_alerta_input}                                 xpath=//input[@name='alertaNumber']
${selector_AP_create_form_saveLog_ddwn}                                 xpath=//mat-select[@name='saveLog']
${selector_AP_create_form_alarmGroup_ddwn}                              xpath=//mat-select[@name='alarmGroup']
${selector_AP_create_form_normal_btn}                                   xpath=//div[@class='wizard_list']//span[text()='Normal']
${selector_AP_create_form_limit_btn}                                    xpath=//div[@class='wizard_list']//span[text()='Limit']
${selector_AP_create_form_module_btn}                                   xpath=//div[@class='wizard_list']//span[text()='Module']
${selector_AP_create_form_conflict_btn}                                 xpath=//div[@class='wizard_list']//span[text()='Conflict']

${selector_AP_create_form_lockPointId_input}                            xpath=//input[@name='lockPointId']
${selector_AP_create_form_lockPointState_input}                         xpath=//input[@name='lockPointState']
${selector_AP_create_form_alarmInfoSource_ddwn}                         xpath=//mat-select[@name='alarmInfoSource']
${selector_AP_create_form_alarmInfoData_input}                          xpath=//input[@name='alarmInfoData']

${selector_AP_create_form_limitAlarmPointId_input}                      xpath=//input[@name='limitAlarmPointId']
${selector_AP_create_form_limit1Mode_input}                             xpath=//mat-select[@name='limit1Mode']
${selector_AP_create_form_limit1Limit_input}                            xpath=//input[@name='limit1Limit']
${selector_AP_create_form_alarmOptionsOperation_input}                  xpath=//mat-select[@name='alarmOptionsOperation']
${selector_AP_create_form_limit2Mode_input}                             xpath=//mat-select[@name='limit2Mode']
${selector_AP_create_form_limit2Limit_input}                            xpath=//input[@name='limit2Limit']
${selector_AP_create_form_alarmOptionsDeadZone_input}                   xpath=//input[@name='alarmOptionsDeadZone']
${selector_AP_create_form_clearRunTime_chkbx}                           xpath=//mat-checkbox[@name='clearRunTime']

${selector_AP_create_form_alarmOptionsPort_input}                       xpath=//input[@name='alarmOptionsPort']
${selector_AP_create_form_alarmOptionsModNumber_input}                  xpath=//input[@name='alarmOptionsModNumber']
${selector_AP_create_form_alarmOptionsSensitivity_input}                xpath=//input[@name='alarmOptionsSensitivity']

${selector_AP_create_form_conflictAlarmPointId1_input}                  xpath=//input[@name='conflictAlarmPointId1']
${selector_AP_create_form_conflictAlarmPointId2_input}                  xpath=//input[@name='conflictAlarmPointId2']

### Alarm devices

${selector_AD_create_form_name_input}                                   xpath=//input[@formcontrolname="name"]
${selector_AD_create_form_deviceType_ddwn}                              xpath=//select[@formcontrolname="deviceType"]
${selector_point_list_AD_name_header}                                   xpath=//th[text()='Name']

${selector_point_list_AD_acknowledge_chkbx}                             xpath=//mat-checkbox[@formcontrolname="acknowledge"]
${selector_point_list_AD_lockstate_chkbx}                               xpath=//mat-checkbox[@formcontrolname="lockState"]

${selector_point_list_AD_state_0_chkbx}                                 xpath=//mat-checkbox[@formcontrolname="0"]
${selector_point_list_AD_state_1_chkbx}                                 xpath=//mat-checkbox[@formcontrolname="1"]
${selector_point_list_AD_state_2_chkbx}                                 xpath=//mat-checkbox[@formcontrolname="2"]
${selector_point_list_AD_state_3_chkbx}                                 xpath=//mat-checkbox[@formcontrolname="3"]
${selector_point_list_AD_state_4_chkbx}                                 xpath=//mat-checkbox[@formcontrolname="4"]
${selector_point_list_AD_state_5_chkbx}                                 xpath=//mat-checkbox[@formcontrolname="5"]
${selector_point_list_AD_state_6_chkbx}                                 xpath=//mat-checkbox[@formcontrolname="6"]
${selector_point_list_AD_state_7_chkbx}                                 xpath=//mat-checkbox[@formcontrolname="7"]
${selector_point_list_AD_state_8_chkbx}                                 xpath=//mat-checkbox[@formcontrolname="8"]
${selector_point_list_AD_state_9_chkbx}                                 xpath=//mat-checkbox[@formcontrolname="9"]
${selector_point_list_AD_state_10_chkbx}                                xpath=//mat-checkbox[@formcontrolname="10"]
${selector_point_list_AD_state_11_chkbx}                                xpath=//mat-checkbox[@formcontrolname="11"]
${selector_point_list_AD_smsCommands_chkbx}                             xpath=//mat-checkbox[@formcontrolname="smsComands"]
${selector_point_list_AD_syncronize_chkbx}                              xpath=//mat-checkbox[@formcontrolname="synchronize"]

${selector_point_list_AD_ipAddress_input}                               xpath=//input[@formcontrolname="ipAddress"]
${selector_point_list_AD_ipPort_input}                                  xpath=//input[@formcontrolname="ipPort"]
${selector_point_list_AD_phoneNumber_input}                             xpath=//input[@formcontrolname="address"]
${selector_point_list_AD_backupNumber_1_input}                          xpath=//input[@formcontrolname="0"]
${selector_point_list_AD_backupNumber_2_input}                          xpath=//input[@formcontrolname="1"]
${selector_point_list_AD_backupNumber_3_input}                          xpath=//input[@formcontrolname="2"]
${selector_point_list_AD_backupNumber_4_input}                          xpath=//input[@formcontrolname="3"]

${selector_point_list_AD_template_file_ddwn}                            xpath=//select[@formcontrolname="templateNumber"]

${selector_point_list_AD_email_input}                                   xpath=//input[@formcontrolname="address"]
${selector_point_list_AD_serverId_ddwn}                                 xpath=//select[@formcontrolname="serverId"]

${selector_point_list_AD_do_pointname_input}                            xpath=//div[@class='form_item']//input[@formcontrolname='address']

${selector_point_list_AD_do_unacknowledged_input}                       xpath=//div[@class='form_multi_select']//span[text()='Unacknowledged']
${selector_point_list_AD_do_active_btn}                                 xpath=//div[@class='form_multi_select']//span[text()='Active']
${selector_point_list_AD_do_both_btn}                                   xpath=//div[@class='form_multi_select']//span[text()='Both']

${selector_point_list_AD_serviceType_ddwn}                              xpath=//select[@formcontrolname='serviceType']
${selector_point_list_AD_sserviceUrl_input}                             xpath=//input[@formcontrolname='serviceUrl']
${selector_point_list_AD_systemId_input}                                xpath=//input[@formcontrolname='systemId']
${selector_point_list_AD_password_input}                                xpath=//input[@formcontrolname='password']
${selector_point_list_AD_organizationId_input}                          xpath=//input[@formcontrolname='organizationId']

### Alarm groups
${selector_AG_create_form_name_input}                                   xpath=//input[@formcontrolname='name']
${selector_AG_create_form_timeschedule_ddwn}                            xpath=//mat-select[@formcontrolname='id']
${selector_AG_create_form_alarmDetailInfo_ddwn}                         xpath=//mat-select[@formcontrolname='alarmDetailInfo']
${selector_AG_create_form_help_input}                                   xpath=//input[@formcontrolname='help']

${selector_AG_create_form_synchronize_chkbx}                            xpath=//mat-checkbox[@formcontrolname='synchronize']
${selector_AG_create_form_state_0_btn}                                  xpath=//div[@class='form_multi_select']//span[text()='State 0']
${selector_AG_create_form_state_1_btn}                                  xpath=//div[@class='form_multi_select']//span[text()='State 1']
${selector_AG_create_form_state_2_btn}                                  xpath=//div[@class='form_multi_select']//span[text()='State 2']
${selector_AG_create_form_state_3_btn}                                  xpath=//div[@class='form_multi_select']//span[text()='State 3']
${selector_AG_create_form_state_4_btn}                                  xpath=//div[@class='form_multi_select']//span[text()='State 4']

${selector_AG_create_form_email_alarm_cell}                             xpath=//mat-table[@class='mat-table cdk-table mat-sort alarm_device_table ng-star-inserted']//mat-cell[contains(text(), 'Email')]
${selector_AG_create_form_sms_alarm_cell}                               xpath=//mat-table[@class='mat-table cdk-table mat-sort alarm_device_table ng-star-inserted']//mat-cell[contains(text(), 'SMS')]
${selector_AG_create_form_do_alarm_cell}                                xpath=//mat-table[@class='mat-table cdk-table mat-sort alarm_device_table ng-star-inserted']//mat-cell[contains(text(), 'DO')]
${selector_AG_create_form_forward_alarm_cell}                           xpath=//mat-table[@class='mat-table cdk-table mat-sort alarm_device_table ng-star-inserted']//mat-cell[contains(text(), 'Forwarding')]
${selector_AG_create_form_forward_alerta_cell}                          xpath=//mat-table[@class='mat-table cdk-table mat-sort alarm_device_table ng-star-inserted']//mat-cell[contains(text(), 'Alerta')]
${selector_AG_create_form_forward_webservice_cell}                      xpath=//mat-table[@class='mat-table cdk-table mat-sort alarm_device_table ng-star-inserted']//mat-cell[contains(text(), 'WebService')]

${selector_point_list_AG_name_header}                                   xpath=//th[@class='ng-star-inserted' and contains(text(), 'Alarm group name')]

### Alalrm helps

${selector_AH_create_form_name_input}                                   xpath=//input[@formcontrolname='name']
${selector_AH_create_form_text_btn}                                     xpath=//div[@class='form_multi_select']//span[text()='Text']
${selector_AH_create_form_picture_btn}                                  xpath=//div[@class='form_multi_select']//span[text()='Picture']
${selector_AH_create_form_text_text}                                    xpath=//textarea[@formcontrolname='helpText']

${selector_AH_create_form_add_btn}                                      xpath=//button[@class='aut_btn active']/span[text()='Add']
