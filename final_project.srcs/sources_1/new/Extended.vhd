library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Extend is
    Port ( DR : in  STD_LOGIC_VECTOR (2 downto 0);
           SB : in  STD_LOGIC_VECTOR (2 downto 0);
           EXT : out  STD_LOGIC_VECTOR (15 downto 0));
end Extend;

architecture Behavioral of Extend is

begin
	EXT(15 downto 6) <= "0000000000" when (DR(2)='0') else "1111111111";
	EXT(5 downto 3) <= DR;
	EXT(2 downto 0) <= SB;
end Behavioral;
