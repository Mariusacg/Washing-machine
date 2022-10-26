----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.05.2022 10:38:33
-- Design Name: 
-- Module Name: Counter_minute - Behavioral
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
use IEEE.STD_LOGIC_1164.all;
use ieee.std_logic_unsigned.all; 

entity Counter_minute is
	 port(
		 clk : in STD_LOGIC;
		 Start : in STD_LOGIC;
		 intrari_minute: in STD_LOGIC_VECTOR(5 downto 0);
		 intrari_secunde: in STD_LOGIC_VECTOR(5 downto 0);
		 iesire_secunde: out STD_LOGIC_VECTOR(5 downto 0);
		 iesiri_minute: out STD_LOGIC_VECTOR(5 downto 0);
		 Borrow : out STD_LOGIC
	     );
end Counter_minute;

--}} End of automatically maintained section

architecture Beh2 of Counter_minute is

signal counter2,counter3: STD_LOGIC_VECTOR(5 downto 0);
signal clk2: STD_LOGIC :='0';
signal ceva:STD_LOGIC :='0';
signal manevra:STD_LOGIC :='0';
signal counter : integer range 0 to 60 := 0;
component Divizor is
    Port (
        clk_in : in  STD_LOGIC;
        reset  : in  STD_LOGIC;
        clk_out: out STD_LOGIC
    );
    end component;
begin
   c2:Divizor port map (clk,NOT(Start),clk2);                                    
   
    process(clk)
    begin
     if (rising_edge(clk2)) then
         counter2<=counter2-1;
        if(counter2="000000") then
            counter3<=counter3-1;
             counter2<="111011"; 
                   end if;
             end if;      
              if(Start='0') then
           counter2<=intrari_secunde;
           counter3<=intrari_minute;
        end if;
    end process;
     process(clk)
     begin
     if(counter3="111111") then
       ceva<='1';
             else
       ceva<='0';
     end if;
     end process; 
     iesire_secunde<=counter2;
     iesiri_minute<=counter3;
     Borrow <= ceva;
     
     
end Beh2;