----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06.03.2018 18:51:30
-- Design Name: 
-- Module Name: alu_unit - Behavioral
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

entity alu_unit is
    Port(
    a_in: in STD_LOGIC;
    b_in, C_in: in STD_LOGIC;
    S0, S1, S2 : in STD_LOGIC; --g select = s2 s1 s0 c_in
    C : out STD_LOGIC;
    G_out : out STD_LOGIC
    
    );
end alu_unit;

architecture Behavioral of alu_unit is
        Component logic_circuit_a_b 
         Port (
            S0, S1: in STD_LOGIC;
            A, B : in STD_LOGIC;
            G: out STD_LOGIC
           );
        End Component;
        Component mux1bit_selector
            Port(
            s, a, b : in STD_LOGIC;
            y : out STD_LOGIC
            );
          End Component;
        Component logic_circuit_b
            Port (
             S0, S1, C_in : in STD_LOGIC;
             A,B: in STD_LOGIC;
             Y, C: out STD_LOGIC
            );
         End Component;
  signal adder_out, logic_out, c_result, result: STD_LOGIC;
begin

    --logic circuit
    logic01: logic_circuit_a_b PORT MAP (
    S0 => S0,
    S1 => S1,
    A => a_in,
    B => b_in,
    G => logic_out
    );
    
    --arithmetic circuit
    logic00: logic_circuit_b PORT MAP (
    S0 => S0,
    S1 => S1,
    C_in => C_in,
    A => a_in,
    B =>b_in,
    C =>c_result,
    Y=>adder_out
    );
    
    
    
    multiplexer: mux1bit_selector PORT MAP (
    s => S2, --most significant bit of g_sel determines the output
    a => adder_out,
    b => logic_out,
    y => result
    );
    
    G_out <= result after 1ns ;
    C <= c_result after 1ns;
    
end Behavioral;
