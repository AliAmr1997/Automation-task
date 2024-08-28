*** Settings ***
Library    SeleniumLibrary
Resource    ../Pages/Automation_Page.robot


*** Keywords ***
Benutzer scrollt zu Kontaktformular
    Scroll down to Contact us Form
Benutzer gibt alle erforderlichen Felder mit Zufallsdaten ein
    Generate Random Data
    Fill Contact Us Form
Benutzer klickt auf "I agree" Checkbox
    Check I Agree Checkbox
Benutzer klickt auf "Submit" Button
     Click Submit Button
Benutzer löst CAPTCHA manuell
    Handle CAPTCHA Manually
    
Benutzer überprüft die "Danke"-Nachricht
    Assert Thank You Message
