*** Settings ***
Library           SeleniumLibrary
Resource          ../Resources/variables.robot
Resource          ../Resources/reusable_keywords.robot





*** Test Cases ***
TC001 Open Automation Practice Website
    [Documentation]    Open the website and verify the page title.
    Open Browser To Application    ${BASE_URL}    ${BROWSER}
    
    

     

    

