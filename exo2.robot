*** Settings ***
*** Variables ***
${num1}=    3
${num2}=    9
${num3}=    3

*** Test Cases ***
je test ma boucle
    IF    ${num1}>${num2}
        ${max}=    Set Variable   ${num1}
        IF    $max > $num3
            Log    le max est ${max}
        ELSE IF     $max < $num3
            Log    Le max est ${num3} 
        END
    ELSE IF    ${num1}<${num2}
        ${max}=    Set Variable    ${num2}
        IF    $max > $num3
            Log    le max est ${max}
        ELSE IF     $max < $num3
            Log    Le max est ${num3}
            
        END
    END
*** Keywords ***