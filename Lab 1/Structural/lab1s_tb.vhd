LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;

ENTITY lab1s_tb_vhd IS
END lab1s_tb_vhd;

ARCHITECTURE structure OF lab1s_tb_vhd IS 

	COMPONENT LFDetector_struct
	PORT(
		Fuel3 : IN std_logic;
		Fuel2 : IN std_logic;
		Fuel1 : IN std_logic;
		Fuel0 : IN std_logic;          
		FuelWarningLight : OUT std_logic
		);
	END COMPONENT;

	SIGNAL Fuel3 :  std_logic := '0';
	SIGNAL Fuel2 :  std_logic := '0';
	SIGNAL Fuel1 :  std_logic := '0';
	SIGNAL Fuel0 :  std_logic := '0';

	SIGNAL FuelWarningLight :  std_logic;

BEGIN
	uut: LFDetector_struct PORT MAP(
		Fuel3 => Fuel3,
		Fuel2 => Fuel2,
		Fuel1 => Fuel1,
		Fuel0 => Fuel0,
		FuelWarningLight => FuelWarningLight
	);

	tb : PROCESS
	BEGIN

		wait for 100 ns;

		Fuel3 <= '0';Fuel2 <= '0';Fuel1 <= '0';Fuel0 <='0'; wait for 10 ns;
		Fuel3 <= '0';Fuel2 <= '0';Fuel1 <= '0';Fuel0 <='1'; wait for 10 ns;
        Fuel3 <= '0';Fuel2 <= '0';Fuel1 <= '1';Fuel0 <='0'; wait for 10 ns;
        Fuel3 <= '0';Fuel2 <= '0';Fuel1 <= '1';Fuel0 <='1'; wait for 10 ns;
        Fuel3 <= '0';Fuel2 <= '1';Fuel1 <= '0';Fuel0 <='0'; wait for 10 ns;
        Fuel3 <= '0';Fuel2 <= '1';Fuel1 <= '0';Fuel0 <='1'; wait for 10 ns;
        Fuel3 <= '0';Fuel2 <= '1';Fuel1 <= '1';Fuel0 <='0'; wait for 10 ns;
        Fuel3 <= '0';Fuel2 <= '1';Fuel1 <= '1';Fuel0 <='1'; wait for 10 ns;
        Fuel3 <= '1';Fuel2 <= '0';Fuel1 <= '0';Fuel0 <='0'; wait for 10 ns;
        Fuel3 <= '1';Fuel2 <= '0';Fuel1 <= '0';Fuel0 <='1'; wait for 10 ns;
        Fuel3 <= '1';Fuel2 <= '0';Fuel1 <= '1';Fuel0 <='0'; wait for 10 ns;
        Fuel3 <= '1';Fuel2 <= '0';Fuel1 <= '1';Fuel0 <='1'; wait for 10 ns;
        Fuel3 <= '1';Fuel2 <= '1';Fuel1 <= '0';Fuel0 <='0'; wait for 10 ns;
        Fuel3 <= '1';Fuel2 <= '1';Fuel1 <= '0';Fuel0 <='1'; wait for 10 ns;
        Fuel3 <= '1';Fuel2 <= '1';Fuel1 <= '1';Fuel0 <='0'; wait for 10 ns;
        Fuel3 <= '1';Fuel2 <= '1';Fuel1 <= '1';Fuel0 <='1'; wait for 10 ns;                
        
		wait; 
	END PROCESS;

END;