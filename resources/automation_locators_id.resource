*** Settings ***
Library     Browser
Resource    navigate.resource
Resource    login.resource
Resource    global_variables.resource

### Locators are utilizing 'data-qa-id' attributes where possible ###

*** Variables ***
####
# MAIN VIEW
####
${SELECTOR_AUTOMATION_SEARCH_TERM}                                          xpath=//input[@data-qa-id='automation-table-filter-search-term']
${SELECTOR_AUTOMATION_ICON_SEARCH}                                          xpath=//mat-icon[@svgicon='icon-search']
${SELECTOR_AUTOMATION_FILTERS_BUTTON}                                       xpath=//button[@data-qa-id='automation-table-filter-filters-button']
${SELECTOR_AUTOMATION_TOOLBAR_PRINT_BUTTON}                                 xpath=//button[@data-qa-id='automation-toolbar-buttons-print']
${SELECTOR_AUTOMATION_TOOLBAR_DUPLICATE_BUTTON}                             xpath=//button[@data-qa-id='automation-toolbar-buttons-duplicate']
${SELECTOR_AUTOMATION_TOOLBAR_EDIT_BUTTON}                                  xpath=//button[@data-qa-id='automation-toolbar-buttons-edit']
${SELECTOR_AUTOMATION_TOOLBAR_DELETE_BUTTON}                                xpath=//button[@data-qa-id='automation-toolbar-buttons-delete']
${SELECTOR_AUTOMATION_TOOLBAR_ADD_NEW_BUTTON}                               xpath=//button[@data-qa-id='automation-toolbar-buttons-add-new']
${SELECTOR_AUTOMATION_TABLE_MASTER_TOGGLE_CHECKBOX}                         xpath=//mat-checkbox[@id='automation-table-select-master-toggle']    # NO ID
${SELECTOR_AUTOMATION_POINT_CELL_COPY_BUTTON}                               xpath=//button[@data-qa-id='automation-copy-point-id-dialog-copy-button']

# Table row
${SELECTOR_AUTOMATION_TABLE_ITEM1_CHECKBOX}                                 xpath=//mat-checkbox[@id='automation-table-item1-selected']    # NO ID
${SELECTOR_AUTOMATION_TABLE_ITEM1_COPY_NAME}                                xpath=//div[@data-qa-id='automation-table-item1-copy-name']
${SELECTOR_AUTOMATION_TABLE_ITEM1_VALUE}                                    xpath=//div[@data-qa-id='automation-table-item1-value']
${SELECTOR_AUTOMATION_TABLE_ITEM1_LOCK_STATE}                               xpath=//div[@data-qa-id='automation-table-item1-lock-state']
${SELECTOR_AUTOMATION_TABLE_ITEM1_ACTIONS_DETAILS_ICON}                     xpath=//mat-icon[@data-qa-id='automation-table-item1-actions-details']

# Filter dialog
${SELECTOR_AUTOMATION_FILTER_DIALOG_CLOSE_ICON}                             xpath=//mat-icon[@data-qa-id='automation-filter-dialog-close']
${SELECTOR_AUTOMATION_FILTER_DIALOG_LOCK_STATE_SELECT}                      xpath=//select[@data-qa-id='automation-filter-dialog-lock-state']
${SELECTOR_AUTOMATION_FILTER_DIALOG_TYPE_SELECT}                            xpath=//select[@data-qa-id='automation-filter-dialog-type']
${SELECTOR_AUTOMATION_FILTER_DIALOG_ERROR_SELECT}                           xpath=//select[@data-qa-id='automation-filter-dialog-error-state']
${SELECTOR_AUTOMATION_FILTER_DIALOG_CLEAR_BUTTON}                           xpath=//button[@data-qa-id='automation-filter-dialog-clear-button']
${SELECTOR_AUTOMATION_FILTER_DIALOG_CANCEL_BUTTON}                          xpath=//button[@data-qa-id='automation-filter-dialog-cancel-button']
${SELECTOR_AUTOMATION_FILTER_DIALOG_SAVE_BUTTON}                            xpath=//button[@data-qa-id='automation-filter-dialog-save-button']

# Set value dialog
${SELECTOR_AUTOMATION_SETVALUE_DIALOG_VALUE_INPUT}                          xpath=//*[@data-qa-id='automation-point-value-dialog-value']
${SELECTOR_AUTOMATION_SETVALUE_DIALOG_CANCEL_BUTTON}                        xpath=//*[@data-qa-id='automation-point-value-dialog-cancel-button']
${SELECTOR_AUTOMATION_SETVALUE_DIALOG_SAVE_BUTTON}                          xpath=//*[@data-qa-id='automation-point-value-dialog-save-button']

# Copy point dialog
${SELECTOR_AUTOMATION_COPY_POINT_DIALOG_CLOSE_ICON}                         xpath=//*[@data-qa-id='automation-copy-point-dialog-close']
${SELECTOR_AUTOMATION_COPY_POINT_DIALOG_POINT_ID_INPUT}                     xpath=//input[@data-qa-id='automation-copy-point-dialog-point-id']
${SELECTOR_AUTOMATION_COPY_POINT_DIALOG_CANCEL_BUTTON}                      xpath=//button[@data-qa-id='automation-copy-point-dialog-cancel-button']
${SELECTOR_AUTOMATION_COPY_POINT_DIALOG_CREATE_BUTTON}                      xpath=//button[@data-qa-id='automation-copy-point-dialog-create-button']

${SELECTOR_AUTOMATION_POINT_DI_TABLE_COPY_ICON}                             xpath=//mat-icon[@data-qa-id='automation-table-item1-copy-name']
${SELECTOR_AUTOMATION_POINT_DI_TABLE_1_VALUE_INPUT}                         xpath=//div[@data-qa-id='automation-table-item1-value']

${SELECTRO_AUTOMATION_POINT_DI_TABLE_1_LOCKSTATE_INPUT}                     xpath=//div[@class='lock-state ng-star-inserted' and @data-qa-id='automation-table-item1-lock-state']

${SELECTOR_AUTOMATION_POINT_DI_VALUE_DIALOG}                                xpath=//mat-dialog-container
${SELECTOR_AUTOMATION_POINT_DI_VALUE_DIALOG_CONTENT}                        xpath=//app-point-value-dialog[@class='ng-star-inserted']
${SELECTOR_AUTOMATION_POINT_DI_VALUE_DIALOG_TEXT}                           xpath=//div[@class='text']
${SELECTOR_AUTOMATION_POINT_DI_VALUE_POINT_NAME}                            xpath=//span[@class='point_name']
${SELECTOR_AUTOMATION_POINT_DI_VALUE_SUBTITLE}                              xpath=//span[@class='subtitle']
${SELECTOR_AUTOMATION_POINT_DI_VALUE_INPUT_AREA}                            xpath=//div[@class='input_area']
${SELECTOR_AUTOMATION_POINT_DI_VALUE_INPUT}                                 xpath=//input[@data-qa-id='automation-point-value-dialog-value']
${SELECTOR_AUTOMATION_POINT_DI_VALUE_CANCEL_BUTTON}                         xpath=//button[@data-qa-id='automation-point-value-dialog-cancel-button']
${SELECTOR_AUTOMATION_POINT_DI_VALUE_SAVE_BUTTON}                           xpath=//button[@data-qa-id='automation-point-value-dialog-save-button']

# 2024.03.27

${SELECTOR_FORM_NOT_VALID_ERROR_TEXT}                                       xpath=//div[text()=' Form not valid! ']

# Point Details
${SELECTOR_AUTOMATION_ACTIONS_DETAILS_ICON}                                 xpath=//button[@data-qa-id="automation-table-item1-actions-details"]
${SELECTOR_AUTOMATION_POINT_DETAILS_DIALOG_CLOSE_ICON}                      xpath=//mat-icon[@data-qa-id="automation-dialog-close"]
${SELECTOR_AUTOMATION_POINT_DETAILS_DIALOG_TABLE_BUTTON}                    xpath=//div[@data-qa-id="automation-dialog-list-tab"]
${SELECTOR_AUTOMATION_POINT_DETAILS_DIALOG_GRAPH_BUTTON}                    xpath=//div[@data-qa-id="automation-dialog-graph-tab"]
${SELECTOR_AUTOMATION_POINT_DETAILS_DIALOG_EVENTS_BUTTON}                   xpath=//div[@data-qa-id="automation-dialog-event-tab"]

# Global point
${SELECTOR_AUTOMATION_POINT_EDIT_GLOBAL_SUBSTATION_SELECT}                  xpath=//mat-select[@data-qa-id='automation-point-edit-global-info-substation']
${SELECTOR_AUTOMATION_POINT_EDIT_GLOBAL_POINT_ID_INPUT}                     xpath=//input[@data-qa-id="automation-point-edit-global-info-point-id"]

# Edit / Add point dialog
${SELECTOR_AUTOMATION_POINT_EDIT_DIALOG_CLOSE_ICON}                         xpath=//mat-icon[@data-qa-id='automation-dialog-close']
${SELECTOR_AUTOMATION_POINT_EDIT_POINT_ID_INPUT}                            xpath=//input[@data-qa-id='automation-point-edit-point-id']
${SELECTOR_AUTOMATION_POINT_EDIT_POINT_DESCRIPTION_INPUT}                   xpath=//input[@data-qa-id='automation-point-edit-point-description']
${SELECTOR_AUTOMATION_POINT_EDIT_ACCESS_LEVEL_VIEW_INPUT}                   xpath=//input[@data-qa-id='automation-point-edit-access-level-view']
${SELECTOR_AUTOMATION_POINT_EDIT_ACCESS_LEVEL_MANUAL_INPUT}                 xpath=//input[@data-qa-id='automation-point-edit-access-level-manual']
${SELECTOR_AUTOMATION_POINT_EDIT_ACCESS_LEVEL_PROGRAMMING_INPUT}            xpath=//input[@data-qa-id='automation-point-edit-access-level-programming']
${SELECTOR_AUTOMATION_POINT_EDIT_TYPE_LOCAL_BUTTON}                         xpath=//span[@data-qa-id='automation-point-edit-type-local']
${SELECTOR_AUTOMATION_POINT_EDIT_TYPE_GLOBAL_BUTTON}                        xpath=//span[@data-qa-id='automation-point-edit-type-global']

${SELECTOR_AUTOMATION_POINT_EDIT_GLOBAL_POINTNAME_INPUT}                    xpath=//input[@data-qa-id='automation-point-edit-global-info-point-id']

${SELECTOR_AUTOMATION_POINT_EDIT_PICTURE_SELECT}                            xpath=//mat-select[@data-qa-id='automation-point-edit-picture']
${SELECTOR_AUTOMATION_POINT_EDIT_CANCEL_BUTTON}                             xpath=//button[@data-qa-id='automation-point-edit-cancel-button']
${SELECTOR_AUTOMATION_POINT_EDIT_SAVE_BUTTON}                               xpath=//button[@data-qa-id='automation-point-edit-save-button']
${SELECTOR_AUTOMATION_POINT_EDIT_ADD_BUTTON}                                xpath=//button[@data-qa-id='automation-point-edit-add-button']

####
# DI page
####

${SELECTOR_AUTOMATION_POINT_EDIT_MODULE_PORT_INPUT}                         xpath=//input[@data-qa-id='automation-point-edit-module-info-port']
${SELECTOR_AUTOMATION_POINT_EDIT_MODULE_NUMBER_INPUT}                       xpath=//input[@data-qa-id='automation-point-edit-module-info-number']
${SELECTOR_AUTOMATION_POINT_EDIT_LINK_ICON}                                 xpath=//span[@class='link_icon']//mat-icon[@svgicon='list-icon']    # NO ID
${SELECTOR_AUTOMATION_POINT_EDIT_MOD_POINT_INPUT}                           xpath=//input[@data-qa-id='automation-point-edit-module-info-point']
${SELECTOR_AUTOMATION_POINT_EDIT_STATE_TEXT_SELECT}                         xpath=//mat-select[@data-qa-id='automation-point-edit-state-text']
${SELECTOR_AUTOMATION_POINT_EDIT_START_DELAY_INPUT}                         xpath=//input[@data-qa-id='automation-point-edit-start-delay']
${SELECTOR_AUTOMATION_POINT_EDIT_STOP_DELAY_INPUT}                          xpath=//input[@data-qa-id='automation-point-edit-stop-delay']
${SELECTOR_AUTOMATION_POINT_EDIT_TRISTATE_CHKBX}                            xpath=//input[@id='automation-point-edit-tristate-input']
# xpath=//mat-checkbox[@id='automation-point-edit-tristate']    # NO ID
${SELECTOR_AUTOMATION_POINT_EDIT_CLOSED_CONTACT_CHKBX}                      xpath=//input[@id='automation-point-edit-closed-contact-input']    # NO ID

