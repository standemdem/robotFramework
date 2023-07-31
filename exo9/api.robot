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
    ${response}=    GET On Session    sessionTest    /posts/10
        # Pour accéder aux différents attributs de la réponse
    Log     ${response.json()}[id]
    Log     ${response.json()}[userId]
    Log     ${response.json()}[title]
    Log     ${response.json()}[body]
    # Chaque requête dispose d'un code, contenu (content) et infos d'entete
    Log     ${response.status_code}
    Log     ${response.content}
    Log     ${response.headers}
    # Convertir le contenu de la réponse en chaine de caractére
    ${body}=     convert to string     ${response.content}
    # Récupérer la valeur associée à la clé "Content-Type" du dictionnaire "headers" de la réponse
    ${contenu}    Get From Dictionary    ${response.headers}    Content-Type
    Log    ${contenu}
2 TEST METHODE POST
    ${body}    Create Dictionary    title="foo"    body="RobotFW"    userId="25"    id="101"
    ${header}    Create Dictionary    Content-Type="appplication/json"
    # Envoyer une requête POST au serveur avec le contenu et entête créés précédemment
    ${response}=    POST On Session    sessionTest      /posts    data=${body}    headers=${header}
    Log     ${response}
    # Recuperer l'attribut "Reason" de la réponse puis le convertir en string pour faciliter verification
    ${strContent}=     Convert To String     ${response.reason}
    # Vérifier les elements de la réponse , code et raison
    Should Contain     ${strContent}     Created
    Should Be Equal As Integers     ${response.status_code}     201
    Log     ${response.status_code}
    Log     ${response.content}
    Log     ${response.headers}
*** Keywords ***

    

