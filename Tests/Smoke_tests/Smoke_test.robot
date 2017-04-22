*** Settings ***
Library		Selenium2Library
Resource	../../Page_Objects/Main_page_objects.robot
Resource	../../Keywords/Tests.robot
Resource	../../Settings/Settings.robot

*** Test Cases ***
Smoke test open czc page
    [Tags]  Smoke
    Open czc to the main page
    Close All Browsers