[Documentation]   Open the website and Sign in 

*** Settings ***
Library           SeleniumLibrary
Variables         ../Locators/HomePage.py
Resource          ../Resources/reusable_keywords.robot
Resource          ../Resources/variables.robot



*** Keywords ***


*** Test Cases ***
TC002 Sign in and Verify Create Account Button
    Open Browser To Application    ${BASE_URL}    ${BROWSER}
    Click Element       ${LoginPageLocators.SIGN_IN_BUTTON}
    Element Should Be Visible    ${LoginPageLocators.CREATE_ACCOUNT_BUTTON}
    