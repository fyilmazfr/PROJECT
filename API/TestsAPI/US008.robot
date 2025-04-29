*** Settings ***
Library   RequestsLibrary



*** Variables ***
${BASE_URL}=    https://restful-booker.herokuapp.com



*** Test Cases ***
TC001 - Create Booking
     [Documentation]   Bu test yeni bir rezervasyon kaydi olusturur Post ile
     [Tags]   createBooking

     
     ${ENDPOINT}=    Set Variable      /booking

     #inner body olusturmamiza ihtiyac var body icin
     ${bookingdates}=     Create Dictionary   checkin=2023-10-01   checkout=2023-10-10

     ${Body}=      Create Dictionary
     ...    firstname=Yusuf
     ...    lastname=AY
     ...    totalprice=1000
     ...    depositpaid=true
     ...    bookingdates=${bookingdates}
     ...    additionalneeds=Breakfast
     

     Create Session    createBooking          ${BASE_URL}     headers=
     ${response}=      POST On Session    createBooking    ${ENDPOINT}    json=${Body}   #json ile tanimladik ,data ile tanimlarsak sana list gonderiyorum diyoruz   data={body} dersek sana ham veri gonderiyorum demektir


     Status Should Be    200

     #response'un icine girerek array'ler ile yazdirabiliriz
     ${checkIn}    Set Variable        ${response.json()}[booking][bookingdates][checkin]   #ilk booking array'i, ikinci booking array'i, ucuncu checkin array'i
     Log To Console    message: ${checkIn}   #Log to console ile yazdiriyoruz

    