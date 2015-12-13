
-- This component is a 8 bits cyclical shift register, with a reset value of "10011001"
-- "Merry christmas"

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

entity Nb_8bits is
    Port ( CLK : in  STD_LOGIC;
		   RESET : in STD_LOGIC;
           Q  : out STD_LOGIC_VECTOR (7 downto 0)); 
end Nb_8bits;

architecture Behavioral of Nb_8bits is
signal internalQ : STD_LOGIC_VECTOR (7 downto 0) :=CONV_STD_LOGIC_VECTOR(0, 8); -- Signal used to connect 1Bit components
signal internalCLK : STD_LOGIC :='0'; -- Internal clock, generated by the clock manager

component Nb_1bit -- Declaration of the 1Bit component
	Port ( D   : in  STD_LOGIC;
		   RESET : in STD_LOGIC;
		   DEFAULT : in STD_LOGIC;
           H   : in STD_LOGIC;
           Q   : out  STD_LOGIC);
end component;

component clock_manager -- Declaration of the clock manager
    Port ( MAINCLK : in STD_LOGIC;
           BAUDRATE : in INTEGER;
           CLKOUT : out STD_LOGIC);
end component;

begin
Q(0) <= internalQ(0);
Q(1) <= internalQ(1);
Q(2) <= internalQ(2);
Q(3) <= internalQ(3);
Q(4) <= internalQ(4);
Q(5) <= internalQ(5);
Q(6) <= internalQ(6);
Q(7) <= internalQ(7);

-- Clock generator
CLKMGT : clock_manager port map (CLK, 1000000, internalCLK);
-- We will take baudrate=1000000 for the test bench (for faster simulation calcul)
-- and baudrate=2 to test on ZBoard (2 shifts per second)

-- First number
 NB1 : Nb_1bit port map (internalQ(7), RESET, '1', internalCLK, internalQ(0)); 
-- Second number
 NB2 : Nb_1bit port map (internalQ(0), RESET, '0', internalCLK, internalQ(1)); 
-- ...
 NB3 : Nb_1bit port map (internalQ(1), RESET, '0', internalCLK, internalQ(2));  
-- ...
 NB4 : Nb_1bit port map (internalQ(2), RESET, '1', internalCLK, internalQ(3));
-- ...
 NB5 : Nb_1bit port map (internalQ(3), RESET, '1', internalCLK, internalQ(4));
-- ...
 NB6 : Nb_1bit port map (internalQ(4), RESET, '0', internalCLK, internalQ(5));
-- ...
 NB7 : Nb_1bit port map (internalQ(5), RESET, '0', internalCLK, internalQ(6));
 -- ...
 NB8 : Nb_1bit port map (internalQ(6), RESET, '1', internalCLK, internalQ(7));
-- ...

end Behavioral;