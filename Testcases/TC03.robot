*** Settings ***
Library    SeleniumLibrary
Resource    ../Pages_German/Home_Page_German.robot
Resource    ../Pages_German/Automation_Page_German.robot
Variables    ../Resources/TC03.py
Suite Teardown    Sleep    1000

*** Test Cases ***
Scenario: Überprüfen, dass alle länderspezifischen Sogeti-Links funktionieren
    Given Benutzer öffnet den Browser    ${myWebsite}    ${myDriver}  
    And Benutzer maximiert das Fenster 
    And Benutzer akzeptiert den cookies
    When Benutzer klickt auf Dropdown "Worldwide"
    Then Benutzer überprüft, dass die spezifischen Länder-Links funktionieren