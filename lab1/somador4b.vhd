entity somador4b is
	port
	(
		a, b : in bit_vector(3 downto 0);
		sum : out bit_vector(3 downto 0);
		cout : out bit
	);
end somador4b;

architecture estrutural of somador4b is
	signal carry : bit_vector(2 downto 0);
	
	begin
		sb0: entity work.somador1b(comportamental)
			port map (a => a(0), b => b(0), cin => '0', sum => sum(0), cout => carry(0));
		
		sb1: entity work.somador1b(comportamental)
			port map (a => a(1), b => b(1), cin =>  carry(0), sum => sum(1), cout => carry(1));
			
		sb2: entity work.somador1b(comportamental)
			port map (a => a(2), b => b(2), cin => carry(1), sum => sum(2), cout => carry(2));
			
		sb3: entity work.somador1b(comportamental)
			port map (a => a(3), b => b(3), cin => carry(2), sum => sum(3), cout => cout);
	end estrutural;
