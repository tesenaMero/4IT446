*** Keywords ***
Open czc to the main page
	[Arguments]		${url}=${url}	${browser}=${browser}
	Open Browser	${url}	${browser}
	Wait Until Element Is Visible	${mainPage}

Open login form
	Click Link		login
	Wait Until Element Is Visible	${logInForm}

Login to czc with creditals
	[Arguments]		${user}		${pwd}
	Input Text		${userNameField}	${user}
	Input Password	${passwordField}	${pwd}
	Click Button	${submitLogin}