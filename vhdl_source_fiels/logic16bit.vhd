
----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06.03.2018 21:53:27
-- Design Name: 
-- Module Name: logic_circuit_b - Behavioral
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

entity logic16bit is
 Port(
    S0, S1: in STD_LOGIC;
    A, B : in STD_LOGIC_VECTOR(15 downto 0);
    G: out STD_LOGIC_VECTOR(15 downto 0)
    );
end logic16bit;

architecture Behavioral of logic16bit is
    Component mux4_to_1
        Port (
           A, B, D, C:  in STD_LOGIC_VECTOR(15 downto 0);
           S0, S1: in STD_LOGIC;
           Z: out STD_LOGIC_VECTOR(15 downto 0)
        );
    End Component;
    signal sum0, sum1, sum2 : STD_LOGIC_VECTOR(15 downto 0);
    signal sum3, result: STD_LOGIC_VECTOR(15 downto 0);
    
begin
    sum0 <= A and B ;
    sum1 <= A or  B;
    sum2 <= A xor B;
    sum3 <= not A ;
    
    mux00: mux4_to_1 PORT MAP(
    S0 => S0,
    S1 => S1,
    A =>sum0,
    B=>sum1,
    C=>sum2,
    D=>sum3,
    Z =>result    
    );
    G <= result;
end Behavioral;
