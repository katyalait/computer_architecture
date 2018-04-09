----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.04.2018 18:17:02
-- Design Name: 
-- Module Name: alu_16_bit_adder - Behavioral
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

entity alu_16_bit_adder is
Port (
    a_in : in std_logic_vector(15 downto 0);
    b_in : in std_logic_vector(15 downto 0);
    g_sel: in std_logic_vector(3 downto 0);
    result : out std_logic_vector(15 downto 0);
    c_out, v_out, z_out, n_out : out std_logic
);
end alu_16_bit_adder;

architecture Behavioral of alu_16_bit_adder is
signal c0, c1, c2, c3, c4, c5, c6, c7, c8, c9, c10, c11, c12, c13, c14, c15 : std_logic;
signal f_out : std_logic_vector (15 downto 0);
Component alu_unit
    Port(
        a_in: in STD_LOGIC;
        b_in, C_in: in STD_LOGIC;
        S0, S1, S2: in STD_LOGIC;
        C : out STD_LOGIC;
        G_out : out STD_LOGIC
    );
    end Component;
  begin
  
  alu_0 : alu_unit PORT MAP (
  a_in=> a_in(0),
  b_in=> b_in(0),
  C_in => g_sel(0),
  S0 => g_sel(1),
  S1 => g_sel(2),
  S2 => g_sel(3),
  C => c0,
  G_out => f_out(0)
  
  );
  alu_1 : alu_unit PORT MAP (
  a_in=> a_in(1),
  b_in=> b_in(1),
  C_in => c0,
  S0 => g_sel(1),
  S1 => g_sel(2),
  S2 => g_sel(3),
  C => c1,
  G_out => f_out(1)
  
  );
  
  alu_2: alu_unit PORT MAP (
  a_in=> a_in(2),
  b_in=> b_in(2),
  C_in => c1,
  S0 => g_sel(1),
  S1 => g_sel(2),
  S2 => g_sel(3),
  C => c2,
  G_out => f_out(2)
  
  );
  alu_3: alu_unit PORT MAP (
  a_in=> a_in(3),
  b_in=> b_in(3),
  C_in => c2,
  S0 => g_sel(1),
  S1 => g_sel(2),
  S2 => g_sel(3),
  C => c3,
  G_out => f_out(3)
  
  );
  
  alu_4: alu_unit PORT MAP (
  a_in=> a_in(4),
  b_in=> b_in(4),
  C_in => c3,
  S0 => g_sel(1),
  S1 => g_sel(2),
  S2 => g_sel(3),
  C => c4,
  G_out => f_out(1)
  
  );
  
  alu_5 : alu_unit PORT MAP (
  a_in=> a_in(5),
  b_in=> b_in(5),
  C_in => c4,
  S0 => g_sel(1),
  S1 => g_sel(2),
  S2 => g_sel(3),
  C => c5,
  G_out => f_out(5)
  
  );
  
  alu_6 : alu_unit PORT MAP (
  a_in=> a_in(6),
  b_in=> b_in(6),
  C_in => c5,
  S0 => g_sel(1),
  S1 => g_sel(2),
  S2 => g_sel(3),
  C => c6,
  G_out => f_out(6)
  
  );
  
  alu_7 : alu_unit PORT MAP (
  a_in=> a_in(7),
  b_in=> b_in(7),
  C_in => c6,
  S0 => g_sel(1),
  S1 => g_sel(2),
  S2 => g_sel(3),
  C => c7,
  G_out => f_out(7)
  
  );
  
  alu_8 : alu_unit PORT MAP (
  a_in=> a_in(8),
  b_in=> b_in(8),
  C_in => c7,
  S0 => g_sel(1),
  S1 => g_sel(2),
  S2 => g_sel(3),
  C => c8,
  G_out => f_out(8)
  
  );
  
  alu_9 : alu_unit PORT MAP (
  a_in=> a_in(9),
  b_in=> b_in(9),
  C_in => c8,
  S0 => g_sel(1),
  S1 => g_sel(2),
  S2 => g_sel(3),
  C => c9,
  G_out => f_out(9)
  
  );
  
  alu_10 : alu_unit PORT MAP (
  a_in=> a_in(10),
  b_in=> b_in(10),
  C_in => c9,
  S0 => g_sel(1),
  S1 => g_sel(2),
  S2 => g_sel(3),
  C => c10,
  G_out => f_out(10)
  
  );
  
  alu_11 : alu_unit PORT MAP (
  a_in=> a_in(11),
  b_in=> b_in(11),
  C_in => c10,
  S0 => g_sel(1),
  S1 => g_sel(2),
  S2 => g_sel(3),
  C => c11,
  G_out => f_out(11)
  
  );
  
  alu_12 : alu_unit PORT MAP (
  a_in=> a_in(12),
  b_in=> b_in(12),
  C_in => c11,
  S0 => g_sel(1),
  S1 => g_sel(2),
  S2 => g_sel(3),
  C => c12,
  G_out => f_out(12)
  
  );
  
  alu_13 : alu_unit PORT MAP (
  a_in=> a_in(13),
  b_in=> b_in(13),
  C_in => c12,
  S0 => g_sel(1),
  S1 => g_sel(2),
  S2 => g_sel(3),
  C => c13,
  G_out => f_out(13)
  
  );
  
  alu_14 : alu_unit PORT MAP (
  a_in=> a_in(14),
  b_in=> b_in(14),
  C_in => c13,
  S0 => g_sel(1),
  S1 => g_sel(2),
  S2 => g_sel(3),
  C => c14,
  G_out => f_out(14)
  
  ); 
 alu_15 : alu_unit PORT MAP (
  a_in=> a_in(15),
  b_in=> b_in(15),
  C_in => c14,
  S0 => g_sel(1),
  S1 => g_sel(2),
  S2 => g_sel(3),
  C => c15,
  G_out => f_out(15)
  
  );
  result <= f_out after 1ns;
  v_out <= c15 XOR c14 after 1ns;
  c_out <= c15 after 1ns;
  n_out <= f_out(15) after 1ns;
  z_out <= '1' when f_out = x"0000" else '0' after 1ns;
  
  
end Behavioral;
