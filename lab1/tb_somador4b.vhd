entity tb_somador4b is
end ;

architecture mixed of tb_somador4b is
	signal a, b : bit_vector(3 downto 0);
	signal sum : bit_vector(3 downto 0);
	signal cout : bit;
 
begin
  m2: entity work.somador4b(estrutural)
      port map(a, b, sum, cout);

  estimulo_checagem: process is
    type linha_tv is record
		a, b : bit_vector(3 downto 0);
		sum : bit_vector(3 downto 0);
		cout : bit;
    end record;

	type vetor_linha_tv is array (natural range <>) of linha_tv;

	constant tabela_verdade : vetor_linha_tv :=
	(
		-- a		b		sum	cout
		("0000", "0000", "0000", '0'), -- 0 + 0 = 0
		("0011", "0011", "0110", '0'), -- 3 + 3 = 6
		("0101", "0011", "1000", '0'), -- 5 + 3 = 8 (overflow?)
		("1111", "0001", "0000", '1') -- -1 + 1 = 0 (carry out)
	);
	
	begin 
      for i in tabela_verdade'range loop
        a<=tabela_verdade(i).a;
        b<=tabela_verdade(i).b;
        
        wait for 1 ns;

        assert sum=tabela_verdade(i).sum report "Erro na Soma";
        assert cout=tabela_verdade(i).cout report "Erro no Vai-um";

      end loop;

      report "Fim dos Testes";

      wait;
    end process;
end architecture;
