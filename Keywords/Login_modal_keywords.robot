*** Settings ***
Resource	../Page_Objects/Login_modal_objects.robot

*** Keywords ***

Open login form
	Click Link		login
	Wait Until Element Is Visible	${logInForm}

Login to czc with creditals
	[Arguments]		${user}		${pwd}
	Input Text		${userNameField}	${user}
	Input Text	${passwordField}	${pwd}
	Click Button	${submitLogin}