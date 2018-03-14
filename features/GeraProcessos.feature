#language: pt
#utf-8

@GeraProcessos

Funcionalidade: Criar processo
  Eu como usuario do sistema
  Quero gerar diversos Processos
  Para enviar ao Eambiente

  Cenario: Processo Impacto
  	Dado que esteja na tela de cadastro do Processo de Impacto
  	Quando preencher todos os dados
  	Então o sistema gera o processo Impacto

   Cenario: Processo SMA
    Dado que esteja na tela de cadastro do Processo de SMA
    Quando preencher todos os dados obrigatórios
    Então o sistema gera o processo SMA

   Cenario: Processo DAIA
    Dado que esteja na tela de cadastro do Processo de DAIA
    Quando preencher todos os campos obrigatórios
    Então o sistema gera o processo  DAIA

   Cenario: Processo LICAIA
    Dado que esteja na tela de cadastro do Processo de LICAIA
    Quando preencher todos os campos necessários
    Então o sistema gera o processo LICAIA

   Cenario: Processo CETESB
    Dado que esteja na tela de cadastro do Processo de CETESB
    Quando preencher todos os campos requeridos
    Então o sistema gera o processo  CETESB