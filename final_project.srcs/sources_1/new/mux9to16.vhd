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

entity mux9to16bit is
        port (
        In0, In1, In2, In3, In4, In5, In6, In7, In8 : in std_logic_vector(15 downto 0);
        S: in std_logic_vector(3 downto 0);
       Z : out std_logic_vector(15 downto 0));
end mux9to16bit;

architecture Behavioral of mux9to16bit is

begin
 	 Z <=  In0 when (S="0000") else
      In1 after 5ns when (S="0001") else
      In2 after 5ns when (S="0010") else
      In3 after 5ns when (S="0011") else
      In4 after 5ns when (S="0100") else
      In5 after 5ns when (S="0101") else
      In6 after 5ns when (S="0110") else
     In7 after 5ns when (S="0111") else
     In8 after 5ns when (S="1000") else
     x"0000" after 5ns ;

end Behavioral;
