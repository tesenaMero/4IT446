*** Settings ***
Library		Selenium2Library
Resource	../Page_Objects/Login_modal_objects.robot

*** Keywords ***

Open login form
    wait until page contains element    id=login
	Click element   id=login
	Wait Until Element Is Visible	${logInForm}

Login to czc with credentials
	[Arguments]		${user}		${pwd}
	Input Text		${userNameField}	${user}
	Input Text	${passwordField}	${pwd}
	Click Button	${submitLogin}

Close login modal
	wait until page contains element  ${modalClose}
	click element  ${modalClose}
	wait until page does not contain element  ${loginform}