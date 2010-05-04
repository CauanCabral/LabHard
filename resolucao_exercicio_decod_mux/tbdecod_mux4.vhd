
entity tbdecod_mux4 is
end entity;

architecture comportamental of tbdecod_mux4 is
  signal a,b,c,d: bit;
  signal sel: bit_vector(3 downto 0);
  signal saida: bit;
begin
 m2: entity work.decod_mux4(estrutural)
      port map(a, b, c,d, sel, saida);

  estimulo_checagem: process is
    type linha_tb is record
       a, b, c,d: bit;
       sel: bit_vector(3 downto 0);
       saida: bit;
    end record;

    type vet_linha_tb is array (0 to 3) of linha_tb;
   
    constant tabela_verdade: vet_linha_tb:=
    (('0','0','0','0',"0000",'0'),
     ('0','0','0','1',"0000",'0'),
     ('0','0','1','0',"0000",'0'),
     ('1','1','1','1',"1111",'1'));
  --outras possibilidades?

    begin 
      for i in tabela_verdade'range loop
        a<=tabela_verdade(i).a;
        b<=tabela_verdade(i).b;
        c<=tabela_verdade(i).c;
        d<=tabela_verdade(i).d;
        sel<=tabela_verdade(i).sel;

        wait for 1 ns;

        assert saida=tabela_verdade(i).saida report "Erro no Resultado";

      end loop;

      report "Fim dos Testes";

      wait;
    end process;
end;
