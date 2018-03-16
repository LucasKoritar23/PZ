Dado("que esteja na tela de cadastro do requerimento") do
  RealizaLogin.gtiadm
  find(:link, "Requerimento").click
  find(:link, "Adicionar").click
end

Quando("preencher todos os dados para baixa manual") do
  PreencheDadosRequerimento.insereDados(tipo = "Manual")
end

Então("o sistema gera o processo manual") do
  PreencheDadosRequerimento.Cobranca(tipo = "Manual")
end

Dado("que esteja na tela de cadastro de requerimento") do
  find(:link, "Requerimento").click
  find(:link, "Adicionar").click
end

Quando("preencher todos os dados para baixa Automatica") do
  PreencheDadosRequerimento.insereDados(tipo = "Automatico")
end

Então("o sistema gera o processo Automatico") do
  PreencheDadosRequerimento.Cobranca(tipo = "Automatico")
end