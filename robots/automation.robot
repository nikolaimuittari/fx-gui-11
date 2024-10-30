*** Settings ***
Resource        resources\\logs.resource
Resource        resources\\login.resource
Resource        resources\\navigate.resource
Resource        resources\\di_point_id.resource
Resource        resources\\do_point_id.resource
Resource        resources\\ai_point_id.resource
Resource        resources\\cp_point_id.resource
Resource        resources\\ao_point_id.resource
Resource        resources\\st_point_id.resource
Resource        resources\\lt_point_id.resource
Resource        resources\\ts_point_id.resource
Resource        resources\\alarm_point_id.resource
Resource        resources\\alarm_device_id.resource
Resource        resources\\alarm_group_id.resource
Resource        resources\\modules_id.resource
Resource        resources\\modbus_id.resource
Resource        resources\\freeze_id.resource
Resource        resources\\calendar_id.resource
Resource        resources\\automation_locators_id.resource
Library         Browser
Library         OperatingSystem

Test Setup      Go to main view


*** Variables ***
${DI_point_name}    1VAK_TE05_I
${DO_point_name}    1VAK_TE03_O
${AI_point_name}    1VAK_TE01_M
${CP_point_name}    1VAK_TE02_CP
${AO_point_name}    1VAK_TE04_AO
${ST_point_name}    1VAK_STATE_TEXT
${LT_point_name}    1VAK_LOOKUP_TABLE
${TS_point_name}    1VAK_TIME_SCH
${AP_point_name}    1VAK_TE01_ALM
${AD_point_name}    1ALARM_DEVICE
${AG_point_name}    1ALARM_GROUP
${AH_point_name}    1ALARM_HELP


*** Test Cases ***
Navigate To Automation
    Go to automation

Manupulate Good DI Points
    ${random_point}=    Generate Random Point Name
    ...    first_part=1VAK
    ...    last_part=DI
    ...    delimiter=_

    Go to automation indications

    Add New DI Point
    ...    POINT_ID_INPUT_VALUE=${random_point}
    ...    POINT_DESCRIPTION_INPUT_VALUE=DI_Description
    ...    ACCESS_LEVEL_VIEW_INPUT_VALUE=0
    ...    ACCESS_LEVEL_MANUAL_INPUT_VALUE=0
    ...    ACCESS_LEVEL_PROGRAMMING_INPUT_VALUE=0
    ...    MODULE_PORT_INPUT_VALUE=3
    ...    MODULE_NUMBER_INPUT_VALUE=1
    ...    MODULE_POINT_VALUE=7
    ...    START_DELAY_VALUE=5
    ...    STOP_DELAY_VALUE=5
    ...    GLOBAL_POINT=0
    ...    GLOBAL_SUBSTATION_NAME=2
    ...    GLOBAL_POINT_NAME=POINT01_I

    Duplicate DI Point
    ...    POINT_ID_INPUT_VALUE=${random_point}
    ...    POINT_NEW_NAME=1COPY_${random_point}

    Delete DI Point
    ...    POINT_ID_INPUT_VALUE=1COPY_${random_point}

    Edit DI Point
    ...    POINT_ID_INPUT_VALUE=${random_point}
    ...    POINT_ID_NEW_VALUE=1EDIT_${random_point}
    ...    POINT_DESCRIPTION_INPUT_VALUE=EDIT_OF_DI_Description
    ...    ACCESS_LEVEL_VIEW_INPUT_VALUE=0
    ...    ACCESS_LEVEL_MANUAL_INPUT_VALUE=0
    ...    ACCESS_LEVEL_PROGRAMMING_INPUT_VALUE=0
    ...    MODULE_PORT_INPUT_VALUE=3
    ...    MODULE_NUMBER_INPUT_VALUE=4
    ...    MODULE_POINT_VALUE=1
    ...    START_DELAY_VALUE=10
    ...    STOP_DELAY_VALUE=10
    ...    GLOBAL_POINT=0
    ...    GLOBAL_SUBSTATION_NAME=2
    ...    GLOBAL_POINT_NAME=POINT02_I

    Print DI Pointlist

    Delete DI Point
    ...    POINT_ID_INPUT_VALUE=1EDIT_${random_point}