####
# Measurement
####
${SELECTOR_AUTOMATION_POINT_EDIT_SETPOINT_CHECKBOX}                         xpath=//mat-checkbox[@id='automation-point-edit-setpoint']/div[@class='mdc-form-field']/div[@class='mdc-checkbox']/input[@id='automation-point-edit-setpoint-input']
${SELECTOR_AUTOMATION_POINT_EDIT_TYPE_ANALOG_BUTTON}                        xpath=//span[@data-qa-id='automation-point-edit-type-analog']
${SELECTOR_AUTOMATION_POINT_EDIT_TYPE_COUNTER_BUTTON}                       xpath=//span[@data-qa-id='automation-point-edit-type-counter']
${SELECTOR_AUTOMATION_POINT_EDIT_DECIMALS_SELECT}                           xpath=//input[@data-qa-id='automation-point-edit-decimals']
${SELECTOR_AUTOMATION_POINT_EDIT_UNIT_SELECT}                               xpath=//input[@data-qa-id='automation-point-edit-unit']
${SELECTOR_AUTOMATION_POINT_EDIT_TREND_TOLERANCE_INPUT}                     xpath=//input[@data-qa-id='automation-point-edit-trend-tolerance']
${SELECTOR_AUTOMATION_POINT_EDIT_TREND_SAMPLE_SELECT}                       xpath=//input[@data-qa-id='automation-point-edit-trend-sample-space']
${SELECTOR_AUTOMATION_POINT_EDIT_ANALOG_CONVTABLE_SELECT}                   xpath=//mat-select[@data-qa-id='automation-point-edit-analog-conversion-table']
${SELECTOR_AUTOMATION_POINT_EDIT_OFFSET_INPUT}                              xpath=//input[@data-qa-id='automation-point-edit-analog-offset']
${SELECTOR_AUTOMATION_POINT_EDIT_TIME_CONSTANT_INPUT}                       xpath=//input[@data-qa-id='automation-point-edit-analog-time-constant']
${SELECTOR_AUTOMATION_POINT_EDIT_RUN_TIME_POINTID_INPUT}                    xpath=//input[@data-qa-id='automation-point-edit-analog-run-time-point-id']
# Limits
${SELECTOR_AUTOMATION_POINT_EDIT_LIMIT1_NAME_INPUT}                         xpath=//input[@data-qa-id='automation-point-edit-limit1-name']
${SELECTOR_AUTOMATION_POINT_EDIT_LIMIT1_VALUE_INPUT}                        xpath=//input[@data-qa-id='automation-point-edit-limit1-value']
${SELECTOR_AUTOMATION_POINT_EDIT_LIMIT1_LOCK_STATE_CHKBX}                   xpath=//mat-checkbox[@id='automation-point-edit-limit1-lock-state']    # NO ID
${SELECTOR_AUTOMATION_POINT_EDIT_LIMIT1_SETPOINT_CHKBX}                     xpath=//mat-checkbox[@id='automation-point-edit-limit1-setpoint']    # NO ID

# Actions

####
# Control point
####
${SELECTOR_AUTOMATION_POINT_CP_TABLE_ITEM1_SET_VALUE_INPUT}                 xpath=//div[@data-qa-id='automation-table-item1-set-value']
${SELECTOR_AUTOMATION_POINT_CP_TABLE_ITEM1_STATE_INPUT}                     xpath=//div[@data-qa-id='automation-table-item1-state']

${SELECTOR_AUTOMATION_POINT_CP_EDIT_VALUE_DIALOG_CHANGE_BUTTON}             xpath=//button[@data-qa-id='automation-edit-value-dialog-change-button']
${SELECTOR_AUTOMATION_POINT_CP_EDIT_SET_VALUE_DIALOG_VALUE_INPUT}           xpath=//input[@data-qa-id='automation-set-value-dialog-value']
${SELECTOR_AUTOMATION_POINT_CP_EDIT_SET_VALUE_DIALOG_CANCEL_BUTTON}         xpath=//button[@data-qa-id='automation-set-value-dialog-cancel-button']
${SELECTOR_AUTOMATION_POINT_CP_EDIT_SET_VALUE_DIALOG_SAVE_BUTTON}           xpath=//button[@data-qa-id='automation-set-value-dialog-save-button' and contains(text(),'Save')]

${SELECTOR_AUTOMATION_POINT_CP_EDIT_VALUE_DIALOG_CHANGE_BUTTON}             xpath=//button[@data-qa-id='automation-edit-value-dialog-change-button']
${SELECTOR_AUTOMATION_POINT_CP_EDIT_VALUE_DIALOG_VALUE_INPUT}               xpath=//input[@data-qa-id='automation-point-value-dialog-value']
${SELECTOR_AUTOMATION_POINT_CP_EDIT_VALUE_DIALOG_SAVE_BUTTON}               xpath=//button[@data-qa-id='automation-point-value-dialog-save-button']
${SELECTOR_AUTOMATION_POINT_CP_EDIT_VALUE_DIALOG_CANCEL_BUTTON}             xpath=//button[@data-qa-id='automation-point-value-dialog-cancel-button']

# Control point Edit / Add dialog
${SELECTOR_AUTOMATION_POINT_CP_EDIT_POINT_MAIN_TYPE_BUTTON}                 xpath=//span[@data-qa-id='automation-point-edit-control-point-multi-select-1']
${SELECTOR_AUTOMATION_POINT_CP_EDIT_POINT_BASIC_SETTINGS_BUTTON}            xpath=//span[@data-qa-id='automation-point-edit-control-point-multi-select-2']
${SELECTOR_AUTOMATION_POINT_CP_EDIT_POINT_CONTROL_STAGES_BUTTON}            xpath=//span[@data-qa-id='automation-point-edit-control-point-multi-select-3']
${SELECTOR_AUTOMATION_POINT_CP_EDIT_POINT_AHU_HEATING_BUTTON}               xpath=//span[@data-qa-id='automation-point-edit-control-point-multi-select-4']

# Main and type
${SELECTOR_AUTOMATION_POINT_CP_EDIT_POINT_MAIN_MEAS_ID_INPUT}               xpath=//input[@data-qa-id='automation-point-edit-main-measurement-id']
${SELECTOR_AUTOMATION_POINT_CP_EDIT_POINT_OUTDOOR_MEAS_INPUT}               xpath=//input[@data-qa-id='automation-point-edit-outdoor-measurement-id']

# Control type
${SELECTOR_AUTOMATION_POINT_CP_EDIT_CONTROL_CONSTANT_SET_BUTTON}            xpath=//div[@data-qa-id='automation-point-edit-setting-mode-constant-setvalue']
${SELECTOR_AUTOMATION_POINT_CP_EDIT_CONTROL_CASCADE_BUTTON}                 xpath=//div[@data-qa-id='automation-point-edit-setting-mode-cascade-control']
${SELECTOR_AUTOMATION_POINT_CP_EDIT_CONTROL_COMPENSATION_BUTTON}            xpath=//div[@data-qa-id='automation-point-edit-setting-mode-compensation-control']

# Constant set value
${SELECTOR_AUTOMATION_POINT_CP_EDIT_CONSTANT_DEFAULT_VALUE_INPUT}           xpath=//input[@data-qa-id='automation-point-edit-main-setting-default']
${SELECTOR_AUTOMATION_POINT_CP_EDIT_CONSTANT_COPY_VALUE_CHECKBOX}           xpath=//mat-checkbox[@data-qa-id='automation-point-edit-main-setting-copy-manual-value-to-default']

# Cascade control
${SELECTOR_AUTOMATION_POINT_CP_EDIT_CASCADE_CONTROL_POINT_ID_INPUT}         xpath=//input[@data-qa-id='automation-point-edit-main-setting-cascade-point-id']
${SELECTOR_AUTOMATION_POINT_CP_EDIT_CASCADE_CONTROL_STAGE_INPUT}            xpath=//input[@data-qa-id='automation-point-edit-main-setting-cascade-stage']

# Compensation control
${SELECTOR_AUTOMATION_POINT_CP_EDIT_COMPENSATION_LOOKUP_ID_INPUT}           xpath=//input[@data-qa-id='automation-point-edit-main-setting-lookup-table-id']
${SELECTOR_AUTOMATION_POINT_CP_EDIT_COMPENSATION_AI_POINT_INPUT}            xpath=//input[@data-qa-id='automation-point-edit-main-setting-compensation-point-id']

# Basic settings
${SELECTOR_AUTOMATION_POINT_CP_EDIT_BASIC_IND_POINT_ID_INPUT}               xpath=//input[@data-qa-id='automation-point-edit-indication-id']
${SELECTOR_AUTOMATION_POINT_CP_EDIT_BASIC_UNIT_INPUT}                       xpath=//input[@data-qa-id='automation-point-edit-unit']
${SELECTOR_AUTOMATION_POINT_CP_EDIT_BASIC_DECIMAL_INPUT}                    xpath=//input[@data-qa-id='automation-point-edit-decimal']
${SELECTOR_AUTOMATION_POINT_CP_EDIT_BASIC_STATE_TEXT_SELECT}                xpath=//mat-select[@data-qa-id='automation-point-edit-state-text']
${SELECTOR_AUTOMATION_POINT_CP_EDIT_BASIC_PICTURE_SELECT}                   xpath=//mat-select[@data-qa-id='automation-point-edit-picture']
${SELECTOR_AUTOMATION_POINT_CP_EDIT_BASIC_CONTROL_MODE_SELECT}              xpath=//mat-select[@data-qa-id='automation-point-edit-control-mode']
${SELECTOR_AUTOMATION_POINT_CP_EDIT_BASIC_PID_D_TIME_INPUT}                 xpath=//input[@data-qa-id='automation-point-edit-d-time']
${SELECTOR_AUTOMATION_POINT_CP_EDIT_BASIC_PID_D_SENSITIVITY_INPUT}          xpath=//input[@data-qa-id='automation-point-edit-d-sensitivity']
${SELECTOR_AUTOMATION_POINT_CP_EDIT_BASIC_SLOW_SPEED_INPUT}                 xpath=//input[@data-qa-id='automation-point-edit-tuning-slow-speed-factor']
${SELECTOR_AUTOMATION_POINT_CP_EDIT_BASIC_INTEGR_TIME_INPUT}                xpath=//input[@data-qa-id='automation-point-edit-tuning-integration-time']
${SELECTOR_AUTOMATION_POINT_CP_EDIT_BASIC_ITERM_SENSITIVITY_INPUT}          xpath=//input[@data-qa-id='automation-point-edit-tuning-integration-sensitivity']
${SELECTOR_AUTOMATION_POINT_CP_EDIT_BASIC_COOLING_DEADZONE_INPUT}           xpath=//input[@data-qa-id='automation-point-edit-tuning-cooling-dead-zone']
${SELECTOR_AUTOMATION_POINT_CP_EDIT_BASIC_EXEC_INTREVAL_INPUT}              xpath=//input[@data-qa-id='automation-point-edit-tuning-sample-time']
${SELECTOR_AUTOMATION_POINT_CP_EDIT_BASIC_BALANCE_STAGE_INPUT}              xpath=//input[@data-qa-id='automation-point-edit-balance-stage-number']
${SELECTOR_AUTOMATION_POINT_CP_EDIT_BASIC_BALANCE_VALUE_INPUT}              xpath=//input[@data-qa-id='automation-point-edit-balance-stage-value']

# Control stages
${SELECTOR_AUTOMATION_POINT_CP_EDIT_CTRL_STAGE_COUNT_INPUT}                 xpath=//input[@data-qa-id='automation-point-edit-stage-count']

