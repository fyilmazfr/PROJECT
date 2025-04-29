#bir get sorgusu

*** Settings ***
Library   RequestsLibrary


*** Variables **
${BASE_URL}=    https://restful-booker.herokuapp.com


*** Test Cases **
Get Booking Ids
    [Documentation]   Bu test tum rezervasyon kayitlarinin id'lerini getirir

    ${ENDPOINT}=    Set Variable      /booking 

    Create Session    getBookingIds     ${BASE_URL}     
    ${response}=     GET On Session    getBookingIds    ${ENDPOINT}

    Status Should Be      200

    #{response.json()}      butun donen body'i bise verir veya yazdirir, ayrinti istersek icine girmemiz lazim
    #Log To Console         ${response.json()}
    #Log To Console         ${response.headers}   #tum headers'i bize verir

    #eger istersek headers'in icindeki ayrintilari alabilir ve validation yapabiliriz
     ${content-type}       Set Variable        ${response.headers['Content-Type']}
     Should Be Equal          application/json; charset=utf-8          ${content-type}   #content-type'i kontrol ettik



Get Booking
    
        [Documentation]   Bu test bir rezervasyon kaydini getirir
    
        ${ENDPOINT}=    Set Variable      /booking/1 
    
        Create Session    getBooking     ${BASE_URL}     
        ${response}=     GET On Session    getBooking    ${ENDPOINT}
    
        Status Should Be      200

        Log To Console     ${response.json()}
    
        
    
