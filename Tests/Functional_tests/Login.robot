*** Settings ***
Resource	../../Page_Objects/Login_modal_objects.robot
Resource	../../Keywords/Main_page_keywords.robot
Resource	../../Keywords/Login_modal_keywords.robot
Resource	../../Settings/Settings.robot
Test Setup		Open czc to the main page
Test Teardown	Close All Browsers

*** Variables ***
${invalidUserName}	faultUsername
${invalidPassword}	faultPassword

*** Test Cases ***
Test login without credentials
    [Documentation]  Test login without credentials, unsuccessful login
    [Tags]  Login
    Open login form
    Click Button	${submitLogin}
	Wait Until Page Contains Element	${errorMessagesUser}

Test login with fault credentials
    [Documentation]  Test login with fault credentials, unsuccessful login
    [Tags]  Login
	Open login form
	Login to czc with credentials		${invalidUserName}	${invalidPassword}
	Wait Until Page Contains Element	${errorMessagesUser}

Test login with fault username and valid password
    [Documentation]  Test login with fault username and valid password, unsuccessful login
    [Tags]  Login
	Open login form
	Login to czc with credentials		${invalidUserName}	${validPassword}
	Wait Until Page Contains Element	${errorMessagesUser}

Test login with valid username and fault password
    [Documentation]  Test login with valid username and fault password, unsuccessful login
    [Tags]  Login
	Open login form
	Login to czc with credentials		${validUserName}	${invalidPassword}
	Wait Until Page Contains Element	${errorMessagesPass}

Test login with valid credentials
    [Documentation]  Test login with valid credentials, successful login
    [Tags]  Login   PositiveSmokeTest
	Open login form
	Login to czc with credentials		${validUserName}	${validPassword}
	wait until page contains element  ${loggedUserNameField}
	wait until element contains  ${loggedUserNameField}  ${validUserName}
	Wait Until Element Is Not Visible	${logInForm}

