** Settings
Documentation     TOKEN alacagiz ve  aldigimiz token'i kullanacagiz
Library    RequestsLibrary





*** Variables
${BASE_URL}=    https://restful-booker.herokuapp.com
${HEADERS}=     Content-Type=application/json   




*** Test Cases ***
TC001 Get token
    Create token






*** Keywords ***
Create token
    ${ENDPOINT}=     Set Variable      /auth  #variable atayalim, burda yada yukarda 


    ${BODY}=    Create Dictionary     username=admin     password=password123
    
    
    Create Session    createTokenAL      ${BASE_URL}     headers={Content-Type: application/json}
    ${response}=      POST On Session    createTokenAL    ${ENDPOINT}         json=${BODY}

    Status Should Be    200









