*** Settings ***
Library    SeleniumLibrary
Resource    ../Locators/Automation_Page_Elements.robot
Resource    ../Resources/Generals.robot

*** Keywords ***
Scroll down to Contact us Form 
    Wait Until Element Is Visible    ${contactusForm}
    Scroll Element Into View    ${contactusForm}
Generate Random Data
    ${faker}=    Evaluate    __import__('faker').Faker()
    ${FIRST_NAME}=    Call Method    ${faker}    first_name
    ${LAST_NAME}=     Call Method    ${faker}    last_name
    ${EMAIL}=         Call Method    ${faker}    email
    ${PHONE}=         Call Method    ${faker}    phone_number
    ${MESSAGE}=       Call Method    ${faker}    text
    ${COMPANY}=       Call Method    ${faker}    company
    Set Suite Variable    ${FIRST_NAME}    ${FIRST_NAME}
    Set Suite Variable    ${LAST_NAME}    ${LAST_NAME}
    Set Suite Variable    ${EMAIL}        ${EMAIL}
    Set Suite Variable    ${PHONE}        ${PHONE}
    Set Suite Variable    ${MESSAGE}      ${MESSAGE}
    Set Suite Variable    ${COMPANY}      ${COMPANY}
Fill Contact Us Form
    Input Text    ${firstnameTextbox}    ${FIRST_NAME}
    Input Text    ${lastNameTextbox}   ${LAST_NAME}
    Input Text    ${emailTextbox}    ${EMAIL}
    Input Text    ${phoneTextbox}    ${PHONE}
    Input Text    ${inputMessage}    ${MESSAGE}    
    Input Text    ${companyTextbox}    ${COMPANY}    
    Select From List By Index     ${countryDropdown}   1  # Select the first country

Check I Agree Checkbox
    Click BTN    ${agreeCheckbox}
Click Submit Button 
    Wait Until Keyword Succeeds    10    5    Click BTN    ${submitButton}
    
Handle CAPTCHA Manually
    # CAPTCHA cannot be automated directly
    # Manual intervention is required to complete the CAPTCHA
    Log    Please complete the CAPTCHA manually within the next 60 seconds.
    Sleep    60
Assert Thank You Message
    ${message}=    Get Text    ${thankyouMessage}
    Should Contain    ${message}    Thank you    