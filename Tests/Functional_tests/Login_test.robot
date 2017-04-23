*** Settings ***
Library		Selenium2Library
Resource	../../Page_Objects/czc.robot

Test Setup		Open czc to the main page
Test Teardown	Close All Browsers


*** Test Cases ***
Test login without credentials
    [Tags]  Login
	Click login
	Login modal is opened
    Submit login
	wait until page contains element  	${errorMessagesUser}
    wait until page contains element  	${errorMessagesPass}

Test login with fault credentials
    [Tags]  Login
	Click login
    Login modal is opened
	Fill username  ${invalidUserName}
	Fill password  ${invalidPassword}
	Submit login
	wait until page contains element  	${errorMessagesUser}

Test login with fault username and valid password
    [Tags]  Login
	Click login
    Login modal is opened
	Fill username  ${invalidUserName}
	Fill password  ${validPassword}}
	Submit login
    wait until page contains element  	${errorMessagesUser}

Test login with valid username and fault password
    [Tags]  Login
	Click login
	Login modal is opened
	Fill username  ${validUserName}
	Fill password  ${invalidPassword}
	Submit login
    wait until page contains element  	${errorMessagesPass}

Test login with valid credentials
    [Tags]  Login
	Click login
    Login modal is opened
	Fill username  ${validUserName}
	Fill password  ${validPassword}
	Submit login

