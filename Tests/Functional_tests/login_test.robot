*** Settings ***
Library		Selenium2Library
Resource	../../Page_Objects/Main_page_objects.robot
Resource	../../Page_Objects/Login_modal_objects.robot
Resource	../../Keywords/Tests.robot
Resource	../../Settings/Settings.robot
Test Setup		Open Czc To The Main Page	${url}	${browser}
Test Teardown	Close All Browsers

*** Variables ***
${invalidUserName}	faultUsername
${invalidPassword}	faultPassword
${validUserName}	dd
${validPassword}	dd

*** Test Cases ***
LoginTest_Empty
	Click Link		login
    Wait Until Element Is Visible	${logInForm}
    Click Button	${loginButton}
	Wait Until Element Is Visible	${errorMessagesUser}

LoginTest_FaultUserAndPass
	Login To Czc		${invalidUserName}	${invalidPassword}
	Wait Until Element Is Visible	${errorMessagesUser}

LoginTest_FaultUser
	Login To Czc		${invalidUserName}	${validPassword}
	Wait Until Element Is Visible	${errorMessagesUser}

LoginTest_FaultPass
	Login To Czc		${validUserName}	${invalidPassword}
	Wait Until Element Is Visible	${errorMessagesPass}

LoginTest_Success
	Login To Czc		${validUserName}	${validPassword}
	Wait Until Element Is Not Visible	${logInForm}

