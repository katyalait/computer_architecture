----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.02.2018 14:12:51
-- Design Name: 
-- Module Name: half_adder - Behavioral
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

entity full_adder is
    port (
    X, Y, Cin: in STD_LOGIC; --bits and carry
    S,  Cout : out STD_LOGIC -- result and carry out
        );
end full_adder;

architecture Behavioral of full_adder is
signal result, carry: STD_LOGIC; -- create signals to then transfer to outs

begin
    --two outputs determined by logical functions of the full adder
   result <= (X xor Y) xor Cin after 1ns; 
   carry <= (X and Y) or ((X xor Y) and Cin) after 1ns;
   S <= result;
   Cout <= carry;
end Behavioral;
