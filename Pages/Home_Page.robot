*** Settings ***
Library    SeleniumLibrary
Library    RequestsLibrary
Resource    ../Locators/Home_Page_Elements.robot
Resource    ../Resources/Generals.robot

*** Keywords ***
Hover over Services Link 
    Mouse Over    ${services}
Click Automation Link 
    Click BTN     ${automationLink}
Automation Link is displayed 
    Wait Until Page Contains    ${expectedTitle}
    Title Should Be    ${expectedTitle} 
    Element Should Be Visible    ${automationText}
Verify that text color for services and automation are changed to red 
     Mouse Over      ${services}
    ${colorServices}=    Execute JavaScript    return window.getComputedStyle(document.querySelector("#main-menu ul.level0 > li.level2 > div.wrapper > span")).color;
     Log    ${colorServices}
    Should Be Equal    ${colorServices}    ${expectedcolor}
    ${colorAutomation}=    Execute JavaScript    return window.getComputedStyle(document.querySelector("ul.level0 > li.selected.level2 > div.mega-navbar.level2 > ul.level1 > li.selected > a.subMenuLink")).color;
     Log    ${colorAutomation}
    Should Be Equal    ${colorAutomation}    ${expectedcolor}

Open my Browser 
    [Arguments]    ${my_website}    ${my_driver}    
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${options}    add_argument    ${CHROME_OPTIONS}
    Open Browser    ${my_website}    ${my_driver}    options=${options}
Accept cookies
    ${accept_button_visible}    Run Keyword And Return Status    Element Should Be Visible    ${acceptCookies}
    Run Keyword If    ${accept_button_visible}    Click Element    ${acceptCookies}   


# Validate Country Link
#     [Arguments]    ${url}
#     # Open the URL in a new tab
#     Go To    ${url}
    
#     # Assert the page loaded successfully
#     ${status_code}=    Get Request Status    ${url}
#     Should Be Equal As Numbers    ${status_code}    200
    
#     # Optionally, assert specific content on the page
#     # Page Should Contain Element    <specific element>

#     # Return to the main page if necessary
#     Go Back


Check Country Specific Links
    Create Session    sogeti    https://www.sogeti.com/
    ${response}=    Get    sogeti    /path-to-check
    ${status_code}=    Evaluate    ${response.status_code}
    Should Be Equal As Numbers    ${status_code}    200

User clicks to view all countries 
    Click BTN    ${worldwideDropdown}
Validate Country Specific Sogeti Links
    [Documentation]    This test validates that all country-specific Sogeti links are working.
    # Step 2: Click the Worldwide Dropdown
    
    # Step 3: Retrieve All Country Links
    ${thecountry_links}=    Get WebElements    ${countryLinks}
    # Step 4: Iterate Through Each Country Link and Validate
    FOR    ${link}    IN    @{thecountry_links}
       ${url}=    Get Element Attribute    ${link}    href
       # Step 5: Validate that each country-specific link is working
        Create Session    sogeti    ${url}
        ${response}=    GET On Session    sogeti    ${url}
        Log     ${response.status_code}
        Should Be Equal As Numbers    ${response.status_code}    200
        # Optionally, add a delay to avoid overloading the server with requests
        Sleep    1s

    END