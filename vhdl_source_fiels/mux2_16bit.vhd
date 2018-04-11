----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.03.2018 15:32:44
-- Design Name: 
-- Module Name: mux2_16bit - Behavioral
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

entity mux2_16bit is
    Port (
        S: in STD_LOGIC;
        A,B: in STD_LOGIC_VECTOR(15 downto 0);
        G: out STD_LOGIC_VECTOR(15 downto 0)
    );
end mux2_16bit;

architecture Behavioral of mux2_16bit is
 
begin
    G <= A after 1ns when S = '0' else
        B after 1ns when S = '1' else
        x"0000" after 1ns;
end Behavioral;
