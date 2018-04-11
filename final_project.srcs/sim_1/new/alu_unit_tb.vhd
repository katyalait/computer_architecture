
library ieee;
use ieee.std_logic_1164.all;

entity tb_alu_16_bit_adder is
end tb_alu_16_bit_adder;

architecture tb of tb_alu_16_bit_adder is

    component alu_16_bit_adder
        port (a_in   : in std_logic_vector (15 downto 0);
              b_in   : in std_logic_vector (15 downto 0);
              g_sel  : in std_logic_vector (3 downto 0);
              result : out std_logic_vector (15 downto 0);
              c_out  : out std_logic;
              v_out  : out std_logic;
              z_out  : out std_logic;
              n_out  : out std_logic);
    end component;

    signal a_in   : std_logic_vector (15 downto 0);
    signal b_in   : std_logic_vector (15 downto 0);
    signal g_sel  : std_logic_vector (3 downto 0);
    signal result : std_logic_vector (15 downto 0);
    signal c_out  : std_logic;
    signal v_out  : std_logic;
    signal z_out  : std_logic;
    signal n_out  : std_logic;

begin

    dut : alu_16_bit_adder
    port map (a_in   => a_in,
              b_in   => b_in,
              g_sel  => g_sel,
              result => result,
              c_out  => c_out,
              v_out  => v_out,
              z_out  => z_out,
              n_out  => n_out);

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
        a_in <= x"0001";
        b_in <= x"0001";
        wait for 5ns;
        g_sel <= "0000";
        wait for 10ns;
        wait for 5ns;
        g_sel <= "0001";
        wait for 10ns  ; 
        --result should be 0002     
        a_in <= x"0001";
        b_in <= x"0002";
        wait for 5ns;
        g_sel <= "0010";
        -- result should be 0003
        wait for 10ns;
        
        a_in <= x"0001";
        b_in <= x"0001";
        wait for 5ns;
        g_sel <= "0011";
        wait for 10ns;
        --result should be 0003
        a_in <= x"0001";
        b_in <= x"0001";
        wait for 5ns; 
        g_sel <= "0100";
        wait for 5ns;  
        --should be 0000
            
        a_in <= x"0001";
        b_in <= x"0002";
        wait for 5ns;
        g_sel <= "0101";
        wait for 5ns   ;
        --result should be ffff
        
        a_in <= x"0001";
        wait for 5ns;
        g_sel <= "0110";
        wait for 5ns   ;  
        --result should be 0000
        a_in <= x"0001";
        wait for 5ns;
        g_sel <= "0111";
        wait for 5ns   ;               
        --result should be 0001
        wait;
    end process;

end tb;