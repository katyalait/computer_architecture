----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06.03.2018 09:40:08
-- Design Name: 
-- Module Name: mux4_to_1 - Behavioral
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

entity mux4_to_1 is
    Port (
        S0, S1:  in STD_LOGIC;
        A,B,C,D : in STD_LOGIC_VECTOR(15 downto 0);
        Z: out STD_LOGIC_VECTOR(15 DOWNTO 0)
    );
end mux4_to_1;

architecture Behavioral of mux4_to_1 is
   signal result : std_logic_vector(15 downto 0);
begin

    result <= A when (S1 = '0' AND S0 = '0') else
            B when (S1 = '0' AND S0= '1') else
            C when (S1 = '1' AND S0 = '0') else
            D when (S1 = '1' AND S0 = '1') else
            x"0000";
            
    Z <= result;
end Behavioral;

