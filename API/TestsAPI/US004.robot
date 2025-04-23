#json,jsonARRAY,key-value,
#https://jsonpath.com/   #$.phoneNumbers[:1].type( syntax sekli bu sekilde yazilarak json objelerini kontrol edebiliriz)
#pc'de olusturacagimiz bir json metin belgesiyle donen cevaplari buraya kaydedebilir ve LOAD JSON FROM FILE ile okuyabiliriz. validetion yapabiliriz

*** Settings ***
Library           RequestsLibrary
Library           Collections
Library    JSONLibrary
Library    OperatingSystem


*** Variables ***


*** Test Cases ***
TC001 json file
    #File Should Exist            "C:\Users\fthyl\OneDrive\Belgeler\API_json ornegi\user_data.json"
    ${json_obj}=        Load Json From File        C:\Users\fthyl\OneDrive\Belgeler\API_json ornegi\user_data.json
    ${name_value}=      Get Value From Json    ${json_obj}    $.user.name
    Should Be Equal    ${name_value[0]}    John Doe