Manipulate Good AI Points
    Go to automation measurements

    ${random_point}=    Generate Random Point Name
    ...    first_part=1VAK
    ...    last_part=M
    ...    delimiter=_

    Add New AI Point
    ...    POINT_ID_INPUT_VALUE=${random_point}
    ...    POINT_DESCRIPTION_INPUT_VALUE=AI Description
    ...    ACCESS_LEVEL_VIEW_INPUT_VALUE=0
    ...    ACCESS_LEVEL_MANUAL_INPUT_VALUE=0
    ...    ACCESS_LEVEL_PROGRAMMING_INPUT_VALUE=0
    ...    GLOBAL_POINT=0
    ...    GLOBAL_SUBSTATION_NAME=2
    ...    GLOBAL_POINT_NAME=POINT01_M
    ...    SETVALUE_ANALOG_COUNTER=2
    ...    MODULE_PORT_INPUT_VALUE=3
    ...    MODULE_NUMBER_INPUT_VALUE=3
    ...    MODULE_POINT_VALUE=7
    ...    ANALOG_DECIMALS=2
    ...    ANALOG_UNIT=Pa
    ...    ANALOG_TREND_TOLERANCE=0.5
    ...    ANALOG_TREND_SAMPLE_TIME=120
    ...    ANALOG_CONV_TABLE_SELECT=3
    ...    ANALOG_OFFSET=-1
    ...    ANALOG_TIME_CONSTANT=180
    ...    ANALOG_RUNTIME_POINTNAME=POINT01_I
    ...    COUNTER_MIN_PULSE=50
    ...    COUNTER_SCALING=10
    ...    LIMITS_NUM=1
    ...    LIMITS_RANDOM=0
    ...    LIMIT1_NAME=Limit_NAME_1
    ...    LIMIT1_VALUE=999.99
    ...    LIMIT1_MANUAL=1
    ...    LIMIT1_SETVALUE=1

    Duplicate AI Point
    ...    POINT_ID_INPUT_VALUE=${random_point}
    ...    POINT_NEW_NAME=1COPY_${random_point}

    Delete AI Point
    ...    POINT_ID_INPUT_VALUE=1COPY_${random_point}

    Edit AI Point
    ...    POINT_ID_INPUT_VALUE=${random_point}
    ...    POINT_ID_NEW_VALUE=1EDIT_${random_point}
    ...    POINT_DESCRIPTION_INPUT_VALUE=EDIT_OF AI Description
    ...    ACCESS_LEVEL_VIEW_INPUT_VALUE=0
    ...    ACCESS_LEVEL_MANUAL_INPUT_VALUE=0
    ...    ACCESS_LEVEL_PROGRAMMING_INPUT_VALUE=0
    ...    MODULE_PORT_INPUT_VALUE=3
    ...    MODULE_NUMBER_INPUT_VALUE=2
    ...    MODULE_POINT_VALUE=6
    ...    GLOBAL_POINT=0
    ...    GLOBAL_SUBSTATION_NAME=2
    ...    GLOBAL_POINT_NAME=POINT01_M

    Print AI Pointlist

    Delete AI Point
    ...    POINT_ID_INPUT_VALUE=1EDIT_${random_point}

