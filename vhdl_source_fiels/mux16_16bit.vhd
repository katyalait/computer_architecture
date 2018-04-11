----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.04.2018 21:25:26
-- Design Name: 
-- Module Name: mux16_16bit - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mux8_16bit is
        port (
        In0, In1, In2, In3, In4, In5, In6, In7 : in std_logic_vector(15 downto 0);
        S: in std_logic_vector(2 downto 0);
       Z : out std_logic_vector(15 downto 0));
end mux8_16bit;

architecture Behavioral of mux8_16bit is

begin
 	 Z <=  In0 when (S="000") else
      In1 when (S="001") else
      In2 when (S="010") else
      In3 when (S="011") else
      In4 when (S="100") else
      In5 when (S="101") else
      In6 when (S="110") else
     In7 when (S="111") else
     x"0000" ;

end Behavioral;
