----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.05.2022 17:19:06
-- Design Name: 
-- Module Name: Sumator - Behavioral
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
 use IEEE.std_logic_unsigned.all;
 use IEEE.numeric_std.all;		
 entity sumator is
	 port  ( 		B:in std_logic_vector(5 downto 0):="000000";
	 				temp:in std_logic_vector(1 downto 0);
	 				clatire:in std_logic;
					prespalare:in std_logic; 
					timp_total:out std_logic_vector(5 downto 0):="101000";
					timp_incalzire_minute:out std_logic_vector(5 downto 0):="000000";
					timp_incalzire_secunde:out std_logic_vector(5 downto 0):="000000";
				    timp_clatire:out std_logic_vector(5 downto 0):="001010";
					timp_prespalare: out std_logic_vector (5 downto 0):="000000"
	 );	 
	 
	 
end entity sumator;

architecture chestie of sumator is  
signal tp :std_logic_vector(5 downto 0);
begin
	process (B(5 downto 0))
   	begin
	case B(5 downto 0) is 
	when "000001" =>   timp_total<="101000" ; timp_incalzire_minute<="000000"; timp_incalzire_secunde<="011110";timp_clatire<="001010"; timp_prespalare<="000000"; 
	when "000010" =>	timp_total<="101001" ; timp_incalzire_minute<="000001"; timp_incalzire_secunde<="011110";timp_clatire<="001010"; timp_prespalare<="000000";
	when "000100" =>timp_total<="110010" ; timp_incalzire_minute<="000000"; timp_incalzire_secunde<="110010";timp_clatire<="010100"; timp_prespalare<="000000";	
	when "001000" =>timp_total<="110010" ; timp_incalzire_minute<="000000"; timp_incalzire_secunde<="110010";timp_clatire<="001010"; timp_prespalare<="001010";
	when "010000" =>timp_total<="110100" ; timp_incalzire_minute<="000010"; timp_incalzire_secunde<="011110";timp_clatire<="010100"; timp_prespalare<="000000";	
	when others	 => 	
	if 	prespalare='1' then  
	timp_prespalare<="001010";
		if 	clatire='1' then 
		timp_clatire<="010100";	  
		tp<="111100"; 
		     if(temp(1)='1') then
		     tp<="111101";
		     if(temp(0)='1') then
		        tp<="111110";
		        end if;
		    end if;    
		else
		    timp_clatire<="001010"; 
		    tp<="110010";
		     if(temp(1)='1') then
		     tp<="110011";
		     if(temp(0)='1') then
		        tp<="110100";
		        end if;
		    end if;    
		end if	;
	else
	   timp_prespalare<="000000";
		if 	clatire='1' then 
		timp_clatire<="010100";	
		tp<="110010";
		     if(temp(1)='1') then
		     tp<="110011";
		     if(temp(0)='1') then
		        tp<="110100";
		        end if;
		    end if;    
		else 
		     timp_clatire<="001010";
		     tp<="101000";
		     if(temp(1)='1') then
		     tp<="101001";
		     if(temp(0)='1') then
		        tp<="101010";
		        end if;
		    end if;    
		end if;
	end if	;
	
	case(temp (1 downto 0)) is
	when "00"=>	timp_incalzire_minute<="000000"; timp_incalzire_secunde<="011110"; 
	when "01"=>	timp_incalzire_minute<="000000"; timp_incalzire_secunde<="110010";
	when "10"=>	timp_incalzire_minute<="000001"; timp_incalzire_secunde<="011110"; 
	when others=>	timp_incalzire_minute<="000010"; timp_incalzire_secunde<="011110"; 
		end case;
	timp_total<=tp;
   end case;  

   end process;
end architecture chestie;