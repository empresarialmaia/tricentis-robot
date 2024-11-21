*** Settings ***

Documentation    Base preenchimento formulário

Resource    ../resources/FormularioAuto.resource

 
*** Keywords ***

Iniciar testes    
    New Browser    chromium    headless=False    
    New Page       https://sampleapp.tricentis.com/101/index.php           

Encerrar testes   
    Take Screenshot
    Close Browser 





