*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Click BTN 
    [Arguments]    ${locator}    
    Wait Until Element Is Visible    ${locator}
    Scroll Element Into View    ${locator}
    Click Element    ${locator} 
User selects element from dropdown   
    [Arguments]    ${dropdown_id}    ${Element}
    Wait Until Element Is Visible    ${dropdown_id}
    Select From List By Label    ${dropdown_id}    ${Element}