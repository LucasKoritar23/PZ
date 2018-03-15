Dado("que esteja na tela de cadastro do requerimento") do
  RealizaLogin.gtiadm
  
  @Unidade = "CETESB/I"
  @Interessado = "OSCAR  SENGER"
  @Municipio = "São Paulo"
  @Req = "REQIMPACTO"
  find(:link, "Requerimento").click
  find(:link, "Adicionar").click
 
end

Quando("preencher todos os dados para baixa manual") do
  select(@Req, :from => "ctl00$conteudo$TabNavegacao$TBCadastro$entDdlSigla")
  find(:id, "ctl00_conteudo_TabNavegacao_TBCadastro_dpUnidade_BUSCA").click
  	sleep(5)
  page.switch_to_window page.windows[-1]
    select("Sigla Unidade", :from => "SqlWhere_fields")
    select("Igual a", :from => "SqlWhere_operators")
    first('#SqlWhere_valueEntry input[type=text]').set @Unidade
	find(:xpath, "//*[@id='SqlWhere_entryButtons']/input[1]").click
	find(:id, "cmdPesq").click
	find(:link, @Unidade).click
  page.switch_to_window page.windows[0]
	sleep(5)
 fill_in("ctl00_conteudo_TabNavegacao_TBCadastro_dpInteressado_txtText_Input", :with => @Interessado)
  sleep(5)
  find(:id, "TabRequerimento").click
  fill_in("ctl00_conteudo_TabNavegacao_TBCadastro_dpMunicipio_txtText_Input", :with => @Municipio)
  sleep(5)
  find(:id, "TabRequerimento").click
 fill_in("ctl00_conteudo_TabNavegacao_TBCadastro_dpEmpreendimento_txtText_Input", :with => "GAFISA")
  sleep(5)
    find(:id, "TabRequerimento").click
  fill_in("ctl00_conteudo_TabNavegacao_TBCadastro_dpSolicitacao_txtText_Input", :with => "Averbação de Reserva Legal ou Área Verde")
  sleep(5)
  find(:id, "TabRequerimento").click
 fill_in("ctl00$conteudo$TabNavegacao$TBCadastro$desAssunto", :with => "Requerimento criado pelo código automatizado")
 	find(:link, "Atualizar").click
  sleep(5)  
  	page.driver.browser.switch_to.alert.accept 
  sleep(5)
  	@NIS = find(:id, "ctl00_conteudo_TabNavegacao_TBCadastro_lblNIS").text
	if  @NIS
	puts("O NIS " + @Req + " é :" + @NIS)
	else
	puts("Algo deu errado na geração do Requerimento automatizado!")
	end
end

Então("o sistema gera o processo manual") do
	find(:id, "ctl00_conteudo_TabNavegacao_TBCobranca_tab").click
	find(:id, "ctl00_conteudo_TabNavegacao_TBCobranca_cmdAdicionaServico").click
	fill_in("ctl00_conteudo_TabNavegacao_TBCobranca_dpCategoriaServico_txtText_Input", :with => "Análise de EIA e Rima Classe II")
	sleep(5)
	find(:id, "TabRequerimento").click
	find(:id, "ctl00_conteudo_TabNavegacao_TBCobranca_chkIsento").click
	fill_in("ctl00$conteudo$TabNavegacao$TBCobranca$desObsServico", :with => "Gerando via código automatizado")
	find(:link, "Finalizar").click
	sleep(5)
	assert_text("Enviar Requerimento para o E-Ambiente")

end

Dado("que esteja na tela de cadastro de requerimento") do
  pending # Write code here that turns the phrase above into concrete actions
end

Quando("preencher todos os dados para baixa Automatica") do
  pending # Write code here that turns the phrase above into concrete actions
end

Então("o sistema gera o processo Automatico") do
  pending # Write code here that turns the phrase above into concrete actions
end