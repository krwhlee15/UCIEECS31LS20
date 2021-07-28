--------------------------------------------------------------------------------
-- Company:       QV's Minions
-- Engineer:      <Wonhee Lee>
-- 
-- VHDL Test Bench Created by ISE for module: Lab2b_FSM
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY lab2b_tb IS
END lab2b_tb;
 
ARCHITECTURE behavior OF lab2b_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Lab2b_FSM
    PORT(
         Input : IN  std_logic_vector(2 downto 0);
         Clk : IN  std_logic;
         Permit : OUT  std_logic;
         ReturnChange : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Input : std_logic_vector(2 downto 0) := (others => '0');
   signal Clk : std_logic := '0';

 	--Outputs
   signal Permit : std_logic;
   signal ReturnChange : std_logic;

   -- Clock period definitions
   constant Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Lab2b_FSM PORT MAP (
          Input => Input,
          Clk => Clk,
          Permit => Permit,
          ReturnChange => ReturnChange
        );

   -- Clock process definitions
   Clk_process: process
   begin
		Clk <= '0';
		wait for Clk_period/2;
		Clk <= '1';
		wait for Clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for some number of ns.
      wait for 100 ns;	
      
      
        -- waiting for next clock edge, then adding a little bit of time
        -- to help avoid any potential setup/hold time errors
        -- you can remove these next 2 lines and/or modify them as you wish
        WAIT UNTIL clk = '1' AND clk'EVENT;
		wait for 2 ns;

      -- insert stimulus here 

		-- TEST CASE 0 BEGIN (provided) --
		
		-- insert $10 ($10 total)
		Input <= "010";
		Wait for 20 NS ;
		
	    Input <= "000";
		Wait for 20 NS ;
		
		-- insert $5 ($15 total)
	    Input <= "001";
		Wait for 20 NS ;
		
	    Input <= "000";
		Wait for 20 NS ;
		
		-- insert $5 ($20 total, expecting P=1, R=0)
	    Input <= "001";
		Wait for 10 NS ;
		ASSERT Permit = '1' REPORT "p = 1 fail with test case 0" SEVERITY WARNING;
		ASSERT ReturnChange = '0' REPORT "r = 0 fail with test case 0" SEVERITY WARNING;
		Wait for 10 NS ;
	    
		Input <= "000";
		Wait for 30 NS ;

        -- more test cases here
		
		   -- TEST CASE 1 BEGIN --
		 
		   -- insert $20 ($20 total)
		   Input <= "100";
		   Wait for 10 NS ;
		   ASSERT PERMIT = '1' REPORT "p = 1 fail with test case 1" SEVERITY WARNING;
		   ASSERT ReturnChange = '0' REPORT "r = 0 fail with test case 1" SEVERITY WARNING;
		   Wait for 10 NS ;
		 
		   Input <= "000";
		   Wait for 30 NS ;
		   
		   -- TEST CASE 2 BEGIN --
		   
		   
		   -- insert $5 ($5 total)
		   Input <= "001";
		   Wait for 20 NS ;
		
		   Input <= "000";
		   Wait for 20 NS ;
		   -- insert $5 ($10 total)
		   Input <= "001";
		   Wait for 20 NS ;
	
		   Input <= "000";
		   Wait for 20 NS ;
		   
		   -- insert $20 ($35 total)
		   Input <= "100";
		   Wait for 10 NS ;
		   ASSERT PERMIT = '1' REPORT "p = 1 fail with test case 2" SEVERITY WARNING;
		   ASSERT ReturnChange = '1' REPORT "r = 1 fail with test case 2" SEVERITY WARNING;
		   Wait for 10 NS ;
		 
		   Input <= "000";
		   Wait for 30 NS ;
		   
		  -- TEST CASE 3 BEGIN --
		
	      -- insert $10 ($10 total)
		   Input <= "010";
		   Wait for 20 NS ;
		
		   Input <= "000";
		   Wait for 20 NS ;
	   
	       -- insert $5 ($15 total)
		   Input <= "001";
		   Wait for 20 NS ;
	
		   Input <= "000";
		   Wait for 20 NS ;
			
		   -- insert $20 ($35 total)
		   Input <= "100";
		   Wait for 10 NS ;
		   ASSERT PERMIT = '1' REPORT "p = 1 fail with test case 2" SEVERITY WARNING;
		   ASSERT ReturnChange = '1' REPORT "r = 1 fail with test case 2" SEVERITY WARNING;
		   Wait for 10 NS ;
		   
		   Input <= "000";
		   Wait for 30 NS ;
		   
		wait;
   end process;

END;
