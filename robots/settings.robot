*** Settings ***
Resource        resources\\settings.resource
Resource        resources\\settings_2.resource
Resource        resources\\settings_id.resource
Resource        resources\\settings_id_2.resource
Resource        resources\\navigate.resource
Library         RPA.Browser.Selenium
Library         SeleniumLibrary

Test Setup      Go to main view


*** Test Cases ***
Settings Page Features Walkthrough QA-ID
    [Documentation]    Walks through all Settings sub-pages for Dashboard, System, Network, User

    Settings Dashboard Elements QA-ID

Settings Page System Settings
    Settings System Device QA-ID    nosave
    Settings System Status QA-ID    nosave
    Settings System Clock QA-ID    nosave
    # Settings System Activations QA-ID    nosave
    Settings System SMS QA-ID    nosave
    Settings System Information Synchronization QA-ID    nosave
    Settings System Backup QA-ID    nosave
    Settings System Status QA-ID    nosave

Settings Page Network Settings
    Settings Network IP QA-ID    nosave
    Settings Network Port QA-ID    nosave
    Settings Network Firewall QA-ID    nosave
    Settings Network Email QA-ID    nosave
    Settings Network NAT Settings QA-ID    nosave
    # Settings Network History QA-ID    nosave
    Settings Network Tosibox QA-ID    nosave

Settings Page User Settings
    Settings User Users Add QA-ID    NEWUSER    newpassword    1    nosave
    Settings User Users Edit QA-ID    NEWUSER    USERNEW    nosave
    Settings User Users Remove QA-ID    USERNEW    nosave
    Settings User Usergroup Add QA-ID    NEWGROUP    nosave
    Settings User Usergroup Edit QA-ID    NEWGROUP    GROUPNEW    nosave
    Settings User Usergroup Remove QA-ID    GROUPNEW    nosave
