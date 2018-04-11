library ieee;
use ieee.std_logic_1164.all;

entity tb_mux9to16bit is
end tb_mux9to16bit;

architecture tb of tb_mux9to16bit is

    component mux9to16bit
        port (In0 : in std_logic_vector (15 downto 0);
              In1 : in std_logic_vector (15 downto 0);
              In2 : in std_logic_vector (15 downto 0);
              In3 : in std_logic_vector (15 downto 0);
              In4 : in std_logic_vector (15 downto 0);
              In5 : in std_logic_vector (15 downto 0);
              In6 : in std_logic_vector (15 downto 0);
              In7 : in std_logic_vector (15 downto 0);
              In8 : in std_logic_vector (15 downto 0);
              S   : in std_logic_vector (3 downto 0);
              Z   : out std_logic_vector (15 downto 0));
    end component;

    signal In0 : std_logic_vector (15 downto 0);
    signal In1 : std_logic_vector (15 downto 0);
    signal In2 : std_logic_vector (15 downto 0);
    signal In3 : std_logic_vector (15 downto 0);
    signal In4 : std_logic_vector (15 downto 0);
    signal In5 : std_logic_vector (15 downto 0);
    signal In6 : std_logic_vector (15 downto 0);
    signal In7 : std_logic_vector (15 downto 0);
    signal In8 : std_logic_vector (15 downto 0);
    signal S   : std_logic_vector (3 downto 0);
    signal Z   : std_logic_vector (15 downto 0);

begin

    dut : mux9to16bit
    port map (In0 => In0,
              In1 => In1,
              In2 => In2,
              In3 => In3,
              In4 => In4,
              In5 => In5,
              In6 => In6,
              In7 => In7,
              In8 => In8,
              S   => S,
              Z   => Z);

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
        In0 <= x"1111";
        In1 <= x"2222";
        In2 <= x"3333";
        In3 <= x"4444";
        In4 <= x"5555";
        In5 <= x"6666";
        In6 <= x"7777";
        In7 <= x"8888";
        In8 <= x"9999";
        wait for 5ns;
        
        S <= "0000";
        wait for 5ns;
        S <= "0001";
        wait for 5ns;  
        S <= "0010";
        wait for 5ns;
        S <= "0011";
        wait for 5ns;
        S <= "0100";
        wait for 5ns;
        S <= "0101";
        wait for 5ns;  
        S <= "0110";
        wait for 5ns;
        S <= "0111";
        wait for 5ns;     
        S <= "1000";
        wait for 5ns;                      
        -- EDIT Add stimuli here

        wait;
    end process;

end tb;
