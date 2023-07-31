*** Settings ***
Library    Collections
Library    XML

*** Variables ***
${first_name}=    stanislas
@{class_list}    stanislas    gaetan    guigouz    mirah
&{person_object}    first_name=stan    last_name=montmarin

*** Test Cases ***
Doit suspendre l'exécution du test pendant 3 secondes
    Sleep    1
    ${coucou}=    Set Variable     salut    # set the value salut to the var coucou
    Log    ${coucou}                        # Logs  the value of var coucou
stan et stan doit etre egal à stan
    Run Keyword And Continue On Failure    Should Be Equal    stanislas   stanislas  
Je log un msge à la con
    Log To Console    3 secondes d'attentes
    Log    3 secondes d'attentes encore
    Log    Calculating the total sum. Current value of x: 10, y: 5    level=INFO
    Log    msge warning                level=WARN
    Log    Ceci est un log d'erreur    level=ERROR
1 Je test le should not be equal
    Log    ${person_object}
    Run Keyword And Continue On Failure    Should Not Be Equal    12    15
2 Je test le should contain
    Run Keyword And Continue On Failure    Should Contain    stanislas    islas
3 Je test le should not contain
    Run Keyword And Continue On Failure    Should not Contain    stanislas    slave
4 Je test le should Start With
    Run Keyword And Continue On Failure    Should End With    Je suis un slip en bois    Je suis un sli
5 Je test le should NOT Start With
    Run Keyword And Continue On Failure    Should Not End With     Je suis un slip en bois    Ah Je suis un slip
6 Je test le should END With
    Run Keyword And Continue On Failure    Should End With    Je suis un slip en bois    Je suis un sli
7 Je test le should NOT END With
    Run Keyword And Continue On Failure    Should Not End With    Je suis un slip en bois    Ah Je suis un slip
8 J'essaye un Calcul
    ${calcul}    Set Variable    ${2000+7-1000*2}
    Set Global Variable    ${calcul}
    Log    ${calcul}
9 Je test la fonction Evaluate qui permet de faire du python
    ${evalue}=    Evaluate    'slip' if ${calcul} > 0 else 'slourp'
    Log    ${evalue}
    ${opeMath}    Evaluate    len("slip")
10 Je crée une liste
    ${list1}    Create List    a    b    c    d    bonjour
11 Je remplace une valeure d'une liste
    Set List Value    ${class_list}    2    Patrice
12 Je rajoute un élément à la fin d'une liste
    Append To List    ${class_list}    Lou
13 Je récupère un élément d'une liste
    ${temp}    Get From List    ${class_list}    4
    Log    ${class_list}
14 Je récupère un élément d'une liste d'une autre manière
    ${tmp}=    Set Variable     ${class_list}[2]
15 Je crée un dictionnaire
    &{dict}    Create Dictionary    a=1    b=2
16 J'ajoute un élément à un dico existant
    Set To Dictionary    ${person_object}    zip_code    75015
17 Je récupère la valeur du zip code du dico
    Get From Dictionary    ${person_object}    zip_code
*** Keywords ***
