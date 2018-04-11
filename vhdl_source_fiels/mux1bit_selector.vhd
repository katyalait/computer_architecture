----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.03.2018 11:23:15
-- Design Name: 
-- Module Name: mux1bit_selector - Behavioral
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

entity mux1bit_selector is
    Port(
    s: in std_logic;
    a, b : in STD_LOGIC;
    y : out STD_LOGIC
    );
end mux1bit_selector;

architecture Behavioral of mux1bit_selector is
signal result: std_logic;
begin
    
    result <= a when s = '0' else
              b when s='1' else
             '0';
              y<= result;
end Behavioral;
