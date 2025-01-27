*** Settings ***
Library    SeleniumLibrary
Library    BuiltIn
Library    String
Variables         ../Locators/HomePage.py
Resource          ../Resources/reusable_keywords.robot
Resource          ../Resources/variables.robot

*** Variables ***
${LOCATORGENDERMR}    xpath=//input[@id='id_gender1']
${LOCATORGENDERMRS}        xpath=//input[@id='id_gender2']


*** Keywords ***
Select One Random Gender
    [Documentation]      Selects gender randomly as male (MR) or female (MRS).
    ${locator_list}=    Create List    ${LOCATORGENDERMR}    ${LOCATORGENDERMRS}
    ${selected_locator}=    Evaluate    random.choice(${locator_list})    modules=random
    Log    Selected locator: ${selected_locator}
    Click Element    ${selected_locator}

Select Random Date Of Birth
    [Documentation]    Selects a random date of birth in the registration form.
    ${day}    Evaluate    random.randint(1, 28)
    ${month}  Evaluate    random.randint(1, 12)
    ${year}   Evaluate    random.randint(1915, 2025)
    Select From List By Value    ${LoginPageLocators.DAY_DROPDOWN}     ${day}
    Select From List By Value    ${LoginPageLocators.MONTH_DROPDOWN}   ${month}
    Select From List By Value    ${LoginPageLocators.YEAR_DROPDOWN}    ${year}

Generate Random Email
    [Documentation]    Generates and returns a random email address.
    ${random_string}=    Evaluate    ''.join(random.choices('abcdefghijklmnopqrstuvwxyz1234567890', k=10))    modules=random
    ${email}=    Set Variable    ${random_string}@yopmail.com
    [Return]    ${email}

 


*** Test Cases ***
TC001 Create an account 
    [Documentation]   Tests the process of creating a new user account
    [Tags]   smoke
    
    Open Browser To Application    ${BASE_URL}    ${BROWSER}
    Click Element   ${LoginPageLocators.SIGN_IN_BUTTON}
    Sleep    1s
    ${random_email}=    Generate Random Email
    Input Text      ${LoginPageLocators.EMAIL_ADDRESS_CREATE_ACCOUNT}    ${random_email}
    Sleep    1s
    Click Button    ${LoginPageLocators.CREATE_ACCOUNT_BUTTON}
    Sleep    1s
    Location Should Contain    controller=authentication
    Sleep    1s
    Select One Random Gender
    Sleep    1s
    Input Text    ${LoginPageLocators.FIRST_NAME1}    textA
    Input Text    ${LoginPageLocators.LAST_NAME2}    textlast
    Input Text    ${LoginPageLocators.PASSWORD}    ${PASSWORD_CREATE_ACCOUNT} 
    Sleep    1s
    Select Random Date Of Birth  
    Select Checkbox    locator=${LoginPageLocators.SIGN_UP_OUR_NEWSLETTER}
    Sleep    1s
    Click Element    ${LoginPageLocators.REGISTER}
    Sleep    1s
    Element Should Be Visible    ${LoginPageLocators.ACCOUNT_HAS_BEEN_CREATED}


*** Test Cases ***
TC002 Negative Create an account Password Too Short
    [Documentation]   Checks for validation errors when a value less than 5 characters is entered in the password field.
    [Tags]   smoke

    Open Browser To Application    ${BASE_URL}    ${BROWSER}
    Click Element   ${LoginPageLocators.SIGN_IN_BUTTON}
    Sleep    1s
    ${random_email}=    Generate Random Email
    Input Text      ${LoginPageLocators.EMAIL_ADDRESS_CREATE_ACCOUNT}    ${random_email}
    Sleep    1s
    Click Button    ${LoginPageLocators.CREATE_ACCOUNT_BUTTON}
    Sleep    1s
    Location Should Contain    controller=authentication
    Sleep    1s
    Input Text    ${LoginPageLocators.FIRST_NAME1}    textA
    Input Text    ${LoginPageLocators.LAST_NAME2}    textlast
    Input Text    ${LoginPageLocators.PASSWORD}      1234
    Select Random Date Of Birth  
    Select Checkbox    locator=${LoginPageLocators.SIGN_UP_OUR_NEWSLETTER}
    Sleep    1s
    Click Element    ${LoginPageLocators.REGISTER}
    Sleep    1s
    Element Should Be Visible  ${LoginPageLocators.ALERT_ERROR_MESSAGE}
   


    











