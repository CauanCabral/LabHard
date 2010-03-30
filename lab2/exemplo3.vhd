entity exemplo3 is
	port(
		a, b, c : in bit;
		r		: out bit
	);
end entity;

architecture teste1 of exemplo3 is
	signal s1 : bit;
begin
	p1 : process (a, b, c) is
	begin
		s1 <= a and b;
		r <= s1 or c;
	end process;
end;

architecture teste2 of exemplo3 is
begin
	p2 : process (a, b, c) is
		variable v : bit;
	begin
		v := a and c;
		r <= v or c;
	end process;
end;

architecture teste3 of exemplo3 is
	signal s3 : bit;
begin
	p3 : process (a, b) is
	begin
		s3 <= a and b;
	end process;
	
	p4 : process (s3, c) is
	begin
		r <= s3 or c;
	end process;
end;
