*** Settings ***
Library    SeleniumLibrary
Library    XML
*** Test Cases ***
ouvrir google.com
    Open Browser    https://www.saucedemo.com    Chrome
    Sleep    0.5
    Input Text    xpath=//*[@id="user-name"]    standard_user
    Sleep    0.5
    Input Text    xpath=//*[@id="password"]    secret_sauce
    Click Button    xpath=//*[@id="login-button"]
    Sleep    0.5
    Select From List By Index    class:product_sort_container     2
    Sleep    1
    Click Element    //*[@id="add-to-cart-sauce-labs-bike-light"]
    Sleep    0.5
    Click Element    //*[@id="shopping_cart_container"]
    Click Element    //*[@id="checkout"]
    Input Text    //*[@id="first-name"]    Stan
    Input Text    //*[@id="last-name"]    de Montmarin
    Input Text    //*[@id="postal-code"]    75015
    Sleep    0.5
    Click Button    //*[@id="continue"]
    Click Button    //*[@id="finish"]

    Sleep    10
    