*** Settings ***
Resource        resources\\logs.resource
Resource        resources\\login.resource
Resource        resources\\navigate.resource
Resource        resources\\point_locators.resource
Resource        resources\\device_locators.resource
Resource        resources\\modules_id.resource
Resource        resources\\modbus_id.resource
Resource        resources\\freeze_id.resource
Resource        resources\\calendar_id.resource
Resource        resources\\settings_id.resource
Library         Browser

Test Setup      Go to main view


*** Variables ***
${DI_point_name}    1VAK_TE01_DI
@{mbus_ports}       5    6    7    8    9    10


*** Test Cases ***
Manipulate Good Module Devices
    Create X Modules On Port    port=3    start_address=20    quantity=6    module_type=DI
    Create X Modules On Port    port=4    start_address=20    quantity=6    module_type=DO
    Create X Modules On Port    port=5    start_address=20    quantity=6    module_type=AI
    Create X Modules On Port    port=0    start_address=20    quantity=6    module_type=MBUS

    Remove X Modules From Port    port=3    start_address=20    quantity=6
    Remove X Modules From Port    port=4    start_address=20    quantity=6
    Remove X Modules From Port    port=5    start_address=20    quantity=6
    Remove X Modules From Port    port=0    start_address=20    quantity=6

    # Create X MBUS On Port    0    63
    # Create X MBUS On Port    6    63
    # Create X MBUS On Port    7    63
    # Create X MBUS On Port    8    63
    # Create X MBUS On Port    9    63
    # Create X MBUS On Port    10    63

    # Remove X MBUS From Port    0    63
    # Remove X MBUS From Port    6    63
    # Remove X MBUS From Port    7    63
    # Remove X MBUS From Port    8    63
    # Remove X MBUS From Port    9    63
    # Remove X MBUS From Port    10    63


*** Keywords ***
Create X Modules On Port
    [Arguments]    ${port}    ${start_address}    ${quantity}    ${module_type}

    Settings Network Port QA_ID Set Port Parameters
    ...    port=${port}
    ...    type=modbus rtu
    ...    data_code=n82
    ...    speed=57600
    ...    send_delay=150
    ...    address=0
    ...    max_masters=0
    ...    mbus_send_delay=5000

    Go to automation modules
    ${end_address}=    Evaluate    ${start_address} + ${quantity}

    FOR    ${counter}    IN RANGE    ${start_address}    ${end_address}    1
        ${random_mbus_id}=    Generate Random MBUS ID
        Add New Module Device
        ...    port_number=${port}
        ...    address_number=${counter}
        ...    module_type=${module_type}
        ...    tcp_module=no
        ...    ip_address=10.100.1.97
        ...    ip_port=10002
        ...    debug=yes
        ...    timeout=5000ms
        ...    mbus_id=${random_mbus_id}
        ...    mbus_address=0
        ...    mbus_use_secondary=yes
        ...    mbus_send_reset=no
        Log To Console    DI at Port ${port} Address: ${counter} is created
        Sleep    10s
    END

Create X MBUS On Port
    [Arguments]    ${port}    ${start_address}    ${quantity}

    Go to automation modules
    ${end_address}=    Evaluate    ${start_address} + ${quantity}

    FOR    ${counter}    IN RANGE    ${start_address}    ${end_address}    1
        ${random_mbus_id}=    Generate Random MBUS ID
        Add New Module Device
        ...    port_number=${port}
        ...    address_number=${counter}
        ...    module_type=mbus
        ...    tcp_module=yes
        ...    ip_address=10.100.1.97
        ...    ip_port=10002
        ...    debug=yes
        ...    timeout=5000ms
        ...    mbus_id=${random_mbus_id}
        ...    mbus_address=0
        ...    mbus_use_secondary=yes
        ...    mbus_send_reset=no
        Log To Console    MBUS Port ${port} Address: ${counter} is created
    END

Remove X Modules From Port
    [Arguments]    ${port}    ${start_address}    ${quantity}
    ${end_address}=    Evaluate    ${start_address} + ${quantity}

    FOR    ${counter}    IN RANGE    ${start_address}    ${end_address}    1
        Delete Module Device
        ...    port_number=${port}
        ...    address_number=${counter}
        Log To Console    Module Port ${port} Address: ${counter} is removed
    END

Remove X MBUS From Port
    [Arguments]    ${port}    ${start_address}    ${quantity}
    ${end_address}=    Evaluate    ${start_address} + ${quantity}

    FOR    ${counter}    IN RANGE    ${start_address}    ${end_address}    1
        Delete Module Device
        ...    port_number=${port}
        ...    address_number=${counter}
        Log To Console    MBUS Port ${port} Address: ${counter} is removed
    END
