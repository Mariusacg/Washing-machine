----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.05.2022 15:30:18
-- Design Name: 
-- Module Name: main - main
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

  entity main is
	port( clkk,usa,prespalare,clatire,enable  : in std_logic;
			b_usa,b_spalare,b_clatire,b_centrifugare,b_prespalare,b_gata: out std_logic;
		  mod_func:in std_logic_vector(2 downto 0);
		  viteza,temp:in std_logic_vector(1 downto 0);
		  anod : out STD_LOGIC_VECTOR (3 downto 0);
			catod : out STD_LOGIC_VECTOR (6 downto 0)
		  )	;										  
  end entity main;	
  
  architecture	tot of main is	 
  
         component Debouncer_kindof is
        Port (
        clk_in : in  STD_LOGIC;
        clk_out: out STD_LOGIC
          );
             end component;  
           
	   	 component uc is
		 port  (clk,usa,enable_machine,incalzire,gata_usa,prespalare,clatire_supl,gata_prespalare,
		 		gata_spalare,gata_clatire,gata_centrifugare,gata_tot:in std_logic; 
		 mode:in std_logic_vector(2 downto 0);
		 temp:in std_logic_vector(1 downto 0);	
		 viteza:in std_logic_vector(1 downto 0);
		 mode_out:out std_logic_vector(2 downto 0);
		 temp_out:out std_logic_vector(1 downto 0);
		 prespalare_out,clatire_supl_out,bec_gata,enabletimer,usao,enable_prespalare,enable_spalare,enable_clatire,enable_centrifugare,
		 bec_prespalare,bec_spalare,bec_clatire,bec_centrifugare:out std_logic:='0';  e_inc,mu:out std_logic	) ;
	end component ;
	
			 component sumator is
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
	end component;
	        
  		 component ssd is
			Port ( Intrari_secunde : in STD_LOGIC_VECTOR (5 downto 0);
			Intrari_minute : in STD_LOGIC_VECTOR (5 downto 0);
			clk : in STD_LOGIC;
			anod : out STD_LOGIC_VECTOR (3 downto 0);
			catod : out STD_LOGIC_VECTOR (6 downto 0));
		   end component;	
		   
		   component decoder is
				port ( mode:in std_logic_vector(2 downto 0);
				B:out std_logic_vector(0 to 5):="000000");
		   end component; 
		   
		   
		   component Counter_minute is
					port(
					clk : in STD_LOGIC;
					Start : in STD_LOGIC;
					intrari_minute: in STD_LOGIC_VECTOR(5 downto 0);
					intrari_secunde: in STD_LOGIC_VECTOR(5 downto 0);
					iesire_secunde: out STD_LOGIC_VECTOR(5 downto 0);
					iesiri_minute: out STD_LOGIC_VECTOR(5 downto 0);
					Borrow : out STD_LOGIC
					);
		   end component;
		   
		   
  	 signal	mu,e_inc,presp,clat,et,es,ep,ecf,ec,incalzire,gata_usa,gata_prespalare,
	 		gata_spalare,gata_clatire,gata_centrifugare,gata_tot : std_logic:='0' ; 
	 signal nimic: std_logic:='0'; 
	 signal temp_out:std_logic_vector(1 downto 0);
	 signal mode_out: std_logic_vector(2 downto 0);
	 signal neimp,neimp1,neimp2,neimp3,neimp4,neimp5,neimp6,neimp7,neimp8,neimp9,neimp10,neimp11:std_logic_vector(5 downto 0);
	 signal i_min,i_sec, timp_total,timp_incalzire_minute,timp_incalzire_secunde,timp_clatire,timp_prespalare,B:std_logic_vector(5 downto 0); 
	 signal clk:std_logic:='0';
  	begin  
	
    c0: Debouncer_kindof port map(clkk,clk);
  	c2: uc port map ( clk, usa , enable , incalzire,gata_usa,prespalare,clatire,gata_prespalare,
	 		gata_spalare,gata_clatire,gata_centrifugare,gata_tot,mod_func,temp,viteza,mode_out,temp_out,presp,clat,b_gata,et,b_usa,ep,es,ec,ecf,b_prespalare,b_spalare,b_clatire,b_centrifugare,e_inc,mu);
  	c3: decoder port map (mode_out,B);
	c4: sumator port map (B,temp_out,clat,presp,timp_total,timp_incalzire_minute,timp_incalzire_secunde,timp_clatire,timp_prespalare); 	
	incalzirea: counter_minute port map (clkk, e_inc,timp_incalzire_minute,timp_incalzire_secunde, neimp10,neimp11,incalzire);
	prespalarea: counter_minute port map (clkk,ep, timp_prespalare, "000000",neimp,neimp1,gata_prespalare);
	spalarea_principala: counter_minute port map (clkk,es,"010100","000000",neimp2,neimp3, gata_spalare);
	clatirea: counter_minute port map (clkk, ec,timp_clatire,"000000",neimp4,neimp5,gata_clatire);
	centrifugarea: counter_minute port map (clkk ,ecf,"001010","000000",neimp6,neimp7,gata_centrifugare);
	deschiderea: counter_minute port map (clkk,	mu,"000001","000000",neimp8,neimp9,gata_usa);
	timpul_mare: counter_minute port map (clkk,et,timp_total,timp_incalzire_secunde, i_min,i_sec,gata_tot);
	ssdul: ssd port map (i_min,i_sec,clkk,anod,catod); 
	
  end architecture tot;