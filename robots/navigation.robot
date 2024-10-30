*** Comments ***
# Basically just tests that our navigation works. This is also place to take
# page screenshots.


*** Settings ***
Resource        resources\\navigate.resource
Resource        resources\\backup.resource
Library         Browser

Test Setup      Go to main view


*** Test Cases ***
Test navbar navigations
    [Template]    Run keyword and take screenshot
    Go to dashboard    page-dashboard
    Go to processes    page-processes
    Go to automation
    Go to history    page-history
    Go to logs
    Go to settings

    # TODO:Reports is hidden if there is no reports to display
    # Go to reports    page-reports

Test automation navigations
    [Template]    Run keyword and take screenshot

    Go to automation indications    page-automation-indications
    Go to automation measurements    page-automation-measurements
    Go to automation control points    page-automation-control-points
    Go to automation ao points    page-automation-ao-points
    Go to automation do points    page-automation-do-points
    Go to automation state texts    page-automation-state-texts
    Go to automation lookup tables    page-automation-lookup-tables
    Go to automation time schedules    page-automation-time-schedules
    Go to automation all points    page-automation-all-points

    Go to automation alarm points    page-automation-alarm-points
    Go to automation alarm devices    page-automation-alarm-devices
    Go to automation alarm groups    page-automation-alarm-groups

    Go to automation modules    page-automation-modules
    Go to automation modbus devices    page-automation-modbus-devices
    Go to automation freeze protectors    page-automation-freeze-protectors

    Go to automation calendar    page-automation-calendar

Test logs navigations
    [Template]    Run keyword and take screenshot
    Go to logs events    page-logs-events
    Go to logs alarms    page-logs-alarms
    Go to logs debugs    page-logs-debugs
    # TODO: Sub pages of debug are not here yet.

Test settings navigations
    [Template]    Run keyword and take screenshot
    Go to settings dashboard    page-settings-dashboard
    Go to system settings
    Go to network settings
    Go to user settings

Test system settings navigations
    [Template]    Run keyword and take screenshot
    Go to system device settings    page-settings-system-device
    Go to system status settings    page-settings-system-status
    Go to system clock settings    page-settings-system-clock
    Go to system activations settings    page-settings-system-activations
    Go to system sms settings    page-settings-system-sms
    Go to system sync settings    page-settings-system-sync
    # TODO: this is behind bacnet activation
    # Go to system priority table settings    page-setting-system-priority-table

    # TODO: This is behind activations so what to do?
    # Go to system weather settings    page-settings-system-weather

Test system backup dialog navigations
    Run keyword and take screenshot    Go to system backup settings dialog    page-settings-system-backup
    Click    ${selector_backup_cancel}

Test network settings navigations
    [Template]    Run keyword and take screenshot
    Go to network ip settings    page-settings-network-ip
    Go to network port settings    page-settings-network-port
    Go to network firewall settings    page-settings-network-firewall
    Go to network nat settings    page-settings-network-nat
    Go to network alarm email settings    page-settings-network-alarm-email
    Go to network history settings    page-settings-network-history
    Go to network tosibox settings    page-settings-network-tosibox

Test users settings navigations
    [Template]    Run keyword and take screenshot
    Go to user settings    page-settings-user
    Go to user groups settings    page-settings-user-groups


*** Keywords ***
Take Screenshot With Wait
    [Arguments]    ${screenshotname}
    Wait Until Network Is Idle
    Wait until loading spinner is gone
    Take Screenshot    filename=${screenshotname}

Run keyword and take screenshot
    [Arguments]    ${keyword}    ${screenshotname}=${EMPTY}
    Run Keyword    ${keyword}
    IF    '${screenshotname}' == '${EMPTY}'    RETURN

    Take Screenshot With Wait    ${screenshotname}