Manipulate Good CP Points
    Go to automation control points

    ${random_point}=    Generate Random Point Name
    ...    first_part=1VAK
    ...    last_part=C
    ...    delimiter=_

    Add New CP Point
    ...    POINT_ID_INPUT_VALUE=${random_point}
    ...    POINT_DESCRIPTION_INPUT_VALUE=CP Description
    ...    ACCESS_LEVEL_VIEW_INPUT_VALUE=0
    ...    ACCESS_LEVEL_MANUAL_INPUT_VALUE=0
    ...    ACCESS_LEVEL_PROGRAMMING_INPUT_VALUE=0
    ...    MAIN_MAIN_MEASUREMENT=POINT01_M
    ...    MAIN_OUTDOOR_MEASUREMENT=POINT02_M
    ...    BASIC_INDICATION=POINT01_I
    ...    BASIC_UNIT=Pa
    ...    BASIC_DECIMALS=2
    ...    BASIC_STATETEXT=2
    ...    BASIC_PICTURE=2
    ...    BASIC_CONTROL_MODE=1
    ...    BASIC_SPEED_FACTOR=0.5
    ...    BASIC_INTEGRATION_TIME=300
    ...    BASIC_I_SENSITIVITY=0.2
    ...    BASIC_COOLING_DEADZONE=1.5
    ...    BASIC_EXEC_INTERVAL=120
    ...    BASIC_BALANCE_POINT_STAGE=1
    ...    BASIC_BALANCE_POINT_VALUE=50
    ...    CONTROL_STAGE_COUNT=1
    ...    CONTROL_STAGE_RANDOM=0
    ...    CONTROL_1_NAME=STAGE_NAME_1
    ...    CONTROL_1_P_BAND=80
    ...    CONTROL_1_TYPE=2
    ...    CONTROL_1_MIN_OUTPUT=99
    ...    CONTROL_1_MAX_OUTPUT=9
    ...    CONTROL_1_OFF_STATE=5.5
    ...    CONTROL_1_AO_POINT=POINT01_A
    ...    CONTROL_1_OUTDOOR_TE_LIMIT=-98
    ...    CONTROL_1_OUTDOOR_TE_P_BAND=40
    ...    CONTROL_1_LIMIT_MEAS_LIMIT=-97
    ...    CONTROL_1_LIMIT_MEAS_P_BAND=50
    ...    AHU_HEATING_STAGE_VALUE=-96
    ...    CONSTANT_DEFAULT_VALUE=25
    ...    CONSTANT_COPY_MANUAL_TO_DEFAULT=1
    ...    CASCADE_CONTROL_POINT=POINT02_C
    ...    CASCADE_CONTROL_POINT_STAGE=2
    ...    COMPENSATION_LOOKUP=POINT01_LT
    ...    COMPENSATION_AI=POIMT01_I

    Duplicate CP Point
    ...    POINT_ID_INPUT_VALUE=${random_point}
    ...    POINT_NEW_NAME=1COPY_${random_point}

    Delete CP Point
    ...    POINT_ID_INPUT_VALUE=1COPY_${random_point}

    Edit CP Point
    ...    POINT_ID_INPUT_VALUE=${random_point}
    ...    POINT_ID_NEW_VALUE=1EDIT_${random_point}
    ...    POINT_DESCRIPTION_INPUT_VALUE=EDIT_OF CP Edited_Description
    ...    ACCESS_LEVEL_VIEW_INPUT_VALUE=0
    ...    ACCESS_LEVEL_MANUAL_INPUT_VALUE=0
    ...    ACCESS_LEVEL_PROGRAMMING_INPUT_VALUE=0
    ...    MAIN_MAIN_MEASUREMENT=POINT01_M
    ...    MAIN_OUTDOOR_MEASUREMENT=POINT02_M

    Print CP Pointlist

    Delete CP Point
    ...    POINT_ID_INPUT_VALUE=1EDIT_${random_point}

