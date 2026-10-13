library IEEE;
use IEEE.std_logic_1164.all;

entity and2 is
    port(
        in1 : in STD_LOGIC;
        in2 : in STD_LOGIC;
        out1 : out STD_LOGIC
    );
end and2;

architecture and2 of and2 is
begin
    out1 <= in1 and in2 after 30 ps;
end and2;
