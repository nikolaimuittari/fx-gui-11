*** Settings ***
# Resource    ../../resources/cpu.resource
# Resource    ../../resources/login.resource
# Resource    ../../resources\navigate.resource
# Resource    ../../resources/settings/user_settings/user.resource
# Resource    ../../resources/env.resource
Resource    resources\\login.resource
Resource    resources\\navigate.resource
Resource    resources\\env.resource
Library     Browser
Library     String
Library     Collections
Library     OperatingSystem
Library     Process
Library     DateTime
Library     SSHLibrary
Library     RPA.Windows
Library     RPA.Desktop

*** Variables ***
# ${CLUMSY_PATH}          C:\\QA\\temp\\clumsy_03\\clumsy.exe
${CLUMSY_PATH}          C:/QA/temp/clumsy_03/

${user}                 system
${user_password}        24680

${timestamp_format}     %Y-%m-%d %H:%M:%S.%f

${host}                 10.78.185.37
${username}             fx3000
${password}             Systemuser!
${alias}                fx3000x


*** Test Cases ***
Test SFTP Communication


    [Documentation]    Using Clumsy to limit bandwidth for outbound connections to a host destination IP.
    ...    Command line options for Clumsy.exe:
    ...    --filter = "filter string". Example: --filter "tcp and (tcp.DstPort == 443 or tcp.SrcPort == 443)"
    ...    --drop [on/off] = Whether or not drop is enabled. Default is off. Example: --drop on
    ...    --duplicate [on/off] = Whether or not duplicate is enabled. Default is off. Example: --duplicate on
    ...    --lag [on/off] = Whether or not lag is enabled. Default is off. Example: --lag on
    ...    --lag-time [0-3000] = Milliseconds to delay the request for LAG type
    ...    --ood [on/off] = Whether or not "out of order" is enabled. Default is off. Example: --ood on
    ...    --tamper [on/off] = Whether or not tamper is enabled. Default is off. Example: --tamper on
    ...    --throttle [on/off] = Whether or not throttle is enabled. Default is off. Example: --throttle on
    ...    --bandwidth [on/off] = Whether or not bandwidth limit is enabled. Default is off. Example: --bandwidth on
    ...    --bandwidth-bandwidth [0-99999] = Bandwidth in Kilobytes per second. Example: --bandwidth-bandwidth 10
    ...    --TYPE-inbound [on/off] = Given TYPE is one of drop, duplicate, lag, ood, tamper, or throttle, this sets the inbound to on. Example: --drop-inbound on
    ...    --TYPE-outbound [on/off] = Given TYPE is one of drop, duplicate, lag, ood, tamper, or throttle, this sets the outbound to on. Example: --drop-outbound on
    ...    --TYPE-chance [0.0-100.0] = Given TYPE is one of drop, duplicate, ood, tamper, or throttle, this sets the chance of the operation. Example: --drop-chance 50.0
    ...    Example:
    ...    clumsy.exe --filter "tcp and (tcp.DstPort == 443 or tcp.SrcPort == 443)" --drop on --drop-inbound on --drop-outbound on --drop-chance 100.0
    ...        # Edit 2: SOLUTION https://stackoverflow.com/questions/25991168/robot-framework-start-process-with-arguments-on-windows
    ...        # Each argument must be separated form the other (when not running in shell) with a double space. I was not using double spaces, hence the error.
    ...        # Start Process    ${CLUMSY_PATH}    --bandwidth  on  --bandwidth-bandwidth  200    alias=clumsy_03


    Test SFTP Upload All Folder Files To Remote
    ...    ${host}
    ...    ${host}
    ...    ${username}
    ...    ${password}
    ...    5
    ...    c:\\QA\\robot_tmp\\1MB
    ...    /tmp

    Upload With Lag By Clumsy
    ...    host=10.78.185.37
    ...    username=fx3000
    ...    password=Systemuser!
    ...    upload_folder=c:\\QA\\robot_tmp\\1MB
    ...    lag_time=100

    Upload With Bandwidth Limit By Clumsy
    ...    host=10.78.185.37
    ...    username=fx3000
    ...    password=Systemuser!
    ...    upload_folder=c:\\QA\\robot_tmp\\1MB
    ...    bandwidth_limit=300

    Upload With Drop By Clumsy
    ...    host=10.78.185.37
    ...    username=fx3000
    ...    password=Systemuser!
    ...    upload_folder=c:\\QA\\robot_tmp\\1MB
    ...    drop_chance=10

    Upload With Duplicate By Clumsy
    ...    host=10.78.185.37
    ...    username=fx3000
    ...    password=Systemuser!
    ...    upload_folder=c:\\QA\\robot_tmp\\1MB
    ...    duplicate_count=2
    ...    duplicate_chance=10

    Upload With Throttle By Clumsy
    ...    host=10.78.185.37
    ...    username=fx3000
    ...    password=Systemuser!
    ...    upload_folder=c:\\QA\\robot_tmp\\1MB
    ...    throttle_chance=10

    Upload With OOD By Clumsy
    ...    host=10.78.185.37
    ...    username=fx3000
    ...    password=Systemuser!
    ...    upload_folder=c:\\QA\\robot_tmp\\1MB
    ...    ood_chance=10

    # Upload With Bandwidth Limit By Clumsy
    # ...    host=10.78.185.37
    # ...    username=fx3000
    # ...    password=Systemuser!
    # ...    upload_folder=c:\\QA\\robot_tmp\\10MB
    # ...    bandwidth_limit=300

    # Upload With Drop By Clumsy
    # ...    host=10.78.185.37
    # ...    username=fx3000
    # ...    password=Systemuser!
    # ...    upload_folder=c:\\QA\\robot_tmp\\10MB
    # ...    drop_chance=10

    # Upload With Duplicate By Clumsy
    # ...    host=10.78.185.37
    # ...    username=fx3000
    # ...    password=Systemuser!
    # ...    upload_folder=c:\\QA\\robot_tmp\\10MB
    # ...    duplicate_count=2
    # ...    duplicate_chance=10

    # Upload With Throttle By Clumsy
    # ...    host=10.78.185.37
    # ...    username=fx3000
    # ...    password=Systemuser!
    # ...    upload_folder=c:\\QA\\robot_tmp\\10MB
    # ...    throttle_chance=10

    # Upload With OOD By Clumsy
    # ...    host=10.78.185.37
    # ...    username=fx3000
    # ...    password=Systemuser!
    # ...    upload_folder=c:\\QA\\robot_tmp\\10MB
    # ...    ood_chance=10


