*** Settings ***
Library		Selenium2Library
Resource	../../Keywords/Main_page_keywords.robot
Resource	../../Settings/Settings.robot
Test Setup		Open czc to the main page
Test Teardown	Close All Browsers

*** Variables ***
${termsOfUseLink}       css=#footer-links > div.footer-links-container > div.links-block-container > div:nth-child(2) > ul > li:nth-child(1) > a
${termsOfUseContent}    css=#docs-internal-guid-e40922b1-e43e-f867-b22a-0e2a2f35977e

*** Test Cases ***
Test open terms & conditions page
    [Documentation]  Checks if Terms & Conditions link is visible a leads to appropriate page.
    [Tags]    Conditions    TermsAndConditions
    Element Should Be Visible   ${termsOfUseLink}
    Click Element   ${termsOfUseLink}
    Element Should Be Visible   ${termsOfUseContent}