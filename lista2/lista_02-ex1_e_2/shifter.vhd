LIBRARY ieee;

use ieee.std_logic_1164.all;
-- problema: shifter vector
-- row(0): 0 0 0 0 1 1 1 1
-- row(1): 0 0 0 1 1 1 1 0
-- row(2): 0 0 1 1 1 1 0 0
-- row(3): 0 1 1 1 1 0 0 0
-- row(4): 1 1 1 1 0 0 0 0 

entity shifter is
port (inp: in std_logic_vector(3 downto 0);
      sel: in integer range 0 to 4;
      outp: out std_logic_vector(7 downto 0));
end entity;

architecture arch_shifter of shifter is
   subtype vector is std_logic_vector(7 downto 0);
   type matrix is array(4 downto 0) of vector;
   signal row: matrix;
begin

   row(0)<="0000" & inp;
   process is
-- poderia usar for..generate sem a necessidade de process?
--   g1: for i in 1 to 4 generate 
  
    begin
     for i in 1 to 4 loop
       row(i) <= row(i-1)(6 downto 0) & '0';
     end loop;
    end process;
    outp<=row(sel);
end architecture;
