----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.05.2022 20:36:20
-- Design Name: 
-- Module Name: SSD - Behavioral
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ssd is
    Port ( Intrari_secunde : in  STD_LOGIC_VECTOR (5 downto 0);
           Intrari_minute : in  STD_LOGIC_VECTOR (5 downto 0);
           clk : in  STD_LOGIC;
           anod : out  STD_LOGIC_VECTOR (3 downto 0);
           catod : out  STD_LOGIC_VECTOR (6 downto 0));
end ssd;

architecture Beh3 of ssd is
signal contor:std_logic_vector(15 downto 0):=x"0000";
signal y_temp:std_logic_vector(3 downto 0):=x"0";  ---"0000"  iesirea de la mux cu digit
signal digit0,digit1,digit2,digit3:std_logic_vector(3 downto 0);


component Convertitor is
  Port(
      clk:in STD_LOGIC; 
      Intrari_secunde : in STD_LOGIC_VECTOR(5 downto 0);
      Intrari_minute : in STD_LOGIC_VECTOR(5 downto 0);
      digit0,digit1,digit2,digit3 :out STD_LOGIC_VECTOR(3 downto 0));
    
end component;
begin

C4:Convertitor port map(clk,Intrari_secunde,Intrari_minute,digit0,digit1,digit2,digit3);

process(clk)
begin

if clk'event and clk='1' then 
	contor<=contor+1;
	
end if;


end process;

--selectie anod 
process(contor)
begin
	case  contor(15 downto 14) is   ---2 biiti 
		when "00"=>anod<="1110"; --activeaza primul anod
		when "01"=>anod<="1101";
		when "10"=>anod<="1011";
		when others=>anod<="0111";
	end case;
end process;

process(contor)
begin
	case contor(15 downto 14) is 
	when "00"=>y_temp<=digit0;
	when "01"=>y_temp<=digit1;
	when "10"=>y_temp<=digit2;
	when others=>y_temp<=digit3;
	end case;

end process;


process(y_temp)
begin
case y_temp is
		when "0000" => catod<="0000001";
		when "0001" => catod<="1001111";
		when "0010" => catod<="0010010";
		when "0011" => catod<="0000110";

		when "0100" => catod<="1001100";
		when "0101" => catod<="0100100";
		when "0110" => catod<="0100000";
		when "0111" => catod<="0001111";

		when "1000" => catod<="0000000";
		when "1001" => catod<="0000100";
		when "1010" => catod<="0001000";
		when "1011" => catod<="1100000";

		when "1100" => catod<="0110001";
		when "1101" => catod<="1000010";
		when "1110" => catod<="0110000";
		when others => catod<="0111000";

end case;
end process;




end Beh3;