${SELECTOR_AUTOMATION_POINT_CP_EDIT_CTRL_STAGE1_NAME_INPUT}                 xpath=//input[@data-qa-id='automation-point-edit-stage1-name']
${SELECTOR_AUTOMATION_POINT_CP_EDIT_CTRL_STAGE1_TYPE_SELECT}                xpath=//mat-select[@data-qa-id='automation-point-edit-stage1-type']
${SELECTOR_AUTOMATION_POINT_CP_EDIT_CTRL_STAGE1_OUTPUT_MIN_INPUT}           xpath=//input[@data-qa-id='automation-point-edit-stage1-output-min']
${SELECTOR_AUTOMATION_POINT_CP_EDIT_CTRL_STAGE1_OUTPUT_MAX_INPUT}           xpath=//input[@data-qa-id='automation-point-edit-stage1-output-max']
${SELECTOR_AUTOMATION_POINT_CP_EDIT_CTRL_STAGE1_IDLE_VALUE_INPUT}           xpath=//input[@data-qa-id='automation-point-edit-stage1-output-idle-value']
${SELECTOR_AUTOMATION_POINT_CP_EDIT_CTRL_STAGE1_AO_POINT_INPUT}             xpath=//input[@data-qa-id='automation-point-edit-stage1-output-point-id']
${SELECTOR_AUTOMATION_POINT_CP_EDIT_CTRL_STAGE1_OUT_TEMP_LIM_INPUT}         xpath=//input[@data-qa-id='automation-point-edit-stage1-outdoor-limitation-limit']
${SELECTOR_AUTOMATION_POINT_CP_EDIT_CTRL_STAGE1_OUT_P_BAND_INPUT}           xpath=//input[@data-qa-id='automation-point-edit-stage1-outdoor-limitation-p-band']
${SELECTOR_AUTOMATION_POINT_CP_EDIT_CTRL_STAGE1_LIMIT_POINT_INPUT}          xpath=//input[@data-qa-id='automation-point-edit-stage1-limit-point-id']
${SELECTOR_AUTOMATION_POINT_CP_EDIT_CTRL_STAGE1_LIMIT_VALUE_INPUT}          xpath=//input[@data-qa-id='automation-point-edit-stage1-limit-value']
${SELECTOR_AUTOMATION_POINT_CP_EDIT_CTRL_STAGE1_LIMIT_P_BAND_INPUT}         xpath=//input[@data-qa-id='automation-point-edit-stage1-limit-p-band']

####
# AO point
####
${SELECTOR_AUTOMATION_POINT_AO_EDIT_MIN_VOLTAGE_INPUT}                      xpath=//*[@data-qa-id="automation-point-edit-min-voltage"]
${SELECTOR_AUTOMATION_POINT_AO_EDIT_MAX_VOLTAGE_INPUT}                      xpath=//*[@data-qa-id="automation-point-edit-max-voltage"]
${SELECTOR_AUTOMATION_POINT_AO_EDIT_DEFAULT_OLD_VALUE_BUTTON}               xpath=//span[@data-qa-id="automation-point-edit-default-type-old-value"]
${SELECTOR_AUTOMATION_POINT_AO_EDIT_DEFAULT_FIXED_BUTTON}                   xpath=//span[@data-qa-id="automation-point-edit-default-type-fixed"]

${SELECTOR_AUTOMATION_POINT_AO_EDIT_DEFAULT_FIXED_VALUE_INPUT}              xpath=//input[@data-qa-id="automation-point-edit-default-value"]
${SELECTOR_AUTOMATION_POINT_AO_EDIT_TREND_TOLERANCE_INPUT}                  xpath=//input[@data-qa-id="automation-point-edit-tolerance"]
${SELECTOR_AUTOMATION_POINT_AO_EDIT_TREND_SAMPLE_TIME_INPUT}                xpath=//input[@data-qa-id="automation-point-edit-trend-sample-space"]
${SELECTOR_AUTOMATION_POINT_AO_EDIT_PICTURE_SELECT}                         xpath=//mat-select[@data-qa-id="automation-point-edit-picture"]

####
# DO point
####
${SELECTOR_AUTOMATION_POINT_DO_EDIT_DEFAULT_VALUE_ON_BUTTON}                xpath=//span[@data-qa-id="automation-point-edit-default-value-on"]
${SELECTOR_AUTOMATION_POINT_DO_EDIT_DEFAULT_VALUE_OFF_BUTTON}               xpath=//span[@data-qa-id="automation-point-edit-default-value-off"]
${SELECTOR_AUTOMATION_POINT_DO_EDIT_DEFAULT_VALUE_OLD_BUTTON}               xpath=//span[@data-qa-id="automation-point-edit-default-value-old-value"]
${SELECTOR_AUTOMATION_POINT_DO_EDIT_SPECIAL_TYPE_NORMAL_BUTTON}             xpath=//span[@data-qa-id="automation-point-edit-special-point-type-normal" and contains(@class, "active")]
${SELECTOR_AUTOMATION_POINT_DO_EDIT_SPECIAL_TYPE_LIMITED_BUTTON}            xpath=//span[@data-qa-id="automation-point-edit-special-point-type-limited" and contains(@class, "active")]
${SELECTOR_AUTOMATION_POINT_DO_EDIT_SPECIAL_TYPE_OVERRIDE_BUTTON}           xpath=//span[@data-qa-id="automation-point-edit-special-point-type-override"]
${SELECTOR_AUTOMATION_POINT_DO_EDIT_SPECIAL_POINT_ID_INPUT}                 xpath=//input[@data-qa-id="automation-point-edit-special-point-info-point-id"]
${SELECTOR_AUTOMATION_POINT_DO_EDIT_SPECIAL_POINT_LOCKSTATE_SELECT}         xpath=//mat-select[@data-qa-id="automation-point-edit-special-point-info-lock-state"]

####
# STATE TEXT
####
${SELECTOR_AUTOMATION_POINT_ST_EDIT_POINT_POINTNAME_INPUT}                  xpath=//input[@data-qa-id="automation-state-text-edit-point-name"]
${SELECTOR_AUTOMATION_POINT_ST_EDIT_SYNCHRONIZE_CHKBX}                      xpath=//input[@id="automation-state-text-edit-synchronize-input"]    # NO ID

${SELECTOR_AUTOMATION_POINT_ST_EDIT_VALUES1_VALUE_INPUT}                    xpath=//input[@data-qa-id="automation-state-text-edit-values1-value"]
${SELECTOR_AUTOMATION_POINT_ST_EDIT_VALUES1_TEXT_INPUT}                     xpath=//input[@data-qa-id="automation-state-text-edit-values1-text"]
${SELECTOR_AUTOMATION_POINT_ST_EDIT_VALUES1_DIALOG_CHKBX}                   xpath=//input[@id="automation-state-text-edit-values1-dialog-input"]
${SELECTOR_AUTOMATION_POINT_ST_EDIT_VALUES1_REMOVE_BUTTON}                  xpath=//button[@data-qa-id="automation-state-text-edit-values1-remove-button"]
${SELECTOR_AUTOMATION_POINT_ST_EDIT_VALUES2_ADD_BUTTON}                     xpath=//button[@data-qa-id="automation-state-text-edit-values2-add-button"]

${SELECTOR_AUTOMATION_POINT_ST_EDIT_CANCEL_BUTTON}                          xpath=//button[@data-qa-id="automation-state-text-edit-cancel-button"]
${SELECTOR_AUTOMATION_POINT_ST_EDIT_ADD_BUTTON}                             xpath=//button[@data-qa-id="automation-state-text-edit-add-button"]
${SELECTOR_AUTOMATION_POINT_ST_EDIT_SAVE_BUTTON}                            xpath=//button[@data-qa-id="automation-state-text-edit-save-button"]

####
# LOOKUP TABLE
####
${SELECTOR_AUTOMATION_POINT_LT_EDIT_POINT_ID_INPUT}                         xpath=//input[@data-qa-id="automation-lookup-table-edit-point-id"]
${SELECTOR_AUTOMATION_POINT_LT_EDIT_POINT_DESCR_INPUT}                      xpath=//input[@data-qa-id="automation-lookup-table-edit-point-description"]
${SELECTOR_AUTOMATION_POINT_LT_EDIT_LEVEL_VIEW_INPUT}                       xpath=//input[@data-qa-id="automation-lookup-table-edit-access-level-view"]
${SELECTOR_AUTOMATION_POINT_LT_EDIT_LEVEL_MANUAL_INPUT}                     xpath=//input[@data-qa-id="automation-lookup-table-edit-access-level-manual"]
${SELECTOR_AUTOMATION_POINT_LT_EDIT_LEVEL_PROGRAMMING_INPUT}                xpath=//input[@data-qa-id="automation-lookup-table-edit-access-level-programming"]

${SELECTOR_AUTOMATION_POINT_LT_EDIT_SENSOR_TYPE_SELECT}                     xpath=//mat-select[@data-qa-id="automation-lookup-table-edit-sensor-type"]
${SELECTOR_AUTOMATION_POINT_LT_EDIT_SENSOR_TYPE_1_RESISTIVE}                xpath=//mat-option[@data-qa-id="automation-lookup-table-edit-sensor-type-option1"]
${SELECTOR_AUTOMATION_POINT_LT_EDIT_SENSOR_TYPE_2_VOLTAGE}                  xpath=//mat-option[@data-qa-id="automation-lookup-table-edit-sensor-type-option2"]
${SELECTOR_AUTOMATION_POINT_LT_EDIT_SENSOR_TYPE_3_CURRENT}                  xpath=//mat-option[@data-qa-id="automation-lookup-table-edit-sensor-type-option3"]

${SELECTOR_AUTOMATION_POINT_LT_EDIT_OFFSET_INPUT}                           xpath=//input[@data-qa-id="automation-lookup-table-edit-offset"]
${SELECTOR_AUTOMATION_POINT_LT_EDIT_PICTURE_SELECT}                         xpath=//mat-select[@data-qa-id="automation-lookup-table-edit-picture"]
${SELECTOR_AUTOMATION_POINT_LT_EDIT_PICTURE_SELECT_2}                       xpath=//mat-option[@data-qa-id="automation-lookup-table-edit-picture-option2"]

${SELECTOR_AUTOMATION_POINT_LT_EDIT_X_AXIS_NAME_INPUT}                      xpath=//input[@data-qa-id="automation-lookup-table-edit-x-axis-name"]
${SELECTOR_AUTOMATION_POINT_LT_EDIT_Y_AXIS_NAME_INPUT}                      xpath=//input[@data-qa-id="automation-lookup-table-edit-y-axis-name"]
${SELECTOR_AUTOMATION_POINT_LT_EDIT_TABS_TABLE_BUTTON}                      xpath=//div[@data-qa-id="automation-lookup-table-edit-tabs-table"]
${SELECTOR_AUTOMATION_POINT_LT_EDIT_TABS_GRAPH_BUTTON}                      xpath=//div[@data-qa-id="automation-lookup-table-edit-tabs-graph"]

${SELECTOR_AUTOMATION_POINT_LT_EDIT_REMOVE_VALUES_BUTTON}                   xpath=//button[@data-qa-id="automation-lookup-table-edit-remove-values-button"]
${SELECTOR_AUTOMATION_POINT_LT_EDIT_VALUES1_IN_INPUT}                       xpath=//input[@data-qa-id="automation-lookup-table-edit-values1-in"]
${SELECTOR_AUTOMATION_POINT_LT_EDIT_VALUES1_OUT_INPUT}                      xpath=//input[@data-qa-id="automation-lookup-table-edit-values1-out"]
${SELECTOR_AUTOMATION_POINT_LT_EDIT_VALUES1_ADD_BUTTON}                     xpath=//button[@data-qa-id="automation-lookup-table-edit-values1-add-button"]
${SELECTOR_AUTOMATION_POINT_LT_EDIT_VALUES1_REMOVE_BUTTON}                  xpath=//button[@data-qa-id="automation-lookup-table-edit-values1-remove-button"]
${SELECTOR_AUTOMATION_POINT_LT_EDIT_VALUES2_IN_INPUT}                       xpath=//input[@data-qa-id="automation-lookup-table-edit-values2-in"]
${SELECTOR_AUTOMATION_POINT_LT_EDIT_VALUES2_OUT_INPUT}                      xpath=//input[@data-qa-id="automation-lookup-table-edit-values2-out"]
${SELECTOR_AUTOMATION_POINT_LT_EDIT_VALUES2_ADD_BUTTON}                     xpath=//button[@data-qa-id="automation-lookup-table-edit-values2-add-button"]
${SELECTOR_AUTOMATION_POINT_LT_EDIT_VALUES2_REMOVE_BUTTON}                  xpath=//button[@data-qa-id="automation-lookup-table-edit-values2-remove-button"]

${SELECTOR_AUTOMATION_POINT_LT_EDIT_ADD_BUTTON}                             xpath=//button[@data-qa-id="automation-lookup-table-edit-add-button"]
${SELECTOR_AUTOMATION_POINT_LT_EDIT_SAVE_BUTTON}                            xpath=//button[@data-qa-id="automation-lookup-table-edit-save-button"]
${SELECTOR_AUTOMATION_POINT_LT_EDIT_CANCEL_BUTTON}                          xpath=//button[@data-qa-id="automation-lookup-table-edit-cancel-button"]
${SELECTOR_AUTOMATION_POINT_LT_EDIT_X_AXIS_MIN_INPUT}                       xpath=//input[@data-qa-id="automation-lookup-table-edit-x-axis-min"]
${SELECTOR_AUTOMATION_POINT_LT_EDIT_X_AXIS_MAX_INPUT}                       xpath=//input[@data-qa-id="automation-lookup-table-edit-x-axis-max"]
${SELECTOR_AUTOMATION_POINT_LT_EDIT_Y_AXIS_MIN_INPUT}                       xpath=//input[@data-qa-id="automation-lookup-table-edit-y-axis-min"]
${SELECTOR_AUTOMATION_POINT_LT_EDIT_Y_AXIS_MAX_INPUT}                       xpath=//input[@data-qa-id="automation-lookup-table-edit-y-axis-max"]
${SELECTOR_AUTOMATION_POINT_LT_EDIT_REFRESH_BUTTON}                         xpath=//button[@data-qa-id="automation-lookup-table-edit-refresh-button"]

