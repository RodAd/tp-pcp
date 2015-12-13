
-- Test of the decimal counter

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_CPT_decimal is
end tb_CPT_decimal;

architecture Behavioral of tb_CPT_decimal is

component CPT_decimal is
  Port ( CLK : in  STD_LOGIC;
         RAZ : in  STD_LOGIC;
         I : in STD_LOGIC;
         Q: out INTEGER);
end component;

signal CLK : STD_LOGIC :='0';
signal RAZ : STD_LOGIC :='0';
signal I : STD_LOGIC := '0';
signal Q : INTEGER :=0;

-- Clock 
constant CLK_period : time := 10ns;
begin

uut : CPT_decimal port map(
    CLK => CLK,
    RAZ => RAZ,
    I => I,
    Q => Q
    );

-- Clock process definitions
CLK_process : process
begin
CLK <= '0';
wait for CLK_period / 2;
CLK <= '1';
wait for CLK_period / 2;
end process;

-- Stimulus process
stim_proc : process
begin
wait for 10*CLK_period;

I <= '1';
wait for 200*CLK_period;

I <= '0';
wait for 200*CLK_period;

I <= '1';
wait for 100*CLK_period;

RAZ <= '1';
wait for 200*CLK_period;

RAZ <= '0';
wait;
end process;

end Behavioral;
