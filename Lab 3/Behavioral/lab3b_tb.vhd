--------------------------------------------------------------------------------
-- Company: QV's Minions
-- Engineer: QV (template only) and <Wonhee Lee>
--
-- Create Date: 05-14-2020  
-- Design Name:   
-- Module Name:   
-- Project Name: lab03 
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Integrator_behav
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
USE std.textio.ALL; -- for write, writelin
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY lab3b_tb IS
END lab3b_tb;
 
ARCHITECTURE behavior OF lab3b_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Locator_beh
    PORT(
         Start : IN  std_logic;
         Done : OUT  std_logic;
         Loc : OUT  std_logic_vector(15 downto 0);
         Clk : IN  std_logic;
         Rst : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Start : std_logic := '0';
   signal Clk : std_logic := '0';
   signal Rst : std_logic := '0';

     --Outputs
   signal Done : std_logic;
   signal Loc : std_logic_vector(15 downto 0);

   -- Clock period definitions
   constant Clk_period : time := 10 ns;
 
BEGIN
 
    -- Instantiate the Unit Under Test (UUT)
   uut: Locator_beh PORT MAP (
          Start => Start,
          Done => Done,
          Loc => Loc,
          Clk => Clk,
          Rst => Rst
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
    variable stringbuff : LINE;
   begin        
        WRITE (stringbuff, string'("Simulation starts at "));
        WRITE (stringbuff, now);
        WRITELINE (output, stringbuff);

        Rst <= '1';
        WAIT FOR 50 NS; -- allow time for everything to rst
        Rst <= '0';
		WAIT FOR 15 NS; -- give some time between pressing rst & start button
		
		Start <= '1';
		WAIT UNTIL rising_edge(clk); -- wait for a rising edge so that it is easierto calculate next several wait statements
		WAIT FOR 20 NS; -- hold for some amount of time
		Start <= '0';
		
        assert Loc /= X"017d" report "Loc = 381 fail with test case 0" severity warning;
        WAIT FOR 10 NS;
        Rst <= '1';
        WAIT FOR 10 NS;
        Rst <= '0';
        
        WRITE (stringbuff, string'("Simulation Ends at "));
        WRITE (stringbuff, now);
        WRITELINE (output, stringbuff);
        
        wait;
   end process;
END;
