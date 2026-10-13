library IEEE;
use IEEE.std_logic_1164.all;

entity tb_lab3 is
end tb_lab3;

architecture tb of tb_lab3 is
    component lab3 is
        generic (Delay : time := 100 ps);
        port (
            CLK     : in  STD_LOGIC;
            Reset   : in  STD_LOGIC;
            DataIn  : in  STD_LOGIC_VECTOR (3 downto 0);
            DataOut : out STD_LOGIC_VECTOR (3 downto 0);
            Command : in  STD_LOGIC_VECTOR (2 downto 0)
        );
    end component;

    signal CLK     : STD_LOGIC := '1';
    signal Reset   : STD_LOGIC := '0';
    signal DataIn  : STD_LOGIC_VECTOR (3 downto 0) := "0000";
    signal DataOut : STD_LOGIC_VECTOR (3 downto 0);
    signal Command : STD_LOGIC_VECTOR (2 downto 0) := "000";
begin
    UUT : lab3 port map (CLK, Reset, DataIn, DataOut, Command);

    -- тактовий сигнал: період 400 ps (спад на 200, 600, 1000 ... ps)
    clk_gen : process
    begin
        CLK <= '1'; wait for 200 ps;
        CLK <= '0'; wait for 200 ps;
    end process;

    stim : process
        procedure step(cmd : STD_LOGIC_VECTOR(2 downto 0);
                       din : STD_LOGIC_VECTOR(3 downto 0);
                       expected : STD_LOGIC_VECTOR(3 downto 0)) is
        begin
            wait until rising_edge(CLK);      -- команда змінюється при CLK=1
            Command <= cmd;
            DataIn  <= din;
            wait until falling_edge(CLK);     -- виконання по заднього фронту
            wait for 150 ps;                  -- затримка виходу 100 ps
            assert DataOut = expected
                report "Wrong result"
                severity error;
        end procedure;
    begin
        -- початкове скидання
        Reset <= '1'; wait for 100 ps;
        Reset <= '0'; wait for 100 ps;
        step("000", "1011", "0000");   -- збереження (після скидання 0)
        step("001", "1011", "1011");   -- запис 1011 (B)
        step("000", "0000", "1011");   -- збереження
        step("011", "1011", "0111");   -- цикл. зсув ліворуч: 1011 -> 0111
        step("100", "1011", "0011");   -- лог. зсув праворуч: 0111 -> 0011
        step("101", "1011", "1110");   -- додавання: 3 + 11 = 14 (E)
        step("111", "1011", "0111");   -- розворот: 1110 -> 0111
        step("110", "1011", "1100");   -- nand: 0111 nand 1011 = 1100
        step("010", "1011", "0011");   -- інверсія: 1100 -> 0011
        step("101", "1011", "1110");   -- додавання: 3 + 11 = 14
        step("101", "1011", "1001");   -- 14 + 11 = 25 -> 9 (переповнення)
        wait until rising_edge(CLK);
        Reset <= '1'; wait for 250 ps;   -- асинхронне скидання
        assert DataOut = "0000" report "Reset: wrong result" severity error;
        Reset <= '0'; Command <= "000";
        wait for 800 ps;
        report "Simulation finished" severity note;
        wait;
    end process;
end tb;
