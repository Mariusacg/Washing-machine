----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.05.2022 16:20:01
-- Design Name: 
-- Module Name: Debouncer_kindof - Debouncer
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

entity Debouncer_kindof is
Port (
        clk_in : in  STD_LOGIC;
        clk_out: out STD_LOGIC
    );
end Debouncer_kindof;

architecture Debouncer of Debouncer_kindof is
signal ceva: STD_LOGIC;
    signal counter : integer range 0 to 99999 := 0;
begin
    process (clk_in) begin
        
        if rising_edge(clk_in) then
            if (counter = 99999) then            
                ceva <= NOT(ceva);
                counter <= 0;
            else
                counter <= counter + 1;
            end if;
        end if;
    end process;
    
    clk_out <= ceva;


end Debouncer;
