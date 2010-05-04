entity tb_exercicio_2 is
end tb_exercicio_2;

architecture tb_dataflow of tb_exercicio_2 is
	signal a, b, c : bit;
	signal d : bit;
	begin
		exe : entity work.exercicio_2(dataflow)
		port map (a, b, c, d);
		
		estimulo_checagem: process is
		type linha_tb is record
			a, b, c, d: bit;
		end record;
		
		type vet_linha_tb is array (0 to 7) of linha_tb;
		
		constant tabela_verdade: vet_linha_tb:=
		(('1','1','1','0'),
		('1','1','0','0'),
		('1','0','1','1'),
		('1','0','0','0'),
		('0','1','1','1'),
		('0','1','0','1'),
		('0','0','1','1'),
		('0','0','0','1'));
		
		begin 
			for i in tabela_verdade'range loop
				a<=tabela_verdade(i).a;
				b<=tabela_verdade(i).b;
				c<=tabela_verdade(i).c;
				
				wait for 1 ns;
				assert d=tabela_verdade(i).d report "Erro no Resultado";
			end loop;
		
			report "Fim dos Testes";
			
			wait;
		end process;
end architecture;