${SELECTOR_AUTOMATION_POINT_LT_EDIT_CHART_BUTTON}                           xpath=//g[@class="highcharts-button"]
${SELECTOR_AUTOMATION_POINT_LT_EDIT_CHART_CONTEXT_MENU}                     xpath=//g[@class="highcharts-no-tooltip highcharts-button highcharts-contextbutton highcharts-button-normal"]    # PDF download
${SELECTOR_AUTOMATION_POINT_LT_EDIT_CHART_LEGEND_ITEM}                      xpath=//g[@class="highcharts-legend-item highcharts-line-series highcharts-color-undefined highcharts-series-0"]    # Lookup table text bottom

####
# TIME SCHEDULE
####
${SELECTOR_AUTOMATION_POINT_TS_TABLE_ITEM1_CALENDAR_BUTTON}                 xpath=//button[@data-qa-id="automation-table-item1-actions-calendar"]
${SELECTOR_AUTOMATION_POINT_TS_TABLE_ITEM1_DETAILS_BUTTON}                  xpath=//button[@data-qa-id="automation-table-item1-actions-details"]
${SELECTOR_AUTOMATION_POINT_TS_CALENDAR_DIALOG_DAY1_EVENT1_BUTTON}          xpath=//div[@data-qa-id="automation-time-schedule-edit-table-day1-event1"]
${SELECTOR_AUTOMATION_POINT_TS_DETAILS_DIALOG_TABLE_BUTTON}                 xpath=//div[@data-qa-id="automation-dialog-list-tab" and contains(@class, "tab_item")]
${SELECTOR_AUTOMATION_POINT_TS_DETAILS_DIALOG_GRAPH_BUTTON}                 xpath=//div[@data-qa-id="automation-dialog-graph-tab" and contains(@class, "tab_item")]
${SELECTOR_AUTOMATION_POINT_TS_DETAILS_DIALOG_EVENT_BUTTON}                 xpath=//div[@data-qa-id="automation-dialog-event-tab" and contains(@class, "tab_item")]

${SELECTOR_AUTOMATION_POINT_TS_EDIT_DETAILS_BUTTON}                         xpath=//div[@data-qa-id="automation-time-schedule-edit-details"]
${SELECTOR_AUTOMATION_POINT_TS_EDIT_TABLE_BUTTON}                           xpath=//div[@data-qa-id="automation-time-schedule-edit-table"]

${SELECTOR_AUTOMATION_POINT_TS_EDIT_POINT_ID_INPUT}                         xpath=//input[@data-qa-id="automation-time-schedule-edit-point-id"]
${SELECTOR_AUTOMATION_POINT_TS_EDIT_POINT_DESCRIPTION_INPUT}                xpath=//input[@data-qa-id="automation-time-schedule-edit-point-description"]
${SELECTOR_AUTOMATION_POINT_TS_EDIT_ACCESS_LEVEL_VIEW_INPUT}                xpath=//input[@data-qa-id="automation-time-schedule-edit-access-level-view"]
${SELECTOR_AUTOMATION_POINT_TS_EDIT_ACCESS_LEVEL_MANUAL_INPUT}              xpath=//input[@data-qa-id="automation-time-schedule-edit-access-level-manual"]
${SELECTOR_AUTOMATION_POINT_TS_EDIT_ACCESS_LEVEL_PROGRAMMING_INPUT}         xpath=//input[@data-qa-id="automation-time-schedule-edit-access-level-programming"]
${SELECTOR_AUTOMATION_POINT_TS_STATE_TEXT_SELECT}                           xpath=//mat-select[@data-qa-id="automation-time-schedule-edit-state-text"]
${SELECTOR_AUTOMATION_POINT_TS_USE_SPECIAL_DAYS_CHECKBOX}                   xpath=//input[@id="automation-time-schedule-edit-use-special-days-input"]
${SELECTOR_AUTOMATION_POINT_TS_EVENT_TYPE_SELECT}                           xpath=//mat-select[@data-qa-id="automation-time-schedule-edit-default-type"]
${SELECTOR_AUTOMATION_POINT_TS_EVENT_TYPE_NORMAL}                           xpath=//span[contains(text(), 'Normal')]
${SELECTOR_AUTOMATION_POINT_TS_EVENT_TYPE_BOOLEAN}                          xpath=//span[contains(text(), 'Boolean')]
${SELECTOR_AUTOMATION_POINT_TS_EVENT_TYPE_UINT}                             xpath=//span[contains(text(), 'Unsigned int')]
${SELECTOR_AUTOMATION_POINT_TS_EVENT_TYPE_REAL}                             xpath=//span[contains(text(), 'Real')]
${SELECTOR_AUTOMATION_POINT_TS_EVENT_TYPE_ENUM}                             xpath=//span[contains(text(), 'Enumerated')]

${SELECTOR_AUTOMATION_POINT_TS_DEFAULT_VALUE_INPUT}                         xpath=//input[@data-qa-id="automation-time-schedule-event-edit-value"]
${SELECTOR_AUTOMATION_POINT_TS_SET_VALUE_OPTION_1}                          xpath=//mat-option[@data-qa-id="automation-time-schedule-event-edit-type-option1"]
${SELECTOR_AUTOMATION_POINT_TS_SET_VALUE_OPTION_2}                          xpath=//mat-option[@data-qa-id="automation-time-schedule-event-edit-type-option2"]

${SELECTOR_AUTOMATION_POINT_TS_DECIMALS_INPUT}                              xpath=//input[@data-qa-id="automation-time-schedule-edit-decimals"]
${SELECTOR_AUTOMATION_POINT_TS_FOLLOW_TYPE_LAST_VALUE_BUTTON}               xpath=//span[@data-qa-id="automation-time-schedule-edit-follow-type-last-value"]
${SELECTOR_AUTOMATION_POINT_TS_FOLLOW_TYPE_DEFAULT_VALUE_BUTTON}            xpath=//span[@data-qa-id="automation-time-schedule-edit-follow-type-default-value"]
${SELECTOR_AUTOMATION_POINT_TS_SYNCHRONIZE_CHECKBOX}                        xpath=//input[@id='automation-time-schedule-edit-synchronize-input']
${SELECTOR_AUTOMATION_POINT_TS_PICTURE_SELECT}                              xpath=//mat-select[@data-qa-id="automation-time-schedule-edit-picture"]
${SELECTOR_AUTOMATION_POINT_TS_ADD_BUTTON}                                  xpath=//button[@data-qa-id="automation-time-schedule-edit-add-button"]
${SELECTOR_AUTOMATION_POINT_TS_SAVE_BUTTON}                                 xpath=//button[@data-qa-id="automation-time-schedule-edit-save-button"]
${SELECTOR_AUTOMATION_POINT_TS_CANCEL_BUTTON}                               xpath=//button[@data-qa-id="automation-time-schedule-edit-cancel-button"]

${SELECTOR_AUTOMATION_POINT_TS_TABLE_DAY_COPY_BUTTON}                       xpath=//button[@data-qa-id="automation-time-schedule-edit-day-copy-button"]
${SELECTOR_AUTOMATION_POINT_TS_TABLE_DAY1_EVENT1}                           xpath=//div[@data-qa-id="automation-time-schedule-edit-table-day1-event1"]

${SELECTOR_AUTOMATION_POINT_TS_EVENT_DIALOG_ADD}                            xpath=//div[@data-qa-id='automation-time-schedule-event-dialog-add']
${SELECTOR_AUTOMATION_POINT_TS_EVENT_DIALOG_EDIT}                           xpath=//div[@data-qa-id="automation-time-schedule-event-dialog-edit"]
${SELECTOR_AUTOMATION_POINT_TS_EVENT_DIALOG_COPY}                           xpath=//div[@data-qa-id="automation-time-schedule-event-dialog-copy"]
${SELECTOR_AUTOMATION_POINT_TS_EVENT_DIALOG_PASTE}                          xpath=//div[@data-qa-id="automation-time-schedule-event-dialog-paste"]
${SELECTOR_AUTOMATION_POINT_TS_EVENT_DIALOG_CLEAR}                          xpath=//div[@data-qa-id="automation-time-schedule-event-dialog-clear"]

${SELECTOR_AUTOMATION_POINT_TS_EVENT_CREATE_DIALOG_TIME_INPUT}              xpath=//input[@data-qa-id='automation-time-schedule-event-edit-time']
${SELECTOR_AUTOMATION_POINT_TS_EVENT_CREATE_DIALOG_VALUE_SELECT}            xpath=//mat-select[@data-qa-id="automation-time-schedule-event-edit-type"]

${SELECTOR_AUTOMATION_POINT_TS_EVENT_CREATE_DIALOG_VALUE_INPUT}             xpath=//input[@data-qa-id='automation-time-schedule-event-edit-value']
${SELECTOR_AUTOMATION_POINT_TS_EVENT_CREATE_DIALOG_CREATE_BUTTON}           xpath=//button[@data-qa-id='automation-time-schedule-event-edit-create-button']
${SELECTOR_AUTOMATION_POINT_TS_EVENT_CREATE_DIALOG_CANCEL_BUTTON}           xpath=//button[@data-qa-id='automation-time-schedule-event-edit-cancel-button']
${SELECTOR_AUTOMATION_POINT_TS_EVENT_CREATE_DIALOG_SAVE_BUTTON}             xpath=//button[@data-qa-id='automation-time-schedule-event-edit-save-button']
${SELECTOR_AUTOMATION_POINT_TS_EVENT_CREATE_DIALOG_CLOSE_BUTTON}            xpath=//mat-icon[@data-qa-id='automation-time-schedule-event-edit-close']

####
# ALARM POINT
####
${SELECTOR_AUTOMATION_POINT_AP_EDIT_ALERTA_NUMBER_INPUT}                    xpath=//input[@data-qa-id="automation-point-edit-alerta-number"]

${SELECTOR_AUTOMATION_POINT_AP_EDIT_NORMALLY_CLOSED_CHKBX}                  xpath=//input[@id='automation-point-edit-closed-contact-input']
${SELECTOR_AUTOMATION_POINT_AP_EDIT_PRIORITY_INPUT}                         xpath=//input[@data-qa-id="automation-point-edit-priority"]
${SELECTOR_AUTOMATION_POINT_AP_EDIT_SAVE_LOG_SELECT}                        xpath=//mat-select[@data-qa-id="automation-point-edit-save-log"]
${SELECTOR_AUTOMATION_POINT_AP_EDIT_ALARM_GROUP_SELECT}                     xpath=//mat-select[@data-qa-id="automation-point-edit-alarm-group"]
${SELECTOR_AUTOMATION_POINT_AP_EDIT_PICTURE_SELECT}                         xpath=//mat-select[@data-qa-id="automation-point-edit-picture"]
${SELECTOR_AUTOMATION_POINT_AP_EDIT_ALARM_TYPE_NORMAL_BUTTON}               xpath=//span[@data-qa-id="automation-point-edit-alarm-type-normal"]
${SELECTOR_AUTOMATION_POINT_AP_EDIT_ALARM_TYPE_LIMIT_BUTTON}                xpath=//span[@data-qa-id="automation-point-edit-alarm-type-limit"]
${SELECTOR_AUTOMATION_POINT_AP_EDIT_ALARM_TYPE_MODULE_BUTTON}               xpath=//span[@data-qa-id="automation-point-edit-alarm-type-module"]
${SELECTOR_AUTOMATION_POINT_AP_EDIT_ALARM_TYPE_CONFLICT_BUTTON}             xpath=//span[@data-qa-id="automation-point-edit-alarm-type-conflict"]

${SELECTOR_AUTOMATION_POINT_AP_EDIT_NORMAL_LOCK_POINT_ID_INPUT}             xpath=//input[@data-qa-id="automation-point-edit-alarm-options-lock-point-id"]
${SELECTOR_AUTOMATION_POINT_AP_EDIT_NORMAL_LOCK_POINT_STATE_INPUT}          xpath=//input[@data-qa-id="automation-point-edit-alarm-options-lock-point-state"]

