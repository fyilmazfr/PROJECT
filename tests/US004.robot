*** Settings ***
Library    SeleniumLibrary
Library    BuiltIn

Variables         ../Locators/HomePage.py
Resource          ../Resources/reusable_keywords.robot
Resource          ../Resources/variables.robot
Suite Setup       Open Browser To Application    ${BASE_URL}  #include suite setup and teardown



*** Variables ***
${BROWSER_OPTIONS} 

*** Keywords ***

*** Test Cases ***
TC001 Successfully Login
    [Documentation]   Successfully Login
    [Tags]   smoke

    Click Element    ${LoginPageLocators.SIGN_IN_BUTTON}
    Input Text     ${LoginPageLocators.LOGIN_EMAIL_BUTTON}   ${EMAIL_My_Shop}
    Input Text     ${LoginPageLocators.LOGIN_PASSWORD_BUTTON}   ${PASSWORD_My_Shop}
    Click Element    ${LoginPageLocators.SIGN_IN}
    
    Location Should Contain     controller=my-account







