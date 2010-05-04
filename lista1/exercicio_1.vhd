LIBRARY ieee;
Use ieee.std_logic_1164.all;

entity mux is
   port (
   	c : out std_logic_vector (7 downto 0);
	a,b : in std_logic_vector (7 downto 0);
	sel: in bit_vector(1 downto 0)
   );
end mux;

architecture mux_arch of mux is
	begin
		process (a, b, sel)
		begin
			if (sel="00") then
				c <= "00000000";
		 	elsif (sel="01") then
				c <= a;
			elsif (sel="10") then
				c <= b;
			else
				c <= "ZZZZZZZZ";
			end if;
	end process;
end architecture;
