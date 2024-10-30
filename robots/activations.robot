*** Comments ***
# Currently just tests that we can run activations
# Also makes sure we leave all activations activated


*** Settings ***
Resource        resources\\activations.resource
Resource        resources\\navigate.resource
Resource        resources\\activations.resource
Library         Browser
Library         RPA.Desktop

Test Setup      Go to main view
# Test Teardown    Activate all


*** Test Cases ***
Test activations work
    # [Setup]    Activate all
    [Template]    Test activations work template
    base
    inu
    ecosmart
    tosibox
    modbus

# TODO: Howto get clipboard inside Playwright?
# Test copy button works
#    [Template]    Test copy button works template
#    base
#    inu
#    ecosmart
#    tosibox
#    modbus


*** Keywords ***
Test activations work template
    [Arguments]    ${feature}
    If not already activated activate ${feature}
    Deactivate ${feature}
    Activate ${feature}

Test copy button works template
    [Arguments]    ${feature}

    Go to system activations settings

    Click production key copy for ${feature}
    ${production_code}=    Get production key for ${feature}

    # Compare clipboard to production key
    ${clipboard}=    RPA.Desktop.Get Clipboard Value
    Should be equal    ${production_code}    ${clipboard}
