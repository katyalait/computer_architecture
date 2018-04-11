LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY zero_fill_tb IS
END zero_fill_tb;
 
ARCHITECTURE behavior OF zero_fill_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT zero_fill
    PORT(
         sb : IN  std_logic_vector(2 downto 0);
         constant_out : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal SB : std_logic_vector(2 downto 0);

 	--Outputs
   signal constant_out : std_logic_vector(15 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: zero_fill PORT MAP (
          SB => SB,
          constant_out => constant_out
        );

   -- Stimulus process
   stim_proc: process
   begin	
   --test constant values
          SB <= "000";
         wait for 100 ns;	
		  SB <= "001";
         wait for 100 ns;
		  SB <= "010";
		  wait for 100 ns;
          SB <= "011";
          wait for 100 ns;
          SB <= "100";          
		  wait for 100ns;
          SB <= "101";          
          wait for 100ns;	
          SB <= "110";          
          wait for 100ns;    
          SB <= "111";          
          wait for 100ns;                                  	  
      end process;

END;