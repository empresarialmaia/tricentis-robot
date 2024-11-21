*** Settings ***

Documentation    Automação preenchimento formulário / Automóvél

Resource    ../resources/Base.resource

Test Setup       Iniciar testes
Test Teardown    Encerrar testes

*** Variables ***

###Enter Vechicle Data
${Make}                  BMW
${Engine_Performance}    2000   
${Date_of_Manufacture}   10/03/2024
${Number_of_Seats}       2   
${Fuel_Type}             Petrol         
${List_Price}            33000
${License_Plate_Number}  33
${Annual_Mileage}        3333

###Enter Insurant Data
${First_Name}            Eduardo
${Last_Name}             Maia
${Date_of_Birth}         07/19/1986
${Gender}                Male
${Street_Address}        Rua teste
${Country}               Brazil
${Zip_Code}              04300000
${City}                  São Paulo
${Occupation}            Employee
${Hobbies}               Skydiving
${Website}               www.teste.com.br

###Enter Product Data
${Start_Date}            10/20/2025
${Insurance_Sum}          3.000.000,00 
${Merit_Rating}          Super Bonus 
${Damage_Insurance}      Full Coverage
${Optional_Products}     Legal Defense Insurance 
${Courtesy_Car}          Yes   

###Select Price Option
${Select_Price}          Ultimate   

###Send Quote
${E-Mail}                testedoteste@gmail.com
${Phone}                 11999994444 
${Username}              TesteQA 
${Password}              Teste@123 
${Confirm_Password}      Teste@123 
${Comments}              "Tudo posso naquele que me fortalece." 


*** Test Cases ***
Preencher formulário solicitação seguro Automóvel
    Validação texto home    
    ...    Welcome Aboard!

    Acesso ao menu Automobile
    Validação texto primeira parte do formulário
    ...    Make   
   
    Preenchimento primeira parte do formulário      
    ...    ${Make}    
    ...    ${Engine_Performance}     
    ...    ${Date_of_Manufacture}
    ...    ${Number_of_Seats}
    ...    ${Fuel_Type}
    ...    ${List_Price} 
    ...    ${License_Plate_Number}
    ...    ${Annual_Mileage}         
       
    Validação texto segunda parte do formulário    
    ...    First Name
  
    Preenchimento segunda parte do formulário    
    ...    ${First_Name}    
    ...    ${Last_Name}
    ...    ${Date_of_Birth}
    ...    ${Gender}
    ...    ${Street_Address}
    ...    ${Country}
    ...    ${Zip_Code}
    ...    ${City}
    ...    ${Occupation}
    ...    ${Hobbies}
    ...    ${Website} 
      
    Validação texto terceira parte do formulário 
    ...    Start Date
    
    Preenchimento terceira parte do formulário 
    ...    ${Start_Date}
    ...    ${Insurance_Sum}
    ...    ${Merit_Rating}
    ...    ${Damage_Insurance}
    ...    ${Optional_Products}
    ...    ${Courtesy_Car} 
       
    Validação texto quarta parte do formulário      
    ...    Select Option	
    
    Preenchimento quarta parte selecionar preço    
    ...    ${Select_Price}     
    
    Validação texto quinta parte do formulário 
    ...     E-Mail 
    
    Preenchimento quinta parte do formulário 
    ...    ${E-Mail}
    ...    ${Phone}
    ...    ${Username}
    ...    ${Password}
    ...    ${Confirm_Password}
    ...    ${Comments}   
         
    Validação do texto de envio e do formulário    
    ...    Sending e-mail success!
        

     
     





    