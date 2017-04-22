*** Settings ***
Library		Selenium2Library
Resource	../../Page_Objects/Main_page_objects.robot
Resource	../../Page_Objects/Login_modal_objects.robot
Resource	../../Keywords/Tests.robot
Resource	../../Settings/Settings.robot
Test Setup		Open czc to the main page
Test Teardown	Close All Browsers

*** Variables ***
${searchBar}    id=fulltext
${searchBarSubmitButton}	fulltextSubmit
${productNotFoundWarning}   css=#product-list-container > div.box.info
${productFoundHeader}   css=#product-list-container > div.entry-header > h1
${titleOfFirstFoundProduct}     css=#tiles > div:nth-child(1) > div:nth-child(1) > div.overflow > div.tile-title > h5 > a
${productName}   MSI GP72 7RD-025XCZ Leopard, černá

*** Test Cases ***
Test search for given existing product
    [Tags]  Product     ProductSearch   PositiveSmokeTest
	Input Text		${searchBar}	${productName}
    Click Button	${searchBarSubmitButton}
	Wait Until Element Is Visible	${productFoundHeader}
	Element Should Contain    ${productFoundHeader}    Vyhledávání "${productName}"
	Element Should Contain    ${titleOfFirstFoundProduct}    ${productName}

Test search for not existing product
    [Tags]  Product     ProductSearch
	Input Text		${searchBar}	'Not existing product name'
    Click Button	${searchBarSubmitButton}
	Wait Until Element Is Visible	${productNotFoundWarning}

