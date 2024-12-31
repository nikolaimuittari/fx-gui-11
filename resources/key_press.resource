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
    [Documentation]
    ...    Types text with delay between key press

    [Arguments]    ${text}    ${delay}
    FOR    ${char}    IN    @{text}
        Browser.Keyboard Key    press    ${char}
        Sleep    ${delay}
    END