Manipulate Good AO Points
    Go to automation ao points

    ${AO_point_name}=    Generate Random Point Name
    ...    first_part=1VAK
    ...    last_part=AO
    ...    delimiter=_

    Add New AO Point
    ...    POINT_ID_INPUT_VALUE=${AO_point_name}
    ...    POINT_DESCRIPTION_INPUT_VALUE=AO Description
    ...    ACCESS_LEVEL_VIEW_INPUT_VALUE=0
    ...    ACCESS_LEVEL_MANUAL_INPUT_VALUE= 0
    ...    ACCESS_LEVEL_PROGRAMMING_INPUT_VALUE=0
    ...    GLOBAL_POINT=0
    ...    GLOBAL_SUBSTATION_NAME=2
    ...    GLOBAL_POINT_NAME=POINT01_AO
    ...    MODULE_PORT_INPUT_VALUE=3
    ...    MODULE_NUMBER_INPUT_VALUE=4
    ...    MODULE_POINT_VALUE=7
    ...    MIN_VOLTAGE=9.8
    ...    MAX_VOLTAGE=0.2
    ...    DEFAULT_VALUE_OLD_FIXED=1
    ...    DEFAULT_VALUE=5.5
    ...    TREND_TOLERANCE=1.5
    ...    TREND_SAMPLE_TIME=120
    ...    PICTURE=2

    Duplicate AO Point
    ...    POINT_ID_INPUT_VALUE=${AO_point_name}
    ...    POINT_NEW_NAME=1COPY_${AO_point_name}

    Delete AO Point
    ...    POINT_ID_INPUT_VALUE=1COPY_${AO_point_name}

    Print AO Pointlist

    Edit AO Point
    ...    POINT_ID_INPUT_VALUE=${AO_point_name}
    ...    POINT_ID_NEW_VALUE=1EDIT_${AO_point_name}
    ...    POINT_DESCRIPTION_INPUT_VALUE=AO Edited_Description
    ...    ACCESS_LEVEL_VIEW_INPUT_VALUE=0
    ...    ACCESS_LEVEL_MANUAL_INPUT_VALUE=0
    ...    ACCESS_LEVEL_PROGRAMMING_INPUT_VALUE=0
    ...    MODULE_PORT_INPUT_VALUE=3
    ...    MODULE_NUMBER_INPUT_VALUE=4
    ...    MODULE_POINT_VALUE=6
    ...    GLOBAL_POINT=1
    ...    GLOBAL_SUBSTATION_NAME=2
    ...    GLOBAL_POINT_NAME=POINT01_AO

    Delete AO Point
    ...    POINT_ID_INPUT_VALUE=1EDIT_${AO_point_name}

Manipulate Good DO Points
    Go to automation do points

    ${DO_point_name}=    Generate Random Point Name
    ...    first_part=1VAK
    ...    last_part=DO
    ...    delimiter=_

    Add New DO Point
    ...    POINT_ID_INPUT_VALUE=${DO_point_name}
    ...    POINT_DESCRIPTION_INPUT_VALUE=DO Description
    ...    ACCESS_LEVEL_VIEW_INPUT_VALUE=0
    ...    ACCESS_LEVEL_MANUAL_INPUT_VALUE=0
    ...    ACCESS_LEVEL_PROGRAMMING_INPUT_VALUE=0
    ...    MODULE_PORT_INPUT_VALUE=3
    ...    MODULE_NUMBER_INPUT_VALUE=2
    ...    MODULE_POINT_VALUE=7
    ...    START_DELAY_VALUE=5
    ...    STOP_DELAY_VALUE=6
    ...    GLOBAL_POINT=0
    ...    GLOBAL_SUBSTATION_NAME=2
    ...    GLOBAL_POINT_NAME=POINT01_AO

    Duplicate DO Point
    ...    POINT_ID_INPUT_VALUE=${DO_point_name}
    ...    POINT_NEW_NAME=1COPY_${DO_point_name}

    Delete DO Point
    ...    POINT_ID_INPUT_VALUE=1COPY_${DO_point_name}

    Print DO Pointlist

    Edit DO Point
    ...    POINT_ID_INPUT_VALUE=${DO_point_name}
    ...    POINT_ID_NEW_VALUE=1EDIT_${DO_point_name}
    ...    POINT_DESCRIPTION_INPUT_VALUE=DO Description_Edited
    ...    ACCESS_LEVEL_VIEW_INPUT_VALUE=0
    ...    ACCESS_LEVEL_MANUAL_INPUT_VALUE=0
    ...    ACCESS_LEVEL_PROGRAMMING_INPUT_VALUE=0
    ...    MODULE_PORT_INPUT_VALUE=3
    ...    MODULE_NUMBER_INPUT_VALUE=2
    ...    MODULE_POINT_VALUE=6
    ...    START_DELAY_VALUE=15
    ...    STOP_DELAY_VALUE=16
    ...    GLOBAL_POINT=1
    ...    GLOBAL_SUBSTATION_NAME=2
    ...    GLOBAL_POINT_NAME=POINT01_AO

    Delete DO Point
    ...    POINT_ID_INPUT_VALUE=1EDIT_${DO_point_name}

