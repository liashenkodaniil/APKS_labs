library IEEE;
use IEEE.std_logic_1164.all;

entity jk1 is
    generic(delay : time := 100 ps);
    port(
        j  : in STD_LOGIC;
        k  : in STD_LOGIC;
        c  : in STD_LOGIC;
        r  : in STD_LOGIC;
        c1 : out STD_LOGIC;
        c2 : out STD_LOGIC
    );
end jk1;

architecture jk1 of jk1 is
begin
    process(c, r)
        variable q : integer := 0;
    begin
        -- синхронна робота: перемикання по заднього фронту (1 -> 0)
        if (c'event and c = '0' and r = '0') then
            if ((j = '1') and (k = '0')) then
                q := 1;
            elsif ((j = '0') and (k = '1')) then
                q := 0;
            elsif ((j = '1') and (k = '1')) then
                q := 1 - q;
            end if;
        end if;
        -- асинхронне скидання
        if (r = '1') then
            q := 0;
        end if;
        if (q = 1) then
            c1 <= '1' after delay;
            c2 <= '0' after delay;
        else
            c1 <= '0' after delay;
            c2 <= '1' after delay;
        end if;
    end process;
end jk1;
