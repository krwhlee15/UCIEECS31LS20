----------------------------------------------------------------------
-- EECS31L Assignment 2
-- FSM Structural Model
----------------------------------------------------------------------
-- Student First Name : Wonhee
-- Student Last Name : Lee
-- Student ID : 54872959
----------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY Lab2s_FSM IS
     Port (Input : in  STD_LOGIC_VECTOR(2 DOWNTO 0);
           Clk : in  STD_LOGIC;
           Permit : out  STD_LOGIC;
           ReturnChange : out  STD_LOGIC);
END Lab2s_FSM;

ARCHITECTURE Structural OF Lab2s_FSM IS

-- DO NOT modify any signals, ports, or entities above this line
-- Required - there are multiple ways to complete this FSM; however, you will be restricted to the following as a best practice:
-- Create 2 processes (one for updating state status and the other for describing transitions and outputs)
-- For the combinatorial process, use Boolean equations consisting of AND, OR, and NOT gates while expressing the delay in terms of the NAND gates. 
-- Remember to use your calculated delay from the lab handout.
-- For the state register process, use IF statements. Remember to use the calculated delay from the lab handout.
-- Figure out the appropriate sensitivity list of both the processes.
-- add your code here
	SUBTYPE Statetype IS std_logic_vector(3 DOWNTO 0);
	SIGNAL Nextstate: Statetype;
	SIGNAL Currstate: Statetype := "0000"; 

