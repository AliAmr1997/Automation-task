*** Settings ***
Library    SeleniumLibrary
Resource    ../Pages_German/Home_Page_German.robot
Resource    ../Pages_German/Automation_Page_German.robot
Variables    ../Resources/TC02.py
Suite Teardown    Sleep    1000

*** Test Cases ***
Scenario: Contact us Form absenden
    Given Benutzer öffnet den Browser    ${myWebsite}    ${myDriver}  
    And Benutzer maximiert das Fenster 
    And Benutzer akzeptiert den cookies
    Given Benutzer Hover über Services-Link
    When Benutzer klickt auf Automation-Link
    Then Automation-Link ist sichtbar

    When Benutzer scrollt zu Kontaktformular
    And Benutzer gibt alle erforderlichen Felder mit Zufallsdaten ein
    And Benutzer klickt auf "I agree" Checkbox
    And Benutzer löst CAPTCHA manuell
    And Benutzer klickt auf "Submit" Button
    Then Benutzer überprüft die "Danke"-Nachricht
