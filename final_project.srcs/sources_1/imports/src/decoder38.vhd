----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/15/2018 11:26:46 AM
-- Design Name: 
-- Module Name: decoder38 - Behavioral
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity decoder38 is
    port( A: in STD_LOGIC_VECTOR(2 downto 0);
    D: out STD_LOGIC_VECTOR(7 downto 0)
    );

end decoder38;

architecture Behavioral of decoder38 is
    
begin
   D(0)<= '1' after 1ns when A = "000" else '0' after 1ns;
   D(1)<= '1' after 1ns when A = "001" else '0' after 1ns;
   D(2)<= '1' after 1ns when A = "010" else '0' after 1ns;
   D(3)<= '1' after 1ns when A = "011" else '0' after 1ns;
   D(4)<= '1' after 1ns when A = "100" else '0' after 1ns;
   D(5)<= '1' after 1ns when A = "101" else '0' after 1ns;
   D(6)<= '1' after 1ns when A = "110" else '0' after 1ns;
   D(7)<= '1' after 1ns when A = "111" else '0' after 1ns;
   			

end Behavioral;
