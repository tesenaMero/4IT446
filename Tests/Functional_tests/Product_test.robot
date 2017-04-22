*** Settings ***
Library		Selenium2Library
Resource	../../Keywords/Main_page_keywords.robot
Test Setup		Open czc to the main page
Test Teardown	Close All Browsers

*** Variables ***
${productNotFoundWarning}   css=#product-list-container > div.box.info
${productFoundHeader}   css=#product-list-container > div.entry-header > h1
${titleOfFirstFoundProduct}     css=#tiles > div:nth-child(1) > div:nth-child(1) > div.overflow > div.tile-title > h5 > a
${productName}   MSI GP72 7RD-025XCZ Leopard, černá

*** Keywords ***
Product not found warning displayed
	Element Should Be Visible	${productNotFoundWarning}

Product is found and dispayed as first product
    [Arguments]  ${searchString}
	Element Should Be Visible	${productFoundHeader}
	Element Should Contain    ${productFoundHeader}    Vyhledávání "${searchString}"
	Element Should Contain    ${titleOfFirstFoundProduct}    ${searchString}

*** Test Cases ***
Test search for given existing product
    [Tags]  Product     ProductSearch   PositiveSmokeTest
	Search for	${productName}
	Product is found and dispayed as first product      ${productName}

Test search for not existing product
    [Tags]  Product     ProductSearch
	Search for	'Not existing product name'
	Product not found warning displayed