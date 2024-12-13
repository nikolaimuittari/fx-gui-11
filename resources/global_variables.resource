*** Settings ***
# Library    RPA.Browser.Selenium
Library     Browser
Library     RPA.HTTP
Library     RPA.DocumentAI.Nanonets
Library     String
Library     OperatingSystem
Library     Collections
Library     DateTime
Library     Process
Library     OperatingSystem
Library     SeleniumLibrary
# Library     RPA.JavaAccessBridge
Resource    automation_locators_id.resource


*** Variables ***
${SLEEP_TIME}       0.1s
${temp_folder}      c:\\QA\\robot_tmp\\
${min_range}        0
${max_range}        999
${hour}             24
${minute}           60
${snack_bar_text_xpath}    xpath=//mat-snack-bar-container//div[@class="item left"]

*** Keywords ***
Log Texts FromElementsWithAttribute
    [Arguments]    ${attribute_prefix}
    @{elements}=    Browser.Get Elements    //*[contains(@data-qa-id, '${attribute_prefix}')]
    ${elements_count}=    Browser.Get Element Count    //*[contains(@data-qa-id, '${attribute_prefix}')]
    Log To Console    Elements in table: ${elements_count}
    FOR    ${element}    IN    @{elements}
        ${text}=    Browser.Get Text    ${element}
        Log To Console    ${text}
    END

Log All Module Tables
    [Arguments]    ${attribute_prefix}
    # Log Texts FromElementsWithAttribute    automation-module-view-dialog-table6-row
    ${element_xpath}=    Set Variable    xpath=//*[contains(@data-qa-id, '${attribute_prefix}')]

