*** Settings ***
Documentation    Consulta no site da Petz

Library  SeleniumLibrary
Library  OperatingSystem

Test Teardown   close browser

*** Variables ***
${browser}      Chrome
${url}          https://www.petz.com.br

*** Test Cases ***
Consulta Produto com Clique na Lupa
    [Tags]    rapido
   Dado que acesso o site como cliente
   Quando escrevo "Ração" na barra de pesquisa
   E cliclo no botao da lupa
   Entao exibe um grid e frase do resultado esperado

   Consulta Produto Apertando Enter
    [Tags]    rapido
   Dado que acesso o site como cliente
   Quando escrevo "Ração" na barra de pesquisa
   E aperto a tecla Enter
   Entao exibe um grid e frase do resultado esperado

*** Keywords ***
Dado que acesso o site como cliente
    open browser    ${url}  ${browser}

Quando escrevo "${palavra_chave}" na barra de pesquisa
    Set Test Variable   ${palavra_chave}
    input text      name = q    ${palavra_chave}

E cliclo no botao da lupa
    click button    button-search

Entao exibe um grid e frase do resultado esperado
    element should contain  css = h2Categoria nomeCategoria     Resultados para "${palavra_chave}"

E aperto a tecla Enter
   press keys       ENTER