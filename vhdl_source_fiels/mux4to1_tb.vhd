library ieee;
use ieee.std_logic_1164.all;

entity tb_mux4_to_1 is
end tb_mux4_to_1;

architecture tb of tb_mux4_to_1 is

    component mux4_to_1
        port (S0 : in std_logic;
              S1 : in std_logic;
              A  : in std_logic_vector (15 downto 0);
              B  : in std_logic_vector (15 downto 0);
              C  : in std_logic_vector (15 downto 0);
              D  : in std_logic_vector (15 downto 0);
              Z  : out std_logic_vector (15 downto 0));
    end component;

    signal S0 : std_logic;
    signal S1 : std_logic;
    signal A  : std_logic_vector (15 downto 0);
    signal B  : std_logic_vector (15 downto 0);
    signal C  : std_logic_vector (15 downto 0);
    signal D  : std_logic_vector (15 downto 0);
    signal Z  : std_logic_vector (15 downto 0);

begin

    dut : mux4_to_1
    port map (S0 => S0,
              S1 => S1,
              A  => A,
              B  => B,
              C  => C,
              D  => D,
              Z  => Z);

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
        S0 <= '0';
        S1 <= '0';
        A <= x"1111";
        B <= x"2222";
        C <= x"3333";
        D <= x"4444";
        wait for 20ns;
        
        S0 <= '1';
        S1 <= '0';
        wait for 20ns;
        
        S0<= '0';
        S1 <= '1';
        WAIT FOR 20NS;
        
        S0 <= '1';
        S1 <= '1';
        WAIT FOR 20NS;
    end process;

end tb;
