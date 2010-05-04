entity mux2b is
   port (a,b,sel: in bit;
         o: out bit);
end entity;

architecture comportamental of mux2b is
begin
  o<= a when sel='0' else
      b when sel='1';
end;
