entity decod2b is
   port (a,b: in bit;
         o: out bit_vector(3 downto 0));
end entity;

architecture comportamental of decod2b is
begin
  o(3)<=a and b;
  o(2)<=(not a) and b;
  o(1)<=(not a) and (not b);
  o(0)<=a and (not b);
end;
