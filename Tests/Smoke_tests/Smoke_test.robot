*** Settings ***
Library		Selenium2Library
Resource	../../Keywords/Main_page_keywords.robot

*** Test Cases ***
Smoke test open czc page
    [Tags]  Smoke
    Open czc to the main page
    Close All Browsers