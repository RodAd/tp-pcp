
-- This is a 1 bit component (D bascule)
-- it sets the input D to the ouput Q when H increases from 0 to 1,
-- except if RAZ='1'

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Nb_1bit is
    Port ( D : in STD_LOGIC;
           H : in STD_LOGIC;
           RAZ : in STD_LOGIC;
           Q : out STD_LOGIC);
end Nb_1bit;

architecture Behavioral of Nb_1bit is
signal internalQ : STD_LOGIC :='0';

begin
Q <= internalQ;
process (H, D, RAZ)
begin
if RAZ='1' then internalQ <= '0';
elsif (H'event and H='1') then
    if D='0' then internalQ <='0';
    else internalQ <= '1';
    end if;
end if;
end process;
end Behavioral;