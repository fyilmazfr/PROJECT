*** Settings ***
Library           RequestsLibrary
Library    Collections     #json objelerini cevirmek icin ideal eklenmeli





*** Variables ***
${base_url}       https://petstore.swagger.io



*** Test Cases ***
Get_Pet By ID
    Create Session    demoqa    ${base_url}                             #1.adim
    ${response}=   GET On Session     demoqa     /v2/pet/123       

    Should Be Equal As Strings    ${response.status_code}    200        #2
    
    ${body}=   Convert To String    ${response.content}                 #3
    Should Contain    ${body}    category

    ${contentTypeValue}      Get From Dictionary       ${response.headers}    Content-Type     # 4    #key ve value degeri burda var bu yuzden dictinary kullaniriz
    Should Be Equal As Strings    ${contentTypeValue}    application/json
