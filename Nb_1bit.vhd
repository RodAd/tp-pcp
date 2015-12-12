
-- This is a 1 bit component
-- it sets the input D to the ouput Q, except if RAZ='1'

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Nb_1bit is
    Port ( D : in STD_LOGIC;
           RAZ : in STD_LOGIC;
           Q : out STD_LOGIC);
end Nb_1bit;

architecture Behavioral of Nb_1bit is
signal internalQ : STD_LOGIC :='0';

begin
Q <= D when RAZ = '0' else '0';
end Behavioral;