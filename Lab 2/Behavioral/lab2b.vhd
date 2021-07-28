----------------------------------------------------------------------
-- EECS31L Assignment 2
-- FSM Behavioral Model
----------------------------------------------------------------------
-- Student First Name : Wonhee Lee
-- Student Last Name : Lee
-- Student ID : 54872959
----------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;
USE ieee.std_logic_unsigned.ALL;

entity Lab2b_FSM is
    Port ( Input : in  STD_LOGIC_VECTOR(2 DOWNTO 0);
           Clk : in  STD_LOGIC;
           Permit : out  STD_LOGIC;
           ReturnChange : out  STD_LOGIC);
end Lab2b_FSM;

architecture Behavioral of Lab2b_FSM is

-- DO NOT modify any signals, ports, or entities above this line
-- Recommendation: Create 2 processes (one for updating state status and the other for describing transitions and outputs)
-- Figure out the appropriate sensitivity list of both the processes.
-- Use CASE statements and IF/ELSE/ELSIF statements to describe your processes.
-- add your code here
	type StateType is
		(Initial, FiveTotal, TenTotal, FifteenTotal, TwentyTotal, OverTwenty, Cancel);
	signal Currstate, Nextstate: StateType; 

BEGIN

	StateReg: Process (Clk)
	BEGIN
		IF (Clk = '1' AND Clk'EVENT) THEN
			Currstate <= Nextstate;
		END IF;
	END Process;
	
	CombLogic: Process(Currstate, Input)
	BEGIN
		CASE Currstate IS
			WHEN Initial =>
				Permit <= '0';
				ReturnChange <= '0';
				IF(Input = "001") THEN
					Nextstate <= FiveTotal;
				ELSIF(Input = "010") THEN
					Nextstate <= TenTotal;
				ELSIF(Input = "100") THEN
					Nextstate <= TwentyTotal;
				END IF;
			
			WHEN FiveTotal =>
				Permit <= '0';
				ReturnChange <= '0';
				IF(Input = "001") THEN
					Nextstate <= TenTotal;
				ELSIF(Input = "010") THEN
					Nextstate <= FifteenTotal;
				ELSIF(Input = "100") THEN
					Nextstate <= OverTwenty;
				ELSIF(Input = "111") THEN
					Nextstate <= Cancel;
				END IF;
			
			WHEN TenTotal =>
				Permit <= '0';
				ReturnChange <= '0';
				IF(Input = "001") THEN
					Nextstate <= FifteenTotal;
				ELSIF(Input = "010") THEN
					Nextstate <= TwentyTotal;
				ELSIF(Input = "100") THEN
					Nextstate <= OverTwenty;
				ELSIF(Input = "111") THEN
					Nextstate <= Cancel;
				END IF;
			
			WHEN FifteenTotal =>
				Permit <= '0';
				ReturnChange <= '0';
				IF(Input = "001") THEN
					Nextstate <= TwentyTotal;
				ELSIF(Input = "010") THEN
					Nextstate <= OverTwenty;
				ELSIF(Input = "100") THEN
					Nextstate <= OverTwenty;
				ELSIF(Input = "111") THEN
					Nextstate <= Cancel;
				END IF;
			
			WHEN TwentyTotal =>
				Permit <= '1';
				ReturnChange <= '0';
				Nextstate <= Initial;
				
			WHEN OverTwenty =>
				Permit <= '1';
				ReturnChange <= '1';
				Nextstate <= Initial;
				
			WHEN Cancel =>
				Permit <= '0';
				ReturnChange <= '1';
				Nextstate <= Initial;
				
		END CASE;
	END PROCESS;
END Behavioral;