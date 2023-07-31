Library    OperatingSystem
Library    Collections
*** Settings ***
*** Variables ***
@{cities}=    Paris    Rennes    Marseille
&{city_dict}=       75=Paris    59=Lille    33=Bordeaux
*** Test Cases ***
1 Je teste premiere boucle
    FOR    ${element}    IN    @{cities}
        Log    ${element}
    END
2 Je teste mélange variable et élément
    FOR    ${element}    IN    Paris    @{cities}    Dubai    
        Log    ${element}
    END
3 JE teste boucle for avec un dico
    FOR    ${key}   IN    @{city_dict.items()}
        Log    the key: ${key}[0] the value: ${key}[1]
    END

4 Je teste la boucle FOR IN RANGE
    FOR    ${counter}    IN RANGE    0    10
        Log    ${counter}
    END
5 Je teste la boucle FOR IN RANGE avec un pas de 2
    FOR    ${counter}    IN RANGE    0    11    2
        Log    ${counter}    
    END
6 Je teste la boucle FOR IN RANGE avec evaluate len(list)
    ${len}=    Evaluate   len(${cities})
    FOR    ${counter}    IN RANGE    0    ${len}
        Log    ${counter}
        Log    je mange du caca et j'adore ça . Gros bizou
    END
7 Je teste la boucle FOR IN ENUMERATE
    FOR    ${index}    ${element}    IN ENUMERATE    @{cities}
        Log    ${index}: ${element}
        
    END
8 Je teste la boucle FOR IN ENUMERATE avec un dico
    FOR    ${index}    ${key}    ${value}    IN ENUMERATE    &{city_dict}
        Log    ${index}: ${key} : ${value}
        
    END
9 Je teste la boucle FOR IN zip avec LONGEST
    @{countries}=    Create List    France    Japan    Germany
    @{new_cities}=    Create List    Paris    Tokyo    Berlin    London
    FOR    ${country}    ${city}    IN ZIP    ${countries}    ${new_cities}    mode=LONGEST    fill=unknown
        Log    ${country} - ${city}
        
    END
10 Je teste la boucle FOR IN zip avec SHORTEST
    @{countries}=    Create List    France    Japan    Germany
    @{new_cities}=    Create List    Paris    Tokyo    Berlin    London
    FOR    ${country}    ${city}    IN ZIP    ${countries}    ${new_cities}    mode=SHORTEST    fill=unknown
        Log    ${country} - ${city}
        
    END
11 Je teste la boucle WHILE
    ${objectif}    ${epargne}    Set Variable    50000    0
    ${nbjour}    ${age}    Set Variable    0    54
    WHILE    ${epargne}<${objectif}
        ${epargne}    Evaluate    ${epargne}+1500
        ${nbjour}    Evaluate    ${nbjour}+1
        Log    ${epargne} - jour:${nbjour}
        
    END
*** Keywords ***