BEGIN
	CombLogic : PROCESS (Currstate, Input)
	BEGIN
		Permit <= (Currstate(3) AND (NOT Currstate(2)) AND (NOT Currstate(1)) AND (NOT Currstate(0))) OR ((NOT Currstate(3)) AND Currstate(2) AND Currstate(1) AND Currstate(0)) AFTER 5.6 NS;
		ReturnChange <= Currstate(3) AND (NOT Currstate(2)) AND (NOT Currstate(1)) AFTER 5.6 NS;
		
		Nextstate(3) <= ((NOT Currstate(3)) AND (Currstate(2)) AND (Currstate(1)) AND (NOT Currstate(0)) AND (NOT Input(2)) AND (Input(1)) AND (NOT Input(0))) OR
						((NOT Currstate(3)) AND (Currstate(2)) AND (NOT Currstate(1)) AND (Input(2)) AND (Input(1)) AND (Input(0))) OR
						((NOT Currstate(3)) AND (Currstate(2)) AND (NOT Currstate(1)) AND (Input(2)) AND (NOT Input(1)) AND (NOT Input(0))) OR
						((NOT Currstate(3)) AND (Currstate(2)) AND (NOT Currstate(0)) AND (Input(2)) AND (Input(1)) AND (Input(0))) OR
						((NOT Currstate(3)) AND (Currstate(2)) AND (NOT Currstate(0)) AND (Input(2)) AND (NOT Input(1)) AND (NOT Input(0))) OR
						((NOT Currstate(3)) AND (NOT Currstate(1)) AND (NOT Currstate(0)) AND (Input(2)) AND (Input(1)) AND (Input(0))) AFTER 5.6 NS;

		Nextstate(2) <= ((NOT Currstate(3)) AND (Currstate(2)) AND (Currstate(1)) AND (NOT Currstate(0)) AND (NOT Input(2)) AND (NOT Input(1)) AND (Input(0))) OR
						((NOT Currstate(3)) AND (Currstate(2)) AND (NOT Currstate(1)) AND (Currstate(0)) AND (NOT Input(2)) AND (NOT Input(0))) OR
						((NOT Currstate(3)) AND (Currstate(2)) AND (NOT Currstate(1)) AND (NOT Input(2)) AND (NOT Input(1)) AND (NOT Input(0))) OR
						((NOT Currstate(3)) AND (NOT Currstate(2)) AND (Currstate(1)) AND (NOT Input(2)) AND (NOT Input(1)) AND (NOT Input(0))) OR
						((NOT Currstate(3)) AND (NOT Currstate(2)) AND (NOT Currstate(1)) AND (NOT Currstate(0)) AND (Input(2)) AND (NOT Input(1)) AND (NOT Input(0))) OR
						((NOT Currstate(3)) AND (NOT Currstate(2)) AND (Currstate(0)) AND (NOT Input(2)) AND (NOT Input(1)) AND (NOT Input(0))) AFTER 5.6 NS;

		Nextstate(1) <= ((NOT Currstate(3)) AND (Currstate(2)) AND (Currstate(1)) AND (NOT Currstate(0)) AND (NOT Input(2)) AND (NOT Input(1))) OR
						((NOT Currstate(3)) AND (Currstate(2)) AND (NOT Currstate(1)) AND (NOT Input(2)) AND (Input(1)) AND (NOT Input(0))) OR
						((NOT Currstate(3)) AND (Currstate(2)) AND (NOT Currstate(1)) AND (NOT Input(2)) AND (NOT Input(1)) AND (Input(0))) OR
						((NOT Currstate(3)) AND (NOT Currstate(2)) AND (Currstate(1)) AND (Currstate(0)) AND (NOT Input(1)) AND (NOT Input(0))) OR
						((NOT Currstate(3)) AND (NOT Currstate(2)) AND (Currstate(1)) AND (Input(2)) AND (Input(1)) AND (Input(0))) OR
						((NOT Currstate(3)) AND (NOT Currstate(2)) AND (Currstate(1)) AND (NOT Input(2)) AND (Input(1)) AND (NOT Input(0))) OR
						((NOT Currstate(3)) AND (NOT Currstate(2)) AND (Currstate(1)) AND (NOT Input(2)) AND (NOT Input(1)) AND (Input(0))) OR
						((NOT Currstate(3)) AND (NOT Currstate(2)) AND (NOT Currstate(0)) AND (Input(2)) AND (NOT Input(1)) AND (NOT Input(0))) OR
						((NOT Currstate(3) ) AND (NOT Currstate(2)) AND (NOT Currstate(0)) AND (NOT Input(2)) AND (Input(1)) AND (NOT Input(0))) AFTER 5.6 NS;

		Nextstate(0) <= ((NOT Currstate(3)) AND (Currstate(2)) AND (Currstate(1)) AND (NOT Currstate(0)) AND (NOT Input(2)) AND (NOT Input(1))) OR
						((NOT Currstate(3)) AND (Currstate(2)) AND (NOT Currstate(1)) AND (Currstate(0)) AND (NOT Input(2)) AND (NOT Input(1))) OR
						((NOT Currstate(3)) AND (Currstate(2)) AND (NOT Currstate(1)) AND (NOT Input(2)) AND (Input(1)) AND (NOT Input(0))) OR
						((NOT Currstate(3)) AND (Currstate(2)) AND (NOT Currstate(0)) AND (Input(2)) AND (Input(1)) AND (Input(0))) OR
						((NOT Currstate(3)) AND (NOT Currstate(2)) AND (NOT Currstate(1)) AND (Input(2)) AND (NOT Input(1)) AND (NOT Input(0))) OR
						((NOT Currstate(3)) AND (NOT Currstate(2)) AND (NOT Currstate(1)) AND (NOT Input(2)) AND (NOT Input(1)) AND (Input(0))) OR
						((NOT Currstate(3)) AND (NOT Currstate(2)) AND (Currstate(0)) AND (Input(2)) AND (Input(1)) AND (Input(0))) OR
						((NOT Currstate(3)) AND (NOT Currstate(2)) AND (Currstate(0)) AND (Input(2)) AND (NOT Input(1)) AND (NOT Input(0))) OR
						((NOT Currstate(3)) AND (NOT Currstate(2)) AND (Currstate(0)) AND (NOT Input(2)) AND (Input(1)) AND (NOT Input(0))) OR
						((NOT Currstate(3)) AND (NOT Currstate(2)) AND (Currstate(0)) AND (NOT Input(2)) AND (NOT Input(1)) AND (Input(0))) OR
						((NOT Currstate(3)) AND (Currstate(1)) AND (NOT Currstate(0)) AND (NOT Input(2)) AND (NOT Input(1)) AND (NOT Input(0))) OR
						((NOT Currstate(3)) AND (NOT Currstate(1)) AND (Input(2)) AND (Input(1)) AND (Input(0))) AFTER 5.6 NS;

	END PROCESS CombLogic;
	
	StateReg: PROCESS (Clk)
	BEGIN
		IF (Clk = '1' AND Clk'EVENT) THEN
			Currstate <= Nextstate AFTER 4.0 NS;
		END IF;
	END PROCESS StateReg;
	

END Structural;