*** Settings ***
Library		Selenium2Library
Resource	../../Keywords/Main_page_keywords.robot
Test Setup		Open czc to the main page
Test Teardown	Close All Browsers

*** Variables ***
${titleOfFirstCategory}         css=#main-menu > div > div > div > div:nth-child(2) > div.submenu.clearfont.col-3 > div:nth-child(2) > div > h4 > a
${linkToFinalCategory}         /herni-notebooky/produkty
${titleForFinalCategory}       Herní notebooky | CZC.cz
${linkToRootCategory}          /pocitace-a-notebooky/kategorie
${titleForRootCategory}        Kategorie Počítače a notebooky | CZC.cz
${RootCategoryHeader}          css=#main-menu > div > div > div > div:nth-child(2) > div.dep-wrapper.unselectable

*** Keywords ***
Final category displayed
    [Arguments]
    Mouse Over                      ${RootCategoryHeader}
    Wait Until Element Is Visible   ${titleOfFirstCategory}
    Click Element                   ${titleOfFirstCategory}
    Page Should Contain Link        ${linkToFinalCategory}
    Click Link                      ${linkToFinalCategory}
    Title Should Be                 ${titleForFinalCategory}

Return to root category through breadcrumbs
    [Arguments]
    Page Should Contain Link        ${linkToRootCategory}
    Click Link                      ${linkToRootCategory}
    Title Should Be                 ${titleForRootCategory}

*** Test Cases ***
Test for displaying subcategory and returning to the root category via breadcrumbs
    [Documentation]  Firstly open the page to final subcategory, then return to root category via breadcrumbs.

    [Tags]  Category    RootCategory    Breadcrumbs    PositiveSmokeTest
	Final category displayed
    Return to root category through breadcrumbs
