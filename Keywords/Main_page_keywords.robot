*** Settings ***
Resource	../Page_Objects/Main_page_objects.robot
Resource	../Settings/Settings.robot

*** Keywords ***
Open czc to the main page
	[Arguments]		${url_p}=${url}	${browser_p}=${browser}
	Open Browser	${url_p}	${browser_p}
	Wait Until Element Is Visible	${mainPage}
#	Maximize Browser Window

Search for
    [Arguments]  ${searchString}
	Input Text		${searchBar}	${searchString}
    Click Button	${searchBarSubmitButton}
    Wait Until Element Is Visible	product-list-container