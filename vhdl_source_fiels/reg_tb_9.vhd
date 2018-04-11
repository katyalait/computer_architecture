----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.04.2018 22:09:09
-- Design Name: 
-- Module Name: reg9x16_tb - Behavioral
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


library ieee;
use ieee.std_logic_1164.all;

entity tb_register_file is
end tb_register_file;

architecture tb of tb_register_file is

    component register_file
        port (a_sel     : in std_logic_vector (2 downto 0);
              b_sel     : in std_logic_vector (2 downto 0);
              d_sel     : in std_logic_vector (2 downto 0);
              td        : in std_logic;
              ta        : in std_logic;
              tb        : in std_logic;
              Clk       : in std_logic;
              data_load : in std_logic;
              data_in   : in std_logic_vector (15 downto 0);
              a_out     : out std_logic_vector (15 downto 0);
              b_out     : out std_logic_vector (15 downto 0);
              r0        : out std_logic_vector (15 downto 0);
              r1        : out std_logic_vector (15 downto 0);
              r2        : out std_logic_vector (15 downto 0);
              r3        : out std_logic_vector (15 downto 0);
              r4        : out std_logic_vector (15 downto 0);
              r5        : out std_logic_vector (15 downto 0);
              r6        : out std_logic_vector (15 downto 0);
              r7        : out std_logic_vector (15 downto 0);
              r8        : out std_logic_vector (15 downto 0));
    end component;

    signal a_sel     : std_logic_vector (2 downto 0);
    signal b_sel     : std_logic_vector (2 downto 0);
    signal d_sel     : std_logic_vector (2 downto 0);
    signal td        : std_logic;
    signal ta        : std_logic;
    signal tb        : std_logic;
    signal Clk       : std_logic;
    signal data_load : std_logic;
    signal data_in   : std_logic_vector (15 downto 0);
    signal a_out     : std_logic_vector (15 downto 0);
    signal b_out     : std_logic_vector (15 downto 0);
    signal r0        : std_logic_vector (15 downto 0);
    signal r1        : std_logic_vector (15 downto 0);
    signal r2        : std_logic_vector (15 downto 0);
    signal r3        : std_logic_vector (15 downto 0);
    signal r4        : std_logic_vector (15 downto 0);
    signal r5        : std_logic_vector (15 downto 0);
    signal r6        : std_logic_vector (15 downto 0);
    signal r7        : std_logic_vector (15 downto 0);
    signal r8        : std_logic_vector (15 downto 0);

    constant period: time := 10ns;
begin

    dut : register_file
    port map (a_sel     => a_sel,
              b_sel     => b_sel,
              d_sel     => d_sel,
              td        => td,
              ta        => ta,
              tb        => tb,
              Clk       => Clk,
              data_load => data_load,
              data_in   => data_in,
              a_out     => a_out,
              b_out     => b_out,
              r0        => r0,
              r1        => r1,
              r2        => r2,
              r3        => r3,
              r4        => r4,
              r5        => r5,
              r6        => r6,
              r7        => r7,
              r8        => r8);


    clk_process : process
    begin
    Clk <= '1';
    wait for period/2;
    Clk <= '0';
    wait for period/2;
    end process;
    
    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
        a_sel <= "000";
        b_sel <= "000";
        d_sel <= "000";
        td <= '0';
        ta <= '0';
        tb <= '0';
        data_load <= '0';
        wait for period;
        data_in <= x"1111";
        d_sel <= "000";
        wait for period;
        data_load <= '1';
        wait for period;
        data_load <= '0';
        wait for period;
        data_in <= x"2222";
        d_sel <= "001";
        wait for period;
        data_load <= '1';
        wait for period;
        data_load <= '0';
        wait for period;
        data_in <= x"3333";
        d_sel <= "010";
        wait for period;
        data_load <= '1';
        wait for period;
        data_load <= '0';
        wait for period;
        data_in <= x"4444";
        d_sel <= "011";
        wait for period;
        data_load <= '1';
        wait for period;
        data_load <= '0';
        wait for period;
        data_in <= x"5555";
        d_sel <= "100";
        wait for period;
        data_load <= '1';
        wait for period;
        data_load <= '0';
        wait for period;
        data_in <= x"6666";
        d_sel <= "101";
        wait for period;
        data_load <= '1';
        wait for period;
        data_load <= '0';
        wait for period;
        data_in <= x"7777";
        d_sel <= "110";
        wait for period;
        data_load <= '1';
        wait for period;
        data_load <= '0';
        wait for period;
        
        data_in <= x"8888";
        d_sel <= "111";
        wait for period;
        data_load <= '1';
        wait for period;
        data_load <= '0'; 
        wait for period;
        
        
        data_in <= x"9999";
        d_sel <= "000";
        wait for period*2;
        data_load <= '1';
        wait for period;
        data_load <= '0'; 
        wait for period; 
        ta<= '1';
        wait for period*2;
        
    end process;

end tb;