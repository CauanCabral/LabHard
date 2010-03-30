entity exemplo2 is
end entity;

architecture teste of exemplo2 is
begin
	p1 : process
		variable n : natural;
	begin
		report "Em t = " & time'image(now) & ", n = " & natural'image(n);
		n := n + 1;
	end process;
end;
