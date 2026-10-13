library IEEE;
use IEEE.std_logic_1164.all;

entity tb_jk is
end tb_jk;

architecture tb of tb_jk is
    component jk1 is
        generic(delay : time := 100 ps);
        port(j,k,c,r : in STD_LOGIC; c1,c2 : out STD_LOGIC);
    end component;
    component jk2 is
        generic(delay : time := 100 ps);
        port(j,k,c,r : in STD_LOGIC; c1,c2 : out STD_LOGIC);
    end component;
    signal j,k,c,r : STD_LOGIC := '0';
    signal m1q,m1qn,m2q,m2qn : STD_LOGIC;
begin
    M1 : jk1 port map(j,k,c,r,m1q,m1qn);
    M2 : jk2 port map(j,k,c,r,m2q,m2qn);




    clk : process
    begin
        c <= '1'; wait for 500 ps;
        loop
            c <= '0'; wait for 500 ps;
            c <= '1'; wait for 500 ps;
        end loop;
    end process;

    stim : process
    begin
        r <= '1'; wait for 200 ps;      -- початкове скидання
        r <= '0'; j <= '0'; k <= '0';
        wait for 2800 ps;                          -- J=0 K=0: утримання
        j <= '1'; k <= '0'; wait for 3000 ps;      -- J=1 K=0: встановлення
        j <= '0'; k <= '1'; wait for 3000 ps;      -- J=0 K=1: скидання
        j <= '1'; k <= '1'; wait for 4000 ps;      -- J=1 K=1: інверсія
        r <= '1'; wait for 400 ps;                 -- асинхронне скидання
        r <= '0'; wait for 1600 ps;
        wait;
    end process;
end tb;
