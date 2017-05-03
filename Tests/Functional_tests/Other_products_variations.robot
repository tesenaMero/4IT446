*** Settings ***
Documentation    Suite description
Library		Selenium2Library
Resource	../../Keywords/Main_page_keywords.robot
Test Setup		Open czc to the main page
Test Teardown	Close All Browsers

*** Variables ***
${productNotFoundWarning}   css=#product-list-container > div.box.info
${productFoundHeader}   css=#product-list-container > div.entry-header > h1
${titleOfFirstFoundProduct}     css=#tiles > div:nth-child(1) > div:nth-child(1) > div.overflow > div.tile-title > h5 > a
${productPc}   MSI GP72 7RD-025XCZ Leopard, černá
${productYoga}   Lenovo Yoga Tablet 3 8" - 16GB, ANYPEN, černá
${loadedProduct}    css=.data-code:nth-child(1)
${loadedPcCode}    204352
${variantProductUrl}    css=tr:nth-child(1) > td.title.title-variant > a
${OptionPcCode}  205009
${yogaCode}  192356

*** Keywords ***
Product not found warning displayed
	Element Should Be Visible	${productNotFoundWarning}

Product is found and displayed as first product
    [Arguments]  ${searchString}
	Element Should Be Visible	${productFoundHeader}
	Element Should Contain    ${productFoundHeader}    Vyhledávání "${searchString}"
	Element Should Contain    ${titleOfFirstFoundProduct}    ${searchString}

Check For Code
    [Arguments]  ${product}    ${productCode}
    Element Should Contain  ${product}    ${productCode}

Open product from a list
    [Arguments]     ${searchName}   ${code}
    Product is found and displayed as first product  ${searchName}
    Click Element   ${titleOfFirstFoundProduct}
    Element Should Be Visible   ${loadedProduct}
    Check For Code  ${loadedProduct}    ${code}

Get product
    [Arguments]     ${searchName}   ${code}
	Search for	${searchName}
	Open product from a list   ${searchName}    ${code}

Open product option
    [Arguments]     ${url}
    Click Element   ${url}
    Element Should Be Visible   ${loadedProduct}

*** Test Cases ***
Test search for opening the detail of an existing product
    [Tags]  Product     ProductSearch   PositiveSmokeTest   ProductDetail
    Get product  ${productPc}   ${loadedPcCode}

Test search for opening the detail of an existing product's option
    [Tags]  Product     ProductSearch   PositiveSmokeTest   ProductOptionDetail
    Get product  ${productPc}   ${loadedPcCode}
    Open product option  ${variantProductUrl}
    Check For Code  ${loadedProduct}    ${optionPcCode}

Test search for opening a non existing product's option
    [Tags]  Product     ProductSearch   PositiveSmokeTest   ProductOptionFail
    Get product     ${productYoga}     ${yogaCode}
    Element Should Not Be Visible   ${variantProductUrl}