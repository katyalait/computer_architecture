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
Component alu_16_bit_adder
    Port(
    a_in : in std_logic_vector(15 downto 0);
    b_in : in std_logic_vector(15 downto 0);
    g_sel: in std_logic_vector(3 downto 0);
    result : out std_logic_vector(15 downto 0);
    c_out, v_out, z_out, n_out : out std_logic
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

Component mux2_16bit 
    Port(
    A, B: in STD_LOGIC_VECTOR(15 downto 0);
    S: in STD_LOGIC;
    G: out STD_LOGIC_VECTOR(15 downto 0)
    );
End Component;

signal c_result, v_result, n_result, z_result: std_logic;
signal alu_result, shift_result, overall_result: std_logic_vector(15 downto 0);
signal S3, S2, S1, S0, C_in : std_logic;

begin
      S3 <= f_select(4);
      S2 <= f_select(3);
      S1 <= f_select(2);
      S0 <= f_select(1);
      C_in <=f_select(0);


 alu_unit : alu_16_bit_adder PORT MAP (
    a_in => a_in,
    b_in => b_in,
    g_sel(0) =>C_in,
    g_sel(1) => S0,
    g_sel(2) => S1,
    g_sel(3) => S2,
    result => alu_result,
    c_out => c_result,
    v_out => v_result,
    z_out => z_result,
    n_out => n_result
 );

 shifter00: shifter PORT MAP (
    B => b_in,
    FS => f_select,
    IL => '0',
    IR => '0',
    H => shift_result
    ); 
    
 multiplexer: mux2_16bit PORT MAP(
    A => alu_result,
    B => shift_result,
    S => S3,
    G => overall_result
 );
 
 c_out <= c_result;
 v_out <= v_result;
 z_out <= z_result;
 n_out <= n_result;
 y_out <= overall_result;
 
end Behavioral;
