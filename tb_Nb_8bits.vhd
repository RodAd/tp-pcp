
-- Test of the 8Bits number

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_Nb_8Bits is
end tb_Nb_8Bits;

architecture Behavioral of tb_Nb_8Bits is

component Nb_8Bits is
    Port ( CLK : in  STD_LOGIC;
           RAZ : in STD_LOGIC;
           A   : out STD_LOGIC_VECTOR (7 downto 0));
end component;

signal CLK : STD_LOGIC :='0';
signal RAZ : STD_LOGIC :='0';
signal A : STD_LOGIC_VECTOR (7 downto 0);

-- Clock 
constant CLK_period : time := 10ns;
begin

uut : Nb_8Bits port map(
    CLK => CLK,
    RAZ => RAZ,
    A => A 
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
    RAZ <= '0';
    wait for 100 ns;
    
    RAZ <= '1';
    wait for CLK_period * 21;
    
    RAZ <= '0';
    wait;
end process;

end Behavioral;