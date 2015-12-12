
-- This component generates a clock that will give rhythm to
-- the main component

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity clock_manager is
    Port ( MAINCLK : in STD_LOGIC;
           BAUDRATE : in INTEGER;
           CLKOUT : out STD_LOGIC);
end clock_manager;

architecture Behavioral of clock_manager is
CONSTANT MAINFREQ : integer := 100000000; -- Base clock frequence on ZBoard

signal counter : integer :=0;

begin
process(MAINCLK)
begin
if MAINCLK'event and MAINCLK='1' then
	if counter>=MAINFREQ/BAUDRATE then
		counter <= 0;
		CLKOUT <= '1';
	else
		counter <= counter+1;
		CLKOUT <= '0';
	end if;
end if;
end process;

end Behavioral;
