LIBRARY ieee;

use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity tb_ula is
end entity;

architecture arch_tb_ula of tb_ula is
signal a, b, y: std_logic_vector(7 downto 0);
signal sel: std_logic_vector(3 downto 0);
signal cin: std_logic;
begin
e1: entity work.ula(ula_arch)
    port map(a, b, sel, cin, y);

p1: process is
type registro_ula is record
  a, b: std_logic_vector(7 downto 0);
  sel: std_logic_vector(3 downto 0);
  cin: std_logic;
  y: std_logic_vector(7 downto 0);
end record;
type dados_tb_ula is array (0 to 15) of registro_ula; 

 constant dados_tb: dados_tb_ula :=
    ( ( "00000000", "00000000", "0000", '0', "00000000"),
      ( "00000000", "00000000", "0001", '0', "00000001"),
      ( "00000000", "00000000", "0010", '0', "11111111"),
      ( "00000000", "00000000", "0011", '0', "00000000"),
      ( "00000000", "00000000", "0100", '0', "00000001"),
      ( "00000000", "00000000", "0101", '0', "11111111"),
      ( "00000000", "00000000", "0110", '0', "00000000"),
      ( "00000000", "00000000", "0111", '0', "00000000"),
      ( "00000000", "00000000", "1000", '0', "11111111"),
      ( "00000000", "00000000", "1001", '0', "11111111"),
      ( "00000000", "00000000", "1010", '0', "00000000"),
      ( "00000000", "00000000", "1011", '0', "00000000"),
      ( "00000000", "00000000", "1100", '0', "11111111"),
      ( "00000000", "00000000", "1101", '0', "11111111"),
      ( "00000000", "00000000", "1110", '0', "00000000"),
      ( "00000000", "00000000", "1111", '0', "11111111"));
begin
   for i in dados_tb'range loop
        a <= dados_tb(i).a;
        b <= dados_tb(i).b;
        sel <= dados_tb(i).sel;
        cin <= dados_tb(i).cin;
    
        wait for 1 ns;
   
        assert y=dados_tb(i).y  report "Erro no resultado da operacao ";


    end loop;

      report "fim do teste";

    wait ;
end process p1; 

end architecture;
