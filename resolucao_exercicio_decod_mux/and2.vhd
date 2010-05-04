entity and2 is
   port (a,b: in bit;
         o: out bit);
end entity;

architecture comportamental of and2 is
begin
  o<=a and b;
end;
