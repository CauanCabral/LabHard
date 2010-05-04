LIBRARY ieee;
Use ieee.std_logic_1164.all;
Use ieee.std_logic_unsigned.all;

entity ula is
   port (
   	a,b : in std_logic_vector (7 downto 0);
   	sel: in std_logic_vector(3 downto 0);
   	cin : in std_logic;
	y: out std_logic_vector (7 downto 0)
   );
end ula;

architecture ula_arch of ula is
	begin
		y <= a when sel="0000" else
			 a + 1 when sel="0001" else
			 a - 1 when sel="0010" else
			 b when sel="0011" else
			 b + 1 when sel="0100" else
			 b - 1 when sel="0101" else
			 a + b when sel="0110" else
			 a + b + cin when sel="0111" else
			 NOT a when sel="1000" else
			 NOT b when sel= "1001" else
			 a AND b when sel="1010" else
			 a OR b when sel="1011" else
			 a NAND b when sel="1100" else
			 a NOR b when sel="1101" else
			 a XOR b when sel="1110" else
			 a XNOR b when sel="1111";
end architecture;
