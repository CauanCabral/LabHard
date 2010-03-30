entity exemplo1 is
end entity ;

architecture teste of exemplo1 is
       signal a,b,s1,s2,s3,s4,s5 : natural ;
begin
       p1 : process (a, b) is
       begin
               s1 <= a + b + 1 ;
       end process ;

       p2 : process is
       begin
               s2 <= a + b + 1 ;
               wait on a, b ;
       end process ;

       p3 : process is
       begin
               wait on a, b ;
               s3 <= a + b + 1 ;
       end process ;

       p4 : process is
       begin
               s4 <= a + b + 1 ;
               wait on a ;
       end process ;

       p5 : process is
       begin
               s5 <= a + b + 1 ;
               wait on b ;
       end process ;

       estimulo : process is
       begin
               wait for 1 ns ;
               a <= 1 ;
               b <= 2 ;
               wait for 1 ns ;
               a <= 3 ;
               b <= 4 ;
               wait for 1 ns ;
               a <= 5 ;
               b <= 6 ;
               wait for 1 ns ;
               b <= 6 ;
               wait for 1 ns ;
               wait ;
       end process ;
end ;
