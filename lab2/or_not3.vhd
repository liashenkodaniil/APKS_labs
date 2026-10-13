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

architecture or_not3 of or_not3 is
begin
    out1 <= not (in1 or in2 or in3) after 30 ps;
end or_not3;
