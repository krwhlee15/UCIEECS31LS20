----------------------------------------------------------------------
-- Digital Design 101 Lab Assignment 1
-- LFDetector Structural Model
----------------------------------------------------------------------
-- Student First Name : Your First Name
-- Student Last Name : Your Last Name
-- Student ID : Your Student ID
----------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY NAND2 IS
   PORT (x: IN std_logic;
         y: IN std_logic;
         F: OUT std_logic);
END NAND2;  

ARCHITECTURE behav OF NAND2 IS
BEGIN
   PROCESS(x, y)
   BEGIN
      F <= NOT (x AND y) AFTER 1.4 ns; 
   END PROCESS;
END behav;
----------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY LFDetector_structural IS
   PORT (Fuel3, Fuel2, Fuel1, Fuel0: IN std_logic;
         FuelWarningLight: OUT std_logic);
END LFDetector_structural;

ARCHITECTURE structural OF LFDetector_structural IS
-- DO NOT modify any signals, ports, or entities above this line
-- add your code below this line
-- use the appropriate library component(s) specified in the lab handout
-- add the appropriate internal signals & wire your design below
    COMPONENT NAND2 IS
        PORT ( x: IN std_logic;
               y: IN std_logic;
               F: OUT std_logic);
    END COMPONENT;
    
SIGNAL F0, F1, F2, F3, w1, w2, w3, w4, w5: std_logic; 
BEGIN
        NAND2_0: NAND2 PORT MAP(Fuel0, Fuel0, F0);
        NAND2_1: NAND2 PORT MAP(Fuel1, Fuel1, F1);
        NAND2_2: NAND2 PORT MAP(Fuel2, Fuel2, F2);
        NAND2_3: NAND2 PORT MAP(Fuel3, Fuel3, F3);
        NAND2_4: NAND2 PORT MAP(F3, F2, w1);
        NAND2_5: NAND2 PORT MAP(F1, F3, w2);
        NAND2_6: NAND2 PORT MAP(w2, w2, w3);
        NAND2_7: NAND2 PORT MAP(F0, w3, w4);
        NAND2_8: NAND2 PORT MAP(w2, w4, FuelWarningLIght);
END structural;