Manipulate Good ST Points
    Go to automation state texts

    ${ST_point_name}=    Generate Random Point Name
    ...    first_part=1VAK
    ...    last_part=A
    ...    delimiter=_

    Add New ST Point
    ...    POINT_ID_INPUT_VALUE=${ST_point_name}
    ...    SYNCHRONIZE=1
    ...    VALUES1_VALUE=0
    ...    VALUES1_TEXT=ZERO
    ...    VALUES2_VALUE=1
    ...    VALUES2_TEXT=ONE
    ...    VALUES3_VALUE=2
    ...    VALUES3_TEXT=TWO

    Edit ST Point
    ...    POINT_ID_INPUT_VALUE=${ST_point_name}
    ...    POINT_ID_NEW_VALUE=1EDIT${ST_point_name}
    ...    SYNCHRONIZE=0
    ...    VALUES1_VALUE=-999
    ...    VALUES1_TEXT=NineNineNine
    ...    VALUES2_VALUE=998
    ...    VALUES2_TEXT=NineNineEight
    ...    VALUES3_VALUE=-997
    ...    VALUES3_TEXT=NineNineSeven

    Print ST Pointlist

    Delete ST Point
    ...    POINT_ID_INPUT_VALUE=1EDIT${ST_point_name}

Manipulate Good LT Points
    Go to automation lookup tables

    ${random_point}=    Generate Random Point Name
    ...    first_part=1VAK
    ...    last_part=LT
    ...    delimiter=_

    Add New LT Point
    ...    POINT_ID_INPUT_VALUE=${random_point}
    ...    POINT_DESCRIPTION_INPUT_VALUE=LT_Description
    ...    ACCESS_LEVEL_VIEW_INPUT_VALUE=0
    ...    ACCESS_LEVEL_MANUAL_INPUT_VALUE=0
    ...    ACCESS_LEVEL_PROGRAMMING_INPUT_VALUE=0
    ...    SENSOR_TYPE=2
    ...    OFFSET_INPUT_VALUE=-1.5
    ...    X_AXIS_INPUT_VALUE=X-measure
    ...    Y_AXIS_INPUT_VALUE=Y-convert
    ...    X_AXIS_MIN_VALUE=12
    ...    X_AXIS_MAX_VALUE=345
    ...    Y_AXIS_MIN_VALUE=23
    ...    Y_AXIS_MAX_VALUE=456
    ...    MEASURED_1_VALUE=111
    ...    CONVERTED_1_VALUE=1111
    ...    MEASURED_2_VALUE=222
    ...    CONVERTED_2_VALUE=2222
    ...    MEASURED_3_VALUE=333
    ...    CONVERTED_3_VALUE=3333
    ...    MEASURED_4_VALUE=444
    ...    CONVERTED_4_VALUE=4444

    Edit LT Point
    ...    POINT_ID_INPUT_VALUE=${random_point}
    ...    POINT_ID_NEW_VALUE=1EDIT_${random_point}
    ...    POINT_DESCRIPTION_INPUT_VALUE=LT_Description_Edited
    ...    ACCESS_LEVEL_VIEW_INPUT_VALUE=0
    ...    ACCESS_LEVEL_MANUAL_INPUT_VALUE=0
    ...    ACCESS_LEVEL_PROGRAMMING_INPUT_VALUE=0
    ...    SENSOR_TYPE=3
    ...    OFFSET_INPUT_VALUE=-55.5
    ...    X_AXIS_INPUT_VALUE=X-measure
    ...    Y_AXIS_INPUT_VALUE=Y-convert
    ...    X_AXIS_MIN_VALUE=0
    ...    X_AXIS_MAX_VALUE=1000
    ...    Y_AXIS_MIN_VALUE=0
    ...    Y_AXIS_MAX_VALUE=1000
    ...    RANDOM_VALUES=1

    Show LT graph
    ...    POINT_ID_INPUT_VALUE=1EDIT_${random_point}

    Delete LT Point
    ...    POINT_ID_INPUT_VALUE=1EDIT_${random_point}

