*** Settings ***
*** Variables ***
${num1}=       25
${num2}=    45
${num3}=    101

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
        IF    ${max} > ${num3}
            Log    le max est ${max}
        ELSE IF     ${max} < ${num3}
            Log    Le max est ${num3}
            
        END
    END
*** Keywords ***