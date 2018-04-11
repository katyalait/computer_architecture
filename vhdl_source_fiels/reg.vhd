----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/13/2018 09:57:37 AM
-- Design Name: 
-- Module Name: reg - Behavioral
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

entity reg is
    Port( 
    D: in STD_LOGIC_VECTOR(15 downto 0);
    load, Clk :in STD_LOGIC;
    Q: out STD_LOGIC_VECTOR(15 downto 0));
           
end reg;

architecture Behavioral of reg is
  begin
 process(Clk)
      begin
      if (rising_edge(Clk)) then
          if load='1' then
              Q <= D after 5 ns;
          end if;
      end if;
  end process;       
end Behavioral;
