*** Settings ***
Library    RequestsLibrary
Library    Collections
#Test Setup      Create Session        Nasa_Apod        ${base_url} 



*** Variables ***
${base_url}       https://api.nasa.gov
${end_point}       /planetary/apod





*** Test Cases ***
TC001 GET NASA

    [Documentation]       API testi Nasa sitesinden ,api key'i nasa mail adresimizle abone olunca bize gonderiyor
    [Tags]    GET STATUS
    ${PARAMETRE}=       Create Dictionary     api_key=Zpt6PfsjfbrPPIW60jhI9Pr2O7Q9ACB1fxDtIn5e       

    Create Session    Nasa_Apod    ${base_url}
    ${response}=      GET On Session    Nasa_Apod    ${end_point}     ${PARAMETRE}

    Status Should Be    200 
    Log to Console      ${response.json}    #donen cevabi(json) yazdiralim

    

    

   



     
    
    














#TC002 GET FIND PET BY ID 



#TC003 POST ADD A NEW PET TO THE STORE








#TC004 POST UPLOADS AN IMAGE




#TC005 UPDATES A PET IN THE STORE WITH FORM data




#TC006 PUT UPDATE AN EXISTING PET



#TC007 DELETE A PET


