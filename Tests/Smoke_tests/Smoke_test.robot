*** Settings ***
Library		Selenium2Library
Resource	../../Page_objects/czc.robot

*** Test Cases ***
Smoke test open czc page
    [Tags]  Smoke
    Open czc to the main page
    Close All Browsers