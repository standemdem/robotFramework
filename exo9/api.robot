*** Settings ***
Library    RequestsLibrary
Library    Collections
Library    JSONLibrary

*** Variables ***
${url}    https://jsonplaceholder.typicode.com/
${irl}    posts
*** Test Cases ***
Test FakeApi
    # creer une session http vers le serveur
    Create Session    sessionTest    ${url}
*** Keywords ***

    