${SELECTOR_AUTOMATION_POINT_AP_EDIT_LIMIT_POINT_ID_INPUT}                   xpath=//input[@data-qa-id="automation-point-edit-alarm-options-limit-point-id"]
${SELECTOR_AUTOMATION_POINT_AP_EDIT_LIMIT1_MODE_SELECT}                     xpath=//mat-select[@data-qa-id="automation-point-edit-alarm-options-limit1-mode"]
${SELECTOR_AUTOMATION_POINT_AP_EDIT_LIMIT1_LIMIT_INPUT}                     xpath=//input[@data-qa-id="automation-point-edit-alarm-options-limit1-limit"]
${SELECTOR_AUTOMATION_POINT_AP_EDIT_LIMIT2_MODE_SELECT}                     xpath=//mat-select[@data-qa-id='automation-point-edit-alarm-options-limit2-mode']
${SELECTOR_AUTOMATION_POINT_AP_EDIT_LIMIT2_LIMIT_INPUT}                     xpath=//input[@data-qa-id='automation-point-edit-alarm-options-limit2-limit']

${SELECTOR_AUTOMATION_POINT_AP_EDIT_LIMIT_OPERATION_SELECT}                 xpath=//mat-select[@data-qa-id="automation-point-edit-alarm-options-operation"]
${SELECTOR_AUTOMATION_POINT_AP_EDIT_LIMIT_DEAD_ZONE_INPUT}                  xpath=//input[@data-qa-id="automation-point-edit-alarm-options-dead-zone"]
${SELECTOR_AUTOMATION_POINT_AP_EDIT_LIMIT_CLEAR_RUN_TIME_CHKBX}             xpath=//input[@data-qa-id="automation-point-edit-alarm-options-clear-run-time-input"]

${SELECTOR_AUTOMATION_POINT_AP_EDIT_MODULE_TYPE_PORT_INPUT}                 xpath=//input[@data-qa-id="automation-point-edit-alarm-options-port"]
${SELECTOR_AUTOMATION_POINT_AP_EDIT_MODULE_TYPE_MODULE_INPUT}               xpath=//input[@data-qa-id="automation-point-edit-alarm-options-module"]
${SELECTOR_AUTOMATION_POINT_AP_LINK_ICON}                                   xpath=//span[@class="link_icon"]    # NO ID
${SELECTOR_AUTOMATION_POINT_AP_MODULE_TYPE_SENSITIVITY_INPUT}               xpath=//input[@data-qa-id="automation-point-edit-alarm-options-sensitivity"]

${SELECTOR_AUTOMATION_POINT_AP_CONFLICT_POINT_ID_1_INPUT}                   xpath=//input[@data-qa-id="automation-point-edit-alarm-options-point-id-1"]
${SELECTOR_AUTOMATION_POINT_AP_CONFLICT_POINT_ID_2_INPUT}                   xpath=//input[@data-qa-id="automation-point-edit-alarm-options-point-id-2"]

${SELECTOR_AUTOMATION_POINT_AP_LIMIT_LIMIT_1_SELECT}                        xpath=//mat-select[@name='limit1limit']    # No data-qa-id !
${SELECTOR_AUTOMATION_POINT_AP_LIMIT_OPTION_1}                              xpath=//mat-option[@data-qa-id="automation-point-edit-alarm-options-limit1-limit-option-1"]
${SELECTOR_AUTOMATION_POINT_AP_LIMIT_OPTION_2}                              xpath=//mat-option[@data-qa-id="automation-point-edit-alarm-options-limit1-limit-option-2"]
${SELECTOR_AUTOMATION_POINT_AP_LIMIT_OPTION_3}                              xpath=//mat-option[@data-qa-id="automation-point-edit-alarm-options-limit1-limit-option-3"]
${SELECTOR_AUTOMATION_POINT_AP_LIMIT_OPTION_4}                              xpath=//mat-option[@data-qa-id="automation-point-edit-alarm-options-limit1-limit-option-4"]

${SELECTOR_AUTOMATION_POINT_AP_LIMIT_OPTIONS_OPERATION}                     xpath=//mat-select[@data-qa-id="automation-point-edit-alarm-options-operation"]
${SELECTOR_AUTOMATION_POINT_AP_LIMIT_OPTIONS_OPERATION_OPTION1}             xpath=//mat-option[@data-qa-id="automation-point-edit-alarm-options-operation-option1"]
${SELECTOR_AUTOMATION_POINT_AP_LIMIT_OPTIONS_OPERATION_OPTION2}             xpath=//mat-option[@data-qa-id="automation-point-edit-alarm-options-operation-option2"]
${SELECTOR_AUTOMATION_POINT_AP_LIMIT_OPTIONS_OPERATION_OPTION3}             xpath=//mat-option[@data-qa-id="automation-point-edit-alarm-options-operation-option3"]

${SELECTOR_AUTOMATION_POINT_AP_LIMIT_OPTIONS_LIMIT2_MODE}                   xpath=//mat-select[@data-qa-id="automation-point-edit-alarm-options-limit2-mode"]
${SELECTOR_AUTOMATION_POINT_AP_LIMIT_OPTIONS_LIMIT2_MODE_OPTION1}           xpath=//mat-option[@data-qa-id="automation-point-edit-alarm-options-limit2-mode-option1"]
${SELECTOR_AUTOMATION_POINT_AP_LIMIT_OPTIONS_LIMIT2_MODE_OPTION2}           xpath=//mat-option[@data-qa-id="automation-point-edit-alarm-options-limit2-mode-option2"]

${SELECTOR_AUTOMATION_POINT_AP_LIMIT_LIMIT_2_SELECT}                        xpath=//mat-select[@name='limit2limit']    # No data-qa-id !
${SELECTOR_AUTOMATION_POINT_AP_LIMIT_OPTIONS_LIMIT2_LIMIT_OPTION_1}         xpath=//mat-option[@data-qa-id="automation-point-edit-alarm-options-limit2-limit-option-1"]
${SELECTOR_AUTOMATION_POINT_AP_LIMIT_OPTIONS_LIMIT2_LIMIT_OPTION_2}         xpath=//mat-option[@data-qa-id="automation-point-edit-alarm-options-limit2-limit-option-2"]
${SELECTOR_AUTOMATION_POINT_AP_LIMIT_OPTIONS_LIMIT2_LIMIT_OPTION_3}         xpath=//mat-option[@data-qa-id="automation-point-edit-alarm-options-limit2-limit-option-3"]
${SELECTOR_AUTOMATION_POINT_AP_LIMIT_OPTIONS_LIMIT2_LIMIT_OPTION_4}         xpath=//mat-option[@data-qa-id="automation-point-edit-alarm-options-limit2-limit-option-4"]

${SELECTOR_AUTOMATION_POINT_AP_LIMIT_OPTIONS_DEAD_ZONE}                     xpath=//input[@data-qa-id="automation-point-edit-alarm-options-dead-zone"]

${SELECTOR_AUTOMATION_POINT_AP_LIMIT_RESET_MEASUREMENT_CHKBX}               xpath=//input[@id="automation-point-edit-alarm-options-clear-run-time-input"]

${SELECTOR_AUTOMATION_POINT_AR_MODULE_OPTIONS_PORT}                         xpath=//input[@data-qa-id="automation-point-edit-alarm-options-port"]
${SELECTOR_AUTOMATION_POINT_AR_MODULE_OPTIONS_MODULE}                       xpath=//input[@data-qa-id="automation-point-edit-alarm-options-module"]

${SELECTOR_AUTOMATION_POINT_AR_MODULE_OPTIONS_SENSITIVITY}                  xpath=//input[@data-qa-id="automation-point-edit-alarm-options-sensitivity"]

####
# ALARM DEVICE
####

${SELECTOR_AUTOMATION_POINT_AD_EDIT_NAME_INPUT}                             xpath=//input[@data-qa-id='automation-alarm-device-edit-device-name']
${SELECTOR_AUTOMATION_POINT_AD_EDIT_DEVICE_TYPE_SELECT}                     xpath=//mat-select[@data-qa-id="automation-alarm-device-edit-device-type"]
${SELECTOR_AUTOMATION_POINT_AD_EDIT_DEVICE_TYPE_OPTION1}                    xpath=//mat-option[@data-qa-id='automation-alarm-device-edit-device-type-option1']
${SELECTOR_AUTOMATION_POINT_AD_EDIT_DEVICE_TYPE_OPTION2}                    xpath=//mat-option[@data-qa-id='automation-alarm-device-edit-device-type-option2']
${SELECTOR_AUTOMATION_POINT_AD_EDIT_DEVICE_TYPE_OPTION3}                    xpath=//mat-option[@data-qa-id='automation-alarm-device-edit-device-type-option3']
${SELECTOR_AUTOMATION_POINT_AD_EDIT_DEVICE_TYPE_OPTION4}                    xpath=//mat-option[@data-qa-id='automation-alarm-device-edit-device-type-option4']
${SELECTOR_AUTOMATION_POINT_AD_EDIT_DEVICE_TYPE_OPTION5}                    xpath=//mat-option[@data-qa-id='automation-alarm-device-edit-device-type-option5']
${SELECTOR_AUTOMATION_POINT_AD_EDIT_DEVICE_TYPE_OPTION6}                    xpath=//mat-option[@data-qa-id='automation-alarm-device-edit-device-type-option6']

${SELECTOR_AUTOMATION_POINT_AD_EDIT_EVENTS_ACKNOWLEDGE_CHKBX}               xpath=//input[@id='automation-alarm-device-edit-events-acknowledge-input']
${SELECTOR_AUTOMATION_POINT_AD_EDIT_EVENTS_LOCK_STATE_CHKBX}                xpath=//input[@id='automation-alarm-device-edit-events-lock-state-input']

${SELECTOR_AUTOMATION_POINT_AD_EDIT_EVENTS_STATE0_CHKBX}                    xpath=//input[@id='automation-alarm-device-edit-events-state0-input']
${SELECTOR_AUTOMATION_POINT_AD_EDIT_EVENTS_STATE1_CHKBX}                    xpath=//input[@id='automation-alarm-device-edit-events-state1-input']
${SELECTOR_AUTOMATION_POINT_AD_EDIT_EVENTS_STATE2_CHKBX}                    xpath=//input[@id='automation-alarm-device-edit-events-state2-input']
${SELECTOR_AUTOMATION_POINT_AD_EDIT_EVENTS_STATE3_CHKBX}                    xpath=//input[@id='automation-alarm-device-edit-events-state3-input']
${SELECTOR_AUTOMATION_POINT_AD_EDIT_EVENTS_STATE4_CHKBX}                    xpath=//input[@id='automation-alarm-device-edit-events-state4-input']
${SELECTOR_AUTOMATION_POINT_AD_EDIT_EVENTS_STATE5_CHKBX}                    xpath=//input[@id='automation-alarm-device-edit-events-state5-input']
${SELECTOR_AUTOMATION_POINT_AD_EDIT_EVENTS_STATE6_CHKBX}                    xpath=//input[@id='automation-alarm-device-edit-events-state6-input']
${SELECTOR_AUTOMATION_POINT_AD_EDIT_EVENTS_STATE7_CHKBX}                    xpath=//input[@id='automation-alarm-device-edit-events-state7-input']
${SELECTOR_AUTOMATION_POINT_AD_EDIT_EVENTS_STATE8_CHKBX}                    xpath=//input[@id='automation-alarm-device-edit-events-state8-input']
${SELECTOR_AUTOMATION_POINT_AD_EDIT_EVENTS_STATE9_CHKBX}                    xpath=//input[@id='automation-alarm-device-edit-events-state9-input']
${SELECTOR_AUTOMATION_POINT_AD_EDIT_EVENTS_STATE10_CHKBX}                   xpath=//input[@id='automation-alarm-device-edit-events-state10-input']
${SELECTOR_AUTOMATION_POINT_AD_EDIT_EVENTS_STATE11_CHKBX}                   xpath=//input[@id='automation-alarm-device-edit-events-state11-input']

${SELECTOR_AUTOMATION_POINT_AD_EDIT_EMAIL_INPUT}                            xpath=//*[@data-qa-id="automation-alarm-device-edit-email-address"]
${SELECTOR_AUTOMATION_POINT_AD_EDIT_EMAIL_SERVER_SELECT}                    xpath=//*[@data-qa-id="automation-alarm-device-edit-email-server"]
${SELECTOR_AUTOMATION_POINT_AD_EDIT_EMAIL_SERVER_OPTION1}                   xpath=//*[@data-qa-id='automation-alarm-device-edit-email-server-option1']
${SELECTOR_AUTOMATION_POINT_AD_EDIT_EMAIL_SERVER_OPTION2}                   xpath=//*[@data-qa-id='automation-alarm-device-edit-email-server-option2']
${SELECTOR_AUTOMATION_POINT_AD_EDIT_EMAIL_SERVER_OPTION3}                   xpath=//*[@data-qa-id='automation-alarm-device-edit-email-server-option3']
${SELECTOR_AUTOMATION_POINT_AD_EDIT_EMAIL_SERVER_OPTION4}                   xpath=//*[@data-qa-id='automation-alarm-device-edit-email-server-option4']
${SELECTOR_AUTOMATION_POINT_AD_EDIT_EMAIL_SERVER_OPTION5}                   xpath=//*[@data-qa-id='automation-alarm-device-edit-email-server-option5']

