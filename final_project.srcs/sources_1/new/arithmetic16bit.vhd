----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06.03.2018 09:32:43
-- Design Name: 
-- Module Name: logic_circuit_a_b - Behavioral
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

entity arithmetic16bit is
   Port(
    S0, S1, C_in : in STD_LOGIC;
    A, B : in STD_LOGIC_VECTOR(15 downto 0);
    C, V: out STD_LOGIC;
    Y: out STD_LOGIC_VECTOR(15 downto 0)
    );
end arithmetic16bit;

architecture Behavioral of arithmetic16bit is
    Component b_to_y_16bit 
        Port (
            S0, S1: in STD_LOGIC;
            inB: in STD_LOGIC_VECTOR(15 downto 0);
            Y: out STD_LOGIC_VECTOR(15 downto 0)
        );
    End Component;
    
    Component full_adder_16bit
        Port (
       A: in std_logic_vector(15 downto 0);
       B: in std_logic_vector(15 downto 0);
       Cin: in std_logic;
       Cout: out std_logic;
       Vout: out std_logic;
       S : out std_logic_vector(15 downto 0)
    );
    End Component;
    signal c_sig, c_out_sig, v_out_sig: std_logic;
    signal logic_out_sig, g_sig : STD_LOGIC_VECTOR(15 downto 0);
begin
    mux: b_to_y_16bit PORT MAP (
        S0 => S0,
        S1 => S1,
        inB => B,
        Y => logic_out_sig
    ); 
    
    
    adder00: full_adder_16bit PORT MAP (
    A=> A,
    B => logic_out_sig,
    Cin =>C_in,
    S => g_sig,
    Cout => c_out_sig,
    Vout => v_out_sig
    );
    
   V <= v_out_sig;
   Y<= g_sig;
   C <= c_out_sig;
   
end Behavioral;