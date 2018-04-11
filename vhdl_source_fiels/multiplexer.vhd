----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/15/2018 02:13:01 PM
-- Design Name: 
-- Module Name: multiplexer - Behavioral
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

entity multiplexer is
Port ( 
        In0, In1, In2, In3, In4, In5, In6, In7 : in std_logic_vector(15 downto 0);
        In8, In9, In10, In11, In12, In13, In14, In15 : in std_logic_vector(15 downto 0);
        S: in std_logic_vector(3 downto 0);
       Z : out std_logic_vector(15 downto 0));
       
end multiplexer;

architecture Behavioral of multiplexer is

begin

 	 Z <=  In0 when (S="0000") else
            In1 when (S="0001") else
            In2 when (S="0010") else
            In3 when (S="0011") else
            In4 when (S="0100") else
            In5 when (S="0101") else
            In6 when (S="0110") else
           In7 when (S="0111") else
           In8 when (S="1000") else
           In9 when (S="1001") else
           In10 when (S="1010") else
           In11 when (S="1011") else
           In12 when (S="1100") else
           In13 when (S="1101") else
           In14 when (S="1110") else
           In15 when (S="1111") else
           x"0000" ;

       

end Behavioral;
