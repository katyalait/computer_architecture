----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11.03.2018 20:26:25
-- Design Name: 
-- Module Name: datapath - Behavioral
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

entity datapath is
    Port (
		data_in : in std_logic_vector(15 downto 0); -- 
		constant_in : in std_logic_vector(15 downto 0);
		a_in : in std_logic_vector(2 downto 0);  -- a address select
		b_in : in std_logic_vector(2 downto 0);  -- b address select
		d_sel : in std_logic_vector(2 downto 0); -- d address storage select
		FS : in std_logic_vector(4 downto 0); -- function select
		write_enable : in std_logic; -- enable writing to reg file
		ta:    in std_logic;
		td:    in std_logic;
		tb:    in std_logic;
		Clk:    in std_logic;
		v_out : out std_logic; -- overflow
		c_out : out std_logic; -- carry
		n_out : out std_logic; -- negative bit
		z_out : out std_logic; -- zero bit
		mb_sel : in std_logic; -- selects between constant_in (1) and b_out (0) from reg file
		md_sel : in std_logic; -- selects between data_in  (1) and y_out (0) from f_unit
		address_a_out : out std_logic_vector(15 downto 0); -- signal from bus a
		address_b_out : out std_logic_vector(15 downto 0); -- signal from bus b
		f_out : out std_logic_vector(15 downto 0); -- result from functional unit
		-- registers from the reg file for testing purposes
		reg_0 : out std_logic_vector(15 downto 0);
		reg_1 : out std_logic_vector(15 downto 0);
		reg_2 : out std_logic_vector(15 downto 0);
		reg_3 : out std_logic_vector(15 downto 0);
		reg_4 : out std_logic_vector(15 downto 0);
		reg_5 : out std_logic_vector(15 downto 0);
		reg_6 : out std_logic_vector(15 downto 0);
		reg_7 : out std_logic_vector(15 downto 0);
		reg_8 : out std_logic_vector(15 downto 0)
	);
end datapath;


architecture Behavioral of datapath is
Component register_file
    Port(
                a_sel: in std_logic_vector(2 downto 0);	
                b_sel : in std_logic_vector(2 downto 0);
                d_sel : in std_logic_vector(2 downto 0);
                data_load : in std_logic;
                td : in std_logic;
                tb : in std_logic;
                ta : in std_logic;
                Clk : in std_logic;
                data_in : in std_logic_vector(15 downto 0);
                a_out : out std_logic_vector(15 downto 0);
                b_out : out std_logic_vector(15 downto 0);
                r0 : out std_logic_vector(15 downto 0);
                r1 : out std_logic_vector(15 downto 0);
                r2: out std_logic_vector(15 downto 0);
                r3 : out std_logic_vector(15 downto 0);
                r4 : out std_logic_vector(15 downto 0);
                r5 : out std_logic_vector(15 downto 0);
                r6 : out std_logic_vector(15 downto 0);
                r7 : out std_logic_vector(15 downto 0);
                r8 : out std_logic_vector(15 downto 0)
    );
End Component;

Component f_unit 
    Port (
    a_in: in STD_LOGIC_VECTOR(15 downto 0);
    b_in : in STD_LOGIC_VECTOR(15 downto 0);
    f_select: in STD_LOGIC_VECTOR(4 downto 0);
    c_out: out STD_LOGIC;
    v_out: out STD_LOGIC;
    z_out : out STD_LOGIC;
    n_out   :out std_logic;
    y_out: out STD_LOGIC_VECTOR(15 downto 0)
    );
End Component;



Component mux2to1
    Port(
    in0: in std_logic_vector(15 downto 0);
    in1: in std_logic_vector(15 downto 0);
    s: in std_logic;
    Z: out std_logic_vector(15 downto 0)
    );
End Component;

signal a_data, b_data, mb_result, md_result: std_logic_vector(15 downto 0);
signal fu_result, bus_b, bus_a: std_logic_vector(15 downto 0);
begin
    -- extract reg's from reg file or return output of md_sel to store
    reg_file: register_file PORT MAP(
    a_sel => a_in, --a select
    b_sel => b_in, -- b select
    d_sel=>d_sel, -- d select if storing data to new register 
    data_load=>write_enable,
    Clk =>Clk,
    ta => ta,
    td => td,
    tb => tb,
    data_in => md_result,
    a_out=>bus_a,
    b_out=>bus_b,
    r0 => reg_0,
    r1 => reg_1,
    r2 => reg_2,
    r3 => reg_3,
    r4 => reg_4,
    r5 => reg_5,
    r6 => reg_6,
    r7 => reg_7,
    r8 =>reg_8
    );
    
    --MB select: choosing between output B from reg file and Constant_in
    -- default is mb = 0 where the datapath uses the output B. 
    mux_b: mux2to1 PORT MAP( 
    in0=>bus_b,
    in1=>constant_in,
    s=>mb_sel,
    Z=>mb_result
    );
    --functional unit performs necessary operations as indicated by the FS select
    func_unit: f_unit PORT MAP(
    a_in => bus_a,
    b_in => mb_result,
    f_select => FS,
    c_out => c_out,
    v_out => v_out,
    z_out => z_out,
    n_out => n_out,
    y_out =>fu_result
    );
    --MD Select: choosing between result from functional unit and the data input.
    -- default is md = 0 where the datapath chooses from functional unit unless 
    -- otherwise indicated. 
    mux_d: mux2to1 PORT MAP(
    in0 => fu_result,
    in1 => data_in,
    s => md_sel,
    Z => md_result
    );
    address_a_out <= bus_a;
    address_b_out <= mb_result;
    f_out <= md_result;
    
end Behavioral;
