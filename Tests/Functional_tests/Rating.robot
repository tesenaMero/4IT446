*** Settings ***
Documentation  This test suite is veryfing that rating is shown both on product tile and detail
Library		Selenium2Library
Resource	../../Keywords/Main_page_keywords.robot
Resource	../../Keywords/Login_modal_keywords.robot
Suite Setup 		Run keywords  Open czc to the main page
...             AND     Search For  ${testProduct}
Suite Teardown	Close All Browsers


*** Variables ***
${testProduct}  ASUS F556UQ-DM914T, hnědá
${tileRating}  css=span.rating
${detailRating}  css=span.average
${expectedTestProductRating}  60%
${value}
${rateButton}  //a[contains(text(),"Přidat vlastní hodnocení")]
${newReviewForm}  id=new-review-form

*** Test Cases ***
Rating is visible on product tile
    [Documentation]  Verify that rating is visible on product tile
    [Tags]  Rating  smoke
    wait until page contains element  ${tileRating}

Rating is visible on product detail
    [Documentation]  Verify that rating is visible on product detail
    [Tags]  Rating  smoke
    click link  ${testProduct}
    wait until page contains element  ${detailRating}

Rating for test product is as expected
    [Documentation]  Verify that rating shown is equal to expected value
    [Tags]  Rating
    ${value}=  get text  ${detailRating}
    should be equal  ${expectedTestProductRating}  ${value}

Not logged user have to log in for rating
    [Documentation]  Verify that rating is available only for logged users
    [Tags]  Rating
    click element  ${rateButton}
    wait until page does not contain element  ${newReviewForm}
    wait until page contains element  ${logInForm}
    close login modal

Logged user can rate
    [Documentation]  Verify that rating is available for logged users
    [Tags]  Rating
    click element  ${rateButton}
	Login to czc with credentials		${validUserName}	${validPassword}
	wait until page contains element  ${newReviewForm}




