library IEEE;
use IEEE.std_logic_1164.all;

entity jk2 is
    generic(delay : time := 100 ps);
    port(
        j  : in STD_LOGIC;
        k  : in STD_LOGIC;
        c  : in STD_LOGIC;
        r  : in STD_LOGIC;
        c1 : out STD_LOGIC;
        c2 : out STD_LOGIC
    );
end jk2;

architecture jk2 of jk2 is

component and2 is
    port (in1:in STD_LOGIC; in2:in STD_LOGIC; out1:out STD_LOGIC);
end component;

component or4 is
    port (in1:in STD_LOGIC; in2:in STD_LOGIC; in3:in STD_LOGIC; in4:in STD_LOGIC; out1:out STD_LOGIC);
end component;

component or_not3 is
    port (in1:in STD_LOGIC; in2:in STD_LOGIC; in3:in STD_LOGIC; out1:out STD_LOGIC);
end component;

-- генератор імпульсу по задньому фронту синхросигналу
signal nc, b1, b2, b3, pls, nr, plsg : STD_LOGIC;
-- вхідна логіка та RS-засувка
signal sj, sjp, rk, rkp, q, qn : STD_LOGIC;

begin
    -- ланцюг внутрішньої затримки
    E1 : or_not3 port map(c, '0', '0', nc);      -- not c, 30 ps
    E2 : and2    port map(c,  c,  b1);           -- c, 30 ps
    E3 : and2    port map(b1, b1, b2);           -- c, 60 ps
    E4 : and2    port map(b2, b2, b3);           -- c, 90 ps
    E5 : and2    port map(nc, b3, pls);          -- імпульс 60 ps після спаду c
    E6 : or_not3 port map(r, '0', '0', nr);      -- not r
    E7 : and2    port map(pls, nr, plsg);        -- блокування імпульсу при r=1

    -- вхідна логіка
    E8  : and2 port map(j, qn, sj);
    E9  : and2 port map(sj, plsg, sjp);
    E10 : and2 port map(k, q, rk);
    E11 : and2 port map(rk, plsg, rkp);

    -- RS-засувка на елементах 3АБО-НЕ (з пріоритетом скидання r)
    E12 : or_not3 port map(rkp, qn, r, q);
    E13 : or_not3 port map(sjp, q, '0', qn);

    c1 <= q;
    c2 <= qn;
end jk2;
