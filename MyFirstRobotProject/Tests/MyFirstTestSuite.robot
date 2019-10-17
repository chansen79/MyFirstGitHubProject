*** Settings ***
Library            SeleniumLibrary

Suite Setup        Log    I am inside Test Suite Setup
Suite Teardown     Log    I am inside Test Test Suite Teardown
Test Setup         Log    I am inside Test Setup
Test Teardown      Log    I am inside Test Teardown    

Default Tags       sanity

*** Variables ***
# SCALAR ${variable_name}
${URL}    https://opensource-demo.orangehrmlive.com/ 
# LIST @[variable_name}    item1    item2    ...
@{CREDENTIALS}    Admin             admin123
# DICTIONARY &{variable_name}    Key1=Value1    K2=V2    ...
&{LOGINDATA}      username=Admin    password=admin123
# ENVIRONMENT 
# BUILT-IN

*** Keywords ***
    [Documentation]    LIBRARY    USER
LoginKW
   Input Text        id=txtUsername    @{CREDENTIALS}[0]
   Input Password    id=txtPassword    &{LOGINDATA}[password]    
   Click Button      id=btnLogin   

*** Test Cases ***
MyFirstTest
    [Tags]     smoke
    Log        Hello World...  

MySecondTest
    Set Tags     regression1
    Remove Tags    regression1
    Log        Inside second test
    
MyThirdTest
    Log        Inside thrid test

# FirstSeleniumTest
    # [Documentation]    download and add chromebrowser.exe to the python/script or write the path
  # Open Browser    https:google.com    chrome
  # Set Browser Implicit Wait    5
  # Input Text      name=q              Automation step by step    
  # Press Keys      name=q    ENTER
  # # Click Button    name=btnK    
  # Sleep    2 
  # Close Browser   
  # Log    Test Completed   
  
# SampleLoginTest
    # [Documentation]    This is a sample login test
   # Open Browser      ${URL}/    chrome
   # Set Browser Implicit Wait    5
   # LoginKW
   # Click Element     id=welcome    
   # Click Element     link=Logout 
   # Close Browser   
   # Log               Test Completete    
   # Log               This test was executed by %{username} on %{os}    
   # Ctrl + Shift + / = command out (#) 
