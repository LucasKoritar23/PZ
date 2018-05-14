class PreencheDadosProcesso

	def PreencheDadosProcesso.insereDados(sigla)

  	@Interessado = "OSCAR  SENGER"
  	@Municipio = "São Paulo"
  	@numProcesso = rand(0...10000000)
	  @temporalidade = "001.01.02.009 Processo de cadastramento no Fundo de Garantia por Tempo de Serviço - FGTS"
	  find(:link, "Processos", visible: true).click
	find(:id, "ctl00_conteudo_ctl00_cmdIncluir").click
	@Unidade = "CETESB/IE"

	select(sigla, :from => "ctl00$conteudo$TabNavegacao$TabCadastro$ddlSigla")

	if (sigla == "LICAIA - Licenciamento c/ Avaliação de Impacto Ambiental" || sigla == "DAIA - Departamento de Avaliação de Impacto Amb" || sigla == "CETESB - Companhia Ambiental do Estado de São Paulo")
	fill_in("ctl00$conteudo$TabNavegacao$TabCadastro$codAno", :with => "2018")
	fill_in("ctl00$conteudo$TabNavegacao$TabCadastro$codNumero", :with => @numProcesso)
	
	end

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
	fill_in("ctl00_conteudo_TabNavegacao_TabCadastro_dpCatInicial_txtText_Input", :with => "EIA E RIMA")
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
	sigla = ""
	end

	def PreencheDadosProcesso.PreencheAtividade
  	find(:xpath, "//a[@id='__tab_ctl00_conteudo_TabNavegacao_TabAtividades']/span").click
  	find(:id, "ctl00_conteudo_TabNavegacao_TabAtividades_categoriaProcesso_dgCategorias_ctl02_cmdCategoria").click
	fill_in("ctl00_conteudo_TabNavegacao_TBBasico_dadosBasicos_dpEmpreendimento_txtText_Input", :with => "GAFISA")
  	sleep(5)
  	find(:xpath, "//*[@id='ctl00_conteudo_capaProcesso_trAtividade']/td[1]").click
	  sleep(5)
	  fill_in("ctl00_conteudo_TabNavegacao_TBBasico_dadosBasicos_dpConsultora_txtText_Input", :with => "LPC")
	  sleep(5)
	  find(:xpath, "//*[@id='ctl00_conteudo_capaProcesso_trAtividade']/td[1]").click
  	find(:id, "ctl00_conteudo_TabNavegacao_TBBasico_dadosBasicos_cmdAtualiza").click
  	sleep(5)
  	find(:id, "ctl00_conteudo_TabNavegacao_TBBasico_dadosBasicos_cmdFinaliza").click
	end
end