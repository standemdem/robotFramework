Library    OperatingSystem
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
    END
*** Keywords ***