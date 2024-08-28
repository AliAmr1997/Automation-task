## Prerequisites

Make sure you have the following software installed:

- **Python 3.x**: [Download and install Python](https://www.python.org/downloads/).
- **Robot Framework**: [Install Robot Framework](https://robotframework.org/).
- **Google Chrome**: Latest stable version installed.
- **ChromeDriver**: ChromeDriver executable that matches the version of Google Chrome installed on your machine.

### Setting Up ChromeDriver

1. **Download ChromeDriver**:
   - Go to the [ChromeDriver Downloads page](https://sites.google.com/chromium.org/driver/).
   - Download the ChromeDriver version that matches the version of your installed Chrome browser.  
     To find your Chrome version:
     - Open Chrome.
     - Go to `Settings > About Chrome`.
     - Note the version number.

2. **Install ChromeDriver**:
   - Extract the downloaded `chromedriver` file.
   - Place the `chromedriver.exe` (or the equivalent executable for your OS) in a directory of your choice.

3. **Add ChromeDriver to System PATH**:
   - **Windows**:
     - Right-click on "This PC" or "My Computer" and select "Properties".
     - Click on "Advanced system settings".
     - Click on "Environment Variables".
     - Find the "Path" variable in the "System variables" section and click "Edit".
     - Add the directory path where `chromedriver.exe` is located, and click "OK".
   - **macOS/Linux**:
     - Open a terminal.
     - Run: `sudo nano /etc/paths`.
     - Add the path to the directory where `chromedriver` is located.
     - Save and close the file.

4. **Verify ChromeDriver Installation**:
   - Open a terminal or command prompt.
   - Run: `chromedriver --version`.
   - You should see the version of ChromeDriver displayed. Make sure it matches your Chrome browser version.

### Running the Tests

To run the tests, follow these steps:

1. **Clone the Repository**:
    ```bash
    git clone https://github.com/AliAmr1997/Automation-task.git
    ```

2. **Install Dependencies**:
    ```bash
    pip install -r requirements.txt
    ```

3. **Known Limitations and Manual Interventions**

### CAPTCHA Handling

**Test Case 2: Automation of the Sogeti Contact Form**

- **Step Involving CAPTCHA**:
  - After filling in the contact form on the Sogeti Automation page, a CAPTCHA challenge may appear before the form submission.
  - CAPTCHAs are designed to block automated scripts, making them difficult to bypass programmatically without violating the purpose of the CAPTCHA.

- **Automation Workaround**:
  - The automation script will fill out the form and then wait for up to 60 seconds to allow the user to manually complete the CAPTCHA.
  - During this time, the script pauses execution, giving you enough time to solve the CAPTCHA manually.

- **How the Script Proceeds**:
  - Once the CAPTCHA is solved and the 60 seconds is through, then Automation proceeds, clicking the "SUBMIT" button and checking for the "Thank you" message that confirms the form submission.

- **Notes**:
  - Ensure you are present to solve the CAPTCHA when running this test case.
  - The script is designed to wait for 60 seconds, but you can adjust this timing if needed in the code.

4. **Run Robot Framework Tests**:
    ```bash
    cd .\Testcases\
    robot TC01.robot
    robot TC02.robot
    robot TC03.robot
    ```

5. **Run Python API Tests**:
    ```bash
    cd Testcases
    python test_basic_api.py
    python test_api_data_driven.py
    ```

## Troubleshooting

- If you encounter issues with ChromeDriver, make sure the version matches your Chrome browser and that the executable is in your system PATH.
- For any browser compatibility issues, check the [ChromeDriver Documentation](https://sites.google.com/chromium.org/driver/).
