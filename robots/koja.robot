*** Settings ***
Resource        ${RESOURCES}/koja.resource
Resource        ${RESOURCES}/navigate.resource
Library         Browser

Test Setup      New Page    http://10.78.185.48:${TARGET_FRONTEND_PORT}


*** Test Cases ***
Koja Basic Tests
    Koja Main Page Walkthrough
