----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.05.2022 22:26:48
-- Design Name: 
-- Module Name: Divizor_de_frecventa_100mhz_1sec - Behavioral
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

entity Divizor is
    Port (
        clk_in : in  STD_LOGIC;
        reset  : in  STD_LOGIC;
        clk_out: out STD_LOGIC
    );
end Divizor;

architecture Behavioral of Divizor is
    signal ceva: STD_LOGIC;
    signal counter : integer range 0 to 49999999 := 0;
begin
    process (reset, clk_in) begin
        if (reset = '1') then
            ceva <= '0';
            counter <= 0;
        elsif rising_edge(clk_in) then
            if (counter = 49999999) then            
                ceva <= NOT(ceva);
                counter <= 0;
            else
                counter <= counter + 1;
            end if;
        end if;
    end process;
    
    clk_out <= ceva;
end Behavioral;
