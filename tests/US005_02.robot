*** Settings ***
Library    SeleniumLibrary
Library    BuiltIn

Variables         ../Locators/HomePage.py
Resource          ../Resources/reusable_keywords.robot
Resource          ../Resources/variables.robot
Suite Setup       Open Browser To Application    ${BASE_URL}  

*** Test Cases ***
TC003 Switch Between Multiple Tabs
    [Documentation]   Bu test senaryosu, bir web sayfasindan Facebook ve Twitter linklerine tiklayarak yeni sekmeler acmayi(switch Window) ,
    ...    acilan sekmeler arasinda gecis yapmayi ve sayfa URL dogrulamalarini icerir.

    [Tags]   smoke  


    # İlk sekmeye tıkla ve yeni bir sekme aç
    Click Element     ${LoginPageLocators.FACEBOOK}
    Sleep    2s

    # İkinci sekmeye tıkla ve yeni bir sekme aç
    Click Element     ${LoginPageLocators.TWETTER}
    Sleep    2s

   

    # Tüm sekmelerin handle'larını al
    ${handles}=    Get Window Handles

    # 1. sekmeye geçiş yap (index 0)
    Switch Window   ${handles[0]}
    Sleep    1s

    

    # 2. sekmeye geçiş yap (index 1)
    Switch Window   ${handles[1]}
    Location Should Contain     facebook
    Sleep    1s
    

    # 3. sekmeye geçiş yap (index 2)
    Switch Window   ${handles[2]}
    Location Should Contain    x
    Sleep    1s
    