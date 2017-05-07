*** Settings ***
Library		Selenium2Library
Resource	../../Keywords/Main_page_keywords.robot
Test Setup		Open czc to the main page
Test Teardown	Close All Browsers

*** Variables ***
${productFoundHeader}           css=#product-list-container > div.entry-header > h1
${titleOfFirstFoundProduct}     css=#tiles > div:nth-child(1) > div:nth-child(1) > div.overflow > div.tile-title > h5 > a
${productName}                  MSI GP72 7RD-025XCZ Leopard, černá
${linkToProduct}                /msi-gp72-7rd-025xcz-leopard-cerna/204352/produkt
${linkToDiscussion}             /msi-gp72-7rd-025xcz-leopard-cerna/204352/produkt/f0op3df4h6ihsbp3ui4skqli72/diskuse
${discussionTitle}              Komentáře - MSI GP72 7RD-025XCZ Leopard, černá - Diskuze | CZC.cz

*** Keywords ***
Product is found and displayed
    [Arguments]  ${searchString}
	Element Should Be Visible	${productFoundHeader}
    Element Should Contain      ${productFoundHeader}           Vyhledávání     "${searchString}"
	Element Should Contain      ${titleOfFirstFoundProduct}     ${searchString}
	Click Link                  ${linkToProduct}

Discussion opened and checked
    [Arguments]
    Page Should Contain Link    ${linkToDiscussion}
    Click Link                  ${linkToDiscussion}
    Title Should Be             ${discussionTitle}

*** Test Cases ***
Test search for given existing product and then opens discussion for given product
    [Documentation]  Firstly opens given product and then opens the discussion for the given product.

    [Tags]  Discusssion     PositiveSmokeTest
	Search for	                        ${productName}
	Product is found and displayed      ${productName}
    Discussion opened and checked
