library ieee;
use ieee.std_logic_1164.all;

entity tb_mux2to1 is
end tb_mux2to1;

architecture tb of tb_mux2to1 is

    component mux2to1
        port (in0 : in std_logic_vector (15 downto 0);
              in1 : in std_logic_vector (15 downto 0);
              s   : in std_logic;
              Z   : out std_logic_vector (15 downto 0));
    end component;

    signal in0 : std_logic_vector (15 downto 0);
    signal in1 : std_logic_vector (15 downto 0);
    signal s   : std_logic;
    signal Z   : std_logic_vector (15 downto 0);

begin

    dut : mux2to1
    port map (in0 => in0,
              in1 => in1,
              s   => s,
              Z   => Z);

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
        in0 <= x"3222";
        in1 <= x"2001";
        s <= '0';
        -- should choose in0
        
        wait for 5ns;
         s<= '1';
         --should choose in1
       
wait for 5ns;
    end process;

end tb;