-------------------------------------------------------------------------------
--
-- Title       : task2
-- Design      : lab1
-- Author      : Daniil
-- Company     : none
--
-------------------------------------------------------------------------------
--
-- File        : c:/APKS_proga/lab1/src/lab1.vhd
-- Generated   : Mon Oct 12 15:07:07 2026
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
--{entity {task2} architecture {task2}}

library IEEE;
use IEEE.std_logic_1164.all;

entity task1 is
	port(
		x1 : in STD_LOGIC;
		x2 : in STD_LOGIC;
		x3 : in STD_LOGIC;
		y1 : out STD_LOGIC;
		y2 : out STD_LOGIC
	);
end task1;

--}} End of automatically maintained section

architecture task1 of task1 is

component and2 is
    port (in1:in STD_LOGIC; in2:in STD_LOGIC; out1:out STD_LOGIC);
end component;

component or4 is
    port (in1:in STD_LOGIC; in2:in STD_LOGIC; in3:in STD_LOGIC; in4:in STD_LOGIC; out1:out STD_LOGIC);
end component;

component or_not3 is
    port (in1:in STD_LOGIC; in2:in STD_LOGIC; in3:in STD_LOGIC; out1:out STD_LOGIC);
end component;

signal A, B, C, D : STD_LOGIC;

begin
    DD1: and2    port map(x1, x3, A);
    DD2: and2    port map(x1, x2, C);
    DD3: and2    port map(C, x3, D);
    DD4: or_not3 port map(x1, x2, x3, B);
    DD5: or_not3 port map(A, B, '0', y1);
    DD6: or4     port map(D, B, '0', '0', y2);

end task1;
