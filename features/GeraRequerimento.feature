#language: pt
#utf-8

@GeraRequerimento

Funcionalidade: Gerar Requerimento
  Eu como usuario do sistema int-Eambiente
  Quero gerar Requerimentos
  Para realizar testes

  Cenario: Requerimento Baixa Manual
    Dado que esteja na tela de cadastro do requerimento
    Quando preencher todos os dados para baixa manual
    Então o sistema gera o processo manual

  Cenario: Requerimento Baixa Automática
    Dado que esteja na tela de cadastro de requerimento
    Quando preencher todos os dados para baixa Automatica
    Então o sistema gera o processo Automatico