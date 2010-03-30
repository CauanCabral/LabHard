entity tb_exemplo3 is
end entity;

architecture mixed of tb_exemplo3 is
	signal a, b, c, r1, r2, r3 : bit;
begin
	ex3_arq1 : 	entity work.exemplo3(teste1)
				port map(a, b, c, r1);
				
	ex3_arq2 :	entity work.exemplo3(teste2)
				port map(a, b, c, r2);
				
	ex3_arq3 :	entity work.exemplo3(teste3)
				port map(a, b, c, r3);
				
	estimulo : process is

	begin
		a <= '0'; b <= '0'; c <= '0';
		wait for 1 ns;
		
		a <= '1'; b <= '0'; c <= '1';
		wait for 1 ns;
		
		a <= '1'; b <= '1'; c <= '0';
		wait for 1 ns;
		
		a <= '1'; b <= '1'; c <= '1';
		wait for 1 ns;
		
		a <= '0'; b <= '1'; c <= '0';
		wait for 1 ns;
		
		wait;
	end process;
end;
		
