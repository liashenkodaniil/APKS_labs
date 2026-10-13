library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity lab3 is
    generic (Delay : time := 100 ps);       -- затримка розповсюдження сигналу
    port (
        CLK     : in  STD_LOGIC;                     -- тактовий сигнал
        Reset   : in  STD_LOGIC;                     -- сигнал скидання
        DataIn  : in  STD_LOGIC_VECTOR (3 downto 0); -- інформаційний вхід
        DataOut : out STD_LOGIC_VECTOR (3 downto 0); -- інформаційний вихід
        Command : in  STD_LOGIC_VECTOR (2 downto 0)  -- код команди
    );
end entity lab3;

-- Система команд (варіант 9):
-- 000 - збереження
-- 001 - запис (завантаження DataIn)
-- 010 - перетворення в код: інверсний
-- 011 - зсув ліворуч: циклічний
-- 100 - зсув праворуч: логічний
-- 101 - арифметична операція: +In (додавання DataIn)
-- 110 - логічна операція: nand (з DataIn)
-- 111 - додаткова функція: розворот (реверс розрядів)

architecture lab3 of lab3 is
begin
    process (CLK, Reset)
        variable private : STD_LOGIC_VECTOR (3 downto 0) := "0000";
    begin
        if (Reset = '1') then
            private := "0000";
        elsif (CLK'event) and (CLK = '0') then   -- по задньому фронту
            case Command is
                when "000" => null;                          -- збереження
                when "001" => private := DataIn;             -- запис
                when "010" => private := not private;        -- інверсія
                when "011" =>                                -- цикл. зсув вліво
                    private := private(2 downto 0) & private(3);
                when "100" =>                                -- лог. зсув вправо
                    private := '0' & private(3 downto 1);
                when "101" => private := private + DataIn;   -- додавання
                when "110" => private := private nand DataIn; -- nand
                when "111" =>                                -- розворот
                    private := private(0) & private(1) &
                               private(2) & private(3);
                when others => null;
            end case;
        end if;
        DataOut <= private after Delay;
    end process;
end architecture lab3;
