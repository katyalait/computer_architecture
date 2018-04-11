----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.04.2018 18:28:19
-- Design Name: 
-- Module Name: full_adder_16bit - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity full_adder_16bit is
Port (
    A: in std_logic_vector(15 downto 0);
    B: in std_logic_vector(15 downto 0);
    Cin: in std_logic;
    Cout: out std_logic;
    Vout: out std_logic;
    S : out std_logic_vector(15 downto 0)
    
);
end full_adder_16bit;

architecture Behavioral of full_adder_16bit is
 Component full_adder 
       Port (
       A, B, Cin: in STD_LOGIC;
       S,  Cout : out STD_LOGIC 
       );
 End Component;
 
 signal c : std_logic_vector(15 downto 0);
 
begin
add00: full_adder PORT MAP(
	A => A(0),
	B => B(0),
	Cin => Cin,
	S => S(0),
	Cout => c(1)
);
-- adder 1
add01: full_adder PORT MAP(
	A => A(1),
	B => B(1),
	Cin => c(1),
	S => S(1),
	Cout => c(2)
);
-- adder 2
add02: full_adder PORT MAP(
	A => A(2),
	B => B(2),
	Cin => c(2),
	S => S(2),
	Cout => c(3)
);
-- adder 3
add03: full_adder PORT MAP(
	A => A(3),
	B => B(3),
	Cin => c(3),
	S => S(3),
	Cout => c(4)
);
-- adder 4
add04: full_adder PORT MAP(
	A => A(4),
	B => B(4),
	Cin => c(4),
	S => S(4),
	Cout => c(5)
);
-- adder 5
add05: full_adder PORT MAP(
	A => A(5),
	B => B(5),
	Cin => c(5),
	S => S(5),
	Cout => c(6)
);
-- adder 6
add06: full_adder PORT MAP(
	A => A(6),
	B => B(6),
	Cin => c(6),
	S => S(6),
	Cout => c(7)
);
-- adder 7
add07: full_adder PORT MAP(
	A => A(7),
	B => B(7),
	Cin => c(7),
	S => S(7),
	Cout => c(8)
);
-- adder 8
add08: full_adder PORT MAP(
	A => A(8),
	B => B(8),
	Cin => c(8),
	S => S(8),
	Cout => c(9)
);
-- adder 9
add09: full_adder PORT MAP(
	A => A(9),
	B => B(9),
	Cin => c(9),
	S => S(9),
	Cout => c(10)
);
-- adder 10
add10: full_adder PORT MAP(
	A => A(10),
	B => B(10),
	Cin => c(10),
	S => S(10),
	Cout => c(11)
);
-- adder 11
add11: full_adder PORT MAP(
	A => A(11),
	B => B(11),
	Cin => c(11),
	S => S(11),
	Cout => c(12)
);
-- adder 12
add12: full_adder PORT MAP(
	A => A(12),
	B => B(12),
	Cin => c(12),
	S => S(12),
	Cout => c(13)
);
-- adder 13
add13: full_adder PORT MAP(
	A => A(13),
	B => B(13),
	Cin => c(13),
	S => S(13),
	Cout => c(14)
);
-- adder 14
add14: full_adder PORT MAP(
	A => A(14),
	B => B(14),
	Cin => c(14),
	S => S(14),
	Cout => c(15)
);
-- adder 15
add15: full_adder PORT MAP(
	A => A(15),
	B => B(15),
	Cin => c(15),
	S => S(15),
	Cout => c(0)
);
Vout <= (c(15) xor c(0));
Cout <= c(0);

end Behavioral;
