*** Settings ***
Library     Browser
Resource    navigate.resource


*** Variables ***
${selector_activations_field_base}                      xpath=//div[@formgroupname='main']//input[@formcontrolname='activationKey']
${selector_activations_field_inu}                       xpath=//div[@formgroupname='inuio']//input[@formcontrolname='activationKey']
${selector_activations_field_ecosmart}                  xpath=//div[@formgroupname='ecosmart']//input[@formcontrolname='activationKey']
${selector_activations_field_tosibox}                   xpath=//div[@formgroupname='tosibox']//input[@formcontrolname='activationKey']
${selector_activations_field_modbus}                    xpath=//div[@formgroupname='modbusTCPServer']//input[@formcontrolname='activationKey']

${selector_production_code_field_base}                  xpath=//div[@formgroupname='main']//span[@class='code']
${selector_production_code_field_inu}                   xpath=//div[@formgroupname='inuio']//span[@class='code']
${selector_production_code_field_ecosmart}              xpath=//div[@formgroupname='ecosmart']//span[@class='code']
${selector_production_code_field_tosibox}               xpath=//div[@formgroupname='tosibox']//span[@class='code']
${selector_production_code_field_modbus}                xpath=//div[@formgroupname='modbusTCPServer']//span[@class='code']
# TODO: There is no div for weather
# ${selector_production_code_field_weather}    xpath=

${selector_activations_activate_button_base}            xpath=//div[@formgroupname='main']//button[@class='settings_action_btn ng-star-inserted']
${selector_activations_activate_button_inu}             xpath=//div[@formgroupname='inuio']//button[@class='settings_action_btn ng-star-inserted']
${selector_activations_activate_button_ecosmart}        xpath=//div[@formgroupname='ecosmart']//button[@class='settings_action_btn ng-star-inserted']
${selector_activations_activate_button_tosibox}         xpath=//div[@formgroupname='tosibox']//button[@class='settings_action_btn ng-star-inserted']
${selector_activations_activate_button_modbus}          xpath=//div[@formgroupname='modbusTCPServer']//button[@class='settings_action_btn ng-star-inserted']

${selector_activations_deactivate_button_base}          xpath=//div[@formgroupname='main']//button[@class='settings_action_btn settings_action_btn_disabled ng-star-inserted']
${selector_activations_deactivate_button_inu}           xpath=//div[@formgroupname='inuio']//button[@class='settings_action_btn settings_action_btn_disabled ng-star-inserted']
${selector_activations_deactivate_button_ecosmart}      xpath=//div[@formgroupname='ecosmart']//button[@class='settings_action_btn settings_action_btn_disabled ng-star-inserted']
${selector_activations_deactivate_button_tosibox}       xpath=//div[@formgroupname='tosibox']//button[@class='settings_action_btn settings_action_btn_disabled ng-star-inserted']
${selector_activations_deactivate_button_modbus}        xpath=//div[@formgroupname='modbusTCPServer']//button[@class='settings_action_btn settings_action_btn_disabled ng-star-inserted']

${selector_activations_deactivate_confirm_remove}       xpath=//button[@class='form_btn_save active']
${selector_activations_deactivate_confirm_cancel}       xpath=//button[@class='form_btn_cancel']

${selector_activations_copy_button_base}                xpath=//div[@formgroupname='main']//mat-icon
${selector_activations_copy_button_inu}                 xpath=//div[@formgroupname='inuio']//mat-icon
${selector_activations_copy_button_ecosmart}            xpath=//div[@formgroupname='ecosmart']//mat-icon
${selector_activations_copy_button_tosibox}             xpath=//div[@formgroupname='tosibox']//mat-icon
${selector_activations_copy_button_modbus}              xpath=//div[@formgroupname='modbusTCPServer']//mat-icon
# TODO: There is no div for weather
# ${selector_activations_copy_button_weather}    xpath=


*** Keywords ***
Activate all
    [Documentation]
    ...    Activates all the available features for the device.
    ...    This will automatically navigate to system activation settings.

    Go to system activations settings

    If not already activated activate base
    If not already activated activate base
    If not already activated activate inu
    If not already activated activate ecosmart
    If not already activated activate tosibox
    If not already activated activate modbus

Deactivate all
    [Documentation]
    ...    Deactivates all the available features for the device.
    ...    This will automatically navigate to system activation settings.

    Go to system activations settings

    If not already deactivated deactivate base
    If not already deactivated deactivate inu
    If not already deactivated deactivate ecosmart
    If not already deactivated deactivate tosibox
    If not already deactivated deactivate modbus

Activate ${feature}
    [Documentation]
    ...    Activates the given feature.
    ...    This will automatically navigate to system activation settings.
    Go to system activations settings

    Fill and activate ${feature}

    Wait For Elements State    ${selector_activations_deactivate_button_${feature}}    visible    1s

If not already activated activate ${feature}
    [Documentation]
    ...    Activates the given feature if it is not already activated.
    ...    This will automatically navigate to system activation settings.

    Go to system activations settings

    ${activated}=    Is activated ${feature}
    IF    not ${activated}    Fill and activate ${feature}

Deactivate ${feature}
    [Documentation]
    ...    Deactivates the given feature.
    ...    This will automatically navigate to system activation settings.
    Go to system activations settings

    Click deactivate for ${feature}
    Browser.Click    ${selector_activations_deactivate_confirm_remove}

    Wait For Elements State    ${selector_activations_activate_button_${feature}}    visible    1s

If not already deactivated deactivate ${feature}
    [Documentation]
    ...    Deactivates the given feature if it is not already deactivated.
    ...    This will automatically navigate to system activation settings.

    Go to system activations settings

    ${activated}=    Is activated ${feature}
    IF    ${activated}    Deactivate ${feature}

Is activated ${feature}
    [Documentation]
    ...    Returns true if the given feature is activated.
    ...    This will automatically navigate to system activation settings.

    Go to system activations settings

    ${status}=    Run Keyword And Return Status
    ...    Wait For Elements State    ${selector_activations_deactivate_button_${feature}}    visible    1s
    RETURN    ${status}

Fill activations
    [Arguments]    ${feature}    ${activation_key}
    Fill Text    ${selector_activations_field${feature}}    ${activation_key}

Click activate for ${feature}
    Browser.Click    ${selector_activations_activate_button_${feature}}

Click deactivate for ${feature}
    Browser.Click    ${selector_activations_deactivate_button_${feature}}

Click production key copy for ${feature}
    Browser.Click    ${selector_activations_copy_button_${feature}}

Get production key for ${feature}
    ${production_code}=    Browser.Get Text    ${selector_production_code_field_${feature}}
    RETURN    ${production_code}

Fill and activate ${feature}
    ${production_code}=    Get production key for ${feature}
    ${activation_key}=    Calculate activation key    ${production_code}
    Fill activations    ${feature}    ${activation_key}
    Click activate for ${feature}

Calculate activation key
    [Documentation]
    ...    Return calculated activation key for the given product key.
    [Arguments]    ${product_key}

    ${md5}=    Evaluate    hashlib.md5('${product_key}'.encode('utf-8')).hexdigest()    hashlib
    ${activation_key}=    Evaluate
    ...    '${md5}'[4] + '${md5}'[2] + '${md5}'[6] + '${md5}'[9] + '${md5}'[0] + '${md5}'[11]
    RETURN    ${activation_key}
