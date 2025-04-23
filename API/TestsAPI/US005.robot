#kompleks bir  json ornegini almak ve validations yapmak

*** Settings ***
Library           RequestsLibrary
Library    JSONLibrary




*** Variables ***
${BASE_URL}    https://restcountries.com
${ENDPOINT}    /v3.1/name/deutschland



*** Test Cases ***
Get_countryInfo
    Create Session    ulkeIsim    ${BASE_URL}
    ${response}=    GET On Session    ulkeIsim    ${ENDPOINT}
    ${json_obj}=    Set Variable    ${response.json()}

    ${country_name_0}=    Get Value From Json    ${json_obj}    $[0].name.common
    #Log To Console    message: ${json_obj}

    Log To Console    First country: ${country_name_0}
    
    


    