*** Keywords ***

Upload With Lag By Clumsy
    [Arguments]    ${host}    ${username}    ${password}    ${upload_folder}    ${lag_time}

    ${process}=    Start Process    ${CLUMSY_PATH}clumsy.exe    --lag  on  --lag-inbound  on  --lag-outbound  on  --lag-time  ${lag_time}    alias=clumsy_03    

    Test SFTP Upload All Folder Files To Remote
    ...    ${host}
    ...    ${alias}
    ...    ${username}
    ...    ${password}
    ...    5
    ...    ${upload_folder}
    ...    /tmp

    Stop Clumsy    ${process}


Upload With Bandwidth Limit By Clumsy
    [Arguments]    ${host}    ${username}    ${password}    ${upload_folder}    ${bandwidth_limit}

    ${process}=    Start Process    ${CLUMSY_PATH}clumsy.exe    --bandwidth  on  --bandwidth-inbound  on  --bandwidth-outbound  on  --bandwidth-bandwidth  ${bandwidth_limit}    alias=clumsy_03

    Test SFTP Upload All Folder Files To Remote
    ...    ${host}
    ...    ${alias}
    ...    ${username}
    ...    ${password}
    ...    5
    ...    ${upload_folder}
    ...    /tmp

    Stop Clumsy    ${process}


