Dado("que esteja na tela de cadastro do Processo de Impacto") do
  RealizaLogin.gtiadm
end

Quando("preencher todos os dados") do
  PreencheDadosProcesso.insereDados(sigla = "IMPACTO - Licenciamento c/ Avaliação de Impacto Ambiental")
end

Então("o sistema gera o processo Impacto") do
  find(:id, "ctl00_conteudo_TabNavegacao_TabCadastro_cmdAtualiza").click
  PreencheDadosProcesso.PreencheAtividade
  @NIS = find(:id, "ctl00_conteudo_capaProcesso_lblNIS").text
  if  @NIS
  puts("O NIS do Processo é :" + @NIS)
  else
  puts("Algo deu errado na geração do processo automatizado!")
  end
end

Dado("que esteja na tela de cadastro do Processo de SMA") do
 PreencheDadosProcesso.insereDados(sigla = "SMA - Secretaria do Meio Ambiente")
end

Quando("preencher todos os dados obrigatórios") do
  find(:id, "ctl00_conteudo_TabNavegacao_TabCadastro_cmdAtualiza").click
  PreencheDadosProcesso.PreencheAtividade
end

Então("o sistema gera o processo SMA") do
  @NIS = find(:id, "ctl00_conteudo_capaProcesso_lblNIS").text
  if  @NIS
  puts("O NIS do Processo é :" + @NIS)
  else
  puts("Algo deu errado na geração do processo automatizado!")
  end
end

Dado("que esteja na tela de cadastro do Processo de DAIA") do
PreencheDadosProcesso.insereDados(sigla = "DAIA - Departamento de Avaliação de Impacto Amb")
end

Quando("preencher todos os campos obrigatórios") do
 find(:id, "ctl00_conteudo_TabNavegacao_TabCadastro_cmdAtualiza").click
 PreencheDadosProcesso.PreencheAtividade
end

Então("o sistema gera o processo  DAIA") do

 @NIS = find(:id, "ctl00_conteudo_capaProcesso_lblNIS").text
  if  @NIS
  puts("O NIS do Processo é :" + @NIS)
  else
  puts("Algo deu errado na geração do processo automatizado!")
  end
end

Dado("que esteja na tela de cadastro do Processo de LICAIA") do
  PreencheDadosProcesso.insereDados(sigla = "LICAIA - Licenciamento c/ Avaliação de Impacto Ambiental")
end

Quando("preencher todos os campos necessários") do
  find(:id, "ctl00_conteudo_TabNavegacao_TabCadastro_cmdAtualiza").click
  PreencheDadosProcesso.PreencheAtividade
end

Então("o sistema gera o processo LICAIA") do

  @NIS = find(:id, "ctl00_conteudo_capaProcesso_lblNIS").text
  if  @NIS
  puts("O NIS do Processo é :" + @NIS)
  else
  puts("Algo deu errado na geração do processo automatizado!")
  end
end

Dado("que esteja na tela de cadastro do Processo de CETESB") do
PreencheDadosProcesso.insereDados(sigla = "CETESB - Companhia Ambiental do Estado de São Paulo")
end

Quando("preencher todos os campos requeridos") do
  find(:id, "ctl00_conteudo_TabNavegacao_TabCadastro_cmdAtualiza").click
  PreencheDadosProcesso.PreencheAtividade
end

Então("o sistema gera o processo  CETESB") do
  @NIS = find(:id, "ctl00_conteudo_capaProcesso_lblNIS").text
  if  @NIS
  puts("O NIS do Processo é :" + @NIS)
  else
  puts("Algo deu errado na geração do processo automatizado!")
  end
end