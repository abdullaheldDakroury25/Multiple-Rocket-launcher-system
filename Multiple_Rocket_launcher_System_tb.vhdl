LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY Multiple_Rocket_launcher_System_tb IS
END Multiple_Rocket_launcher_System_tb;
ARCHITECTURE behavior OF Multiple_Rocket_launcher_System_tb IS
    -- Component Declaration for the UUT
    COMPONENT Multiple_Rocket_launcher_System
    PORT(
        clk : IN std_logic;
        rst : IN std_logic;
        Is_Target_Escaped_From_Radar_Zone : IN std_logic;
        Is_Target_Monitored_By_Radar : IN std_logic;
        Are_All_Rockets_Fired : OUT std_logic;
        RocketsFired : OUT std_logic_vector(15 downto 0);
        s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12, s13, s14, s15 : IN std_logic
    );
    END COMPONENT;
    -- Signal Declarations
    SIGNAL clk : std_logic := '0';
    SIGNAL rst : std_logic := '0';
    SIGNAL Is_Target_Escaped_From_Radar_Zone : std_logic := '0';
    SIGNAL Is_Target_Monitored_By_Radar : std_logic := '0';
    SIGNAL Are_All_Rockets_Fired : std_logic;
    SIGNAL RocketsFired : std_logic_vector(15 downto 0);
    SIGNAL s : std_logic_vector(15 downto 0) := (OTHERS => '0');
BEGIN
    -- Instantiate the UUT
    uut: Multiple_Rocket_launcher_System PORT MAP (
        clk => clk,
        rst => rst,
        Is_Target_Escaped_From_Radar_Zone => Is_Target_Escaped_From_Radar_Zone,
        Is_Target_Monitored_By_Radar => Is_Target_Monitored_By_Radar,
        Are_All_Rockets_Fired => Are_All_Rockets_Fired,
        RocketsFired => RocketsFired,
        s0 => s(0), s1 => s(1), s2 => s(2), s3 => s(3),
        s4 => s(4), s5 => s(5), s6 => s(6), s7 => s(7),
        s8 => s(8), s9 => s(9), s10 => s(10), s11 => s(11),
        s12 => s(12), s13 => s(13), s14 => s(14), s15 => s(15)
    );
    -- Clock Generation Process
    clk_process : process
    begin
        clk <= '0';
        wait for 5 ns;
        clk <= '1';
        wait for 5 ns;
    end process;
    -- Stimulus Process
    stim_proc: process
    begin
        -- Reset system
        rst <= '1';
        wait for 20 ns;
        rst <= '0';
        -- Enable radar monitoring
        Is_Target_Monitored_By_Radar <= '1';

        -- Simulate rocket firing sequence
        for i in 0 to 15 loop
            s(i) <= '1';
            wait for 50 ns;
            s(i) <= '0';
        end loop;
        -- Simulate target escaping radar zone
        Is_Target_Monitored_By_Radar <= '0';
        Is_Target_Escaped_From_Radar_Zone <= '1';
        wait for 50 ns;

        -- Finish simulation
        wait;
    end process;
END behavior;
