*** Settings ***
Documentation  This test suite is veryfing that add to basket function is able to put product into basket
Library		Selenium2Library
Resource	../../Keywords/Main_page_keywords.robot
Resource	../../Keywords/Login_modal_keywords.robot
Suite Setup 		Run keywords  Open czc to the main page
...             AND     Search For  ${testProduct}
Suite Teardown	Close All Browsers


*** Variables ***
${testProduct}  ASUS F556UQ-DM914T, hnědá
${addToBasketTileButton}  css=button[title='Přidat zboží do košíku']
${inTheBasketInfo}  css=div#buy-mode-product-info
${inTheBasketProduct}  //div[h1[text()="Zboží jsme vložili do košíku"]]//div[@class="td product-name"]/a
${basketInfoSteady}  css=div#basket-info > a
${basketInfoHover}  css=div#basket-info > a.hover
${basketRemove}  css=i[title="Odstranit z košíku"]
${value}

*** Test Cases ***
Add to basket button is visible on product tile
    [Documentation]  Verify that add to basket is visible on product tile
    [Tags]  BasketAdd  smoke
    wait until page contains element  ${addToBasketTileButton}

Add to basket from tile is possible
    [Documentation]  Verify that add to basket function is available from product tile
    [Tags]  BasketAdd
    [Teardown]  Throw product off the basket
    click element  ${addToBasketTileButton}
    wait until page contains element  ${inTheBasketInfo}
    wait until page contains element  ${inTheBasketProduct}[contains(text(),"${testProduct}")]
    click element  ${modalClose}

Add to basket from detail is possible
    [Documentation]  Verify that add to basket function is available from product detail
    [Tags]  BasketAdd
    [Teardown]  Throw product off the basket
    click link  ${testProduct}
    click element  ${addToBasketTileButton}
    wait until page contains element  ${inTheBasketInfo}
    wait until page contains element  ${inTheBasketProduct}[contains(text(),"${testProduct}")]
    click element  ${modalClose}

*** Keywords ***
Throw product off the basket
    mouse over  ${basketInfoSteady}
    wait until page contains element  ${basketInfoHover}
    click element  ${basketRemove}