Manipulate Good TS Points
    Go to automation time schedules

    ${random_point}=    Generate Random Point Name
    ...    first_part=1VAK
    ...    last_part=TS
    ...    delimiter=_

    Add New TS Point
    ...    POINT_ID_INPUT_VALUE=${random_point}
    ...    POINT_DESCRIPTION_INPUT_VALUE=TS Description
    ...    ACCESS_LEVEL_VIEW_INPUT_VALUE=0
    ...    ACCESS_LEVEL_MANUAL_INPUT_VALUE=0
    ...    ACCESS_LEVEL_PROGRAMMING_INPUT_VALUE=0
    ...    STATE_TEXT=0
    ...    USE_EXCEPTION_DAYS_CHKBX=1
    ...    DEFAULT_TYPE=1
    ...    DEFAULT_VALUE=3
    ...    VALUE_DECIMAL=2
    ...    LAST_DEFAULT_VALUE_BUTTON=2
    ...    SYNCHRONIZE_CHKBX=1
    ...    RANDOM_EVENTS=1
    ...    EVENTS_COPY=0

    Edit TS Point
    ...    POINT_ID_INPUT_VALUE=${random_point}
    ...    NEW_POINT_ID_INPUT_VALUE=1EDIT_${random_point}

    Print TS Pointlist

    Delete TS Point
    ...    POINT_ID_INPUT_VALUE=1EDIT_${random_point}

    Duplicate TS Point
    ...    POINT_ID_INPUT_VALUE=${random_point}
    ...    POINT_NEW_NAME=1COPY_${random_point}

    Delete TS Point
    ...    POINT_ID_INPUT_VALUE=1COPY_${random_point}

    Edit TS Point
    ...    POINT_ID_INPUT_VALUE=${random_point}
    ...    NEW_POINT_ID_INPUT_VALUE=1EDIT_${random_point}

    Delete TS Point
    ...    POINT_ID_INPUT_VALUE=1EDIT_${random_point}

Manipulate Good AG Points
    Go to automation alarm groups

    ${random_point}=    Generate Random Point Name
    ...    first_part=A
    ...    last_part=AG
    ...    delimiter=_

    Add Alarm Group
    ...    group_name=${random_point}
    ...    alarm_device=DEVICE_01

    Edit Alarm Group
    ...    group_name=${random_point}
    ...    alarm_device=DEVICE_01

    Print Alarm groups

    Delete Alarm Group
    ...    group_name=${random_point}

Manipulate Good AD Points
    Go to automation alarm devices

    ${random_point}=    Generate Random Point Name
    ...    first_part=AD
    ...    last_part=AD
    ...    delimiter=_

    Add Alarm Device
    ...    device_name=${random_point}
    ...    device_type=Email

    Delete Alarm Device
    ...    device_name=${random_point}

    ${random_point}=    Generate Random Point Name
    ...    first_part=AD
    ...    last_part=AD
    ...    delimiter=_

    Add Alarm Device
    ...    device_name=${random_point}
    ...    device_type=do

    Delete Alarm Device
    ...    device_name=${random_point}

    ${random_point}=    Generate Random Point Name
    ...    first_part=AD
    ...    last_part=AD
    ...    delimiter=_

    Add Alarm Device
    ...    device_name=${random_point}
    ...    device_type=forwarding

    Delete Alarm Device
    ...    device_name=${random_point}

    ${random_point}=    Generate Random Point Name
    ...    first_part=AD
    ...    last_part=AD
    ...    delimiter=_

    Add Alarm Device
    ...    device_name=${random_point}
    ...    device_type=alerta

    Delete Alarm Device
    ...    device_name=${random_point}

    ${random_point}=    Generate Random Point Name
    ...    first_part=AD
    ...    last_part=AD
    ...    delimiter=_

    Add Alarm Device
    ...    device_name=${random_point}
    ...    device_type=do

    Edit Alarm Device
    ...    device_name=${random_point}
    ...    new_device_name=1${random_point}
    ...    device_type=email

    Edit Alarm Device
    ...    device_name=${random_point}
    ...    new_device_name=2${random_point}
    ...    device_type=sms

    Edit Alarm Device
    ...    device_name=${random_point}
    ...    new_device_name=3${random_point}
    ...    device_type=do

    Edit Alarm Device
    ...    device_name=${random_point}
    ...    new_device_name=4${random_point}
    ...    device_type=forwarding

    Edit Alarm Device
    ...    device_name=${random_point}
    ...    new_device_name=6${random_point}
    ...    device_type=alerta

    Delete Alarm Device
    ...    device_name=6${random_point}

    Print Alarm Devices

