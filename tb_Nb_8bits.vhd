
-- Test of the DEL switches positions indicator
-- We test a stimulus on the first two switches

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_Nb_8Bits is
end tb_Nb_8Bits;

architecture Behavioral of tb_Nb_8Bits is

component Nb_8Bits is
    Port ( CLK : in  STD_LOGIC;
           RAZ : in STD_LOGIC;
           S   : in STD_LOGIC_VECTOR (7 downto 0);
           A   : out STD_LOGIC_VECTOR (7 downto 0));
end component;

signal CLK : STD_LOGIC :='0';
signal RAZ : STD_LOGIC :='0';
signal S : STD_LOGIC_VECTOR (7 downto 0);
signal A : STD_LOGIC_VECTOR (7 downto 0);

-- Clock 
constant CLK_period : time := 10ns;
begin

uut : Nb_8Bits port map(
    CLK => CLK,
    RAZ => RAZ,
    S => S,
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
    S(0) <= '0';
    S(1) <= '0';
    S(2) <= '0';
    S(3) <= '0';
    S(4) <= '0';
    S(5) <= '0';
    S(6) <= '0';
    S(7) <= '0';
    wait for CLK_period;
    
    S(0) <= '1';
    wait for CLK_period;
    
    S(1) <= '1';
    wait for CLK_period;
    
    S(0) <= '0';
    wait for CLK_period;
    
    S(1) <= '0';
    wait for CLK_period;
    
    RAZ <= '1';
    wait for CLK_period * 10;
    
    S(0) <= '1';
    wait for CLK_period;
    
    S(1) <= '1';
    wait for CLK_period;
    
    S(0) <= '0';
    wait for CLK_period;
    
    S(1) <= '0';
    wait for CLK_period;
    
    RAZ <= '0';
    S(0) <= '1';
    wait for CLK_period;
    
    S(1) <= '1';
    wait for CLK_period;
    
    S(0) <= '0';
    wait for CLK_period;
    
    S(1) <= '0';
    wait for CLK_period;
    wait;
end process;

end Behavioral;