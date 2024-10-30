*** Settings ***
Library     Browser


*** Variables ***
${selector_language_usermenu}       xpath=//div[@id="user_menu"]
${selector_language_english}        xpath=//span[@class='mat-mdc-menu-item-text' and text()=' English ']
...                                 ${EMPTY}    # xpath=//button[normalize-space(text())=" English "]
${selector_language_finnish}        xpath=//button[normalize-space(text())=" Finnish "]


*** Keywords ***
Change language to ${language}
    [Documentation]
    ...    Changes the language to the given language. This will use top right
    ...    menu to change the language.
    ...
    ...    Example:
    ...    | Change language to finnish |

    Browser.Click    ${selector_language_usermenu}
    ${version_info}=    Run Keyword And Continue On Failure
    ...    Browser.Get Text
    ...    xpath=//div[contains(@class, 'version_info')]
    Set Global Variable    ${version_info}    ${version_info}
    # Log To Console    ${version_info}
    Browser.Click    ${selector_language_${language.lower()}}