${SELECTOR_AUTOMATION_POINT_AD_EDIT_TEMPLATE_SELECT}                        xpath=//*[@data-qa-id="automation-alarm-device-edit-template"]

${SELECTOR_AUTOMATION_POINT_AD_EDIT_SMS_COMMAND_CHKBX}                      xpath=//input[@id='automation-alarm-device-edit-sms-commands-input']

${SELECTOR_AUTOMATION_POINT_AD_EDIT_SMS_IP_ADDRESS_INPUT}                   xpath=//input[@data-qa-id='automation-alarm-device-edit-sms-ip-address']
${SELECTOR_AUTOMATION_POINT_AD_EDIT_SMS_IP_PORT_INPUT}                      xpath=//input[@data-qa-id='automation-alarm-device-edit-sms-ip-port']
${SELECTOR_AUTOMATION_POINT_AD_EDIT_SMS_PHONE_NUMBER_INPUT}                 xpath=//input[@data-qa-id='automation-alarm-device-edit-sms-phone-number']
${SELECTOR_AUTOMATION_POINT_AD_EDIT_SMS_BACKUP_NUMBER1_INPUT}               xpath=//input[@data-qa-id='automation-alarm-device-edit-sms-backup-number1']
${SELECTOR_AUTOMATION_POINT_AD_EDIT_SMS_BACKUP_NUMBER2_INPUT}               xpath=//input[@data-qa-id='automation-alarm-device-edit-sms-backup-number2']
${SELECTOR_AUTOMATION_POINT_AD_EDIT_SMS_BACKUP_NUMBER3_INPUT}               xpath=//input[@data-qa-id='automation-alarm-device-edit-sms-backup-number3']
${SELECTOR_AUTOMATION_POINT_AD_EDIT_SMS_BACKUP_NUMBER4_INPUT}               xpath=//input[@data-qa-id='automation-alarm-device-edit-sms-backup-number4']

${SELECTOR_AUTOMATION_POINT_AD_EDIT_TEMPLATE_OPTION2}                       xpath=//mat-option[@data-qa-id='automation-alarm-device-edit-template-option2']

${SELECTOR_AUTOMATION_POINT_AD_EDIT_DO_POINT_NAME_INPUT}                    xpath=//input[@data-qa-id='automation-alarm-device-edit-do-point-name']
${SELECTOR_AUTOMATION_POINT_AD_EDIT_DO_MODE_UNACKNOWLEDGED}                 xpath=//span[@data-qa-id='automation-alarm-device-edit-do-mode-unacknowledged']
${SELECTOR_AUTOMATION_POINT_AD_EDIT_DO_MODE_ACTIVE}                         xpath=//span[@data-qa-id='automation-alarm-device-edit-do-mode-active']
${SELECTOR_AUTOMATION_POINT_AD_EDIT_DO_MODE_BOTH}                           xpath=//span[@data-qa-id='automation-alarm-device-edit-do-mode-both']

${SELECTOR_AUTOMATION_POINT_AD_EDIT_FORWARDING_IP_ADDRESS_INPUT}            xpath=//input[@data-qa-id='automation-alarm-device-edit-forwarding-ip-address']
${SELECTOR_AUTOMATION_POINT_AD_EDIT_FORWARDING_IP_PORT_INPUT}               xpath=//input[@data-qa-id='automation-alarm-device-edit-forwarding-ip-port']

${SELECTOR_AUTOMATION_POINT_AD_EDIT_ALERTA_IP_ADDRESS_INPUT}                xpath=//input[@data-qa-id='automation-alarm-device-edit-alerta-ip-address']
${SELECTOR_AUTOMATION_POINT_AD_EDIT_ALERTA_IP_PORT_INPUT}                   xpath=//input[@data-qa-id='automation-alarm-device-edit-alerta-ip-port']

${SELECTOR_AUTOMATION_POINT_AD_EDIT_WEB_SERVICE_TYPE_SELECT}                xpath=//mat-select[@data-qa-id='automation-alarm-device-edit-web-service-type']
${SELECTOR_AUTOMATION_POINT_AD_EDIT_WEB_SERVICE_TYPE_OPTION1}               xpath=//mat-option[@data-qa-id='automation-alarm-device-edit-web-service-type-option1']
${SELECTOR_AUTOMATION_POINT_AD_EDIT_WEB_SERVICE_ADDRESS_INPUT}              xpath=//input[@data-qa-id='automation-alarm-device-edit-web-service-address']
${SELECTOR_AUTOMATION_POINT_AD_EDIT_WEB_SERVICE_SYSTEM_ID_INPUT}            xpath=//input[@data-qa-id='automation-alarm-device-edit-web-service-system-id']
${SELECTOR_AUTOMATION_POINT_AD_EDIT_WEB_SERVICE_PASSWORD_INPUT}             xpath=//input[@data-qa-id='automation-alarm-device-edit-web-service-password']
${SELECTOR_AUTOMATION_POINT_AD_EDIT_WEB_SERVICE_ORGANIZATION_ID_INPUT}      xpath=//input[@data-qa-id='automation-alarm-device-edit-web-service-organization-id']

${SELECTOR_AUTOMATION_POINT_AD_EDIT_SYNCHRONIZE_CHKBX}                      xpath=//input[@id='automation-alarm-device-edit-synchronize-input']
${SELECTOR_AUTOMATION_POINT_AD_EDIT_ADD_BUTTON}                             xpath=//button[@data-qa-id='automation-alarm-device-edit-add-button']
${SELECTOR_AUTOMATION_POINT_AD_EDIT_SAVE_BUTTON}                            xpath=//button[@data-qa-id="automation-alarm-device-edit-save-button"]
${SELECTOR_AUTOMATION_POINT_AD_EDIT_CANCEL_BUTTON}                          xpath=//button[@data-qa-id="automation-alarm-device-edit-cancel-button"]

####
# ALARM GROUP
####

${SELECTOR_AUTOMATION_POINT_AG_EDIT_GROUP_NAME_INPUT}                       xpath=//input[@data-qa-id="automation-alarm-group-edit-group-name"]
${SELECTOR_AUTOMATION_POINT_AG_EDIT_TIME_SCHEDULE_SELECT}                   xpath=//mat-select[@data-qa-id="automation-alarm-group-edit-time-schedule"]
${SELECTOR_AUTOMATION_POINT_AG_EDIT_SYNCHRONIZE_CHKBX}                      xpath=//input[@id="automation-alarm-group-edit-synchronize-input"]    # NO ID

${SELECTOR_AUTOMATION_POINT_AG_EDIT_STATE0_BUTTONS}                         xpath=//span[@data-qa-id="automation-alarm-group-edit-state0"]
${SELECTOR_AUTOMATION_POINT_AG_EDIT_STATE1_BUTTONS}                         xpath=//span[@data-qa-id="automation-alarm-group-edit-state1"]
${SELECTOR_AUTOMATION_POINT_AG_EDIT_STATE2_BUTTONS}                         xpath=//span[@data-qa-id="automation-alarm-group-edit-state2"]
${SELECTOR_AUTOMATION_POINT_AG_EDIT_STATE3_BUTTONS}                         xpath=//span[@data-qa-id="automation-alarm-group-edit-state3"]
${SELECTOR_AUTOMATION_POINT_AG_EDIT_STATE4_BUTTONS}                         xpath=//span[@data-qa-id="automation-alarm-group-edit-state4"]

${SELECTOR_AUTOMATION_POINT_AG_EDIT_DEVICE_TABLE_ROW}                       xpath=//tr[@data-qa-id="automation-alarm-group-edit-device-table-itemNaN"]
${SELECTOR_AUTOMATION_POINT_AG_EDIT_DEVICE_TABLE_ITEM}                      xpath=//*[@data-qa-id="automation-alarm-group-edit-device-table-itemNaN"]
${SELECTOR_AUTOMATION_POINT_AG_EDIT_DEVICE_TABLE_ROW_TEXT}                  xpath=//tr[@data-qa-id="automation-alarm-group-edit-device-table-itemNaN"]/td[text()="ROBOT_TEST_EMAIL"]

${SELECTOR_AUTOMATION_POINT_AG_EDIT_ADD_BUTTON}                             xpath=//button[@data-qa-id="automation-alarm-group-edit-add-button"]
${SELECTOR_AUTOMATION_POINT_AG_EDIT_SAVE_BUTTON}                            xpath=//button[@data-qa-id="automation-alarm-group-edit-save-button"]
${SELECTOR_AUTOMATION_POINT_AG_EDIT_CANCEL_BUTTON}                          xpath=//button[@data-qa-id="automation-alarm-group-edit-cancel-button"]

####
# MODULES
####

${SELECTOR_AUTOMATION_MODULE_EDIT_CONNECTION_PORT_SELECT}                   xpath=//mat-select[@data-qa-id="automation-module-edit-port"]
${SELECTOR_AUTOMATION_MODULE_EDIT_CONNECTION_ADDRESS_SELECT}                xpath=//mat-select[@data-qa-id="automation-module-edit-address"]
${SELECTOR_AUTOMATION_MODULE_EDIT_MODULE_TYPE_SELECT}                       xpath=//mat-select[@data-qa-id="automation-module-edit-module-type"]
${SELECTOR_AUTOMATION_MODULE_EDIT_TCP_UDP_MODULE_CHKBX}                     xpath=//input[@id="automation-module-edit-tcp-udp-module-input"]    # NO ID
${SELECTOR_AUTOMATION_MODULE_EDIT_TCP_UDP_MODULE_IP_ADDRESS_INPUT}          xpath=//input[@data-qa-id='automation-module-edit-ip-address']
${SELECTOR_AUTOMATION_MODULE_EDIT_TCP_UDP_MODULE_IP_PORT_INPUT}             xpath=//input[@data-qa-id='automation-module-edit-ip-port']

${SELECTOR_AUTOMATION_MODULE_EDIT_DEBUG_CHKBX}                              xpath=//input[@id="automation-module-edit-debug-input"]
${SELECTOR_AUTOMATION_MODULE_EDIT_TIMEOUT_INPUT}                            xpath=//input[@data-qa-id="automation-module-edit-timeout"]

${SELECTOR_AUTOMATION_MODULE_EDIT_ADD_BUTTON}                               xpath=//button[@data-qa-id="automation-module-edit-add-button"]

${SELECTOR_AUTOMATION_MODULE_EDIT_SAVE_BUTTON}                              xpath=//button[@data-qa-id="automation-module-edit-save-button"]
${SELECTOR_AUTOMATION_MODULE_EDIT_CANCEL_BUTTON}                            xpath=//button[@data-qa-id="automation-module-edit-cancel-button"]

${SELECTOR_AUTOMATION_MODULE_TOOLBAR_CONNECTIONS_BUTTON}                    xpath=//button[@data-qa-id="automation-toolbar-buttons-connections"]
${SELECTOR_AUTOMATION_MODULE_TOOLBAR_CLEAR_ERRORS_BUTTON}                   xpath=//button[@data-qa-id="automation-toolbar-buttons-clear-errors"]
${SELECTOR_AUTOMATION_MODULE_TOOLBAR_PROGRAM_BUTTON}                        xpath=//button[@data-qa-id="automation-toolbar-buttons-program" and @disabled=""]
${SELECTOR_AUTOMATION_MODULE_TOOLBAR_FIND_MODULES_BUTTON}                   xpath=//button[@data-qa-id="automation-toolbar-buttons-find-modules"]

${SELECTOR_AUTOMATION_MODULE_TOOLBAR_FIND_MODULES_DIALOG_TEXT}              xpath=//div[contains(@class, 'dialog_content')]//div[contains(@class, 'dialog_title') and text()='Searching modules']
${SELECTOR_AUTOMATION_MODULE_TOOLBAR_FIND_MODULES_DIALOG_CLOSE_BUTTON}      xpath=//button[@data-qa-id='automation-module-find-dialog-close-button']
${SELECTOR_AUTOMATION_MODULE_ITEM1_PREVIEW_BUTTON}                          xpath=//button[@data-qa-id="automation-table-item1-preview"]

${SELECTOR_AUTOMATION_MODULE_DETAILS_DIALOG_PRINT_BUTTON}                   xpath=//button[@data-qa-id="automation-module-view-dialog-print-button"]
${SELECTOR_AUTOMATION_MODULE_DETAILS_DIALOG_CANCEL_BUTTON}                  xpath=//button[@data-qa-id="automation-module-view-dialog-cancel-button"]

