-------------------------------------------------------------------------------
--
-- Title       : and2
-- Design      : lab1
-- Author      : Daniil
-- Company     : none
--
-------------------------------------------------------------------------------
--
-- File        : c:/APKS_proga/lab1/src/and2.vhd
-- Generated   : Mon Oct 12 13:43:41 2026
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
--{entity {and2} architecture {and2}}

library IEEE;
use IEEE.std_logic_1164.all;

entity and2 is
	port(
		in1 : in STD_LOGIC;
		in2 : in STD_LOGIC;
		out1 : out STD_LOGIC
	);
end and2;

--}} End of automatically maintained section

architecture and2 of and2 is
begin

	out1<= in1 and in2 after 30ps;

end and2;
