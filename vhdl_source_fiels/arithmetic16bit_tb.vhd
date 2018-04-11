library ieee;
use ieee.std_logic_1164.all;

entity tb_arithmetic16bit is
end tb_arithmetic16bit;

architecture tb of tb_arithmetic16bit is

    component arithmetic16bit
        port (S0   : in std_logic;
              S1   : in std_logic;
              C_in : in std_logic;
              A    : in std_logic_vector (15 downto 0);
              B    : in std_logic_vector (15 downto 0);
              C    : out std_logic;
              Y    : out std_logic_vector (15 downto 0));
    end component;

    signal S0   : std_logic;
    signal S1   : std_logic;
    signal C_in : std_logic;
    signal A    : std_logic_vector (15 downto 0);
    signal B    : std_logic_vector (15 downto 0);
    signal C    : std_logic;
    signal Y    : std_logic_vector (15 downto 0);

begin

    dut : arithmetic16bit
    port map (S0   => S0,
              S1   => S1,
              C_in => C_in,
              A    => A,
              B    => B,
              C    => C,
              Y    => Y);

    stimuli : process
    begin
        S0 <= '0';
        S1 <= '0';
        C_in <= '0';
        A <= x"0002";
        B <= x"0003";
        wait for 5ns; --should be x0002
        
        
        S0 <= '1';
        S1 <= '0';
        C_in <= '0'; 
        wait for 5ns;    --should be x0005  
        S0 <= '0';
        S1 <= '1';
        C_in <= '0'; 
        wait for 5ns;      --should be xffff
        S0 <= '1';
        S1 <= '1';
        C_in <= '0';      
        wait for 5ns;   --should be x0001
        
        S0 <= '0';
        S1 <= '0';
        C_in <= '1';      
        wait for 5ns;  --should be x0003
        S0 <= '1';
        S1 <= '0';
        C_in <= '1';      
        wait for 5ns;    --should be x0006
        
        S0 <= '0';
        S1 <= '1';
        C_in <= '1';      
        wait for 5ns;  --should be x0000
        S0 <= '1';
        S1 <= '1';
        C_in <= '1';      
        wait for 5ns;             --should be x0002                    
        wait;
    end process;

end tb;