${SELECTOR_AUTOMATION_MODULE_SEARCH_DIALOG_CLOSE_BUTTON}                    xpath=//button[@data-qa-id="automation-module-find-dialog-close-button"]

${SELECTOR_AUTOMATION_MODULE_UPGRADE_ICON}                                  xpath=//mat-icon[@svgicon="module-upgrade"]
${SELECTOR_AUTOMATION_MODULE_TABLE_ROW1_VERSION}                            xpath=//div[@data-qa-id='automation-table-item1-version']

${SELECTOR_AUTOMATION_MODULE_CREATE_PORT_SELECT}                            xpath=//mat-select[@data-qa-id="automation-module-edit-port"]
${SELECTOR_AUTOMATION_MODULE_CREATE_PORT_1_SELECT}                          xpath=//mat-option[@data-qa-id="automation-module-edit-port-option1"]

${SELECTOR_AUTOMATION_MODULE_CREATE_ADDRESS_SELECT}                         xpath=//mat-select[@data-qa-id="automation-module-edit-address"]
${SELECTOR_AUTOMATION_MODULE_CREATE_ADDRESS_1_SELECT}                       xpath=//mat-option[@data-qa-id="automation-module-edit-address-option1"]

${SELECTOR_AUTOMATION_MODULE_CREATE_DO_WDOG_DELAY_INPUT}                    xpath=//input[@data-qa-id="automation-module-edit-reset-delay"]
${SELECTOR_AUTOMATION_MODULE_CREATE_DO_DEFAULT_DELAY_INPUT}                 xpath=//input[@data-qa-id="automation-module-edit-standby-delay"]

${SELECTOR_AUTOMATION_MODULE_CREATE_MBUS_DEVICE_NUMBER_INPUT}               xpath=//input[@data-qa-id="automation-module-edit-mbus-serial-number"]
${SELECTOR_AUTOMATION_MODULE_CREATE_MBUS_ADDRESS_INPUT}                     xpath=//input[@data-qa-id="automation-module-edit-mbus-address"]

${SELECTOR_AUTOMATION_MODULE_CREATE_MBUS_USE_SECONDARY_CHKBX}               xpath=//input[@id="automation-module-edit-mbus-use-secondary-address-input"]
${SELECTOR_AUTOMATION_MODULE_CREATE_MBUS_SEND_RESET_CHKBX}                  xpath=//input[@id="automation-module-edit-mbus-send-reset-command-input"]

${SELECTOR_AUTOMATION_MODULE_CREATE_SPIDER_ERROR_CLOSE_BUTTON}              xpath=//button[@data-qa-id="notification-dialog-close-button"]

# Module details

${SELECTOR_AUTOMATION_MODULE_VIEW_DIALOG_CLOSE_ICON}                        xpath=//mat-icon[@data-qa-id='automation-module-view-dialog-close']

${SELECTOR_AUTOMATION_MODULE_VIEW_DIALOG_CANCEL_BUTTON}                     xpath=//button[@data-qa-id='automation-module-view-dialog-cancel-button']
${SELECTOR_AUTOMATION_MODULE_VIEW_DIALOG_CLEAR_BUTTON}                      xpath=//button[@data-qa-id='automation-module-view-dialog-clear-button']

${SELECTOR_AUTOMATION_MODULE_VIEW_DIALOG_TABLE1_ROW1}                       xpath=//tr[@data-qa-id='automation-module-view-dialog-table1-row1']
${SELECTOR_AUTOMATION_MODULE_VIEW_DIALOG_TABLE1_ROW2}                       xpath=//tr[@data-qa-id='automation-module-view-dialog-table1-row2']
${SELECTOR_AUTOMATION_MODULE_VIEW_DIALOG_TABLE1_ROW3}                       xpath=//tr[@data-qa-id='automation-module-view-dialog-table1-row3']
${SELECTOR_AUTOMATION_MODULE_VIEW_DIALOG_TABLE1_ROW4}                       xpath=//tr[@data-qa-id='automation-module-view-dialog-table1-row4']
${SELECTOR_AUTOMATION_MODULE_VIEW_DIALOG_TABLE1_ROW5}                       xpath=//tr[@data-qa-id='automation-module-view-dialog-table1-row5']
${SELECTOR_AUTOMATION_MODULE_VIEW_DIALOG_TABLE1_ROW6}                       xpath=//tr[@data-qa-id='automation-module-view-dialog-table1-row6']
${SELECTOR_AUTOMATION_MODULE_VIEW_DIALOG_TABLE1_ROW7}                       xpath=//tr[@data-qa-id='automation-module-view-dialog-table1-row7']
${SELECTOR_AUTOMATION_MODULE_VIEW_DIALOG_TABLE1_ROW8}                       xpath=//tr[@data-qa-id='automation-module-view-dialog-table1-row8']

${SELECTOR_AUTOMATION_MODULE_VIEW_DIALOG_TABLE3_ROW1}                       xpath=//tr[@data-qa-id='automation-module-view-dialog-table3-row1']

${SELECTOR_AUTOMATION_MODULE_VERSION_DIALOG_CANCEL_BUTTON}                  xpath=//button[@data-qa-id='automation-module-version-dialog-cancel-button']
${SELECTOR_AUTOMATION_MODULE_VERSION_DIALOG_CHOOSE_BUTTON}                  xpath=//button[@data-qa-id='automation-module-version-dialog-choose-button']

${SELECTOR_AUTOMATION_MODULE_VERSION_DIALOG_VERSION_LIST}                   xpath=//div[@data-qa-id='automation-module-version-dialog-item1']

${SELECTOR_AUTOMATION_MODULE_VERSION_PROGRAM_BUTTON}                        xpath=//button[@data-qa-id='automation-toolbar-buttons-program']
${SELECTOR_AUTOMATION_MODULE_VERSION_PROGRAM_DIALOG_ROW_1}                  xpath=//table[@class='version_program_table']/tr[2]
${SELECTOR_AUTOMATION_MODULE_VERSION_PROGRAM_CANCEL_BUTTON}                 xpath=//button[@data-qa-id='automation-module-program-dialog-cancel-button']
${SELECTOR_AUTOMATION_MODULE_VERSION_PROGRAM_PROGRAM_BUTTON}                xpath=//button[@data-qa-id='automation-module-program-dialog-program-button']
${SELECTOR_AUTOMATION_MODULE_VERSION_PROGRAM_DIALOG_ROW_1_CHKBX}            xpath=//input[@id='automation-module-program-dialog-item1-selected-input']    # NO ID

${SELECTOR_AUTOMATION_MODULE_VERSION_PROGRAM_CLOSE_BUTTON}                  xpath=//button[@data-qa-id="automation-module-program-dialog-close-button"]

####
# MODBUS DEVICES
####

${SELECTOR_AUTOMATION_MODBUS_DEVICE_EDIT_PORT_SELECT}                       xpath=//mat-select[@data-qa-id="automation-modbus-device-edit-port"]
${SELECTOR_AUTOMATION_MODBUS_DEVICE_EDIT_ADDRESS_INPUT}                     xpath=//input[@data-qa-id="automation-modbus-device-edit-bus-address"]
${SELECTOR_AUTOMATION_MODBUS_DEVICE_EDIT_START_REGISTER_INPUT}              xpath=//input[@data-qa-id="automation-modbus-device-edit-start-register"]
${SELECTOR_AUTOMATION_MODBUS_DEVICE_EDIT_BUS_ADDRESS_INPUT}                 xpath=//input[@data-qa-id="automation-modbus-device-edit-bus-address"]
${SELECTOR_AUTOMATION_MODBUS_DEVICE_EDIT_REGISTER_TYPE_SELECT}              xpath=//mat-select[@data-qa-id="automation-modbus-device-edit-register-type"]

${SELECTOR_AUTOMATION_MODBUS_DEVICE_EDIT_REGISTER_TYPE_OPTION1}             xpath=//mat-option[@data-qa-id="automation-modbus-device-edit-register-type-option1"]
${SELECTOR_AUTOMATION_MODBUS_DEVICE_EDIT_REGISTER_TYPE_OPTION2}             xpath=//mat-option[@data-qa-id="automation-modbus-device-edit-register-type-option2"]
${SELECTOR_AUTOMATION_MODBUS_DEVICE_EDIT_REGISTER_TYPE_OPTION3}             xpath=//mat-option[@data-qa-id="automation-modbus-device-edit-register-type-option3"]
${SELECTOR_AUTOMATION_MODBUS_DEVICE_EDIT_REGISTER_TYPE_OPTION4}             xpath=//mat-option[@data-qa-id="automation-modbus-device-edit-register-type-option4"]
${SELECTOR_AUTOMATION_MODBUS_DEVICE_EDIT_REGISTER_TYPE_OPTION5}             xpath=//mat-option[@data-qa-id="automation-modbus-device-edit-register-type-option5"]
${SELECTOR_AUTOMATION_MODBUS_DEVICE_EDIT_REGISTER_TYPE_OPTION6}             xpath=//mat-option[@data-qa-id="automation-modbus-device-edit-register-type-option6"]

${SELECTOR_AUTOMATION_MODBUS_DEVICE_EDIT_START_REGISTER_INPUT}              xpath=//input[@data-qa-id="automation-modbus-device-edit-start-register"]
${SELECTOR_AUTOMATION_MODBUS_DEVICE_EDIT_REGISTER_COUNT_INPUT}              xpath=//input[@data-qa-id="automation-modbus-device-edit-register-count"]
${SELECTOR_AUTOMATION_MODBUS_DEVICE_EDIT_DEBUG_CHKBX}                       xpath=//input[@id='automation-modbus-device-edit-debug-input']    # NO ID
${SELECTOR_AUTOMATION_MODBUS_DEVICE_EDIT_TCP_IP_MODULE_CHKBX}               xpath=//input[@id='automation-modbus-device-edit-tcp-ip-module-input']    # NO ID
${SELECTOR_AUTOMATION_MODBUS_DEVICE_EDIT_IP_PORT_INPUT}                     xpath=//input[@data-qa-id="automation-module-edit-ip-port"]

${SELECTOR_AUTOMATION_MODBUS_DEVICE_EDIT_IP_ADDRESS_INPUT}                  xpath=//input[@data-qa-id="automation-module-edit-ip-address"]

${SELECTOR_AUTOMATION_MODBUS_DEVICE_EDIT_IP_ADDRESS_INPUT}                  xpath=//input[@data-qa-id="automation-modbus-device-edit-ip-address"]
${SELECTOR_AUTOMATION_MODBUS_DEVICE_EDIT_SEND_ONLY_CHKBX}                   xpath=//input[@id='automation-modbus-device-edit-send-only-input']    # NO ID
${SELECTOR_AUTOMATION_MODBUS_DEVICE_EDIT_TIMEOUT_INPUT}                     xpath=//input[@formcontrolname="timeout"]

${SELECTOR_AUTOMATION_MODBUS_DEVICE_EDIT_SAVE_BUTTON}                       xpath=//button[@data-qa-id="automation-modbus-device-edit-save-button"]
${SELECTOR_AUTOMATION_MODBUS_DEVICE_EDIT_CANCEL_BUTTON}                     xpath=//button[@data-qa-id="automation-modbus-device-edit-cancel-button"]
${SELECTOR_AUTOMATION_MODBUS_DEVICE_EDIT_ADD_BUTTON}                        xpath=//button[@data-qa-id="automation-modbus-device-edit-add-button"]

####
# FREEZE PROTECT
####

