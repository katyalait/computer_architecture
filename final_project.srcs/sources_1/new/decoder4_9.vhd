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

entity decoder4_9 is
    port( 
   AD0: in STD_LOGIC;
    AD1: in STD_LOGIC;
    AD2: in STD_LOGIC;
    AD3: in STD_LOGIC;
    RW : in STD_LOGIC;
    D0 : out STD_LOGIC;
    D1 : out STD_LOGIC;
    D2 : out STD_LOGIC;
    D3 : out STD_LOGIC;
    D4 : out STD_LOGIC;
    D5 : out STD_LOGIC;
    D6 : out STD_LOGIC;
    D7 : out STD_LOGIC;
    D8 : out STD_LOGIC
    );

end decoder4_9;


architecture Behavioral of decoder4_9 is
 signal A : STD_LOGIC_VECTOR(3 downto 0);

begin 
  A(0) <= AD0;
  A(1) <= AD1;
  A(2) <= AD2;
  A(3) <= AD3;  
    
     
   D0<= '1' after 1ns when A= "0000" and RW = '1' else '0' after 1ns;
   D1<= '1' after 1ns when A = "0001" and RW = '1'  else '0' after 1ns;
   D2<= '1' after 1ns when A= "0010" and RW = '1'  else '0' after 1ns;
   D3<= '1' after 1ns when A = "0011" and RW = '1'  else '0' after 1ns;
   D4<= '1' after 1ns when A = "0100" and RW = '1'  else '0' after 1ns;
   D5<= '1' after 1ns when A = "0101" and RW = '1'  else '0' after 1ns;
   D6<= '1' after 1ns when A = "0110" and RW = '1'  else '0' after 1ns;
   D7<= '1' after 1ns when A = "0111" and RW = '1'  else '0' after 1ns;
   D8<= '1' after 1ns when A = "1000" and RW = '1'  else '0' after 1ns;

   
   			

end Behavioral;
