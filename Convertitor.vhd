----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.05.2022 22:18:09
-- Design Name: 
-- Module Name: Convertitor - Behavioral
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


entity Convertitor is
  Port(
      clk:in STD_LOGIC; 
      Intrari_secunde : in STD_LOGIC_VECTOR(5 downto 0);
      Intrari_minute : in STD_LOGIC_VECTOR(5 downto 0);
      digit0,digit1,digit2,digit3 :out STD_LOGIC_VECTOR(3 downto 0));
    
end Convertitor;

architecture Manevra of Convertitor is
signal temp,temp2:std_logic_vector(5 downto 0):="000000";
component Debouncer_kindof is
Port (
        clk_in : in  STD_LOGIC;
        clk_out: out STD_LOGIC
    );
 end component;
 signal da:std_logic:='0';
begin
 F1:Debouncer_kindof port map (clk,da);
process(da)
begin


if (Intrari_secunde<10) then
    digit1<="0000";
    digit0<=Intrari_secunde(3 downto 0);
    end if;
if (Intrari_secunde<20 and Intrari_secunde>=10) then
    digit1<="0001";
    temp<=Intrari_secunde-10;
    digit0<=temp(3 downto 0);
    end if;    
if (Intrari_secunde<30 and Intrari_secunde>=20) then
    digit1<="0010";
    temp<=Intrari_secunde-20;
    digit0<=temp(3 downto 0);
    end if;    
if (Intrari_secunde<40 and Intrari_secunde>=30) then
    digit1<="0011";
    temp<=Intrari_secunde-30;
    digit0<=temp(3 downto 0);
    end if;    
if (Intrari_secunde<50 and Intrari_secunde>=40) then
    digit1<="0100";
    temp<=Intrari_secunde-40;
    digit0<=temp(3 downto 0);
    end if;    
if (Intrari_secunde<60 and Intrari_secunde>=50) then
    digit1<="0101";
   temp<=Intrari_secunde-50;
    digit0<=temp(3 downto 0);
    end if;     
if (Intrari_secunde>=60) then
    digit1<="0110";
   temp<=Intrari_secunde-60;
    digit0<=temp(3 downto 0);
    end if;

if (Intrari_minute<10) then
    digit3<="0000";
    digit2<=Intrari_minute(3 downto 0);
    end if;
if (Intrari_minute<20 and Intrari_minute>=10) then
    digit3<="0001";
    temp2<=Intrari_minute-10;
    digit2<=temp2(3 downto 0);
    end if;    
if (Intrari_minute<30 and Intrari_minute>=20) then
    digit3<="0010";
    temp2<=Intrari_minute-20;
    digit2<=temp2(3 downto 0);
    end if;    
if (Intrari_minute<40 and Intrari_minute>=30) then
    digit3<="0011";
    temp2<=Intrari_minute-30;
    digit2<=temp2(3 downto 0);
    end if;    
if (Intrari_minute<50 and Intrari_minute>=40) then
    digit3<="0100";
    temp2<=Intrari_minute-40;
    digit2<=temp2(3 downto 0);
    end if;    
if (Intrari_minute<60 and Intrari_minute>=50) then
    digit3<="0101";
   temp2<=Intrari_minute-50;
    digit2<=temp2(3 downto 0);
    end if;
if (Intrari_minute>=60) then
    digit3<="0110";
   temp2<=Intrari_minute-60;
    digit2<=temp2(3 downto 0);
    end if;

end process;

end Manevra;
