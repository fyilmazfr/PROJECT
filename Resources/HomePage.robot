#Bu testsuitini daha sonra silebiliriz deneme amacli yaptim

*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${BROWSER}    Chrome
${url}    http://www.automationpractice.pl/index.php



*** Test Cases ***
Open Automation Practice Website
    [Documentation]    Open the website and verify the page title.
    Open Browser    ${url}    ${BROWSER}
    
    Close Browser