Module Selector
    [Documentation]    Fills arguments data according to module selector type. Old model with separate port-module-point fields. New model with gray field and module list
    [Arguments]    ${port}    ${module}    ${point}
    ${new_model}=    Run Keyword And Return Status
    ...    Wait For Elements State
    ...    xpath=//div[contains(@class, 'module-info')]
    ...    visible
    ...    timeout=1s
    IF    ${new_model}
        ${module_info_text}=    Browser.Get Text    xpath=//div[contains(@class, 'module-info')]
        Log To Console    We have a new Module model. Info: ${module_info_text}

        Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_EDIT_LINK_ICON}    visible    timeout=2s
        Browser.Click    ${SELECTOR_AUTOMATION_POINT_EDIT_LINK_ICON}

        Wait For Elements State    ${SELECTOR_AUTOMATION_MODULE_VIEW_DIALOG_CANCEL_BUTTON}    visible    timeout=2s
        ${module_table_visible}=    Run Keyword And Return Status
        ...    Wait For Elements State
        ...    ${SELECTOR_AUTOMATION_MODULE_VIEW_DIALOG_TABLE1_ROW1}
        ...    visible
        ...    timeout=2s
        IF    ${module_table_visible}
            Log Texts FromElementsWithAttribute    automation-module-view-dialog-table

            # Browser.Click    ${SELECTOR_AUTOMATION_MODULE_VIEW_DIALOG_TABLE1_ROW1}
            # Browser.Click    ${SELECTOR_AUTOMATION_MODULE_VIEW_DIALOG_TABLE1_ROW2}
            # Browser.Click    ${SELECTOR_AUTOMATION_MODULE_VIEW_DIALOG_TABLE1_ROW3}
            # Browser.Click    ${SELECTOR_AUTOMATION_MODULE_VIEW_DIALOG_TABLE1_ROW4}
            # Browser.Click    ${SELECTOR_AUTOMATION_MODULE_VIEW_DIALOG_TABLE1_ROW5}
            # Browser.Click    ${SELECTOR_AUTOMATION_MODULE_VIEW_DIALOG_TABLE1_ROW6}
            # Browser.Click    ${SELECTOR_AUTOMATION_MODULE_VIEW_DIALOG_TABLE1_ROW7}
            # Browser.Click    ${SELECTOR_AUTOMATION_MODULE_VIEW_DIALOG_TABLE1_ROW8}
        END

        Wait For Elements State    ${SELECTOR_AUTOMATION_MODULE_VIEW_DIALOG_CLOSE_ICON}    visible    timeout=2s
        Browser.Click    ${SELECTOR_AUTOMATION_MODULE_VIEW_DIALOG_CLOSE_ICON}
    ELSE
        Log To Console    We have an old Module model.

        Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_EDIT_MODULE_PORT_INPUT}    visible    timeout=2s
        Fill Text    ${SELECTOR_AUTOMATION_POINT_EDIT_MODULE_PORT_INPUT}    ${port}

        Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_EDIT_MODULE_NUMBER_INPUT}    visible    timeout=2s
        Fill Text    ${SELECTOR_AUTOMATION_POINT_EDIT_MODULE_NUMBER_INPUT}    ${module}

        Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_EDIT_LINK_ICON}    visible    timeout=2s
        Browser.Click    ${SELECTOR_AUTOMATION_POINT_EDIT_LINK_ICON}

        Wait For Elements State    ${SELECTOR_AUTOMATION_MODULE_VIEW_DIALOG_CANCEL_BUTTON}    visible    timeout=2s
        ${module_table_visible}=    Run Keyword And Return Status
        ...    Wait For Elements State
        ...    ${SELECTOR_AUTOMATION_MODULE_VIEW_DIALOG_TABLE1_ROW1}
        ...    visible
        ...    timeout=2s
        IF    ${module_table_visible}
            Log Texts FromElementsWithAttribute    automation-module-view-dialog-table

            # Browser.Click    ${SELECTOR_AUTOMATION_MODULE_VIEW_DIALOG_TABLE1_ROW1}
            # Browser.Click    ${SELECTOR_AUTOMATION_MODULE_VIEW_DIALOG_TABLE1_ROW2}
            # Browser.Click    ${SELECTOR_AUTOMATION_MODULE_VIEW_DIALOG_TABLE1_ROW3}
            # Browser.Click    ${SELECTOR_AUTOMATION_MODULE_VIEW_DIALOG_TABLE1_ROW4}
            # Browser.Click    ${SELECTOR_AUTOMATION_MODULE_VIEW_DIALOG_TABLE1_ROW5}
            # Browser.Click    ${SELECTOR_AUTOMATION_MODULE_VIEW_DIALOG_TABLE1_ROW6}
            # Browser.Click    ${SELECTOR_AUTOMATION_MODULE_VIEW_DIALOG_TABLE1_ROW7}
            # Browser.Click    ${SELECTOR_AUTOMATION_MODULE_VIEW_DIALOG_TABLE1_ROW8}
        END

        Wait For Elements State    ${SELECTOR_AUTOMATION_MODULE_VIEW_DIALOG_CLOSE_ICON}    visible    timeout=2s
        Browser.Click    ${SELECTOR_AUTOMATION_MODULE_VIEW_DIALOG_CLOSE_ICON}

        Wait For Elements State    ${SELECTOR_AUTOMATION_POINT_EDIT_MOD_POINT_INPUT}    visible    timeout=2s
        Fill Text    ${SELECTOR_AUTOMATION_POINT_EDIT_MOD_POINT_INPUT}    ${point}
    END

Display System Message
    [Arguments]    ${message_text}    ${visibility_time}
    # Run Process    cmd.exe    /c "start /B msg * ${message_text} & timeout /T ${visibility_time} /nobreak > nul & taskkill /FI 'WindowTitle eq Message' /F"
    SeleniumLibrary.Execute JavaScript
    ...    window.alert('${message_text}'); setTimeout(function(){ window.close(); }, ${visibility_time}*1000)

Post-Test Action
    [Documentation]    Display system message for 5 seconds and close it automatically
    Run Process
    ...    cmd.exe
    ...    /c "start /B msg * Test execution completed & timeout /T 5 /nobreak > nul & taskkill /FI 'WindowTitle eq Message' /F"

Generate Random Point Name
    [Arguments]    ${first_part}    ${last_part}    ${delimiter}
    # ${random_string} =    Evaluate    ''.join(random.choices(string.ascii_uppercase + string.digits, k=random.randint(1, 16)))
    ${random_string}=    Evaluate    ''.join(random.choices(string.ascii_uppercase, k=8))
    ${third_part}=    Evaluate    "{:03d}".format(random.randint(0, 999))
    ${final_string}=    Evaluate
    ...    "${first_part}${delimiter}${random_string}${delimiter}${third_part}${delimiter}${last_part}"
    RETURN    ${final_string}

Generate Random Time
    ${random_hour}=    Evaluate    "{:02d}".format(random.randint(0, ${hour} - 1))
    ${random_minute}=    Evaluate    "{:02d}".format(random.randint(0, ${minute} - 1))
    ${time}=    Set Variable    ${random_hour}:${random_minute}
    RETURN    ${time}    ${random_hour}    ${random_minute}

