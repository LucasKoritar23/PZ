Dado("que esteja na tela de cadastro de Processos do Sigam") do
  RealizaLogin.gtiadm
  @Interessado = "OSCAR  SENGER"
  @Municipio = "São Paulo"
  @temporalidade = "001.01.02.009 Processo de cadastramento no Fundo de Garantia por Tempo de Serviço - FGTS"
  @sigla = "IMPACTO - Licenciamento c/ Avaliação de Impacto Ambiental"
  @Unidade = "CETESB/IE"

end

Quando("preencher todos os dados obrigatorios para geração") do
	find(:link, "Processos").click
	find(:id, "ctl00_conteudo_ctl00_cmdIncluir").click
	select(@sigla, :from => "ctl00$conteudo$TabNavegacao$TabCadastro$ddlSigla")
	find(:id, "ctl00_conteudo_TabNavegacao_TabCadastro_dpUnidade_BUSCA").click
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
	fill_in("ctl00_conteudo_TabNavegacao_TabCadastro_dpCatInicial_txtText_Input", :with => "RAS")
	sleep(5)
	#find(:xpath, "//*[@id='ctl00_conteudo_TabNavegacao_TabCadastro_dpCatInicial_txtText_item_0']/nobr/table/tbody/tr/td[1]").click
	find(:xpath, "//table[@id='TabEdita']/tbody/tr[2]/td[2]").click
	fill_in("ctl00_conteudo_TabNavegacao_TabCadastro_dpInteressado_txtText_Input", :with => @Interessado)
	sleep(5)
	find(:xpath, "//table[@id='TabEdita']/tbody/tr[2]/td[2]").click
	fill_in("ctl00_conteudo_TabNavegacao_TabCadastro_dpMunicipio_txtText_Input", :with => @Municipio)
	sleep(5)
	find(:xpath, "//table[@id='TabEdita']/tbody/tr[2]/td[2]").click
	fill_in("ctl00_conteudo_TabNavegacao_TabCadastro_dpAtividade_txtText_Input", :with => "AGROSILVOPASTORIL")
	sleep(5)
	fill_in("ctl00_conteudo_TabNavegacao_TabCadastro_dpFinalidade_txtText_Input", :with => "Administrativo")
	sleep(5)
	find(:xpath, "//table[@id='TabEdita']/tbody/tr[2]/td[2]").click
	fill_in("ctl00$conteudo$TabNavegacao$TabCadastro$dpAssunto$txtTextOld", :with => @temporalidade)
	sleep(5)
	find(:id, "ctl00_conteudo_TabNavegacao_TabCadastro_cmdAtualiza").click
	
end

Então("o sistema gera o Processo") do
   PreencheDadosProcesso.PreencheEmpree
   @NIS = find(:id, "ctl00_conteudo_capaProcesso_lblNIS").text
	if  @NIS
	puts("O NIS do Processo é :" + @NIS)
	else
	puts("Algo deu errado na geração do processo automatizado!")
	end

end