Manipulate Good Alarm Points
    Go to automation alarm points
    Log To Console    Version info: ${version_info}

    ${rnd_pointname}=    Generate Random Point Name
    ...    first_part=1AP
    ...    last_part=H
    ...    delimiter=_

    Add New Alarm Point
    ...    point_name=${rnd_pointname}
    ...    alarm_type=conflict
    ...    port=3
    ...    module=1
    ...    point=8

    Delete Alarm Point
    ...    point_name=${rnd_pointname}

    ${rnd_pointname}=    Generate Random Point Name
    ...    first_part=1AP
    ...    last_part=H
    ...    delimiter=_

    Add New Alarm Point
    ...    point_name=${rnd_pointname}
    ...    alarm_type=normal
    ...    port=3
    ...    module=1
    ...    point=8

    Delete Alarm Point
    ...    point_name=${rnd_pointname}

    ${rnd_pointname}=    Generate Random Point Name
    ...    first_part=1AP
    ...    last_part=H
    ...    delimiter=_

    Add New Alarm Point
    ...    point_name=${rnd_pointname}
    ...    alarm_type=module
    ...    port=3
    ...    module=1
    ...    point=8

    Delete Alarm Point
    ...    point_name=${rnd_pointname}

    ${rnd_pointname}=    Generate Random Point Name
    ...    first_part=1AP
    ...    last_part=H
    ...    delimiter=_

    Add New Alarm Point
    ...    point_name=${rnd_pointname}
    ...    alarm_type=limit
    ...    port=3
    ...    module=1
    ...    point=8

    Edit Alarm Point
    ...    point_name=${rnd_pointname}
    ...    new_point_name=1EDITED_POINT_H
    ...    alarm_type=conflict
    ...    port=3
    ...    module=1
    ...    point=8

    Duplicate Alarm Point
    ...    point_name=${rnd_pointname}

    Delete Alarm Point
    ...    point_name=1COPY_${rnd_pointname}

    Delete Alarm Point
    ...    point_name=${rnd_pointname}

    Delete Alarm Point
    ...    point_name=1EDITED_POINT_H

# Manipulate Good Module Devices

#    Go to automation modules

#    Clear Errors Module Devices

#     Add New Module Device
#    ...    port_number=3
#    ...    address_number=4
#    ...    module_type=ai
#    ...    tcp_module=no
#    ...    ip_address=10.100.1.97
#    ...    ip_port=10002
#    ...    debug=no
#    ...    timeout=5000ms
#    ...    mbus_id=12345678
#    ...    mbus_address=0
#    ...    mbus_use_secondary=yes
#    ...    mbus_send_reset=no

#    Connections Module Devices
#    ...    port=3
#    ...    module=4

#    Find Module Devices

#    Update Software Module Devices
#    ...    port_number=3
#    ...    address_number=4
#    ...    version_number=3.13

#    Add New Module Device
#    ...    port_number=0
#    ...    address_number=7
#    ...    module_type=mbus
#    ...    tcp_module=yes
#    ...    ip_address=10.100.1.97
#    ...    ip_port=10002
#    ...    debug=yes
#    ...    timeout=5000ms
#    ...    mbus_id=12345678
#    ...    mbus_address=0
#    ...    mbus_use_secondary=yes
#    ...    mbus_send_reset=no

#    Delete Module Device
#    ...    port_number=0
#    ...    address_number=7

