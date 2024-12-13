*** Settings ***
Resource        resources\\history.resource
Resource        resources\\navigate.resource
Resource        resources\\ai_point_id.resource
Library         Browser

Test Setup      Go to main view


*** Test Cases ***
History Page Features Walkthrough
    Go to automation measurements

    ${random_point}=    Generate Random Point Name
    ...    first_part=1VAK
    ...    last_part=M
    ...    delimiter=_

    Add New AI Point
    ...    POINT_ID_INPUT_VALUE=AI_0001_M
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

    History Point Add
    ...    point_name=AI_0001_M
    ...    tolerance=1.1
    ...    samplecount=10000
    ...    sampletime=11
    ...    sampletime_period=2
    ...    recording=1
    ...    energy=2
    ...    save=save

    History Point Remove
    ...    point_name=AI_0001_M
    ...    save=save

    History Point Add
    ...    point_name=AI_0001_M
    ...    tolerance=2.1
    ...    samplecount=20000
    ...    sampletime=22
    ...    sampletime_period=2
    ...    recording=1
    ...    energy=2
    ...    save=save

    History Group Add
    ...    group_name=GROUP_1
    ...    timespan=20
    ...    timespan_item=2
    ...    samples_max=2000
    ...    email=1
    ...    server=1
    ...    recipient=info@info.info
    ...    timespan_email=2
    ...    samples_day=200
    ...    save=save
    ...    point_name=AI_0001_M

    History Group Remove
    ...    group_name=GROUP_1
    ...    save=save

    History Point Remove
    ...    point_name=AI_0001_M
    ...    save=save

    Go to automation measurements

    Delete AI Point
    ...    POINT_ID_INPUT_VALUE=AI_0001_M
