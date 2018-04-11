library ieee;
use ieee.std_logic_1164.all;

entity tb_f_unit is
end tb_f_unit;

architecture tb of tb_f_unit is

    component f_unit
        port (a_in     : in std_logic_vector (15 downto 0);
              b_in     : in std_logic_vector (15 downto 0);
              f_select : in std_logic_vector (4 downto 0);
              c_out    : out std_logic;
              v_out    : out std_logic;
              z_out    : out std_logic;
              n_out    : out std_logic;
              y_out    : out std_logic_vector (15 downto 0));
    end component;

    signal a_in     : std_logic_vector (15 downto 0);
    signal b_in     : std_logic_vector (15 downto 0);
    signal f_select : std_logic_vector (4 downto 0);
    signal c_out    : std_logic;
    signal v_out    : std_logic;
    signal z_out    : std_logic;
    signal n_out    : std_logic;
    signal y_out    : std_logic_vector (15 downto 0);

begin

    dut : f_unit
    port map (a_in     => a_in,
              b_in     => b_in,
              f_select => f_select,
              c_out    => c_out,
              v_out    => v_out,
              z_out    => z_out,
              n_out    => n_out,
              y_out    => y_out);

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
        a_in <= x"0001";
        b_in <= x"0002";
        f_select <= "00000";
    

        wait;
    end process;

end tb;
