entity somador1b is
   port (a,b,cin: in bit;
         sum,cout: out bit);
end entity;

architecture comportamental of somador1b is
begin
  sum<=a xor b xor cin;

  cout<=(a and b) or (a and cin) or (b and cin);
end;
