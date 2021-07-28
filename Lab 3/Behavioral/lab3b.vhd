----------------------------------------------------------------------
-- EECS31L/CSE31L Assignment3
-- Locator Behavioral Model
----------------------------------------------------------------------
-- Student First Name : Wonhee
-- Student Last Name : Lee
-- Student ID : 54872959
----------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

entity Locator_beh  is
    Port ( Start : in  STD_LOGIC;
           Rst : in  STD_LOGIC;
           Clk : in  STD_LOGIC;
           Loc : out  STD_LOGIC_VECTOR (15 downto 0);
           Done : out  STD_LOGIC);
end Locator_beh;

architecture Behavioral of Locator_beh  is

   TYPE regArray_type IS 
      ARRAY (0 TO 7) OF std_logic_vector(15 DOWNTO 0); 
   SIGNAL regArray : regArray_type :=  (X"0000", X"000B", X"0008", X"0003", X"0005", X"0000", X"0000", X"0000");     

-- do not modify any code above this line
-- additional variables/signals can be declared if needed
-- add your code starting here
    type StateType is
        (Initial, Calc, Result);
    signal CurrState, NextState: StateType; 
begin
        -- Creates a process sensitive to Clk that serves as a clock
        StateReg: process(Clk)
        begin 
            if(Clk = '1' and Clk'event) then
                CurrState <= NextState;
            end if;
        end process;    

        -- Creates a process sensitive to input and decides on what to output based 
        -- on current state and input
        CombLogic: process(CurrState, Rst, Start)
         variable temp1, temp2, temp3: std_logic_vector(31 downto 0);     
        begin
            case CurrState is    
                when Initial =>
                    Done <= '0';
                    if (Start = '1') then
                        NextState <= Calc;
                    else
                        NextState <= Initial;
                    end if;
                when Calc =>
                    if (Rst = '0') then
                        temp1 := regArray(2) * regArray(2); -- t^2
                        temp2 := regArray(1) * temp1(15 downto 0); -- at^2;
                        regArray(5) <= '0' & temp2(15 downto 1); -- at^2 / 2
                        temp3 := regArray(3) * regArray(2); -- v0t
                        regArray(6) <= regArray(5) + temp3(15 downto 0) + regArray(4);
                        NextState <= Result;
                     else
                        NextState <= Initial;
                     end if;
                when Result => 
                      Done <= '1';
                      Loc <= regArray(6);
                      If (Rst = '1') then
                        NextState <= Initial;
                      end if;                      
            end case;
        end process;
end Behavioral;

