*** Settings ***
Library		Selenium2Library
Resource	../../Page_Objects/Main_page_objects.robot
Resource	../../Page_Objects/Login_modal_objects.robot
Resource	../../Keywords/Tests.robot
Resource	../../Settings/Settings.robot
Test Setup		Open czc to the main page
Test Teardown	Close All Browsers

*** Variables ***
${invalidUserName}	faultUsername
${invalidPassword}	faultPassword

*** Test Cases ***
Test login without creaditals
    [Tags]  Login
	Open login form
    Click Button	${submitLogin}
	Wait Until Element Is Visible	${errorMessagesUser}

Test login with fault creditals
    [Tags]  Login
	Open login form
	Login to czc with creditals		${invalidUserName}	${invalidPassword}
	Wait Until Element Is Visible	${errorMessagesUser}

Test login with fault username and valid password
    [Tags]  Login
	Open login form
	Login to czc with creditals		${invalidUserName}	${validPassword}
	Wait Until Element Is Visible	${errorMessagesUser}

Test login with valid username and fault password
    [Tags]  Login
	Open login form
	Login to czc with creditals		${validUserName}	${invalidPassword}
	Wait Until Element Is Visible	${errorMessagesPass}

Test login with valid creditals
    [Tags]  Login   PositiveSmokeTest
	Open login form
	Login to czc with creditals		${validUserName}	${validPassword}
	Wait Until Element Is Not Visible	${logInForm}

