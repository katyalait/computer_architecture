library ieee;
use ieee.std_logic_1164.all;

entity tb_full_adder_16bit is
end tb_full_adder_16bit;

architecture tb of tb_full_adder_16bit is

    component full_adder_16bit
        port (A    : in std_logic_vector (15 downto 0);
              B    : in std_logic_vector (15 downto 0);
              Cin  : in std_logic;
              Cout : out std_logic;
              Vout : out std_logic;
              S    : out std_logic_vector (15 downto 0));
    end component;

    signal A    : std_logic_vector (15 downto 0);
    signal B    : std_logic_vector (15 downto 0);
    signal Cin  : std_logic;
    signal Cout : std_logic;
    signal Vout : std_logic;
    signal S    : std_logic_vector (15 downto 0);

begin

    dut : full_adder_16bit
    port map (A    => A,
              B    => B,
              Cin  => Cin,
              Cout => Cout,
              Vout => Vout,
              S    => S);

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
        A <= x"0001"; --1+2
        B <= x"0002";
        Cin <= '0';
        wait for 10ns;
        A <= x"0003"; --3-1
        B <= x"ffff";
        
        wait for 10ns;
        A <= x"0003"; --3-1 + 1
        B <= x"ffff"; 
        Cin<= '1';        
        -- EDIT Add stimuli here

        wait;
    end process;

end tb;