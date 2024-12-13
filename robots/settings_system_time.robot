*** Settings ***
Library           Process
Library           DateTime
Suite Setup       Setup Environment
Suite Teardown    Teardown Environment

*** Variables ***
${NTP_SERVER}        time.windows.com
${TIME_BEFORE}       01/01/2024 01:00:00
${TIME_AFTER}        11/05/2024 01:00:00

*** Test Cases ***
Test Daylight Saving Time Adjustments
    [Documentation]    This test verifies daylight saving functionality by toggling time sync and adjusting system time.
    
    # Disable time synchronization
    Disable Time Synchronization
    Sleep    3s
    
    # Set system time to a date before DST change
    Set System Time    ${TIME_BEFORE}
    Sleep    5s
    Verify Daylight Saving Effect
    
    # Set system time to a date after DST change
    Set System Time    ${TIME_AFTER}
    Sleep    5s
    Verify Daylight Saving Effect

    # Re-enable time synchronization
    Enable Time Synchronization
    Sleep    3s

*** Keywords ***
Setup Environment
    Log    Starting daylight saving time test.

Teardown Environment
    Enable Time Synchronization
    Log    Completed daylight saving time test. Resetting synchronization settings.

Disable Time Synchronization
    [Documentation]    Disables Windows time synchronization.
    Run Process    powershell    Set-Service -Name W32Time -StartupType Disabled
    Run Process    powershell    Stop-Service -Name W32Time
    Log    Time synchronization disabled.

Enable Time Synchronization
    [Documentation]    Enables Windows time synchronization and syncs with NTP server.
    Run Process    powershell    Set-Service -Name W32Time -StartupType Manual
    Run Process    powershell    Start-Service -Name W32Time
    Run Process    powershell    w32tm /resync /computer:${NTP_SERVER}
    Log    Time synchronization enabled.

Set System Time
    [Arguments]    ${time_value}
    [Documentation]    Sets the system time to the specified value.
    Run Process    powershell    Set-Date -Date "${time_value}"
    Log    System time set to ${time_value}.

Verify Daylight Saving Effect
    [Documentation]    Verifies if the system time adheres to daylight saving changes.
    ${current_time}=    Get Current Date
    Log    Current system time: ${current_time}
    # Add more validation logic here based on DST rules or expected time adjustments.