Upload With Drop By Clumsy
    [Arguments]    ${host}    ${username}    ${password}    ${upload_folder}    ${drop_chance}

    ${process}=    Start Process    ${CLUMSY_PATH}clumsy.exe    --drop  on  --drop-inbound  on  --drop-outbound  on  --drop-chance  ${drop_chance}    alias=clumsy_03

    Test SFTP Upload All Folder Files To Remote
    ...    ${host}
    ...    ${alias}
    ...    ${username}
    ...    ${password}
    ...    5
    ...    ${upload_folder}
    ...    /tmp

    Stop Clumsy    ${process}


Upload With Duplicate By Clumsy
    [Arguments]    ${host}    ${username}    ${password}    ${upload_folder}    ${duplicate_count}    ${duplicate_chance}

    ${process}=    Start Process    ${CLUMSY_PATH}clumsy.exe    --duplicate  on  --duplicate-inbound  on  --duplicate-outbound  on  --duplicate-count  ${duplicate_count}  --duplicate-chance  ${duplicate_chance}    alias=clumsy_03

    Test SFTP Upload All Folder Files To Remote
    ...    ${host}
    ...    ${alias}
    ...    ${username}
    ...    ${password}
    ...    5
    ...    ${upload_folder}
    ...    /tmp

    Stop Clumsy    ${process}


Upload With Throttle By Clumsy
    [Arguments]    ${host}    ${username}    ${password}    ${upload_folder}    ${throttle_chance}

    ${process}=    Start Process    ${CLUMSY_PATH}clumsy.exe    --throttle  on  --throttle-inbound  on  --throttle-outbound  on  --throttle-chance  ${throttle_chance}    alias=clumsy_03

    Test SFTP Upload All Folder Files To Remote
    ...    ${host}
    ...    ${alias}
    ...    ${username}
    ...    ${password}
    ...    5
    ...    ${upload_folder}
    ...    /tmp

    Stop Clumsy    ${process}


Upload With OOD By Clumsy
    [Arguments]    ${host}    ${username}    ${password}    ${upload_folder}    ${ood_chance}

    ${process}=    Start Process    ${CLUMSY_PATH}clumsy.exe    --ood  on  --ood-inbound  on  --ood-outbound  on  --ood-chance  ${ood_chance}    alias=clumsy_03

    Test SFTP Upload All Folder Files To Remote
    ...    ${host}
    ...    ${alias}
    ...    ${username}
    ...    ${password}
    ...    5
    ...    ${upload_folder}
    ...    /tmp

    Stop Clumsy    ${process}



