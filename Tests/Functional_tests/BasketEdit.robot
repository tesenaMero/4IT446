*** Settings ***
Library		Selenium2Library
Library     BuiltIn
Resource	../../Keywords/Main_page_keywords.robot
Test Setup		Open czc to the main page
Test Teardown	Close All Browsers

*** Variables ***
${productFoundHeader}           css=#product-list-container > div.entry-header > h1
${titleOfFirstFoundProduct}     css=#tiles > div:nth-child(1) > div:nth-child(1) > div.overflow > div.tile-title > h5 > a
${productName}                  Clean IT stlačený plyn 400ml
${addProductToBasketButton}     css=#tiles > div:nth-child(1) > div:nth-child(1) > div.overflow > div.price-wrapper > button
${showBasketButton}             css=#popup-buy-mode > div > div.buttons > a
${ProductAddedPopup}            css=#popup-buy-mode > div
${basketPageTitle}              Košík | CZC.cz
${removeProductFromBasket}      css=a.ico-circle-delete.btn-remove
${emptyBasketHeader}            css=#basket-visibility-container > div > div > h1
${addAmountButton}              css=a.up
${actualAmountId}                 id=frm-quantity
${actualAmount}

*** Keywords ***
Product is found and displayed
    [Arguments]  ${searchString}
	Element Should Be Visible	     ${productFoundHeader}
    Element Should Contain           ${productFoundHeader}           Vyhledávání     "${searchString}"
	Element Should Contain           ${titleOfFirstFoundProduct}     ${searchString}

Product added to basket and basket opened
    [Arguments]
    Click Button                     ${addProductToBasketButton}
    Wait Until Element Is Visible    ${ProductAddedPopup}
    Element Should Be Visible        ${ProductAddedPopup}
    Click Element                    ${showBasketButton}

Product removed from the basket
    [Arguments]
    Title Should Be                  ${basketPageTitle}
    Wait Until Element Is Visible    ${removeProductFromBasket}
    Click Element                    ${removeProductFromBasket}
    Wait until Element Is Visible    ${emptyBasketHeader}
    Element Should Contain           ${emptyBasketHeader}            Váš nákupní košík je prázdný.

Amount of product changed
    [Arguments]
    Title Should Be                  ${basketPageTitle}
    Wait Until Element Is Visible    ${addAmountButton}
    Click Element                    ${addAmountButton}
    ${actualAmount} =                GetValue                         ${actualAmountId}
    Should Be Equal As Integers      2  ${actualAmount}

*** Test Cases ***
Test adds given product to basket and then removes it from basket
    [Documentation]  Adds given product to basket and then removes it from the basket.

    [Tags]  Basket  BasketRemoval   PositiveSmokeTest
	Search for	                        ${productName}
	Product is found and displayed      ${productName}
    Product added to basket and basket opened
    Product removed from the basket

Test adds given product to basket and then changes the amount of the product in the basket
    [Documentation]  Firstly open given product and then open the discussion for the given product.

    [Tags]  Basket  ProductAmount   PositiveSmokeTest
    Search for	                        ${productName}
    Product is found and displayed      ${productName}
    Product added to basket and basket opened
    Amount of product changed