Generate Random Hours Minutes
    ${random_hour}=    Evaluate    random.randint(0, ${hour} - 1)
    ${random_minute}=    Evaluate    random.randint(0, ${minute} - 1)
    RETURN    ${random_hour}    ${random_minute}

Generate Random Latin Letters
    [Arguments]    ${sequence_lenght}
    ${letters}=    Evaluate    "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
    ${random_string}=    Evaluate    ''.join(random.sample($letters, ${sequence_lenght}))
    RETURN    ${random_string}

Generate Random Variables
    [Arguments]    ${sequence_lenght}
    ${random_number}=    Evaluate    random.randint(${min_range}, ${max_range})
    ${random_string}=    Generate Random Latin Letters    ${sequence_lenght}
    RETURN    ${random_number}    ${random_string}

Generate Random Finnish Phone Number International
    ${prefix}=    Set Variable    +358
    ${digits}=    Evaluate    ''.join(random.choices(string.digits, k=9))
    ${phone_number}=    Set Variable    ${prefix}${digits}
    RETURN    ${phone_number}

Generate Random Finnish Phone Number Local
    ${prefix}=    Set Variable    0
    ${digits}=    Evaluate    ''.join(random.choices(string.digits, k=9))
    ${phone_number}=    Set Variable    ${prefix}${digits}
    RETURN    ${phone_number}

Generate Random Email Address
    ${name}=    Evaluate    ''.join(random.choices(string.ascii_lowercase, k=8))
    ${site}=    Evaluate    ''.join(random.choices(string.ascii_lowercase, k=5))
    ${domain}=    Evaluate    ''.join(random.choices(string.ascii_lowercase, k=3))
    # ${email_address} =    Catenate    ${name}    "@"    ${site}    "."    ${domain}
    ${email_address}=    Set Variable    ${name}@${site}.${domain}
    RETURN    ${email_address}

Generate Random Subnet Mask
    ${subnet_masks}=    Create List
    ...    255.255.0.0
    ...    255.255.128.0
    ...    255.255.192.0
    ...    255.255.224.0
    ...    255.255.240.0
    ...    255.255.248.0
    ...    255.255.252.0
    ...    255.255.254.0
    ...    255.255.255.0
    ...    255.255.255.128
    ...    255.255.255.192
    ...    255.255.255.224
    ...    255.255.255.240
    ...    255.255.255.248
    ...    255.255.255.252
    ${random_index}=    Evaluate    randint(0, len(subnet_masks) - 1)
    ${subnet_mask}=    Get From List    ${subnet_masks}    ${random_index}
    RETURN    ${subnet_mask}

Generate Random IP Address
    ${octet1}=    Evaluate    random.randint(1, 255)
    ${octet2}=    Evaluate    random.randint(0, 255)
    ${octet3}=    Evaluate    random.randint(0, 255)
    ${octet4}=    Evaluate    random.randint(1, 254)
    ${ip_address}=    Evaluate    f"${octet1}.${octet2}.${octet3}.${octet4}"
    RETURN    ${ip_address}

Generate Random IP Port
    ${port}=    Evaluate    random.randint(1, 65535)
    RETURN    ${port}

Generate Random MBUS ID
    ${mbus_id}=    Evaluate    random.randint(10000000, 99999999)
    RETURN    ${mbus_id}

Generate Random Web Address
    [Arguments]    ${protocol}
    ${protocol_prefix}=    Evaluate    ["https://", "http://", "www."][${protocol}-1]
    ${subdomain}=    Generate Random String    4    [LOWER]
    ${domain}=    Generate Random String    3    [LOWER]
    ${page}=    Generate Random String    8    [LOWER]
    ${address}=    Evaluate    "${protocol_prefix}${subdomain}.${page}.${domain}"
    RETURN    ${address}

Split Date String
    [Documentation]    Split argument date in format    2024-05-31 into year, month, day variables with removing leading zeroes
    [Arguments]    ${date_string}
    ${year}    ${month}    ${day}=    Split String    ${date_string}    -
    IF    "${month}".startswith("0")
        ${month}=    Remove String    ${month}    0
    ELSE
        ${month}=    Set Variable    ${month}
    END
    IF    "${day}".startswith("0")
        ${day}=    Remove String    ${day}    0
    ELSE
        ${day}=    Set Variable    ${day}
    END
    RETURN    ${year}    ${month}    ${day}

