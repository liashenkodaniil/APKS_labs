-------------------------------------------------------------------------------
--
-- Title       : or4
-- Design      : lab1
-- Author      : Daniil
-- Company     : none
--
-------------------------------------------------------------------------------
--
-- File        : c:/APKS_proga/lab1/src/or4.vhd
-- Generated   : Mon Oct 12 13:54:50 2026
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
--{entity {or4} architecture {or4}}

library IEEE;
use IEEE.std_logic_1164.all;

entity or4 is
	port(
		in1 : in STD_LOGIC;
		in2 : in STD_LOGIC;
		in3 : in STD_LOGIC;
		in4 : in STD_LOGIC;
		out1 : out STD_LOGIC
	);
end or4;

--}} End of automatically maintained section

architecture or4 of or4 is
begin

	out1<= in1 or in2 or in3 or in4 after 30ps;

end or4;
