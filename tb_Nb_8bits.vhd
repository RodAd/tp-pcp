
-- Test of the 8 bits shift register

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_Nb_8Bits is
end tb_Nb_8Bits;

architecture Behavioral of tb_Nb_8Bits is

component Nb_8Bits is
    Port ( A   : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           RAZ : in STD_LOGIC;
           Q   : out STD_LOGIC_VECTOR (7 downto 0));
end component;

signal A : STD_LOGIC :='0';
signal CLK : STD_LOGIC :='0';
signal RAZ : STD_LOGIC :='0';
signal Q : STD_LOGIC_VECTOR (7 downto 0);

-- Clock 
constant CLK_period : time := 10ns;
begin

uut : Nb_8Bits port map(
    A => A,
    CLK => CLK,
    RAZ => RAZ,
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
    wait for 110*CLK_period;
    
    A <= '1';
    wait for 100*CLK_period;
    
    A <= '0';
    wait for 100*CLK_period;
    
    A <= '0';
    RAZ <= '1';
    wait for 100*CLK_period;
        
    A <= '1';
    wait for 100*CLK_period;
        
    A <= '1';
    RAZ <= '0';
    wait for 100*CLK_period;    
    
    A <= '0';
    wait for 100*CLK_period;
    
    wait;   
end process;

end Behavioral;
