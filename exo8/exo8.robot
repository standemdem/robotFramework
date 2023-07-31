# Authentification avec succès
# Authentification en utilisant un nom d’utilisateur vide et un mot de passe
# Authentification avec un nom d’utilisateur et un mot de passe vide
# Authentification avec un utilisateur bloqué locked_out_user
# Test de bout en bout avec achat de produit
*** Settings ***
Library    SeleniumLibrary
Library    XML
Library    RequestsLibrary
Resource    ressources/keyword.robot
Resource    ressources/variables.robot
Test Setup       openNewBrowser    ${website_url}
Test Teardown    closeConnexion
 
*** Test Cases ***
1 Se connecter avec bon log et mdp
    connectToSite   standard_user    secret_sauce
    # verifier la connexion
    ${currentUrl}    Get Location
    Should Contain    ${currentUrl}    /inventory.html

2 Se connecter avec mdp mais pas de user
    connectToSite    ${EMPTY}    secret_sauce
    # Verification
    Element Text Should Be    //*[@id="login_button_container"]/div/form/h3    Epic sadface: Username is required
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
    [Tags]    fullpath
    connectToSite    standard_user    secret_sauce
    #Verification d'arrivée sur page liste produit
    ${currentUrl}    Get Location
    Should Contain    ${currentUrl}    /inventory.html
    Select From List By Index    class:product_sort_container     2
    Sleep    1
    Click Button    //*[@id="inventory_container"]/div/div[2]/div[3]/button
    Sleep    0.5
    # Verifier que l'élem est ajouté
    Element Should Be Visible    class=fa-layers-counter 
    Click Element    //*[@id="shopping_cart_container"]
    ##################################################################
    Create Session    cart    https://www.saucedemo.com/v1
    ${response}=    GET On Session    cart    /cart.html
    Should Be Equal As Integers    ${response.status_code}    200
    ##################################################################
    Click Element    //*[@id="cart_contents_container"]/div/div[2]/a[2]
    Input Text    //*[@id="first-name"]    Stan
    Input Text    //*[@id="last-name"]    de Montmarin
    Input Text    //*[@id="postal-code"]    75015
    Sleep    0.5
    Click Button    //*[@id="checkout_info_container"]/div/form/div[2]/input
    Click Element    //*[@id="checkout_summary_container"]/div/div[2]/div[8]/a[2]
    Sleep    5
6 Je test le get_excel
    ${user1}     ${pwd2}=    get_excel    ${user_pwd}    Feuil1
    Log To Console    ${user1} ${pwd2}
