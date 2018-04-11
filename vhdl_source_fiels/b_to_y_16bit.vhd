----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.04.2018 21:03:05
-- Design Name: 
-- Module Name: b_to_y_16bit - Behavioral
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

entity b_to_y_16bit is
    Port ( inB : in  STD_LOGIC_VECTOR (15 downto 0);
           Y : out  STD_LOGIC_VECTOR (15 downto 0);
           S0 : in std_logic;
           S1 : in std_logic
		);
end b_to_y_16bit;

architecture Behavioral of b_to_y_16bit is
--   | s1 s0 | f(B)  | Y |
--------------------------------
--   | 0   0 | 0 + 0 | 0 |
--   | 0   1 | 0 + B | B |
--   | 1   0 | B'+ 0 | B'|
--   | 1   1 | B + B'| 1 |
begin
        Y <= x"0000" when (S0='0' and S1='0') else ---00
                inB when (S0='1' and S1='0') else---01
                (not inB) when (S0='0' and S1='1') else --10
                x"FFFF" when (S0='1' and S1='1');
end Behavioral;

