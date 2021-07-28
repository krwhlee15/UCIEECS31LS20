----------------------------------------------------------------------
-- Digital Design 101 Lab Assignment 1 - S20
-- LFDetector Behavioral Model
----------------------------------------------------------------------
-- Student First Name : Wonhee Lee
-- Student Last Name : Lee
-- Student ID : 54872959
----------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY LFDetector_behav IS
   PORT (Fuel3, Fuel2, Fuel1, Fuel0: IN std_logic;
         FuelWarningLight: OUT std_logic);
END LFDetector_behav;

ARCHITECTURE Behavior OF LFDetector_behav IS

-- DO NOT modify any signals, ports, or entities above this line
-- add your code below this line
-- put your code in a PROCESS
-- use AND/OR/NOT keywords for behavioral function

BEGIN

    PROCESS(Fuel3, Fuel2, Fuel1, Fuel0)
    BEGIN
        FuelWarningLight <= (NOT Fuel3 AND NOT Fuel2) or (NOT Fuel3 AND NOT Fuel1 AND NOT Fuel0);
	END PROCESS;

END Behavior;