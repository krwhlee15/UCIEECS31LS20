--------------------------------------------------------------------------------
-- Company: QV's Minions
-- Engineer: 
--
-- Create Date:   
-- Design Name:   
-- Module Name:   
-- Project Name:  lab03
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Integrator_struct
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
 
ENTITY lab3s_tb IS
END lab3s_tb;
 
ARCHITECTURE behavior OF lab3s_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Locator_struct
    PORT(
         Start : IN  std_logic;
         Rst : IN  std_logic;
         Clk : IN  std_logic;
         Loc : OUT  std_logic_vector(15 downto 0);
		 Done : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Start : std_logic := '0';
   signal Clk : std_logic := '0';
   signal Rst : std_logic := '1';

     --Outputs
   signal Done : std_logic;
   signal Loc : std_logic_vector(15 downto 0);

   -- Clock period definitions; change to correct value
   constant Clk_period : time := 37 ns;
 
BEGIN
 
    -- Instantiate the Unit Under Test (UUT)
   uut: Locator_struct PORT MAP (
          Start => Start,
          Rst => Rst,
          Clk => Clk,
		  Loc => Loc,
          Done => Done
        );

   -- Clock process definitions
   Clk_process :process
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
        WAIT FOR 100 NS; -- allow time for everything to rst
        Rst <= '0';
		
		assert Done = '0' report "problem with done = '0' before finished" severity warning;
		assert Loc = "ZZZZZZZZZZZZZZZZ" report "problem with Loc = 'Z' before finished" severity warning;
		
		-- your stimulus here
		Start <= '1';
		wait for 100ns;
		Rst <= '1';
		wait for 37ns;
		
		Rst <= '0';
		Start <= '0';
		wait for 235 ns; 
		assert Done = '1' report "problem with Done = '1'after finished" severity warning;
		assert Loc = X"017d" report "problem with Loc = 017D after finished" severity warning;
		
		wait;-- will wait forever

        WRITE (stringbuff, string'("Simulation Ends at "));
        WRITE (stringbuff, now);
        WRITELINE (output, stringbuff);

        wait;
   end process;

END;
