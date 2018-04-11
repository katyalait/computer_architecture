
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity register_file is
   Port( 
          a_sel: in std_logic_vector(2 downto 0);	
           b_sel : in std_logic_vector(2 downto 0);
          d_sel : in std_logic_vector(2 downto 0);
          td : in std_logic;
          ta : in std_logic;
          tb : in std_logic;
          Clk : in std_logic;
         data_load : in std_logic;
          data_in : in std_logic_vector(15 downto 0);
          a_out : out std_logic_vector(15 downto 0);
          b_out : out std_logic_vector(15 downto 0);
          r0, r1, r2, r3, r4, r5, r6,r7 , r8: out std_logic_vector(15 downto 0)
          ); 
end register_file;

architecture Behavioral of register_file is
COMPONENT reg
    port (
    D: in STD_LOGIC_VECTOR(15 downto 0);
    load, Clk :in STD_LOGIC;
    Q: out STD_LOGIC_VECTOR(15 downto 0)
    );
END COMPONENT;
    -- to 16 bit decoder
COMPONENT decoder4_9 
         port( 
AD0: in STD_LOGIC;
AD1: in STD_LOGIC;
AD2: in STD_LOGIC;
AD3: in STD_LOGIC;
RW : in STD_LOGIC;
D0 : out STD_LOGIC;
D1 : out STD_LOGIC;
D2 : out STD_LOGIC;
D3 : out STD_LOGIC;
D4 : out STD_LOGIC;
D5 : out STD_LOGIC;
D6 : out STD_LOGIC;
D7 : out STD_LOGIC;
D8 : out STD_LOGIC
);
  
END COMPONENT;

    ----8 to 1 line multiplexer 
COMPONENT mux8_16bit 
 port (
        In0, In1, In2, In3, In4, In5, In6, In7 : in std_logic_vector(15 downto 0);
        S: in std_logic_vector(2 downto 0);
       Z : out std_logic_vector(15 downto 0)
       );
    END COMPONENT;
COMPONENT mux2to1 
port (
    in0: in std_logic_vector(15 downto 0);
    in1: in std_logic_vector(15 downto 0);
    s: in std_logic;
    z: out std_logic_vector(15 downto 0)
);
END COMPONENT;
    --signals
    signal load_reg0,load_reg1,load_reg2,load_reg3,load_reg4, load_reg5,load_reg6,load_reg7, load_reg8 : STD_LOGIC;
    signal reg0_q, reg1_q, reg2_q, reg3_q, reg4_q, reg5_q, reg6_q, reg7_q, reg8_q :STD_LOGIC_VECTOR(15 downto 0);
    signal reg9_q, reg10_q, reg11_q, reg12_q, reg13_q, reg14_q, reg15_q : STD_LOGIC_VECTOR(15 downto 0);
    signal dec0, dec1, dec2, dec3, dec4, dec5, dec6, dec7: std_logic;
    signal dec8: STD_LOGIC;
    signal data_src_mux_out, a_reg, b_reg : STD_LOGIC_VECTOR(15 downto 0);
    signal muxAout, muxBout : std_logic_vector(15 downto 0);
begin

 decoder: decoder4_9 PORT MAP (
    AD0 => d_sel(0),
    AD1 => d_sel(1),
    AD2 => d_sel(2),
    AD3 => TD,
    RW => data_load,
    D0 => dec0,
    D1 => dec1,
    D2 => dec2,
    D3 => dec3,
    D4 => dec4,
    D5 => dec5,
    D6 => dec6,
    D7 => dec7,
    D8 => dec8
    
    );
         
    --port maps;
    reg00: reg PORT MAP(
        D=> data_in,
        Clk=> Clk,
        load=> dec0,
        Q=>reg0_q
        );
    reg01: reg PORT MAP(
        D=> data_in,
        Clk=> Clk,
        load=> dec1,
        Q=>reg1_q
        );
    reg02: reg PORT MAP(
        D=> data_in,
        Clk=> Clk,
        load=> dec2,
        Q=>reg2_q
        );
    reg03: reg PORT MAP(
        D=> data_in,
        Clk=> Clk,
        load=> dec3,
        Q=>reg3_q
        );
    reg04: reg PORT MAP(
        D=> data_in,
        Clk=> Clk,
        load=> dec4,
        Q=>reg4_q
        );  
    reg05: reg PORT MAP(
        D=> data_in,
        Clk => Clk,
        load=> dec5,
        Q=>reg5_q
        );
    reg06: reg PORT MAP(
        D=> data_in,
        Clk=> Clk,
        load=> dec6,
        Q=>reg6_q
        );  
   reg07: reg PORT MAP(
        D=> data_in,
        Clk => Clk,
        load=> dec7,
        Q=>reg7_q
        ); 
   reg08: reg PORT MAP(
         D=> data_in,
         Clk => Clk,
         load=> dec8,
         Q=>reg8_q
         ); 
        
    --8 to 1 source register multiplexer
    mux00: mux8_16bit PORT MAP (
        S(0) => a_sel(0),
        S(1) => a_sel(1),
        S(2) => a_sel(2),
        in0 => reg0_q,
        in1 => reg1_q,
        in2 => reg2_q,
        in3 => reg3_q,
        in4 => reg4_q,
        in5 => reg5_q,
        in6 => reg6_q,
        in7 => reg7_q,
        
        Z => a_reg
    );
    
    mux01: mux8_16bit PORT MAP(
        S(0) => b_sel(0),
        S(1) => b_sel(1),
        S(2) => b_sel(2),
       in0 => reg0_q,
       in1 => reg1_q,
       in2 => reg2_q,
       in3 => reg3_q,
       in4 => reg4_q,
       in5 => reg5_q,
       in6 => reg6_q,
       in7 => reg7_q,
       Z => b_reg
    );
    tAMux: mux2to1 PORT MAP (
    in0=>a_reg,
    in1=>reg8_q,
    s => ta,
    Z => muxAout
    );
    
    tBMux: mux2to1 PORT MAP (
    in0 =>b_reg,
    in1=>reg8_q,
    s =>tb,
    Z =>muxBout
    );
    
    
    a_out<=muxAout;
    b_out<=muxBout;
    
    r0<= reg0_q;
    r1<= reg1_q;
    r2<= reg2_q;
    r3<= reg3_q;
    r4<= reg4_q;
    r5<= reg5_q;
    r6<= reg6_q;
    r7<= reg7_q;
    r8 <= reg8_q;
    
end Behavioral;
