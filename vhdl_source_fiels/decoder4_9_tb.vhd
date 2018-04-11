library ieee;
use ieee.std_logic_1164.all;

entity tb_decoder4_9 is
end tb_decoder4_9;

architecture tb of tb_decoder4_9 is

    component decoder4_9
        port (AD0 : in std_logic;
              AD1 : in std_logic;
              AD2 : in std_logic;
              AD3 : in std_logic;
              D0  : out std_logic;
              D1  : out std_logic;
              D2  : out std_logic;
              D3  : out std_logic;
              D4  : out std_logic;
              D5  : out std_logic;
              D6  : out std_logic;
              D7  : out std_logic;
              D8  : out std_logic);
    end component;

    signal AD0 : std_logic;
    signal AD1 : std_logic;
    signal AD2 : std_logic;
    signal AD3 : std_logic;
    signal D0  : std_logic;
    signal D1  : std_logic;
    signal D2  : std_logic;
    signal D3  : std_logic;
    signal D4  : std_logic;
    signal D5  : std_logic;
    signal D6  : std_logic;
    signal D7  : std_logic;
    signal D8  : std_logic;

begin

    dut : decoder4_9
    port map (AD0 => AD0,
              AD1 => AD1,
              AD2 => AD2,
              AD3 => AD3,
              D0  => D0,
              D1  => D1,
              D2  => D2,
              D3  => D3,
              D4  => D4,
              D5  => D5,
              D6  => D6,
              D7  => D7,
              D8  => D8
              );

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
        
         
        AD0 <= '0';
        AD1 <= '0';
        AD2 <= '0';
        AD3 <= '0';
        wait for 10ns;
       
        AD0 <= '1';
        AD1 <= '0';
        AD2 <= '0';
        AD3 <= '0';
        wait for 10ns;

        AD0 <= '0';
        AD1 <= '1';
        AD2 <= '0';
        AD3 <= '0';
        wait for 10ns;
        AD0 <= '1';
        AD1 <= '1';
        AD2 <= '0';
        AD3 <= '0';
        wait for 10ns;
        AD0 <= '0';
        AD1 <= '0';
        AD2 <= '1';
        AD3 <= '0';
        wait for 10ns;
        AD0 <= '1';
        AD1 <= '0';
        AD2 <= '1';
        AD3 <= '0';
        wait for 10ns;
        AD0 <= '0';
        AD1 <= '1';
        AD2 <= '1';
        AD3 <= '0';
        wait for 10ns;
        AD0 <= '1';
        AD1 <= '1';
        AD2 <= '1';
        AD3 <= '0';
        wait for 10ns;
        AD0 <= '0';
        AD1 <= '0';
        AD2 <= '0';
        AD3 <= '1';
        wait for 10ns;
        AD0 <= '1';
        AD1 <= '0';
        AD2 <= '0';
        AD3 <= '1';
        wait for 10ns;
        wait for 10ns;
        AD0 <= '0';
        AD1 <= '1';
        AD2 <= '0';
        AD3 <= '1';
        wait for 10ns;
        AD0 <= '1';
        AD1 <= '1';
        AD2 <= '0';
        AD3 <= '1';
        wait for 10ns;
        AD0 <= '0';
        AD1 <= '0';
        AD2 <= '1';
        AD3 <= '1';
        wait for 10ns;
        AD0 <= '1';
        AD1 <= '0';
        AD2 <= '1';
        AD3 <= '1';
        wait for 10ns;
        AD0 <= '0';
        AD1 <= '1';
        AD2 <= '1';
        AD3 <= '1';
        wait for 10ns;    
        AD0 <= '1';
        AD1 <= '1';
        AD2 <= '1';
        AD3 <= '1';
        wait for 10ns;        

    end process;

end tb;