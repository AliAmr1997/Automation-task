*** Settings ***
Library    SeleniumLibrary
Resource    ../Pages_German/Home_Page_German.robot
Variables    ../Resources/TC01.py
Suite Teardown    Sleep    1000

*** Test Cases ***
Scenario: Validierung der Services und des Automation-Links
    Given Benutzer öffnet den Browser    ${myWebsite}    ${myDriver}  
    And Benutzer maximiert das Fenster 
    And Benutzer akzeptiert den cookies
    Given Benutzer Hover über Services-Link
    When Benutzer klickt auf Automation-Link
    Then Automation-Link ist sichtbar
    And Services und Automation sind ausgewählt
