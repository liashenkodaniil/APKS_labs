-------------------------------------------------------------------------------
--
-- Title       : or_not3
-- Design      : lab1
-- Author      : Daniil
-- Company     : none
--
-------------------------------------------------------------------------------
--
-- File        : c:/APKS_proga/lab1/src/or_not3.vhd
-- Generated   : Mon Oct 12 14:02:04 2026
-- From        : Interface description file
-- By          : ItfToHdl ver. 1.0
--
-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------

--{{ Section below this comment is automatically maintained
--    and may be overwritten
--{entity {or_not3} architecture {or_not3}}

library IEEE;
use IEEE.std_logic_1164.all;

entity or_not3 is
	port(
		in1 : in STD_LOGIC;
		in2 : in STD_LOGIC;
		in3 : in STD_LOGIC;
		out1 : out STD_LOGIC
	);
end or_not3;

--}} End of automatically maintained section

architecture or_not3 of or_not3 is
begin

	out1<= not (in1 or in2 or in3) after 30ps;

end or_not3;
