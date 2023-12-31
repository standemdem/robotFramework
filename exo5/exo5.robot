# Authentification avec succès
# Authentification en utilisant un nom d’utilisateur vide et un mot de passe
# Authentification avec un nom d’utilisateur et un mot de passe vide
# Authentification avec un utilisateur bloqué locked_out_user
# Test de bout en bout avec achat de produit
*** Settings ***
Library    SeleniumLibrary
Library    XML
Library    ExcelLibrary
*** Variables ***
${user_pwd}    user_pwd.xlsx
*** Test Cases ***
1 Se connecter avec bon log et mdp
    Open Browser    https://www.saucedemo.com/v1/index.html    Chrome
    Sleep    0.5
    Input Text    xpath=//*[@id="user-name"]    standard_user
    Sleep    0.5
    Input Text    xpath=//*[@id="password"]    secret_sauce
    Click Button    xpath=//*[@id="login-button"]
    Sleep    0.5
# verifier la connexion
    ${currentUrl}    Get Location
    Should Contain    ${currentUrl}    /inventory.html
    Close Browser

2 Se connecter avec mdp mais pas de user
    Open Browser    https://www.saucedemo.com/v1/index.html    Chrome
    Sleep    0.5
    Input Text    xpath=//*[@id="password"]    secret_sauce
    Click Button    xpath=//*[@id="login-button"]
    Sleep    0.5
# Verification
    Element Text Should Be    //*[@id="login_button_container"]/div/form/h3    Epic sadface: Username is required
    Close Browser
3 Se connecter avec user mais pas de mdp
    Open Browser    https://www.saucedemo.com/v1/index.html    Chrome
    Sleep    0.5
    Input Text    xpath=//*[@id="user-name"]    standard_user
    Sleep    0.5
    Input Text    xpath=//*[@id="password"]    ${EMPTY}
    Click Button    xpath=//*[@id="login-button"]
    Sleep    0.5
    ${temp}=     Get Text    //*[@id="login_button_container"]/div/form/h3
    Should Be Equal    ${temp}    Epic sadface: Password is required
    Close Browser

4 Se connecter avec Blocked out user
    Open Browser    https://www.saucedemo.com/v1/index.html    Chrome
    Sleep    0.5
    Input Text    xpath=//*[@id="user-name"]    locked_out_user
    Sleep    0.5
    Input Text    xpath=//*[@id="password"]    secret_sauce
    Click Button    xpath=//*[@id="login-button"]
    Sleep    0.5
    ${temp}=     Get Text    //*[@id="login_button_container"]/div/form/h3
    Should Be Equal    ${temp}    Epic sadface: Sorry, this user has been locked out.
    Close Browser
5 Parcourt achat bout en bout
    Open Browser    https://www.saucedemo.com/v1/index.html    Chrome
    Sleep    0.5
    Input Text    xpath=//*[@id="user-name"]    standard_user
    Sleep    0.5
    Input Text    xpath=//*[@id="password"]    secret_sauce
    Click Button    xpath=//*[@id="login-button"]
    Sleep    0.5
    #Verification d'arrivée sur page liste produit
    ${currentUrl}    Get Location
    Should Contain    ${currentUrl}    /inventory.html
    Select From List By Index    class:product_sort_container     2
    Sleep    1
    Click Element    //*[@id="add-to-cart-sauce-labs-bike-light"]
    Sleep    0.5
    # Verifier que l'élem est ajouté
    Element Should Be Visible    .fa-layers-counter shopping_cart_badge    
    Click Element    //*[@id="shopping_cart_container"]
    Click Element    //*[@id="checkout"]
    Input Text    //*[@id="first-name"]    Stan
    Input Text    //*[@id="last-name"]    de Montmarin
    Input Text    //*[@id="postal-code"]    75015
    Sleep    0.5
    Click Button    //*[@id="continue"]
    Click Button    //*[@id="finish"]

    Sleep    10
6 Je test le get_excel
    ${user1}     ${pwd2}=    get_excel    ${user_pwd}    Feuil1
    Log To Console    ${user1} ${pwd2}
*** Keywords ***
get_excel
    [Arguments]    ${user_pwd}    ${feuille}
    Open Excel Document    ${user_pwd}    ${feuille}
    ${user}=    Read Excel Cell    2    1
    ${pwd}=    Read Excel Cell    2    2
    Close All Excel Documents
    [Return]    ${user}    ${pwd}