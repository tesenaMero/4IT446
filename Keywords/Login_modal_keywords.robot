*** Settings ***
Resource	../Page_Objects/Login_modal_objects.robot

*** Keywords ***

Open login form
	Click Link		login
	Wait Until Element Is Visible	${logInForm}

Login to czc with creditals
	[Arguments]		${user}		${pwd}
	Input Text		${userNameField}	${user}
	Sleep   5
	Input Text	${passwordField}	${pwd}
	Sleep   5
	Click Button	${submitLogin}