${SELECTOR_AUTOMATION_FREEZE_EDIT_POINT_ID_INPUT}                           xpath=//input[@data-qa-id="automation-point-edit-point-id"]
${SELECTOR_AUTOMATION_FREEZE_EDIT_POINT_DESCRIPTION_INPUT}                  xpath=//input[@data-qa-id="automation-point-edit-point-description"]
${SELECTOR_AUTOMATION_FREEZE_EDIT_ACCESS_LEVEL_VIEW_INPUT}                  xpath=//input[@data-qa-id="automation-point-edit-access-level-view"]
${SELECTOR_AUTOMATION_FREEZE_EDIT_ACCESS_LEVEL_MANUAL_INPUT}                xpath=//input[@data-qa-id="automation-point-edit-access-level-manual"]
${SELECTOR_AUTOMATION_FREEZE_EDIT_ACCESS_LEVEL_PROGRAMMING_INPUT}           xpath=//input[@data-qa-id="automation-point-edit-access-level-programming"]
${SELECTOR_AUTOMATION_FREEZE_EDIT_SET_VALUE_INPUT}                          xpath=//input[@data-qa-id="automation-point-edit-setting"]
${SELECTOR_AUTOMATION_FREEZE_EDIT_P_BAND_INPUT}                             xpath=//input[@data-qa-id="automation-point-edit-p-band"]
${SELECTOR_AUTOMATION_FREEZE_EDIT_ALARM_LIMIT_INPUT}                        xpath=//input[@data-qa-id="automation-point-edit-alarm-limit"]
${SELECTOR_AUTOMATION_FREEZE_EDIT_RETURN_WATER_AI_INPUT}                    xpath=//input[@data-qa-id="automation-point-edit-measurement-id"]
${SELECTOR_AUTOMATION_FREEZE_EDIT_FAN_DO_INPUT}                             xpath=//input[@data-qa-id="automation-point-edit-fan-do-id"]
${SELECTOR_AUTOMATION_FREEZE_EDIT_VALVE_AO_INPUT}                           xpath=//input[@data-qa-id="automation-point-edit-valve-ao-id"]
${SELECTOR_AUTOMATION_FREEZE_EDIT_MAIN_ALARM_INPUT}                         xpath=//input[@data-qa-id="automation-point-edit-main-alarm-id"]
${SELECTOR_AUTOMATION_FREEZE_EDIT_ALARM_DO_INPUT}                           xpath=//input[@data-qa-id="automation-point-edit-alarm-do-id"]
${SELECTOR_AUTOMATION_FREEZE_EDIT_WARNING_ALARM_INPUT}                      xpath=//input[@data-qa-id="automation-point-edit-warning-alarm-id"]
${SELECTOR_AUTOMATION_FREEZE_EDIT_ACK_INPUT}                                xpath=//input[@data-qa-id="automation-point-edit-ack-button-id"]
${SELECTOR_AUTOMATION_FREEZE_EDIT_ACK_BY_BUTTON_CHKBX}                      xpath=//input[@id='automation-point-edit-ack-by-button-input']    # NO ID

####
# CALENDAR
####
${SELECTOR_AUTOMATION_CALENDAR_EVENTS_BUTTON}                               xpath=//button[@title="Events"]
${SELECTOR_AUTOMATION_CALENDAR_TODAY_BUTTON}                                xpath=//button[@title="This month"]
${SELECTOR_AUTOMATION_CALENDAR_PREVIOUS_MONTH_BUTTON}                       xpath=//button[@title="Previous month"]
${SELECTOR_AUTOMATION_CALENDAR_NEXT_MONTH_BUTTON}                           xpath=//button[@title="Next month"]

${SELECTOR_AUTOMATION_CALENDAR_ADD_EVENT_BUTTON}                            xpath=//button[@data-qa-id="automation-calendar-edit-add-event-button"]
${SELECTOR_AUTOMATION_CALENDAR_EVENT_LIST_ITEM_1_BUTTON}                    xpath=//div[@data-qa-id="automation-calendar-edit-event-list-item1"]
${SELECTOR_AUTOMATION_CALENDAR_EDIT_DESCRIPTION_INPUT}                      xpath=//input[@data-qa-id="automation-calendar-edit-description"]
${SELECTOR_AUTOMATION_CALENDAR_EDIT_MODE_SELECT}                            xpath=//mat-select[@data-qa-id="automation-calendar-edit-mode"]
${SELECTOR_AUTOMATION_CALENDAR_EDIT_APPLY_TIMETABLE_BUTTON}                 xpath=//span[@data-qa-id="automation-calendar-edit-apply-timetable"]
${SELECTOR_AUTOMATION_CALENDAR_EDIT_APPLY_WEEKDAY_BUTTON}                   xpath=//span[@data-qa-id="automation-calendar-edit-apply-weekday"]

${SELECTOR_AUTOMATION_CALENDAR_EDIT_WEEKDAY_MONDAY_RADIO}                   xpath=//mat-radio-button[@data-qa-id="automation-calendar-edit-weekday-monday"]
${SELECTOR_AUTOMATION_CALENDAR_EDIT_WEEKDAY_TUESDAY_RADIO}                  xpath=//mat-radio-button[@data-qa-id="automation-calendar-edit-weekday-tuesday"]
${SELECTOR_AUTOMATION_CALENDAR_EDIT_WEEKDAY_WEDNESDAY_RADIO}                xpath=//mat-radio-button[@data-qa-id="automation-calendar-edit-weekday-wednesday"]
${SELECTOR_AUTOMATION_CALENDAR_EDIT_WEEKDAY_THURSDAY_RADIO}                 xpath=//mat-radio-button[@data-qa-id="automation-calendar-edit-weekday-thursday"]
${SELECTOR_AUTOMATION_CALENDAR_EDIT_WEEKDAY_FRIDAY_RADIO}                   xpath=//mat-radio-button[@data-qa-id="automation-calendar-edit-weekday-friday"]
${SELECTOR_AUTOMATION_CALENDAR_EDIT_WEEKDAY_SATURDAY_RADIO}                 xpath=//mat-radio-button[@data-qa-id="automation-calendar-edit-weekday-saturday"]
${SELECTOR_AUTOMATION_CALENDAR_EDIT_WEEKDAY_SUNDAY_RADIO}                   xpath=//mat-radio-button[@data-qa-id="automation-calendar-edit-weekday-sunday"]
${SELECTOR_AUTOMATION_CALENDAR_EDIT_WEEKDAY_E1_RADIO}                       xpath=//mat-radio-button[@data-qa-id="automation-calendar-edit-weekday-e1"]
${SELECTOR_AUTOMATION_CALENDAR_EDIT_WEEKDAY_E2_RADIO}                       xpath=//mat-radio-button[@data-qa-id="automation-calendar-edit-weekday-e2"]
${SELECTOR_AUTOMATION_CALENDAR_EDIT_WEEKDAY_E3_RADIO}                       xpath=//mat-radio-button[@data-qa-id="automation-calendar-edit-weekday-e3"]

${SELECTOR_AUTOMATION_CALENDAR_EDIT_START_DAY_SELECT}                       xpath=//mat-select[@data-qa-id="automation-calendar-edit-start-day"]
${SELECTOR_AUTOMATION_CALENDAR_EDIT_START_MONTH_SELECT}                     xpath=//mat-select[@data-qa-id="automation-calendar-edit-start-month"]
${SELECTOR_AUTOMATION_CALENDAR_EDIT_START_YEAR_SELECT}                      xpath=//mat-select[@data-qa-id="automation-calendar-edit-start-year"]
${SELECTOR_AUTOMATION_CALENDAR_EDIT_START_DATE_PICKER_INPUT}                xpath=//input[@data-qa-id="automation-calendar-edit-start-date-picker-input"]
${SELECTOR_AUTOMATION_CALENDAR_EDIT_START_DATE_PICKER_TOGGLE_BUTTON}        xpath=//button[@data-qa-id="automation-calendar-edit-start-date-picker-toggle"]

${SELECTOR_AUTOMATION_CALENDAR_EDIT_INCLUDE_START_DATE_CHECKBOX}            xpath=//input[@id='automation-calendar-edit-include-start-date-input']    # NO ID
${SELECTOR_AUTOMATION_CALENDAR_EDIT_INCLUDE_END_DATE_CHECKBOX}              xpath=//input[@id='automation-calendar-edit-include-end-date-input']    # NO ID

${SELECTOR_AUTOMATION_CALENDAR_EDIT_END_DAY_SELECT}                         xpath=//mat-select[@data-qa-id="automation-calendar-edit-end-day"]
${SELECTOR_AUTOMATION_CALENDAR_EDIT_END_MONTH_SELECT}                       xpath=//mat-select[@data-qa-id="automation-calendar-edit-end-month"]
${SELECTOR_AUTOMATION_CALENDAR_EDIT_END_YEAR_SELECT}                        xpath=//mat-select[@data-qa-id="automation-calendar-edit-end-year"]
${SELECTOR_AUTOMATION_CALENDAR_EDIT_END_DATE_PICKER_INPUT}                  xpath=//input[@data-qa-id="automation-calendar-edit-start-date-picker-input"]
${SELECTOR_AUTOMATION_CALENDAR_EDIT_END_DATE_PICKER_TOGGLE_BUTTON}          xpath=//button[@data-qa-id="automation-calendar-edit-start-date-picker-toggle"]

${SELECTOR_AUTOMATION_CALENDAR_EDIT_REPEAT_MONTH_SELECT}                    xpath=//mat-select[@data-qa-id="automation-calendar-edit-repeat-month"]
${SELECTOR_AUTOMATION_CALENDAR_EDIT_REPEAT_DAYS_OF_MONTH_SELECT}            xpath=//mat-select[@data-qa-id="automation-calendar-edit-repeat-days-of-month"]
${SELECTOR_AUTOMATION_CALENDAR_EDIT_REPEAT_DAY_OF_WEEK_SELECT}              xpath=//mat-select[@data-qa-id="automation-calendar-edit-repeat-day-of-week"]

${SELECTOR_AUTOMATION_CALENDAR_EDIT_TIMETABLE_SELECT}                       xpath=//mat-select[@data-qa-id="automation-calendar-edit-timetable"]
${SELECTOR_AUTOMATION_CALENDAR_EDIT_TIMETABLE_EVENT1_TIME_INPUT}            xpath=//input[@data-qa-id="automation-calendar-edit-timetable-events1-time"]
${SELECTOR_AUTOMATION_CALENDAR_EDIT_TIMETABLE_EVENT1_VALUE_INPUT}           xpath=//input[@data-qa-id="automation-calendar-edit-timetable-events1-value"]
${SELECTOR_AUTOMATION_CALENDAR_EDIT_TIMETABLE_EVENT2_TIME_INPUT}            xpath=//input[@data-qa-id="automation-calendar-edit-timetable-events2-time"]
${SELECTOR_AUTOMATION_CALENDAR_EDIT_TIMETABLE_EVENT2_VALUE_INPUT}           xpath=//input[@data-qa-id="automation-calendar-edit-timetable-events2-value"]
${SELECTOR_AUTOMATION_CALENDAR_EDIT_TIMETABLE_EVENT3_TIME_INPUT}            xpath=//input[@data-qa-id="automation-calendar-edit-timetable-events3-time"]
${SELECTOR_AUTOMATION_CALENDAR_EDIT_TIMETABLE_EVENT3_VALUE_INPUT}           xpath=//input[@data-qa-id="automation-calendar-edit-timetable-events3-value"]
${SELECTOR_AUTOMATION_CALENDAR_EDIT_TIMETABLE_EVENT4_TIME_INPUT}            xpath=//input[@data-qa-id="automation-calendar-edit-timetable-events4-time"]
${SELECTOR_AUTOMATION_CALENDAR_EDIT_TIMETABLE_EVENT4_VALUE_INPUT}           xpath=//input[@data-qa-id="automation-calendar-edit-timetable-events4-value"]
${SELECTOR_AUTOMATION_CALENDAR_EDIT_TIMETABLE_EVENT5_TIME_INPUT}            xpath=//input[@data-qa-id="automation-calendar-edit-timetable-events5-time"]
${SELECTOR_AUTOMATION_CALENDAR_EDIT_TIMETABLE_EVENT5_VALUE_INPUT}           xpath=//input[@data-qa-id="automation-calendar-edit-timetable-events5-value"]
${SELECTOR_AUTOMATION_CALENDAR_EDIT_TIMETABLE_EVENT6_TIME_INPUT}            xpath=//input[@data-qa-id="automation-calendar-edit-timetable-events6-time"]
${SELECTOR_AUTOMATION_CALENDAR_EDIT_TIMETABLE_EVENT6_VALUE_INPUT}           xpath=//input[@data-qa-id="automation-calendar-edit-timetable-events6-value"]

# Lockstate dialog
${SELECTOR_AUTOMATION_EDIT_VALUE_DIALOG_SET_AUTO_BUTTON}                    xpath=//button[@data-qa-id='automation-edit-value-dialog-set-auto-button']

# AI page
${SELECTOR_AUTOMATION_MEASUREMENTS_ELEMENT}                                 xpath=//span[contains(text(), "Measurements")]

${SELECTOR_AUTOMATION_AI_TABLE_FILTER_LIMITS_BUTTON}                        xpath=//button[@data-qa-id='automation-table-filter-limits-button']

${SELECTOR_CONFIRM_DIALOG_CLOSE_ICON}                                       xpath=//mat-icon[@data-qa-id="confirm-dialog-close"]
${SELECTOR_CONFIRM_DIALOG_CONFIRM_BUTTON}                                   xpath=//button[@data-qa-id="confirm-dialog-confirm-button"]
${SELECTOR_CONFIRM_DIALOG_CANCEL_BUTTON}                                    xpath=//button[@data-qa-id="confirm-dialog-cancel-button"]
