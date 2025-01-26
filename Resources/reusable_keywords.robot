
*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Open Browser To Application
    [Arguments]    ${url}    ${browser}=chrome
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Set Selenium Speed    0.5

Close Browser
    Close All Browsers