*** Settings ***
Library    SeleniumLibrary
Library    String
Resource    ../Pages/Home_Page.robot

*** Keywords ***
Benutzer maximiert das Fenster 
    Maximize Browser Window
Benutzer Hover über Services-Link
    Hover over Services Link
Benutzer klickt auf Automation-Link
    Click Automation Link
Automation-Link ist sichtbar
    Automation Link is displayed 
Services und Automation sind ausgewählt
    Verify that text color for services and automation are changed to red
Benutzer öffnet den Browser 
    [Arguments]    ${my_website}    ${my_driver}    
    Open my Browser    ${my_website}    ${my_driver}    

    #Open Browser    ${my_website}    ${my_browser}
Benutzer akzeptiert den cookies
    Accept cookies

Benutzer überprüft, dass die spezifischen Länder-Links funktionieren
    Validate Country Specific Sogeti Links

Benutzer klickt auf Dropdown "Worldwide"
    User clicks to view all countries
