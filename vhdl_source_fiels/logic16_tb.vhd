library ieee;
use ieee.std_logic_1164.all;

entity tb_logic16bit is
end tb_logic16bit;

architecture tb of tb_logic16bit is

    component logic16bit
        port (S0 : in std_logic;
              S1 : in std_logic;
              A  : in std_logic_vector (15 downto 0);
              B  : in std_logic_vector (15 downto 0);
              G  : out std_logic_vector (15 downto 0));
    end component;

    signal S0 : std_logic;
    signal S1 : std_logic;
    signal A  : std_logic_vector (15 downto 0);
    signal B  : std_logic_vector (15 downto 0);
    signal G  : std_logic_vector (15 downto 0);

begin

    dut : logic16bit
    port map (S0 => S0,
              S1 => S1,
              A  => A,
              B  => B,
              G  => G);

    stimuli : process
    begin
    
        S0 <= '0';
        S1 <= '0';
        A <= x"0002";
        B <= x"0001";
        wait for 10ns; --a and b = 0000
        S0 <= '1';
        S1 <= '0';
        wait for 10ns; -- a or b = 0003
        S0 <= '0';
        S1 <= '1'; 
        wait for 10ns; -- a xor b = 0003
        S0 <= '1';
        S1 <= '1';
        wait for 10ns; -- not a = fffd
    end process;

end tb;