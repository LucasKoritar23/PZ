#language: pt
#utf-8

@GeraProcessoUnico

Funcionalidade: Gerar Processo Único
  Eu como usuario do sistema sigam-int-eambiente
  Quero gerar um processo
  Para realizar futuras consultas

  Cenario: Gerar Processo
  	Dado que esteja na tela de cadastro de Processos do Sigam
  	Quando preencher todos os dados obrigatorios para geração
  	Então o sistema gera o Processo
