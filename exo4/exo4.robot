*** Settings ***

*** Variables ***
*** Test Cases ***
je récupère les données
    ${test1}    getData
    connect    ${test1}[0]    ${test1}[1]    ${test1}[2]    ${test1}[3]
    Log    ${test1}

*** Keywords ***
getData
    ${login}    Set Variable    standard_user
    ${mdp}    Set Variable    secret_sauce
    ${url}    Set Variable    https://www.saucedemo.com
    ${browser}    Set Variable    gc
    [Return]    ${url}  ${browser}  ${login}    ${mdp}
connect
    [ARGUMENTS]     ${url}  ${browser}  ${login}    ${mdp}
    Log    ${url} ${browser}
    Log   ${login}
    Log    ${mdp}