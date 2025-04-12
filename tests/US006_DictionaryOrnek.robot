*** Settings ***
Library    Collections

*** Variables ***
&{USER}    name=Fatih    role=QA Tester    age=35

*** Test Cases ***
Dictionary Kullanimi Ornegi
    Log    Kullanici adi: ${USER["name"]}
    Log    Rolu: ${USER["role"]}
    Log    Yasi: ${USER["age"]}

    # Bir anahtarın olup olmadığını kontrol et
    Dictionary Should Contain Key    ${USER}    name

    # Yeni bir anahtar ekle
    Set To Dictionary    ${USER}    city=Paris
    Log    Sehrin adi: ${USER["city"]}

    # Tüm sözlüğü yazdır
    Log Dictionary    ${USER}
