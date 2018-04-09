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
       S: in std_logic_vector(2 downto 0);
       Z : out std_logic_vector(15 downto 0));
       
end multiplexer;

architecture Behavioral of multiplexer is

begin

 	 Z <=In7 when (S="000") else
            In6 when (S="001") else
            In5 when (S="010") else
            In4 when (S="011") else
            In3 when (S="100") else
            In2 when (S="101") else
            In1 when (S="110") else
            In0;

       

end Behavioral;
