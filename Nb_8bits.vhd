
-- This component writes the binary number that
-- corresponds to the switches except if RAZ='1'

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Nb_8bits is
    Port ( CLK : in  STD_LOGIC;
           RAZ : in STD_LOGIC;
           S   : in STD_LOGIC_VECTOR (7 downto 0); -- Switches positions, S(i)='1' if the switch is ON
           A   : out STD_LOGIC_VECTOR (7 downto 0));
end Nb_8bits;

architecture Behavioral of Nb_8bits is

component Nb_1bit -- Declaration of the 1Bit component
  Port ( D   : in  STD_LOGIC;
         RAZ : in  STD_LOGIC;
         Q   : out  STD_LOGIC);
end component;

begin
-- First number
 NB1 : Nb_1bit port map (S(0),RAZ,A(0)); 
-- Second number
 NB2 : Nb_1bit port map (S(1),RAZ,A(1)); 
-- ...
 NB3 : Nb_1bit port map (S(2),RAZ,A(2)); 
-- ...
 NB4 : Nb_1bit port map (S(3),RAZ,A(3)); 
-- ...
 NB5 : Nb_1bit port map (S(4),RAZ,A(4)); 
-- ...
 NB6 : Nb_1bit port map (S(5),RAZ,A(5)); 
-- ...
 NB7 : Nb_1bit port map (S(6),RAZ,A(6)); 
-- ...
 NB8 : Nb_1bit port map (S(7),RAZ,A(7)); 
-- ...

end Behavioral;