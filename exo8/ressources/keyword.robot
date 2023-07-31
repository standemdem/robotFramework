*** Settings ***
Library    ExcelLibrary
*** Keywords ***
get_excel
    [Arguments]    ${user_pwd}    ${feuille}
    Open Excel Document    ${user_pwd}    ${feuille}
    ${user}=    Read Excel Cell    2    1
    ${pwd}=    Read Excel Cell    2    2
    Close All Excel Documents
    [Return]    ${user}    ${pwd}