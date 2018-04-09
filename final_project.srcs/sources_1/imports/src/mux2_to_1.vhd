----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.03.2018 12:45:17
-- Design Name: 
-- Module Name: mux2_to_1 - Behavioral
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

entity mux2_to_1 is
    Port(
        s0, s1 : in STD_LOGIC;
        b_in: in STD_LOGIC;
        y_out: out STD_LOGIC
    );
    
end mux2_to_1;

architecture Behavioral of mux2_to_1 is
signal sig1, sig2, result: STD_LOGIC;
begin

--   | s1 s0 | f(B)  | Y |
--------------------------------
--   | 0   0 | 0 + 0 | 0 |
--   | 0   1 | 0 + B | B |
--   | 1   0 | B'+ 0 | B'|
--   | 1   1 | B + B'| 1 |


    sig1 <= (s0 and b_in); --s0B
    sig2 <= (s1 and (not b_in)); -- +s1~b
    result <= (sig1 or sig2);
    y_out <= result;

end Behavioral;
