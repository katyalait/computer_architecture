----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.04.2018 15:03:53
-- Design Name: 
-- Module Name: mem_tb - Behavioral
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


LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY memory_tb IS
END memory_tb;
 
ARCHITECTURE behavior OF memory_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT memory_tb
    PORT(
         address : IN  std_logic_vector(15 downto 0);
         write_data : IN  std_logic_vector(15 downto 0);
         Clk   : IN std_logic;
         MemWrite : IN  std_logic;
         read_data : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal address : std_logic_vector(15 downto 0) ;
   signal write_data : std_logic_vector(15 downto 0);
   signal MemWrite : std_logic;
   signal Clk : std_logic;
   constant period : time := 10 ns; 
 	--Outputs
   signal read_data : std_logic_vector(15 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: memory_tb PORT MAP (
          address => address,
          write_data => write_data,
          Clk => Clk,
          MemWrite => MemWrite,
          read_data => read_data
        );

    clck_proc: process
    begin
    Clk <= '0';
    wait for period/2;
    Clk <= '1';
    wait for period/2;
    
    end process;
   -- Stimulus process 
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      
     
      wait for 100 ns;	
		write_data <= x"1111";
		address <= x"0002";
		MemWrite <= '1';
      wait for 100 ns;
      MemWrite <= '0';
      read_data <= x"0002";
		
		 wait for 100 ns;	
             write_data <= x"2222";
             address <= x"0003";
             MemWrite <= '1';
           wait for 100 ns;
             MemWrite <= '0';
                read_data <= x"0003";
                          
            wait for 100 ns;	
                  write_data <= x"3333";
                  address <= x"0004";
                  MemWrite <= '1';
                wait for 100 ns;
                 MemWrite <= '0';
                     read_data <= x"0004";
      wait;
   end process;

END;

