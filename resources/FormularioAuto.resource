*** Settings ***

Documentation    Automação preenchimento formulário / Automóvél

Library    Browser

*** Keywords ***

Validação texto home
    [Arguments]    ${Texto_validacao}

    Wait For Elements State    xpath=//h2[contains(text(),'Welcome Aboard!')]    visible    5
    Get Text                   xpath=//h2[contains(text(),'Welcome Aboard!')]    equal    ${Texto_validacao}

Acesso ao menu Automobile    
    Wait For Elements State    xpath=(//a[contains(@id,'automobile')])[1]    visible    5
    Click                      xpath=(//a[contains(@id,'automobile')])[1]   

Validação texto primeira parte do formulário
    [Arguments]    ${Texto_primeira_parte}

    Wait For Elements State    xpath=//label[contains(.,'Make')]    visible    5
    Get Text                   xpath=//label[contains(.,'Make')]    equal    ${Texto_primeira_parte}


    #Primeira parte do formulário
Preenchimento primeira parte do formulário       
    [Arguments]    ${Make}    ${Performance}    ${Date_of_Manufacture}    ${Number_of_Seats}    ${Fuel_Type}
    ...            ${List_Price}    ${License_Plate_Number}    ${Annual_Mileage}
    
    Select Options By          id=make                                      text       ${Make} 
    Fill Text                  id=engineperformance                                    ${Performance }      
    
    Fill Text                  css=input[id=dateofmanufacture]                         ${Date_of_Manufacture}   

    Select Options By          id=numberofseats                             text       ${Number_of_Seats} 

    Select Options By          id=fuel                                      text       ${Fuel_Type}

    Fill Text                  id=listprice                                            ${List_Price} 

    Fill Text                  id=licenseplatenumber                                   ${License_Plate_Number}  
    
    Fill Text                  id=annualmileage                                        ${Annual_Mileage}    

    
    Click                      id=nextenterinsurantdata

   
Validação texto segunda parte do formulário
    [Arguments]    ${Texto_segunda_parte}

    Wait For Elements State    xpath=//label[contains(.,'First Name')]    visible    5
    Get Text                   xpath=//label[contains(.,'First Name')]    equal     ${Texto_segunda_parte}
   
        
    #Segunda parte do formulário
Preenchimento segunda parte do formulário
   [Arguments]    ${First_Name}    ${Last_Name}    ${birthdate}    ${Gender}    ${Street_Address}      
   ...            ${Country}    ${Zip_Code}    ${City}    ${Occupation}    ${Hobbies}    ${Website} 
       
   
    Fill Text                   id=firstname                                          ${First_Name}  

    Fill Text                   id=lastname                                           ${Last_Name}  

    Fill Text                   id=birthdate                                          ${Birthdate} 
    
    Run Keyword If    '${Gender}' == 'Male'    Click    xpath=//label[@class='ideal-radiocheck-label'][contains(.,'Male')]
    ...    ELSE                                Click    xpath=//label[@class='ideal-radiocheck-label'][contains(.,'Female')]
       
    Fill Text                   id=streetaddress                                      ${Street_Address}   
    
          
    Select Options By           id=country                                      text  ${country} 

    Fill Text                   id=zipcode                                            ${Zip_Code} 
    
    Fill Text                   id=city                                               ${city}    

    Select Options By           id=occupation                                   text  ${occupation} 

    Run Keyword If    '${Hobbies}' in ['Speeding', 'Bungee Jumping', 'Cliff Diving','Skydiving','Other']    
...          Click    xpath=//label[contains(.,'${Hobbies}')]
     
  
    Fill Text                    id=website                                        ${Website}    
    
    Click                        id=nextenterproductdata

Validação texto terceira parte do formulário
    [Arguments]    ${Texto_terceira_parte}

    Wait For Elements State    xpath=//label[contains(.,'Start Date')]    visible    5
    Get Text                   xpath=//label[contains(.,'Start Date')]    equal    ${Texto_terceira_parte}
    
    #Terceira parte do formulário
Preenchimento terceira parte do formulário
    [Arguments]    ${Start Date}    ${Insurance Sum}    ${Merit_Rating}     ${Magein_surance}    ${Optional_Products}    ${Courtesy_car}
   
    Fill Text                    id=startdate           ${Start Date} 

    Select Options By            id=insurancesum        text    ${Insurance Sum}        
        
    Select Options By            id=meritrating         text    ${Merit_Rating} 

    Select Options By            id=damageinsurance     text    ${Magein_surance}

    Run Keyword If    '${Optional_Products}' == 'Euro Protection'    Click    xpath=//label[@class='ideal-radiocheck-label'][contains(.,'Euro Protection')]
    ...    ELSE                                                      Click    xpath=//label[@class='ideal-radiocheck-label'][contains(.,'Legal Defense Insurance')]

    Select Options By            id=courtesycar    text     ${Courtesy_car}  

    Click                        id=nextselectpriceoption

Validação texto quarta parte do formulário
    [Arguments]    ${Select_Option}    

    Wait For Elements State    xpath=//th[contains(.,'Select Option')]    visible    5
    Get Text                   xpath=//th[contains(.,'Select Option')]    equal    ${Select_Option}    

    #Quarta parte do formulário
Preenchimento quarta parte selecionar preço
    [Arguments]    ${Price}    

    Run Keyword If        '${Price}' == 'Silver'         Click    xpath=//label[contains(@class,'choosePrice ideal-radiocheck-label')][1]
...    ELSE IF            '${Price}' == 'Gold'           Click    xpath=//label[contains(@class,'choosePrice ideal-radiocheck-label')][2]
...    ELSE IF            '${Price}' == 'Platinum'       Click    xpath=//label[contains(@class,'choosePrice ideal-radiocheck-label')][3]  
...    ELSE                                              Click    xpath=//label[contains(@class,'choosePrice ideal-radiocheck-label')][4]
            
    Click    id=nextsendquote

Validação texto quinta parte do formulário
    [Arguments]    ${Email}

    Wait For Elements State    xpath=//div[contains(@class,'field idealforms-field idealforms-field-email')]    visible    5
    Get Text                   xpath=//div[contains(@class,'field idealforms-field idealforms-field-email')]    equal    ${Email}    

    #Quinta parte do formulário
Preenchimento quinta parte do formulário
    [Arguments]    ${E-Mail}    ${Phone}    ${Username}    ${Password}    ${Confirm_Password}    ${Comments}
    Fill Text                  id=email         ${E-Mail} 

    Fill Text                  id=phone         ${Phone} 

    Fill Text                  id=username    ${Username} 

    Fill Text                  id=password    ${Password}

    Fill Text                  id=confirmpassword    ${Confirm_Password}

    Fill Text                  id=Comments          ${Comments} 

    Click                      id=sendemail

Validação do texto de envio e do formulário
    [Arguments]    ${texto_Sucess}

    Wait For Elements State    xpath=//h2[contains(text(),'Sending e-mail success!')]    visible    10 
    Get Text    xpath=//h2[contains(text(),'Sending e-mail success!')]            equal    ${texto_Sucess}  

    Click       xpath=//div[@class='sa-confirm-button-container']     


   

