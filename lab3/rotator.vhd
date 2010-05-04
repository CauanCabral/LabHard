entity rotator is
	port(
		din: in bit_vector(3 downto 0);
		desloc: in bit_vector(1 downto 0);
		dout: out bit_vector(3 downto 0)
	);
end entity;

architecture comportamental of rotator is
	signal temp: bit_vector(3 downto 0);
begin
	mux2_a: entity work.mux2b(comportamental)
		port map(din(3), din(2), desloc(0), temp(3));
		
	mux2_b: entity work.mux2b(comportamental)
		port map(din(2), din(1), desloc(0), temp(2));
		
	mux2_c: entity work.mux2b(comportamental)
		port map(din(1), din(0), desloc(0), temp(1));
		
	mux2_d: entity work.mux2b(comportamental)
		port map(din(0), din(3), desloc(0), temp(0));

	-- segundo grupo de mux
	mux2_e: entity work.mux2b(comportamental)
		port map(temp(3), temp(2), desloc(1), dout(3));
		
	mux2_f: entity work.mux2b(comportamental)
		port map(temp(2), temp(1), desloc(1), dout(2));
		
	mux2_g: entity work.mux2b(comportamental)
		port map(temp(1), temp(0), desloc(1), dout(1));
		
	mux2_h: entity work.mux2b(comportamental)
		port map(temp(0), temp(3), desloc(1), dout(0));
end;
