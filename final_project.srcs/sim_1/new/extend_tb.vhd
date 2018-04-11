library ieee;
use ieee.std_logic_1164.all;

entity tb_Extend is
end tb_Extend;

architecture tb of tb_Extend is

    component Extend
        port (DR  : in std_logic_vector (2 downto 0);
              SB  : in std_logic_vector (2 downto 0);
              EXT : out std_logic_vector (15 downto 0));
    end component;

    signal DR  : std_logic_vector (2 downto 0);
    signal SB  : std_logic_vector (2 downto 0);
    signal EXT : std_logic_vector (15 downto 0);

begin

    dut : Extend
    port map (DR  => DR,
              SB  => SB,
              EXT => EXT);

    stimuli : process
    begin
        
        DR <= "000";
        SB <= "000";
        wait for 5ns;
        DR <= "101";
        wait for 5ns;
         DR <= "111";
        wait for 5ns;       
    end process;

end tb;