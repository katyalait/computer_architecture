----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.04.2018 13:15:22
-- Design Name: 
-- Module Name: f_unit - Behavioral
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

entity f_unit is
Port(
    a_in: in STD_LOGIC_VECTOR(15 downto 0);
    b_in : in STD_LOGIC_VECTOR(15 downto 0);
    f_select: in STD_LOGIC_VECTOR(4 downto 0);
    c_out: out STD_LOGIC;
    v_out: out STD_LOGIC;
    z_out : out STD_LOGIC;
    n_out   :out std_logic;
    y_out: out STD_LOGIC_VECTOR(15 downto 0)
    );
end f_unit;

architecture Behavioral of f_unit is

Component arithmetic16bit
    Port(
        S0, S1, C_in : in STD_LOGIC;
        A, B : in STD_LOGIC_VECTOR(15 downto 0);
        C, V: out STD_LOGIC;
        Y: out STD_LOGIC_VECTOR(15 downto 0)
    );
End Component;

Component shifter 
    Port(
    B: in STD_LOGIC_VECTOR(15 downto 0);
    FS: in STD_LOGIC_VECTOR(4 downto 0);
    IL, IR : in STD_LOGIC;
    H: out STD_LOGIC_VECTOR(15 downto 0)
    );
End Component;

Component logic16bit 
Port (
    S0, S1: in STD_LOGIC;
    A, B : in STD_LOGIC_VECTOR(15 downto 0);
    G: out STD_LOGIC_VECTOR(15 downto 0)

);
End Component;
Component mux2_16bit 
    Port(
    A, B: in STD_LOGIC_VECTOR(15 downto 0);
    S: in STD_LOGIC;
    G: out STD_LOGIC_VECTOR(15 downto 0)
    );
End Component;

signal c_result, v_result, n_result, z_result: std_logic;
signal arithmetic_result, shift_result, overall_result, logic_result, mux_result: std_logic_vector(15 downto 0);
signal S3, S2, S1, S0, C_in : std_logic;
begin
      S3 <= f_select(4);
      S2 <= f_select(3);
      S1 <= f_select(2);
      S0 <= f_select(1);
      C_in <=f_select(0);


arithmetic: arithmetic16bit PORT MAP (
    S0 => S0,
    S1 => S1,
    A => a_in,
    B => b_in,
    C_in => C_in,
    C => c_result,
    V => v_result,
    Y =>arithmetic_result
);

logic_comp: logic16bit PORT MAP (
    S0 => S0,
    S1 => S1,
    A => a_in,
    B => b_in,
    G => logic_result
);
 shifter00: shifter PORT MAP (
    B => b_in,
    FS => f_select,
    IL => '0',
    IR => '0',
    H => shift_result
    ); 
 
 mux1 : mux2_16bit PORT MAP (
    A => arithmetic_result,
    B => logic_result,
    S => S2,
    G => mux_result
 );
 multiplexer: mux2_16bit PORT MAP(
    A => mux_result,
    B => shift_result,
    S => S3,
    G => overall_result
 );
 
 
 
 c_out <= c_result;
 v_out <= v_result;
 z_out <= '1' when overall_result = x"0000" else '0' ;
 n_out <= '1' when overall_result(15) = '1' else '0' ;
 y_out <= overall_result;
 
end Behavioral;
