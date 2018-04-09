library ieee;
use ieee.std_logic_1164.all;

entity tb_datapath is
end tb_datapath;

architecture tb of tb_datapath is

    component datapath
        port (data_in       : in std_logic_vector (15 downto 0);
              constant_in   : in std_logic_vector (15 downto 0);
              a_in          : in std_logic_vector (2 downto 0);
              b_in          : in std_logic_vector (2 downto 0);
              d_sel         : in std_logic_vector (2 downto 0);
              FS            : in std_logic_vector (4 downto 0);
              write_enable  : in std_logic;
              v_out         : out std_logic;
              c_out         : out std_logic;
              n_out         : out std_logic;
              z_out         : out std_logic;
              mb_sel        : in std_logic;
              md_sel        : in std_logic;
              address_a_out : out std_logic_vector (15 downto 0);
              address_b_out : out std_logic_vector (15 downto 0);
              f_out         : out std_logic_vector (15 downto 0);
              reg_0         : out std_logic_vector (15 downto 0);
              reg_1         : out std_logic_vector (15 downto 0);
              reg_2         : out std_logic_vector (15 downto 0);
              reg_3         : out std_logic_vector (15 downto 0);
              reg_4         : out std_logic_vector (15 downto 0);
              reg_5         : out std_logic_vector (15 downto 0);
              reg_6         : out std_logic_vector (15 downto 0);
              reg_7         : out std_logic_vector (15 downto 0));
    end component;

    signal data_in       : std_logic_vector (15 downto 0);
    signal constant_in   : std_logic_vector (15 downto 0);
    signal a_in          : std_logic_vector (2 downto 0);
    signal b_in          : std_logic_vector (2 downto 0);
    signal d_sel         : std_logic_vector (2 downto 0);
    signal FS            : std_logic_vector (4 downto 0);
    signal write_enable  : std_logic;
    signal v_out         : std_logic;
    signal c_out         : std_logic;
    signal n_out         : std_logic;
    signal z_out         : std_logic;
    signal mb_sel        : std_logic;
    signal md_sel        : std_logic;
    signal address_a_out : std_logic_vector (15 downto 0);
    signal address_b_out : std_logic_vector (15 downto 0);
    signal f_out         : std_logic_vector (15 downto 0);
    signal reg_0         : std_logic_vector (15 downto 0);
    signal reg_1         : std_logic_vector (15 downto 0);
    signal reg_2         : std_logic_vector (15 downto 0);
    signal reg_3         : std_logic_vector (15 downto 0);
    signal reg_4         : std_logic_vector (15 downto 0);
    signal reg_5         : std_logic_vector (15 downto 0);
    signal reg_6         : std_logic_vector (15 downto 0);
    signal reg_7         : std_logic_vector (15 downto 0);

begin

    dut : datapath
    port map (data_in       => data_in,
              constant_in   => constant_in,
              a_in          => a_in,
              b_in          => b_in,
              d_sel         => d_sel,
              FS            => FS,
              write_enable  => write_enable,
              v_out         => v_out,
              c_out         => c_out,
              n_out         => n_out,
              z_out         => z_out,
              mb_sel        => mb_sel,
              md_sel        => md_sel,
              address_a_out => address_a_out,
              address_b_out => address_b_out,
              f_out         => f_out,
              reg_0         => reg_0,
              reg_1         => reg_1,
              reg_2         => reg_2,
              reg_3         => reg_3,
              reg_4         => reg_4,
              reg_5         => reg_5,
              reg_6         => reg_6,
              reg_7         => reg_7);

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
       
        
        wait for 20ns;
        
        
        --for the inititial tests populate the registers
        md_sel<= '1'; --this means the md will choose the data in not the output from the functional unit
        -- we leave mb_sel as 0 meaning it chooses the bus b so we can see what the b output is
        --begin to iterate through all registers and populate them with random bits
        FS <= "00000";
        constant_in <= x"0000";
        mb_sel <= '0';
        
        --reg 0
        write_enable <= '0';
        data_in <= x"1111";
        md_sel <= '1';
        --give the datapath time to transfer data in signal
        wait for 3ns;
        d_sel <= "000";
        --select address destination 
        wait for 1ns;
        --allow datapath to write to reg file
        write_enable <= '1';
        wait for 1ns;
        --turn off ability to write to reg file
        write_enable <= '0';
        --recover the input data from the reg file via the bus a
       
        wait for 1ns;
        
        data_in <= x"2222";
        md_sel <= '1';
        wait for 3ns;
        d_sel <= "001";
        wait for 1ns;
        write_enable <= '1';
        wait for 1ns;
        write_enable <= '0';
        wait for 1ns;
   
        data_in <= x"3333";
        wait for 3ns;
        d_sel <= "010";
        wait for 1ns;
        write_enable <= '1';
        wait for 1ns;
        write_enable <= '0';
        wait for 1ns;     
        
        data_in <= x"4444";
        wait for 3ns;
        d_sel <= "011";
        wait for 1ns;
        write_enable <= '1';
        wait for 1ns;
        write_enable <= '0';
        wait for 1ns;        
        
        data_in <= x"5555";
        wait for 3ns;
        d_sel <= "100";
        wait for 1ns;
        write_enable <= '1';
        wait for 1ns;
        write_enable <= '0';
        wait for 1ns;
        
        data_in <= x"6666";
        wait for 3ns;
        d_sel <= "101";
        wait for 1ns;
        write_enable <= '1';
        wait for 1ns;
        write_enable <= '0';
        wait for 1ns;   
        
        data_in <= x"7777";
        wait for 3ns;
        d_sel <= "110";
        wait for 1ns;
        write_enable <= '1';
        wait for 1ns;
        write_enable <= '0';
        wait for 1ns;  
        
        data_in <= x"8888";
        wait for 3ns;
        d_sel <= "111";
        wait for 1ns;
        write_enable <= '1';
        wait for 1ns;
        write_enable <= '0';
        wait for 1ns;          
        
        
        -- after repetitive testing 3ns was the adequate time required for the data path
        -- to recognise the data_in properly and to use it in storing 
        
        --we begin to test the buses
        
        b_in <= "001"; --should output "2222"
        wait for 3ns;
        a_in <= "111"; --should ouput "8888"
        wait for 3ns;
        b_in <= "010"; --should output "3333"
        wait for 3ns;
        a_in <= "110"; --should output "7777"
        wait for 3ns;
        b_in <= "011"; -- should output "4444"
        wait for 3ns;
        a_in <= "101"; --should output "6666"
        wait for 3ns;
        b_in<= "100";--should ouput "5555"
        wait for 3ns;
        a_in <= "100"; --shoult output "5555"
        wait for 3ns;
        b_in<= "101"; --should output "6666"
        wait for 3ns;
        a_in <= "011"; --should output "4444"
        wait for 3ns;
        b_in <= "110"; --should output "7777"
        wait for 3ns;
        a_in <= "010" ;--should output "3333"
        wait for 3ns;
        b_in <= "111" ;--should output "8888"
        wait for 3ns;
        a_in <= "001" ;--should output "2222"
        wait for 3ns;
        --000 for both a and b in have already been tested
        
        
    end process;
end tb;