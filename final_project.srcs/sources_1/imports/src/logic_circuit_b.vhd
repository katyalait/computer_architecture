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

entity logic_circuit_b is
   Port(
    S0, S1, C_in : in STD_LOGIC;
    A : in STD_LOGIC;
    B : in STD_LOGIC;
    Y, C: out STD_LOGIC
    );
end logic_circuit_b;

architecture Behavioral of logic_circuit_b is
    Component mux2_to_1 
        Port (
            s0, s1: in STD_LOGIC;
            b_in: in STD_LOGIC;
            y_out: out STD_LOGIC
        );
    End Component;
    
    Component full_adder 
        Port (
        X, Y, Cin: in STD_LOGIC;
        S,  Cout : out STD_LOGIC
                
        );
        End Component;
    signal c_sig, c_out_sig, logic_out_sig, g_sig : STD_LOGIC;
begin
    mux00: mux2_to_1 PORT MAP(
    s0 => S0,
    s1 => S1,
    b_in => B,
    y_out => logic_out_sig
    );
    
    
    adder00: full_adder PORT MAP (
    X => A,
    Y => logic_out_sig,
    Cin =>C_in,
    S => g_sig,
    Cout => c_out_sig
    );
    
    
   Y<= g_sig;
   C <= c_out_sig;
   
end Behavioral;
