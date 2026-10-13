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

architecture or4 of or4 is
begin
    out1 <= in1 or in2 or in3 or in4 after 30 ps;
end or4;
