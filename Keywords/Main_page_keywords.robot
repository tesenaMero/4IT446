*** Settings ***
Library		Selenium2Library
Resource	../Page_Objects/Main_page_objects.robot
Resource	../Settings/Settings.robot

*** Keywords ***
Open czc to the main page
	Open Browser	${url}	${browser}
	maximize browser window
	set selenium timeout  10
	Wait Until Element Is Visible	${mainPage}


Search for
    [Arguments]  ${searchString}
	Input Text		${searchBar}	${searchString}
    Click Button	${searchBarSubmitButton}
    Wait Until Element Is Visible	product-list-container