### Types de variables
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

#### Variable scalaire
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

##### Liste
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

#### Dictionnaires
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