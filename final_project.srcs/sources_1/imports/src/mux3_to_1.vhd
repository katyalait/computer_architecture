----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.03.2018 22:18:41
-- Design Name: 
-- Module Name: mux3_to_1 - Behavioral
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

entity mux3_to_1 is
--  Port ( );
    Port(
    In0, In1, In2: in STD_LOGIC;
    S0, S1 : in STD_LOGIC;
    Z: out STD_LOGIC
    );
    
end mux3_to_1;

architecture Behavioral of mux3_to_1 is

begin
    Z <= In0 after 1ns when S1= '0' and S0= '0' else
        In1 after 1ns when S1 = '0' and S0 = '1' else
        In2 after 1ns when S1 = '1' and S0 = '0' else
        '0' after 1ns;
        

end Behavioral;
