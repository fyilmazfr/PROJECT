*** Settings ***
Library    RequestsLibrary
Library    Collections



*** Variables ***
${base_url}    https://petstore.swagger.io
${ENDPOINT}    /v2/pet

${PET_BODY}             
...    {
...        "id": 0,
...        "category": {
...            "id": 0,
...            "name": "string"
...        },
...        "name": "doggie",
...        "photoUrls": ["string"],
...        "tags": [
...            {
...                "id": 0,
...                "name": "string"
...            }
...        ],
...        "status": "available"
...    }



*** Test Cases ***
TC001 Post Requests 
    [Documentation]    Test to create a new post using POST request,yeni kayit yapacagiz
    [Tags]    Post_YeniKayit

    Create Session    YeniKayit    ${base_url}       
    ${headers}=    Create Dictionary    Content-Type=application/json    accept=application/json

    ${response}=     POST On Session  YeniKayit   ${ENDPOINT}   data=${PET_BODY}  headers=${headers}     
                                                                #data=<gönderilecek veri>    headers=<başlıklar>
      
  


     

    #validations
    Should Be Equal As Strings    ${response.status_code}    200

    

      



