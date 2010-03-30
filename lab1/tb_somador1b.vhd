entity tb_somador1b is
end ;

architecture mixed of tb_somador1b is
 signal a, b, cin, sum, cout: bit;
begin
  m2: entity work.somador1b(comportamental)
      port map(a, b, cin, sum, cout);

  estimulo_checagem: process is
    type linha_tb is record
       a, b, cin, sum, cout: bit;
    end record;

    type vet_linha_tb is array (0 to 7) of linha_tb;
   
    constant tabela_verdade: vet_linha_tb:=
    (('0','0','0','0','0'),
     ('0','0','1','1','0'),
     ('0','1','0','1','0'),
     ('0','1','1','0','1'),
     ('1','0','0','1','0'),
     ('1','0','1','0','1'),
     ('1','1','0','0','1'),
     ('1','1','1','1','1'));
    begin 
      for i in tabela_verdade'range loop
        a<=tabela_verdade(i).a;
        b<=tabela_verdade(i).b;
        cin<=tabela_verdade(i).cin;

        wait for 1 ns;

        assert sum=tabela_verdade(i).sum report "Erro na Soma";
        assert cout=tabela_verdade(i).cout report "Erro no Vai-um";

      end loop;

      report "Fim dos Testes";

      wait;
    end process;
end architecture;


