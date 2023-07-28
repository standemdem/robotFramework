## Types de variables
- Insensible à la class_hommeEn majuscules pour les var globales
- en minuscules pour les variables locales

### 4types:
- Scalaire: contenu unique : ${nom}
- Liste: Liste de valeurs: @{nom}
- Dictionnaire: Liste clé valeur : &{nom}
- Var env: Nom de la variable : %{nom}

### Manipuler les variables: Initialisation
Les variables globales sont à déclarer dans la partie *** variables ***
- on peut déclarer une variable locale dans un TestCase / keyword
    - Pour augmenter la portée d'une variable : Set Global Variable ${var}
- avec ou sans initialisation
en utilisant ou non le signe =
liste: @{list}  a   b   c   2   #l'index débute à 0
dico: &{dict}   a=1 b=2         

### Manipules les variables: OPérations

### Variable scalaire
    - Commence par${nomDeLaVar}
    - si la valeur n'est pas une chaine de caractère, on peut éliminer les {}

- exemples
Set variable (Retourne et affecte la valeur donnée à une variable)
${string}= Set Variable     Bonjour
${calcul} Set variable      ${2000+7-1000*2}

Evaluate (Traite l'expression en question avec python et retourne le résultat)
${var}=     Evaluate    'positif' if 1>0 else 'negatif'
${opmath}     Evaluate     2000+7-1000*2
${mot}      Evaluate    '''ch'ine'''
${logique}  Evaluate    0<${opmath}<30

## Liste
- commence par @{nomDeLaListe}
- par défaut, index 0
- pour accéder à un élément => ${liste}[index]

exemple Keywords
- Create List: créer une liste dans un Keyword/TestCase
    - @{list}   Create List     a   b   c   d   Bonjour
- Set List Value: Remplacer une valeur de la liste
    - Set List Value    ${list}     4   e
- Append To List: Ajouter un élément à la liste
    - Append To List    ${list}     g
- Get From List : Récupère l'élément associé à l'index donné
    - ${tmp}    Get From List   ${list}     2

## Dictionnaires
- commence par &{nomDeLaListe}
- pour accéder à un élément => ${Liste.key}

exemple Keywords
- Create Dictionary
    - &{dict}   Create Dictionnary  a=1     b=2     c=3
- Set To Dictionary : ajoute clé/valeur
    - Set To Dictionary     ${dict}     6       e
- Get From Dictionary: Récup_re la valeur associée à la key
    - ${temp}   Get From Dictionary   ${dict}   key

### Boucles conditionnelles
ELSE
ELSE IF
    IF
    ELSE
    END
ELSE
    IF
    END
END

Autre écriture: Run Keyword if / Run Keyword Unless
Set Variable If

### Les boucles
- Principe
    - Répéter les mêmes actions plusieurs fois
    - Utilisables dans les TestCase /keyword
    - Plusieurs types

### FOR    IN
```
FOR     ${élém}   IN    list
    instructions
END
```
### FOR   IN RANGE
```
FOR     ${elem}    IN RANGE [Plage]
    instructions
END
```
Plage:
- Une limite: ex 5
- Un début et une fin: 2    9
- Une plage et un pas: 2    10  2
- Une variable
 
### FOR     IN ENUMERATE
```
FOR     ${index}    ${elem}     IN ENUMERATE    [element à parcourir]   start=1
    instructions
END
```
Attention si tu veux parcourir une liste il faut mettre @{list} plutot que ${list}

### FOR IN ZIP
```
FOR    ${l1-element}    ${l2-element}    IN ZIP    ${LIST-1}    ${LIST-2}   mode    LONGUEST/SHORTEST/STRICT    fill    0
    Log    ${l1-element} - ${l2-element}
END
```

### BOUCLE WHILE
```
WHILE    $var_in_py_expr1 == $var_in_py_expr2   Limit=[une limite]
    instructions        
END
```
Conditions:
- Deux listes / une liste regroupant les 2
Limite:
- nombre d'itération: Limit=10
- nombre de secondes: Limit=1 seconds

### Les Arguments
Principe
- Créer un keyword avec des paramètres en entrée
- Retourner une ou plusieurs variables en sortie d'un keyword

```
Récupérer les données
    ${login}    SET VARIABLE    standard_user
    ${mdp}    SET VARIABLE    secret_sauce
    ${url}    SET VARIABLE    https://www.saucedemo.com
    ${browser}    SET VARIABLE    gc
    [Return]    ${url}  ${browser}  ${login}    ${mdp}
CONNEXION
    [ARGUMENTS]     ${url}  ${browser}  ${login}    ${mdp}
    Open Browser    ${url}  ${browser}
    Input Text  data:test:username  ${login}
    Input Password  data:test:password  ${mdp}
    Click Button    data:test:login-button

```

## Tests Front End
