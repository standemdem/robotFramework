*** Settings ***
Library    Collections
*** Variables ***
@{cities}=    Paris    Rennes    Madrid
*** Test Cases ***
1 je remplace Madrid par Brest
    Set List Value    ${cities}    2    Brest
2 J'ajoute Bordeaux et Lille
    Append To List    ${cities}    Bordeaux    Lille
3 Je crée un dico en associant les 3 premières villes de la liste à un num de département
    &{city_mapping}    Create Dictionary    75=${cities}[0]    35=${cities}[1]    29=${cities}[2]
    Set Global Variable    ${city_mapping}
4 J'ajoute les villes restantes
    Set To Dictionary    ${city_mapping}    33=${cities}[3]    59=${cities}[4]
    Log    ${city_mapping}
5 J'affiche la ville du département 35
    Log    ${city_mapping}[35]

6 je teste les boucles conditionnelles
    IF    '${city_mapping}[33]'=='Bordeau'
        Log    Je suis bien bordeaux
    ELSE
        Log    je suis ${city_mapping}[59]
    END
7 Je teste une autre conditionnelles
    Run Keyword If    '${city_mapping}[33]'=='Bordeaux'    Log    'Bien joué'
      
*** Keywords ***