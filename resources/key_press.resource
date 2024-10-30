*** Settings ***
# Library    RPA.Browser.Selenium
Library     Browser
Library     RPA.HTTP
Library     String
Library     OperatingSystem
Library     Collections
# Library    RPA.Desktop


*** Keywords ***
Press Symbols With Delay
    [Arguments]    ${text}    ${delay}
    FOR    ${char}    IN    @{text}
        Browser.Keyboard Key    press    ${char}
        Sleep    ${delay}
    END
