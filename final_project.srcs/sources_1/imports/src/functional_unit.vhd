----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.03.2018 14:42:00
-- Design Name: 
-- Module Name: functional_unit - Behavioral
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

entity functional_unit is
    Port(
    a_in: in STD_LOGIC_VECTOR(15 downto 0);
    b_in : in STD_LOGIC_VECTOR(15 downto 0);
    f_select: in STD_LOGIC_VECTOR(4 downto 0);
    c_out, v_out, z_out : out STD_LOGIC;
    n_out   :out std_logic;
    y_out: out STD_LOGIC_VECTOR(15 downto 0)
    );
end functional_unit;

architecture Behavioral of functional_unit is
Component alu_unit
    Port(
     a_in: in STD_LOGIC;
     b_in: in STD_LOGIC;
     G_select: in STD_LOGIC_VECTOR(3 downto 0);
     V, C : out STD_LOGIC;
     G_out : out STD_LOGIC
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

signal c_result, v_result: std_logic;
signal result, shift_result, overall_result: std_logic_vector(15 downto 0);
signal S3, S2, S1, S0, C_in : std_logic;

begin
    
    shifter00: shifter PORT MAP (
    B => b_in,
    FS => f_select,
    IL => '0',
    IR => '0',
    H => shift_result
    );    
    
    mux00: mux2_16bit PORT MAP (
    A => result,
    B => shift_result,
    S => ,
    G => overall_result
    );
    
    process(sel2) begin
    if(sel2(0)='0' and sel2(1)= '0') then
        c_out <= C15;
    else
        c_out <='0';
    end if;
  end process;
  process(a_in, b_in, result, sel2) begin
    if (a_in(15)= '1' and b_in(15) = '1' and result(15) = '0' and sel2="00") then
    v_result<= '1';
    elsif (a_in(15)= '0' and b_in(15) = '0' and result(15) = '1' and sel2="00") then
     v_result <= '1';
     else 
     v_result<= '0';
    end if;
  end process;
  v_out <= v_result;
  
  process(overall_result) begin
    if(overall_result = x"0000") then
        z_out<= '1';
    else 
        z_out <='0';
    end if;
  end process;
  
  process(overall_result) begin
    if (overall_result(15) = '1') then
        n_out <= '1';
    else
        n_out <= '0';
    end if;
  end process;
  y_out <= overall_result;
end Behavioral;
