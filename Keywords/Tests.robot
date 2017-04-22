*** Keywords ***
Open Czc To The Main Page
	[Arguments]		${url}	${browser}
	Open Browser	${url}	${browser}
	Wait Until Element Is Visible	${mainPage}

Login To Czc
	[Arguments]		${user}		${pwd}
	Click Link		login
	Wait Until Element Is Visible	${logInForm}
	Input Text		${userNameField}	${user}
	Input Password	${passwordField}	${pwd}
	Click Button	${loginButton}