LIBRARY ieee;

use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity ALU is
port (a, b: in std_logic_vector(7 downto 0);
      sel: in std_logic_vector(3 downto 0);
      cin: in std_logic;
      y: out std_logic_vector(7 downto 0));
end ALU;

architecture dataflow of ALU is
  signal arith, logic: std_logic_vector(7 downto 0);
begin
  with sel(2 downto 0) select
    arith <= a when "000",
             a+1 when "001",
             a-1 when "010",
             b   when "011",
             b+1 when "100",
             b-1 when "101",
             a+b when "110",
             a+b+cin when others;

  with sel(2 downto 0) select
    logic <= not a when "000",
             not b when "001",
             a and b when "010",
             a or b   when "011",
             a nand b when "100",
             a nor b when "101",
             a xor b when "110",
             not (a xor b) when others;

  with sel(3) select
     y<=arith when '0',
        logic when others;
end architecture;
