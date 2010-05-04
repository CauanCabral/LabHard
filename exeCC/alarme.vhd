entity alarme is
port(
	drive, pass, ign, beltd, beltp : in bit;
	alarm : out bit;
);
end;

architecture ex of alarme is
begin
	process (drive, pass, ign, beltd, beltp)
		if (ign='0') then
			alarm <= '1';
		else 
			if(drive='1' && pass='1') then
				if(
		end if;
	end process;
end;
