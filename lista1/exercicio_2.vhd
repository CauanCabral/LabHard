entity exercicio_2 is
	port (
		a, b, c : in bit;
		d : out bit
	);
end exercicio_2;

architecture dataflow of exercicio_2 is
	begin
		d <= ( a nand ( (a and b) or (not c) ) );
end architecture;