*** Settings ***
Library		Selenium2Library
Resource	../../Page_Objects/Main_page_objects.robot
Resource	../../Keywords/Tests.robot
Resource	../../Settings/Settings.robot

*** Test Cases ***
Open_page
    Open Czc To The Main Page	${url}	${browser}
    Close All Browsers