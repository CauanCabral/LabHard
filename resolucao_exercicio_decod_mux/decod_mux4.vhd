-- Este circuito tem como entrada 4 bits para um decodificador (4x16).
-- A saida do decodificador e' entrada para um multiplexador 16x1
entity decod_mux4 is
   port (a,b,c,d: in bit;
         sel: in bit_vector(3 downto 0);
         output: out bit);
end entity;

architecture estrutural of decod_mux4 is
  signal output_decoda: bit_vector(3 downto 0);
  signal output_decodb: bit_vector(3 downto 0);
  signal output_decod: bit_vector(15 downto 0);
  signal output_mux: bit_vector(7 downto 0);
  signal output_mux2: bit_vector(3 downto 0);
  signal output_mux3: bit_vector(1 downto 0);
begin

  decod2b1: entity work.decod2b(comportamental)
              port map(a,b,output_decoda);

  decod2b2: entity work.decod2b(comportamental)
              port map(c,d,output_decodb);

  decod4ba:for i in 3 downto 0 generate
    decod4bb:for j in 3 downto 0 generate
          and2: entity work.and2(comportamental)
                           port map(output_decoda(i),output_decodb(j),output_decod((i*4)+j));
    end generate;
  end generate;

  mux:for i in 7 downto 0 generate 
          mux_i: entity work.mux2b(comportamental)
                     port map(output_decod(i*2),output_decod((i*2)+1),sel(3),output_mux(i));
  end generate;  


  mux1:for i in 3 downto 0 generate 
          mux1_i: entity work.mux2b(comportamental)
                     port map(output_mux(i*2),output_mux((i*2)+1),sel(2),output_mux2(i));
  end generate;  

  mux2:for i in 1 downto 0 generate 
          mux2_i: entity work.mux2b(comportamental)
                     port map(output_mux2(i*2),output_mux2((i*2)+1),sel(1),output_mux3(i));
  end generate;  

  mux3: entity work.mux2b(comportamental)
          port map(output_mux3(0),output_mux3(1),sel(0),output);

    
end;