Test SFTP Upload All Folder Files To Remote
    [Arguments]
    ...    ${host}
    ...    ${alias}
    ...    ${username}
    ...    ${password}
    ...    ${delay}
    ...    ${local_folder_path}
    ...    ${remote_folder_path}

    SSHLibrary.Open Connection    ${host}    alias=${alias}
    SSHLibrary.Login    ${username}    ${password}    delay=${delay}
    ${connection_info}=    SSHLibrary.Get Connection
    Log To Console    Connection info: ${connection_info}

    @{items}=    SSHLibrary.List Directory    /tmp
    # Log To Console    /tmp folder content: @{items}

    ${local_folder_path_exists}=    Run Keyword And Return Status
    ...    OperatingSystem.Directory Should Exist
    ...    ${local_folder_path}

    IF    ${local_folder_path_exists}
        ${remote_folder_path_exists}=    Run Keyword And Return Status
        ...    SSHLibrary.Directory Should Exist
        ...    ${remote_folder_path}
        IF    ${remote_folder_path_exists}
            @{local_folder_items}=    OperatingSystem.List Directory    ${local_folder_path}
            ${local_list_length}=    Get Length    ${local_folder_items}
            # Log To Console    Number of items in the local directory: ${local_list_length}\n

            ${parent_path}    ${copied_subfolder}=    OperatingSystem.Split Path    ${local_folder_path}
            ${remote_folder_path_after_copy}=    Set Variable    ${remote_folder_path}/${copied_subfolder}

            ${start_time}=    Get Current Date    result_format=${timestamp_format}

            @{files}=    OperatingSystem.List Files In Directory    ${local_folder_path}
            ${transferred _size}=     Set Variable    0
            # Upload each file
            FOR    ${file}    IN    @{files}
                
                ${remote_file_path}=    Set Variable    ${remote_folder_path_after_copy}/${file}
                ${local_file_path}=     Set Variable    ${local_folder_path}\\${file}
                Log To Console   Local file: ${local_file_path}  -- ${file} is uploading to remote destination: ${remote_file_path}

                ${size}=    Evaluate    os.path.getsize(r"""${local_file_path}""")    modules=os

                Put File    ${local_file_path}    ${remote_file_path}
                ${transferred_size}=    Evaluate    ${transferred_size}+${size}
                Log To Console   size ${size} \(total: ${transferred size}\) file: ${file} is uploaded.

            END
            # Put Directory    ${local_folder_path}    ${remote_folder_path}    recursive=True

            ${remote_folder_complete_path_exists}=    Run Keyword And Return Status
            ...    SSHLibrary.Directory Should Exist
            ...    ${remote_folder_path_after_copy}
            IF    ${remote_folder_complete_path_exists}
                @{remote_folder_items}=    SSHLibrary.List Directory    ${remote_folder_path_after_copy}
            END
            # @{remote_folder_items}=    SSHLibrary.List Directory    ${remote_folder_path_after_copy}

            ${stop_time}=    DateTime.Get Current Date    result_format=${timestamp_format}
            ${duration}=    Evaluate    (datetime.datetime.strptime('${stop_time}', '${timestamp_format}') - datetime.datetime.strptime('${start_time}', '${timestamp_format}')).total_seconds()
            # Log To Console    Folder ${remote_folder_path_after_copy} is copied from local to remote in ${duration} sec\n

            ${remote_list_length}=    Get Length    ${remote_folder_path_after_copy}
            # Log To Console    Number of items in the remote directory: ${remote_folder_path_after_copy}\n

            @{items}=    SSHLibrary.List Directory    /tmp
            # Log To Console    Remote /tmp folder content: @{items}\n
            
            Remote Folder Remove    ${remote_folder_path_after_copy}
            ${remote_folder_path_not_exists}=    Run Keyword And Return Status
                ...    SSHLibrary.Directory Should Not Exist
                ...    ${remote_folder_path_after_copy}
            IF    ${remote_folder_path_not_exists}
                Log To Console    Remote folder deleted OK : ${remote_folder_path_after_copy}
            ELSE
                Log To Console    Remote folder NOT deleted : ${remote_folder_path_after_copy}
            END
            # ${output}=    Execute Command    rm -rf ${remote_folder_path_after_copy}
            # SSHLibrary.Directory Should Not Exist    ${remote_folder_path_after_copy}
            # Log To Console    Remote directory ${remote_folder_path_after_copy} removed\n
        ELSE
            Log To Console    Remote folder ${remote_folder_path_after_copy} does not exist\n
            Fail    Remote folder ${remote_folder_path_after_copy} does not exist
        END
    ELSE
        Log To Console    Local folder ${remote_folder_path_after_copy} does not exist\n
        Fail    Local folder ${remote_folder_path_after_copy} does not exist
    END

    ${average_speed}=    Evaluate    round((${transferred_size} / 1024) / ${duration}, 2)
    Log To Console    Number of copied items: ${local_list_length}
    Log To Console    Total size: ${transferred_size} bytes
    Log To Console    Time to copy: ${duration}
    Log To Console    Average Speed: ${average_speed} KB/
    # @{files}=    SSHLibrary.List Files In Directory    /tmp    absolute=True
    # Log To Console    Files in tmp: @{files}
    SSHLibrary.Close All Connections



Stop Clumsy
    [Arguments]    ${process}
    Process.Terminate Process    ${process}

Remote Folder Remove
    [Arguments]    ${remote_folder_path}
    ${output}=    Execute Command    rm -rf ${remote_folder_path}
    SSHLibrary.Directory Should Not Exist    ${remote_folder_path}
    Log To Console    Remote directory ${remote_folder_path} removed\n