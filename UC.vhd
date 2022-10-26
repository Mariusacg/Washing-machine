----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.05.2022 17:17:59
-- Design Name: 
-- Module Name: UC - Behavioral
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
 entity uc is
	 port  (clk,usa,enable_machine,incalzire,gata_usa,prespalare,clatire_supl,gata_prespalare,
	 		gata_spalare,gata_clatire,gata_centrifugare,gata_tot:in std_logic; 
	 mode:in std_logic_vector(2 downto 0);
	 temp:in std_logic_vector(1 downto 0);	
	 viteza:in std_logic_vector(1 downto 0);
	 mode_out:out std_logic_vector(2 downto 0);
	 temp_out:out std_logic_vector(1 downto 0);
	 prespalare_out,clatire_supl_out,bec_gata,enabletimer,usao,enable_prespalare,enable_spalare,enable_clatire,enable_centrifugare,
	 bec_prespalare,bec_spalare,bec_clatire,bec_centrifugare:out std_logic:='0';
	 e_inc,mu:out std_logic:='0'
	 );
end entity uc;

architecture org of uc is  	
type stari is (A,B,C,E,sp,cl,centr,verificare,deschidere,final);
signal nxt,stare:stari:=A;
signal k:std_logic:='0';  
begin				
		   
process (clk)
begin
if clk'event and clk='1' then
		 stare<=nxt;
		 end if;
end process;
process(stare)
begin		 
case stare is
	when A =>
			mode_out<=mode;
			temp_out<=temp;	 
			prespalare_out<=prespalare;
			clatire_supl_out<=clatire_supl;
			if  usa='0' then
			 nxt<=A;
			else 		
			usao<='1';nxt<=B ;
			end if;
	when B=> if enable_machine='1'	 then
				nxt<=C;
				else nxt<=B;
			   end if;
	when C=>e_inc<='1';  
	        enabletimer<='1';
			if	incalzire='1'  then
				nxt<=E;
			 else nxt<=C;
				end if;	
	when  E=>enable_prespalare<='1'; bec_prespalare<='1';
				if 	gata_prespalare='1' then
					nxt<=sp; bec_prespalare<='0' ;
				else nxt<=E;
				end if;
	When sp=> bec_spalare<='1';	 enable_spalare<='1'; 
				if gata_spalare='1' then
				nxt<=CL; bec_spalare<='0';
				else nxt<=sp;
				end if;
	when cl=> bec_clatire<='1'; enable_clatire<='1';
			if gata_clatire='1' then 
			 nxt<=centr; bec_clatire<='0';
			else nxt<=cl	;	 
			end if;
	when centr=> bec_centrifugare<='1'; enable_centrifugare<='1';
				if	gata_centrifugare='1'
				then nxt<=verificare;  bec_centrifugare<='0';
				else nxt<=centr;
				end if;	
	when verificare=> if gata_tot='1'
			then	  nxt<=deschidere;
		else nxt<=verificare;
			end if;
	when deschidere=> mu<='1';
			if gata_usa='1' then
			nxt<=final;	k<='1';
			else nxt<=deschidere;
			end if;		
	when final=> bec_gata<='1';		
	end case;
if(k='1') then
usao<='0';
end if;
end process;
end architecture org;