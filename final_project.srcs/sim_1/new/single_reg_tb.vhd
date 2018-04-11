library ieee;
use ieee.std_logic_1164.all;

entity tb_reg is
end tb_reg;

architecture tb of tb_reg is

    component reg
        port (D    : in std_logic_vector (15 downto 0);
              load : in std_logic;
              Clk  : in std_logic;
              Q    : out std_logic_vector (15 downto 0));
    end component;

    signal D    : std_logic_vector (15 downto 0);
    signal load : std_logic;
    signal Clk  : std_logic;
    signal Q    : std_logic_vector (15 downto 0);

    constant period : time := 10 ns; -- EDIT Put right period here

begin

    dut : reg
    port map (D    => D,
              load => load,
              Clk  => Clk,
              Q    => Q);

    clk_process: process
    begin    
    Clk <= '1';
    wait for period/2;
    Clk <= '0';
    wait for period/2;
    end process;

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
        D <= x"0033";
        wait for period;
        load <= '1';
        wait for period;
        load<='0';
        D <= x"0003";
        wait for period;
        load<='1';
        wait for period;
        load <= '0';
        D<= x"0044";
        wait for period;
        load <= '1';
        wait for period;
        load <='0';
    end process;

end tb;
