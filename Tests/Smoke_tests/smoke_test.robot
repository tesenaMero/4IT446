*** Settings ***
Library		Selenium2Library
Resource	../../Page_Objects/Main_page_objects.txt
Resource	../../Keywords/Mahara_demo_keywords.txt
Resource	../../Settings/Settings.txt
Test Setup		Open Czc To The Main Page	${url}	${browser}
Test Teardown	Close All Browsers

*** Variables ***
${invalidUserName}	faultUsername
${invalidPassword}	faultTest

*** Test Cases ***
LoginTest
	Login To Czc		${invalidUserName}	${invalidPassword}
	Wait Until Element Is Visible	${errorMessages}

