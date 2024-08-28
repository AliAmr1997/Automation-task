*** Variables ***
${my_website}    https://www.sogeti.com/
${services}        css=#main-menu ul.level0 > li.level2 > div.wrapper > span
${expectedTitle}    Automation
${automationLink}    xpath=//a[@class='subMenuLink' and text()='Automation']
${automationText}    xpath=//span[text()='Automation']
${acceptCookies}    //button[@class="acceptCookie"]
${chromeOptions}        --disable-search-engine-choice-screen  --disable-cookies
${expectedcolor}    rgb(255, 48, 76)
${countryLinks}    //div[@id="country-list-id"]/ul/li/a
${worldwideDropdown}    //div[@aria-controls="country-list-id"]
