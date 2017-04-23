*** Settings ***
Library		Selenium2Library
Resource	../../Page_objects/czc.robot
Test Setup		Open czc to the main page
Test Teardown	Close All Browsers

*** Variables ***
${productNotFoundWarning}   css=#product-list-container > div.box.info
${productFoundHeader}   css=#product-list-container > div.entry-header > h1
${titleOfFirstFoundProduct}     css=#tiles > div:nth-child(1) > div:nth-child(1) > div.overflow > div.tile-title > h5 > a
${productName}   MSI GP72 7RD-025XCZ Leopard, černá

*** Test Cases ***
Test search for given existing product
    [Tags]  Product     ProductSearch   PositiveSmokeTest
	Search for	${productName}
	Product ${productName} is found and displayed as first product

Test search for not existing product
    [Tags]  Product     ProductSearch
	Search for	'Not existing product name'
	Product not found warning displayed

*** Keywords ***
Product not found warning displayed
	Element Should Be Visible	${productNotFoundWarning}

Product ${productName} is found and displayed as first product
	Element Should Be Visible	${productFoundHeader}
	Element Should Contain    ${productFoundHeader}    Vyhledávání "${productName}"
	Element Should Contain    ${titleOfFirstFoundProduct}    ${productName}
