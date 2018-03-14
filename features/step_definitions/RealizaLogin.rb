class RealizaLogin

	def RealizaLogin.gtiadm

		visit("http://exec-dev01.sma.local/sigam-int-EAmbiente")
		@usuario = "gtiadm"
		@senha = "a"
		find(:xpath, "//*[@id='ctl00_conteudo_ctl00_Panel1']/div").click
		fill_in('username', :with => @usuario)
		fill_in('password', :with => @senha)
		find(:id, "login").click
	end

end