#    Add New Module Device
#    ...    port_number=3
#    ...    address_number=7
#    ...    module_type=ao
#    ...    tcp_module=NO
#    ...    ip_address=
#    ...    ip_port=
#    ...    debug=no
#    ...    timeout=500ms
#    ...    mbus_id=
#    ...    mbus_address=
#    ...    mbus_use_secondary=
#    ...    mbus_send_reset=

#    Delete Module Device
#    ...    port_number=3
#    ...    address_number=7

Manipulate Good Modbus Devices
    Go to automation modbus devices

    Add New Modbus Device
    ...    port_number=3
    ...    address_number=247
    ...    bus_address=0
    ...    register_type=3
    ...    register_start=40000
    ...    register_number=64
    ...    tcp_module=1
    ...    ip_address=0.0.0.0
    ...    ip_port=10000
    ...    debug=1
    ...    sendonly=1
    ...    timeout=123

    Clear Errors Modbus Devices

    Edit Modbus Device
    ...    port_number=5
    ...    address_number=1
    ...    new_port_number=4
    ...    new_address_number=99
    ...    bus_address=0
    ...    register_type=3
    ...    register_start=64000
    ...    register_number=64
    ...    tcp_module=1
    ...    ip_address=0.0.0.0
    ...    ip_port=10000
    ...    debug=1
    ...    sendonly=1
    ...    timeout=123

    Delete Modbus Device
    ...    port_number=7
    ...    address_number=1

Manipulate Good Freeze Protect Points
    Go to automation freeze protectors

    ${rnd_pointname}=    Generate Random Point Name
    ...    first_part=1FP
    ...    last_part=FP
    ...    delimiter=_

    Add New Freeze Protect
    ...    point_name=${rnd_pointname}
    ...    point_description=Freeze_Description
    ...    port_number=3
    ...    module_number=1
    ...    point_number=39
    ...    setvalue=1.5
    ...    PBand=100
    ...    alarmLimit=1.8
    ...    freezeReturnWaterAI=AI_0001_M
    ...    freezeFanDO=DO_0001_O
    ...    freezeValveAO=AO_0001_A
    ...    freezeAlarmDO=DO_0002_O
    ...    freezeWarningAlarm=ALM_0001_H
    ...    freezeAck=DI_0001_I
    ...    ackByButton=1

    Duplicate Freeze Protect
    ...    point_name=${rnd_pointname}
    ...    new_point_name=1COPY_${rnd_pointname}

    Print Freeze Pointlist

    Delete Freeze Protect
    ...    point_name=1COPY_${rnd_pointname}

    Edit Freeze Protect
    ...    point_name=${rnd_pointname}
    ...    new_point_name=1EDIT_${rnd_pointname}
    ...    point_description=Edited Freeze_Description
    ...    port_number=3
    ...    module_number=1
    ...    point_number=39
    ...    setvalue=99.9
    ...    PBand=10000
    ...    alarmLimit=88.8
    ...    freezeReturnWaterAI=AI_9999_M
    ...    freezeFanDO=DO_9999_O
    ...    freezeValveAO=AO_9999_A
    ...    freezeAlarmDO=DO_9998_O
    ...    freezeWarningAlarm=ALM_9999_H
    ...    freezeAck=DI_9999_I
    ...    ackByButton=1

    Delete Freeze Protect
    ...    point_name=1EDIT_${rnd_pointname}

Manipulate Good Calendar Actions
    Go to automation calendar

    ${rnd_event_description}=    Generate Random Latin Letters    16

    ${todays_date}=    Get Todays Date YYYY-MM-DD

    ${other_date}=    Get Date Relative to Today    5

    Add New Calendar Event To Day
    ...    event_description=${rnd_event_description}
    ...    timetable_option=2
    ...    weekday=4
    ...    bypass_validity_option=3
    ...    bypass_date_1=${todays_date}
    ...    bypass_date_2=${other_date}
    ...    bypass_repeat_month=6
    ...    bypass_repeat_days_month=6
    ...    bypass_repeat_day_week=6


*** Keywords ***
Check All Points In The List
    Go to automation
    Go to automation all points