Todays Date YYYY-MM-DD
    ${today}=    Get Current Date    result_format=%Y-%m-%d
    RETURN    ${today}

Replace CR LF with Pipe
    [Arguments]    ${input_string}
    # @{lines} =    Split To Lines    ${manylines}
    # ${str.strip()}
    # {time_stamp}'.replace(' ','_')
    # ${output_string}=    Replace String    ${input_string}    /\r/\n    /|
    # ${output_string}=    Replace String    ${output_string}    ' '    _
    # ${output_string}=    Replace String    ${output_string}    3    X

    # ${output_string}=    Split To Lines    ${input_string}
    # ${output_string}=    Evaluate    ${output_string.strip()}
    ${output_string}=    Replace String    ${input_string}    ' '    '_'
    ${output_string}=    Replace String    ${output_string}    \r    '-'
    RETURN    ${output_string}

Set Zoom Level
    [Arguments]    ${zoom_level}
    Evaluate JavaScript    locator=none    document.body.style.zoom='${zoom_level}';

Wait Until Browser Is Open
    Wait Until Keyword Succeeds    30s    1s    Browser Is Open

Browser Is Open
    ${status}=    Run Keyword And Return Status    Browser.Get Title
    IF    ${status} != 'about:blank'    RETURN    True    False

Get Text From XPath
    [Arguments]    ${xpath}
    ${text}=    Browser.Get Text    ${xpath}
    RETURN    ${text}

Console Text From Path
    [Arguments]    ${description}    ${xpath}
    ${text}=    Browser.Get Text    ${xpath}
    Log To Console    ${description} : ${text}

Check Xpath Visible
    [Arguments]    ${xpath}
    ${xpath_visible}=    Run Keyword And Return Status    Wait For Elements State    ${xpath}    visible    timeout=2s
    IF    ${xpath_visible}
        ${visibility}=    Set Variable    ${True}
    ELSE
        ${visibility}=    Set Variable    ${False}
    END
    RETURN    ${visibility}

Action Button Or Cancel Button
    [Arguments]    ${action_btn}    ${cancel_btn}    ${save}

    IF    $save==1 or $save=='save' or $save=='Save'
        ${visibility}=    Run Keyword And Return Status    Check Xpath Visible    ${action_btn}
        IF    ${visibility}
            Browser.Click    ${action_btn}
            ${return text}=    Set Variable    Action visible and Browser.Clicked
        ELSE
            ${return text}=    Set Variable    Action not visible and not Browser.Clicked
        END

        ${snack-bar_visible}=    Check Xpath visible    xpath=//span[@class='mdc-button__label']
        Log To Console    Snack-bar: ${snack-bar_visible}
        ${snack-bar_text}=   Get Text From Xpath    xpath=//span[@class='mdc-button__label']
        Log To Console    Snack-bar text: ${snack-bar_text}
    ELSE IF    $save==2 or $save=='nosave' or $save=='Nosave'
        ${visibility}=    Run Keyword And Return Status    Check Xpath Visible    ${cancel_btn}
        IF    ${visibility}
            Browser.Click    ${cancel_btn}
            ${return text}=    Set Variable    Cancel visible and Browser.Clicked
        ELSE
            ${return text}=    Set Variable    Cancel not visible and not Browser.Clicked
        END
    END
    RETURN    ${return text}

Snack-bar Visibility And Content
    ${snack-bar_visible}=    Check Xpath visible    xpath=//span[@class='mdc-button__label']
    # ${snack-bar_button_visible}=    Check Xpath Visible    xpath=//button[contains(@class, 'mat-button')]
    Log To Console    Snack-bar: ${snack-bar_visible}
    # Log To Console    Snack-bar button: ${snack-bar_button_visible}

    IF    ${snack-bar_visible}
        ${snack-bar_text_1}=   Get Text From Xpath    xpath=//span[@class='mdc-button__label']
        ${snack-bar_text_2}=   Get Text From Xpath
        ...    xpath=//div[@class='mat-mdc-snack-bar-actions mdc-snackbar__actions ng-star-inserted']
        Log To Console    Snack-bar text: ${snack-bar_text_1} : ${snack-bar_text_2}
    END
