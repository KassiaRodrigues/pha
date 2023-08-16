*** Settings ***
Documentation     Meu teste de automação com dicionário, Argumentos e Retornos, If Simples, For Simples, Lista, If Inline e For in Range.
Library    Collections
*** Variable ***
#Simples
${idade}     28
${ano}    2023
#Tipo Dicionário
&{PESSOA}    nome=Kassia Rodrigues   idade=28   rua=Av Contorno   numero=02   cep=73391734   bairro=Vila vicentina  cidade=Brasilia   estado=DF 
#Tipo Lista
@{FRUTAS}    banana    abacaxi    morango    maça
@{LIST0A10} =      0    1    2    3    4    5    6    7    8    9    10
@{LETRASENUMEROS}=    "A"    1    "B"    2    "C"    3

*** Test Cases ***
Meu teste imprimindo um dicionário de pessoa 
    Logar no terminal um dicionário

Meu teste de Argumentos e Retornos e If Simples
    Logar no terminal uma mensagem de acordo com o ano de nascimento
    
Meu teste de for simples e lista de frutas 
    Logar no terminal uma lista de frutas

Meu teste de loop contar números pares 
    Logar no terminal números pares 

Logar no terminal apenas números da lista 
    Logar no terminal apenas números da lista 

*** Keywords ***
Logar no terminal um dicionário
    Log to console   Nome:${PESSOA.nome} 
    Log to console   idade:${PESSOA.idade} 
    Log to console   rua:${PESSOA.rua} 
    Log to console   numero:${PESSOA.numero}   
    Log to console   cep:${PESSOA.cep}    
    Log to console   bairo:${PESSOA.bairro}   
    Log to console   cidade:${PESSOA.cidade}    
    Log to console   estado:${PESSOA.estado}

Logar no terminal uma mensagem de acordo com o ano de nascimento
    #[Arguments]    ${idade}
    ${result}    Evaluate    int(${ano}) - int(${idade})
    IF   "${idade}" >= "23" 
        Log to console   Você nasceu no século passado: ${result}
    ELSE
        Log to console   Seu ano de nascimento foi: ${result}
    END

Logar no terminal uma lista de frutas
    Log to console  Lista de frutas
    FOR    ${fruta}    IN    @{FRUTAS}
        Log to console  ${fruta}
    END

Logar no terminal números pares 
    FOR    ${num}    IN RANGE    11
        ${result}    Evaluate    int(${num})%int(2)
        IF    int(0)==${result}
            Log to console   ${num}
        END
    END

Logar no terminal apenas números da lista
    
    @{LISTARESPOSTA}    Create List

    FOR    ${simbol}    IN    @{LETRASENUMEROS}
        TRY
            Evaluate    ${simbol} + 1
            Append To List    ${LISTARESPOSTA}  ${simbol}    
            Log To Console    Numero adicionado a lista: ${simbol}
        EXCEPT
            Log To Console    Não adicionado pois não é número: ${simbol}
        FINALLY
            Log To Console    Lista de apenas números @{LISTARESPOSTA}
        END
    END



    
   
    





