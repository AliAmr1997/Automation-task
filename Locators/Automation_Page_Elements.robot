*** Variables ***
${my_website}    https://www.sogeti.com/
${services}        css=#main-menu ul.level0 > li.level2 > div.wrapper > span
${contactusForm}    //h2[@class="Form__Title"]
${firstnameTextbox}    //label[text()="First Name"]/following::input[1]
${lastNameTextbox}    //label[text()="Last Name"]/following::input[1]
${emailTextbox}    //label[text()="Email"]/following::input[1]
${phoneTextbox}    //label[text()="Phone"]/following::input[1]
${companyTextbox}    //label[text()="Company"]/following::input[1]
${countryDropdown}    //label[text()="Country"]/following::select[1]
${agreeCheckbox}    //label[text()="I agree"]
${submitButton}    //button[contains(text(), 'Submit')]
${inputMessage}    //label[text()='Message']/following::textarea[1]
${thankyouMessage}    //p[text()='Thank you for contacting us.']
