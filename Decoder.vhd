----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.05.2022 17:19:32
-- Design Name: 
-- Module Name: Decoder - Behavioral
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


Library IEEE;
use IEEE.std_logic_TEXTIO.all;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity decoder is
port ( mode:in std_logic_vector(2 downto 0);
B:out std_logic_vector(5 downto 0):="000000");
end entity decoder;



architecture decode of decoder is
begin
process (mode)
begin
case mode(2 downto 0) is
when "000"=> B(0)<='1'; B(1)<='0';B(2)<='0';B(3)<='0';B(4)<='0';B(5)<='0';
when "001"=> B(0)<='0'; B(1)<='1';B(2)<='0';B(3)<='0';B(4)<='0';B(5)<='0';
when "010"=> B(0)<='0'; B(1)<='0';B(2)<='1';B(3)<='0';B(4)<='0';B(5)<='0';
when "011"=> B(0)<='0'; B(1)<='0';B(2)<='0';B(3)<='1';B(4)<='0';B(5)<='0';
when "100"=> B(0)<='0'; B(1)<='0';B(2)<='0';B(3)<='0';B(4)<='1';B(5)<='0';
when others=> B(0)<='0'; B(1)<='0';B(2)<='0';B(3)<='0';B(4)<='0';B(5)<='1';
end case;
end process;
end architecture decode;