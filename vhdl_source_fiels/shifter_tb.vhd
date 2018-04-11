library ieee;
use ieee.std_logic_1164.all;

entity tb_shifter is
end tb_shifter;

architecture tb of tb_shifter is

    component shifter
        port (B  : in std_logic_vector (15 downto 0);
              FS : in std_logic_vector (4 downto 0);
              IL : in std_logic;
              IR : in std_logic;
              H  : out std_logic_vector (15 downto 0));
    end component;

    signal B  : std_logic_vector (15 downto 0);
    signal FS : std_logic_vector (4 downto 0);
    signal IL : std_logic;
    signal IR : std_logic;
    signal H  : std_logic_vector (15 downto 0);

begin

    dut : shifter
    port map (B  => B,
              FS => FS,
              IL => IL,
              IR => IR,
              H  => H);

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
        B <= "0011001100110011";
        FS <= "10000";
        IL <= '0';
        IR <= '0';
        wait for 10ns;
        --result should be the same
        
        FS<= "10100";
        wait for 10ns;
        --result should be shifted left
        
        FS<="11000";
        wait for 10ns;
        
        --result should the original number i.e. shifted right.

        wait;
    end process;

end tb;
