

library ieee;
use ieee.std_logic_1164.all;

entity tb_b_to_y_16bit is
end tb_b_to_y_16bit;

architecture tb of tb_b_to_y_16bit is

    component b_to_y_16bit
        port (inB : in std_logic_vector (15 downto 0);
              Y   : out std_logic_vector (15 downto 0);
              S0  : in std_logic;
              S1  : in std_logic);
    end component;

    signal inB : std_logic_vector (15 downto 0);
    signal Y   : std_logic_vector (15 downto 0);
    signal S0  : std_logic;
    signal S1  : std_logic;

begin

    dut : b_to_y_16bit
    port map (inB => inB,
              Y   => Y,
              S0  => S0,
              S1  => S1);

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
        inB <= x"2332";
        S0 <= '0';
        S1 <= '0';
        wait for 5ns;
        -- should return x0000
        S0 <= '1';
        S1 <= '0';
        wait for 5ns;
        -- should return x2332
        S0 <= '0';
        S1 <= '1';
        wait for 5ns;
        -- should return xffff-x2332
        S0 <= '1';
        S1 <= '1';  
        wait for 5ns;       
        -- should return xffff
               

        wait;
    end process;

end tb;