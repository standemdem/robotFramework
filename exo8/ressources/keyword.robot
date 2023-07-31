*** Settings ***
Library    ExcelLibrary
Library    SeleniumLibrary
*** Keywords ***
get_excel
    [Arguments]    ${user_pwd}    ${feuille}
    Open Excel Document    ${user_pwd}    ${feuille}
    ${user}=    Read Excel Cell    2    1
    ${pwd}=    Read Excel Cell    2    2
    Close All Excel Documents
    [Return]    ${user}    ${pwd}

openNewBrowser
    [Arguments]    ${browser}
    Open Browser    ${browser}    Chrome
connectToSite
    [Arguments]    ${user}    ${pwd}
    Input Text    xpath=//*[@id="user-name"]    ${user}
    Sleep    0.5
    Input Text    xpath=//*[@id="password"]    ${pwd}
    Click Button    xpath=//*[@id="login-button"]
    Sleep    0.5
closeConnexion
    Close All Browsers