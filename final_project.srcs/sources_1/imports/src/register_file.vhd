
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity reg16 is
   Port( 
          a_sel: in std_logic_vector(2 downto 0);	
           b_sel : in std_logic_vector(2 downto 0);
          d_sel : in std_logic_vector(2 downto 0);
         data_load : in std_logic;
          data_in : in std_logic_vector(15 downto 0);
          a_out : out std_logic_vector(15 downto 0);
          b_out : out std_logic_vector(15 downto 0);
          r0, r1, r2, r3, r4, r5, r6,r7 : out std_logic_vector(15 downto 0)
          ); 
end reg16;

architecture Behavioral of reg16 is
COMPONENT reg
    port (
    D: in STD_LOGIC_VECTOR(15 downto 0);
    load0, load1 :in STD_LOGIC;
    Q: out STD_LOGIC_VECTOR(15 downto 0)
    );
END COMPONENT;
    --3 to 8 bit decoder
COMPONENT decoder38 
     port(
         A:in std_logic_vector(2 downto 0);
         D:out std_logic_vector(7 downto 0));
  
       END COMPONENT;

    ----8 to 1 line multiplexer 
    COMPONENT multiplexer
        port(  
        In0, In1, In2, In3, In4, In5, In6, In7 : in std_logic_vector(15 downto 0);
               S: in std_logic_vector(2 downto 0);
               Z : out std_logic_vector(15 downto 0));
    END COMPONENT;
    --signals
    signal load_reg0,load_reg1,load_reg2,load_reg3,load_reg4, load_reg5,load_reg6,load_reg7 : STD_LOGIC;
    signal reg0_q, reg1_q, reg2_q, reg3_q, reg4_q, reg5_q, reg6_q, reg7_q: STD_LOGIC_VECTOR(15 downto 0);
    signal dec0, dec1, dec2, dec3, dec4, dec5, dec6, dec7: STD_LOGIC;
    signal data_src_mux_out, a_reg, b_reg : STD_LOGIC_VECTOR(15 downto 0);
 
begin
     des_decoder_3_to8: decoder38 PORT MAP (
           A(0)=> d_sel(0),
           A(1)=> d_sel(1),
           A(2)=> d_sel(2),
           D(0) => dec0,
           D(1) => dec1,
           D(2) => dec2,
           D(3) => dec3,
           D(4) => dec4,
           D(5) => dec5,
           D(6) => dec6,
           D(7) => dec7
           );
           
         
    --port maps;
    reg00: reg PORT MAP(
        D=> data_in,
        load0=> dec0,
        load1=> data_load,
        Q=>reg0_q
        );
    reg01: reg PORT MAP(
        D=> data_in,
        load0=> dec1,
        load1=> data_load,
        Q=>reg1_q
        );
    reg02: reg PORT MAP(
        D=> data_in,
        load0=> dec2,
        load1=> data_load,
        Q=>reg2_q
        );
    reg03: reg PORT MAP(
        D=> data_in,
        load0=> dec3,
        load1=> data_load,
        Q=>reg3_q
        );
    reg04: reg PORT MAP(
        D=> data_in,
        load0=> dec4,
        load1=> data_load,
        Q=>reg4_q
        );  
    reg05: reg PORT MAP(
        D=> data_in,
        load0=> dec5,
        load1=> data_load,
        Q=>reg5_q
        );
    reg06: reg PORT MAP(
        D=> data_in,
        load0=> dec6,
        load1=> data_load,
        Q=>reg6_q
        );  
   reg07: reg PORT MAP(
        D=> data_in,
        load0=> dec7,
        load1=> data_load,
        Q=>reg7_q
        ); 
        
    --8 to 1 source register multiplexer
    mux00: multiplexer PORT MAP (
        in0 => reg0_q,
        in1 => reg1_q,
        in2 => reg2_q,
        in3 => reg3_q,
        in4 => reg4_q,
        in5 => reg5_q,
        in6 => reg6_q,
        in7 => reg7_q,
        S(0) => a_sel(0),
        S(1) => a_sel(1),
        S(2) => a_sel(2),
        Z => a_reg
    );
    
    mux01: multiplexer PORT MAP(
       in0 => reg0_q,
       in1 => reg1_q,
       in2 => reg2_q,
       in3 => reg3_q,
       in4 => reg4_q,
       in5 => reg5_q,
       in6 => reg6_q,
       in7 => reg7_q,
       S(0) => b_sel(0),
       S(1) => b_sel(1),
       S(2) => b_sel(2),
       Z => b_reg
    );
    
    
    a_out<=a_reg;
    b_out<=b_reg;
    
    r0<= reg0_q;
    r1<= reg1_q;
    r2<= reg2_q;
    r3<= reg3_q;
    r4<= reg4_q;
    r5<= reg5_q;
    r6<= reg6_q ;
    r7<= reg7_q;
    
end Behavioral;
