library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

--S0 Represents : ready state for rocket 0
--S1 Represents : ready state for rocket 1
--S2 Represents : ready state for rocket 2
--
--
-- and so on

entity Multiple_Rocket_launcher_System is
     port(
	  clk,rst : in std_logic;
	  Is_Target_Escaped_From_Radar_Zone: in std_logic;
	  Is_Target_Monitored_By_Radar : in std_logic;
	  Are_All_Rockets_Fired : out std_logic;
	  RocketsFired : out std_logic_vector(15 downto 0);
	  s0,s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13,s14,s15 : in std_logic
	  );
end Multiple_Rocket_launcher_System;

architecture Behavioral of Multiple_Rocket_launcher_System is
type state is (T0,T1,T2,T3,T4,T5,T6,T7,T8,T9,T10,T11,T12,T13,T14,T15);

--T0 Represents : Rocket0_ReadyToBeFired
--T1 Represents : Rocket1_ReadyToBeFired
--T2 Represents : Rocket2_ReadyToBeFired
--T3 Represents : Rocket3_ReadyToBeFired
--
--
-- and so on

--nxt : means that the Recent Rocket Is already Fired 
signal present,nxt : state;
Begin
   seq:process(clk)
	  begin
      if(rising_edge(clk)) then
		   if rst = '1' then present <= T0;
			else present <= nxt;
			end if;
		end if;
	end process seq;
	comb:process(present,s0,s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13,s14,s15)
	Begin
	   case present is 
		  when T0 => RocketsFired <= "0000000000000001";
                --(when T0 => T <= "0000000000000001";) : means that the Rocket0 has it's turn to be ready to be fired
			    if (Is_Target_Escaped_From_Radar_Zone = '0') then
			     --(Is_Target_Escaped_From_Radar_Zone = '0') : means that the target could not escape from the radar Zone
			       if (Is_Target_Monitored_By_Radar = '1') then
					   --(Is_Target_Monitored_By_Radar = '1') : ensures that the target is exactly monitored by the radar before firing a rocket
					     if (s0 = '1') then nxt <= T1;
						                     Are_All_Rockets_Fired<='0';
						    --(if (s0 = '1') then nxt <= T1;) : means that if the ready state for rocket0 is equal 1 , then rocket0 is immediatly fired and rocket1 reserves 
							--it's turn to be fired next
						  --Are_All_Rockets_Fired<='0'; means that There are still rockets ready to be fired when ordered
						  else               nxt <= T0;
						                     Are_All_Rockets_Fired<='0';
						    -- else : rocket0 still waits for its turn to be fired 
						  end if;
						end if;
					end if;
				
					
			when T1 => RocketsFired <= "0000000000000010";
                --(when T1 => T <= "0000000000000010";) : means that the Rocket1 has it's turn to be ready to be fired
			    if (Is_Target_Escaped_From_Radar_Zone = '0') then
			     --(Is_Target_Escaped_From_Radar_Zone = '0') : means that the target could not escape from the radar Zone
			       if (Is_Target_Monitored_By_Radar = '1') then
					   --(Is_Target_Monitored_By_Radar = '1') : ensures that the target is exactly monitored by the radar before firing a rocket
					     if (s1 = '1') then nxt <= T2;
						   					   Are_All_Rockets_Fired<='0';
						    --(if (s1 = '1') then nxt <= T2;) : means that if the ready state for rocket1 is equal 1 , then rocket1 is immediatly fired and rocket2 reserves 
							--it's turn to be fired next
						    --Are_All_Rockets_Fired<='0'; means that There are still rockets ready to be fired when ordered
						  else               nxt <= T1;
						    -- else : rocket1 still waits for its turn to be fired 
							 					   Are_All_Rockets_Fired<='0';

						  end if;
						end if;
					end if;
				
					
					
			when T2 => RocketsFired <= "0000000000000100";
                --(when T2 => T <= "0000000000000100";) : means that the Rocket2 has it's turn to be ready to be fired
			    if (Is_Target_Escaped_From_Radar_Zone = '0') then
			     --(Is_Target_Escaped_From_Radar_Zone = '0') : means that the target could not escape from the radar Zone
			       if (Is_Target_Monitored_By_Radar = '1') then
					   --(Is_Target_Monitored_By_Radar = '1') : ensures that the target is exactly monitored by the radar before firing a rocket
					     if (s2 = '1') then nxt <= T3;
						                     Are_All_Rockets_Fired<='0';
						    --(if (s2 = '1') then nxt <= T2;) : means that if the steady state for rocket2 is equal 1 , then rocket2 is immediatly fired and 
							--rocket3 reserves it's turn to be fired next
						    --Are_All_Rockets_Fired<='0'; means that There are still rockets ready to be fired when ordered
						  else               nxt <= T2;
						                     Are_All_Rockets_Fired<='0';
						    -- else : rocket2 still waits for its turn to be fired 
						  end if;
						end if;
					end if;
					
					
			when T3 => RocketsFired <= "0000000000001000";
                --(when T3 => T <= "0000000000001000";) : means that the Rocket3 has it's turn to be ready to be fired
			    if (Is_Target_Escaped_From_Radar_Zone = '0') then
			     --(Is_Target_Escaped_From_Radar_Zone = '0') : means that the target could not escape from the radar Zone
			       if (Is_Target_Monitored_By_Radar = '1') then
					   --(Is_Target_Monitored_By_Radar = '1') : ensures that the target is exactly monitored by the radar before firing a rocket
					     if (s3 = '1') then nxt <= T4;
						                     Are_All_Rockets_Fired<='0';
						    --(if (s3 = '1') then nxt <= T4;) : means that if the steady state for rocket3 is equal 1 , then rocket3 is immediatly fired and rocket4 reserves 
							--it's turn to be fired next
                      --Are_All_Rockets_Fired<='0'; means that There are still rockets ready to be fired when ordered						 
						 else               nxt <= T3;
						                     Are_All_Rockets_Fired<='0';
						    -- else : rocket3 still waits for its turn to be fired 
						  end if;
						end if;
					end if;
					
					
			when T4 => RocketsFired <= "0000000000010000";
                --(when T1 => T <= "0000000000010000";) : means that the Rocket4 has it's turn to be ready to be fired
			    if (Is_Target_Escaped_From_Radar_Zone = '0') then
			     --(Is_Target_Escaped_From_Radar_Zone = '0') : means that the target could not escape from the radar Zone
			       if (Is_Target_Monitored_By_Radar = '1') then
					   --(Is_Target_Monitored_By_Radar = '1') : ensures that the target is exactly monitored by the radar before firing a rocket
					     if (s4 = '1') then nxt <= T5;
						                     Are_All_Rockets_Fired<='0';
						    --(if (s4 = '1') then nxt <= T5;) : means that if the steady state for rocket4 is equal 1 , 
							--then rocket4 is immediatly fired and rocket5 reserves it's turn to be fired next
						    --Are_All_Rockets_Fired<='0'; means that There are still rockets ready to be fired when ordered
						  else               nxt <= T4;
						                     Are_All_Rockets_Fired<='0';
						    -- else : rocke4 still waits for its turn to be fired 
						  end if;
						end if;
					end if;
					
					
			when T5 => RocketsFired <= "0000000000100000";
                --(when T1 => T <= "0000000000100000";) : means that the Rocket4 has it's turn to be ready to be fired
			    if (Is_Target_Escaped_From_Radar_Zone = '0') then
			     --(Is_Target_Escaped_From_Radar_Zone = '0') : means that the target could not escape from the radar Zone
			       if (Is_Target_Monitored_By_Radar = '1') then
					   --(Is_Target_Monitored_By_Radar = '1') : ensures that the target is exactly monitored by the radar before firing a rocket
					     if (s5 = '1') then nxt <= T6;
						                     Are_All_Rockets_Fired<='0';
						    --(if (s5 = '1') then nxt <= T6;) : means that if the steady state for rocket5 is equal 1 , then rocket5 is immediatly fired and rocket6 reserves 
							--it's turn to be fired next
						  	 --Are_All_Rockets_Fired<='0'; means that There are still rockets ready to be fired when ordered
						  else               nxt <= T5;
						                     Are_All_Rockets_Fired<='0';
						    -- else : rocket5 still waits for its turn to be fired 
						  end if;
						end if;
					end if;
					
					
			when T6 => RocketsFired <= "0000000001000000";
                --(when T6 => T <= "0000000001000000";) : means that the Rocket6 has it's turn to be ready to be fired
			    if (Is_Target_Escaped_From_Radar_Zone = '0') then
			     --(Is_Target_Escaped_From_Radar_Zone = '0') : means that the target could not escape from the radar Zone
			       if (Is_Target_Monitored_By_Radar = '1') then
					   --(Is_Target_Monitored_By_Radar = '1') : ensures that the target is exactly monitored by the radar before firing a rocket
					     if (s6 = '1') then nxt <= T7;
						                     Are_All_Rockets_Fired<='0';
						    --(if (s6 = '1') then nxt <= T7;) : means that if the steady state for rocket6 is equal 1 , then rocket6 is immediatly fired and rocket7 
							--reserves it's turn to be fired next
						  	 --Are_All_Rockets_Fired<='0'; means that There are still rockets ready to be fired when ordered
						  else               nxt <= T6;
						                     Are_All_Rockets_Fired<='0';
						    -- else : rocket6 still waits for its turn to be fired 
						  end if;
						end if;
					end if;
					

			when T7 => RocketsFired <= "0000000010000000";
                --(T7 => T <= "0000000010000000") : means that the Rocket7 has it's turn to be ready to be fired
			    if (Is_Target_Escaped_From_Radar_Zone = '0') then
			     --(Is_Target_Escaped_From_Radar_Zone = '0') : means that the target could not escape from the radar Zone
			       if (Is_Target_Monitored_By_Radar = '1') then
					   --(Is_Target_Monitored_By_Radar = '1') : ensures that the target is exactly monitored by the radar before firing a rocket
					     if (s7 = '1') then nxt <= T8;
						                     Are_All_Rockets_Fired<='0';
						    --(if (s7 = '1') then nxt <= T8;) : means that if the steady state for rocket8 is equal 1 , then rocket7 is immediatly fired and rocket8 
							--reserves it's turn to be fired next
						  	 --Are_All_Rockets_Fired<='0'; means that There are still rockets ready to be fired when ordered
						  else               nxt <= T7;
						                     Are_All_Rockets_Fired<='0';
						    -- else : rocket7 still waits for its turn to be fired 
						  end if;
						end if;
					end if;
					

			when T8 => RocketsFired <= "0000000100000000";
                --(when T8 => T <= "0000001000000000";) : means that the Rocket8 has it's turn to be ready to be fired
			    if (Is_Target_Escaped_From_Radar_Zone = '0') then
			     --(Is_Target_Escaped_From_Radar_Zone = '0') : means that the target could not escape from the radar Zone
			       if (Is_Target_Monitored_By_Radar = '1') then
					   --(Is_Target_Monitored_By_Radar = '1') : ensures that the target is exactly monitored by the radar before firing a rocket
					     if (s8 = '1') then nxt <= T9;
						                     Are_All_Rockets_Fired<='0';
						    --(if (s8 = '1') then nxt <= T9;) : means that if the steady state for rocket8 is equal 1 , then rocket8 is immediatly fired and rocket9 
							--reserves it's turn to be fired next
						  	 --Are_All_Rockets_Fired<='0'; means that There are still rockets ready to be fired when ordered
						  else               nxt <= T8;
						                     Are_All_Rockets_Fired<='0';
						    -- else : rocket8 still waits for its turn to be fired 
						  end if;
						end if;
					end if;
										
			when T9 => RocketsFired <= "0000001000000000";
                --(T9 => T <= "0000001000000000";) : means that the Rocket9 has it's turn to be ready to be fired
			    if (Is_Target_Escaped_From_Radar_Zone = '0') then
			     --(Is_Target_Escaped_From_Radar_Zone = '0') : means that the target could not escape from the radar Zone
			       if (Is_Target_Monitored_By_Radar = '1') then
					   --(Is_Target_Monitored_By_Radar = '1') : ensures that the target is exactly monitored by the radar before firing a rocket
					     if (s9 = '1') then nxt <= T10;
						                     Are_All_Rockets_Fired<='0';
						    --(if (s9 = '1') then nxt <= T9;) : means that if the steady state for rocket9 is equal 1 , then rocket9 is immediatly fired and rocket10 
							--reserves it's turn to be fired next
						    --Are_All_Rockets_Fired<='0'; means that There are still rockets ready to be fired when ordered 
						  else               nxt <= T9;
						                     Are_All_Rockets_Fired<='0';
						    -- else : rocket9 still waits for its turn to be fired 
						  end if;
						end if;
					end if;
					
					

			when T10 => RocketsFired <= "0000010000000000";
                --(T9 => T <= "0000010000000000";) : means that the Rocket10 has it's turn to be ready to be fired
			    if (Is_Target_Escaped_From_Radar_Zone = '0') then
			     --(Is_Target_Escaped_From_Radar_Zone = '0') : means that the target could not escape from the radar Zone
			       if (Is_Target_Monitored_By_Radar = '1') then
					   --(Is_Target_Monitored_By_Radar = '1') : ensures that the target is exactly monitored by the radar before firing a rocket
					     if (s10 = '1') then nxt <= T11;
						                     Are_All_Rockets_Fired<='0';
						    --(if (s10 = '1') then nxt <= T10;) : means that if the steady state for rocket10 is equal 1 , then rocket10 is immediatly fired and rocket11 
							--reserves it's turn to be fired next
						    --Are_All_Rockets_Fired<='0'; means that There are still rockets ready to be fired when ordered
						  else               nxt <= T10;
						                     Are_All_Rockets_Fired<='0';
						    -- else : rocket9 still waits for its turn to be fired 
						  end if;
						end if;
					end if;
					
					
					
			when T11 => RocketsFired <= "0000100000000000";
                --(T11 => T <= "0000100000000000";) : means that the Rocket11 has it's turn to be ready to be fired
			    if (Is_Target_Escaped_From_Radar_Zone = '0') then
			     --(Is_Target_Escaped_From_Radar_Zone = '0') : means that the target could not escape from the radar Zone
			       if (Is_Target_Monitored_By_Radar = '1') then
					   --(Is_Target_Monitored_By_Radar = '1') : ensures that the target is exactly monitored by the radar before firing a rocket
					     if (s11 = '1') then nxt <= T12;
						                     Are_All_Rockets_Fired<='0';
						    --(if (s11 = '1') then nxt <= T10;) : means that if the steady state for rocket10 is equal 1 , then rocket10 is immediatly fired and rocket11 
							--reserves it's turn to be fired next
						    --Are_All_Rockets_Fired<='0'; means that There are still rockets ready to be fired when ordered
						  else               nxt <= T11;
						                     Are_All_Rockets_Fired<='0';
						    -- else : rocket9 still waits for its turn to be fired 
						  end if;
						end if;
					end if;
					
					
			when T12 => RocketsFired <= "0001000000000000";
                --(T12 => T <= "0001000000000000";) : means that the Rocket12 has it's turn to be ready to be fired
			    if (Is_Target_Escaped_From_Radar_Zone = '0') then
			     --(Is_Target_Escaped_From_Radar_Zone = '0') : means that the target could not escape from the radar Zone
			       if (Is_Target_Monitored_By_Radar = '1') then
					   --(Is_Target_Monitored_By_Radar = '1') : ensures that the target is exactly monitored by the radar before firing a rocket
					     if (s12 = '1') then nxt <= T13;
						                      Are_All_Rockets_Fired<='0';
						    --(if (s12 = '1') then nxt <= T13;) : means that if the steady state for rocket12 is equal 1 , then rocket12 is immediatly fired and 
							--rocket13 reserves it's turn to be fired next
						    --Are_All_Rockets_Fired<='0'; means that There are still rockets ready to be fired when ordered
						  else               nxt <= T12;
						                     Are_All_Rockets_Fired<='0';
						    -- else : rocket12 still waits for its turn to be fired 
						  end if;
						end if;
					end if;
					
	
			when T13 => RocketsFired <= "0010000000000000";
                --(T12 => T <= "0010000000000000";) : means that the Rocket13 has it's turn to be ready to be fired
			    if (Is_Target_Escaped_From_Radar_Zone = '0') then
			     --(Is_Target_Escaped_From_Radar_Zone = '0') : means that the target could not escape from the radar Zone
			       if (Is_Target_Monitored_By_Radar = '1') then
					   --(Is_Target_Monitored_By_Radar = '1') : ensures that the target is exactly monitored by the radar before firing a rocket
					     if (s13 = '1') then nxt <= T14;
						                      Are_All_Rockets_Fired<='0';
						    --(if (s13 = '1') then nxt <= T14;) : means that if the steady state for rocket13 is equal 1 , then rocket13 is immediatly fired and 
							--rocket14 reserves it's turn to be fired next
						    --Are_All_Rockets_Fired<='0'; means that There are still rockets ready to be fired when ordered 
						  else               nxt <= T13;
						                     Are_All_Rockets_Fired<='0';
						    -- else : rocket13 still waits for its turn to be fired 
						  end if;
						end if;
					end if;
					
			when T14 => RocketsFired <= "0100000000000000";
                --(T12 => T <= "0100000000000000";) : means that the Rocket14 has it's turn to be ready to be fired
			    if (Is_Target_Escaped_From_Radar_Zone = '0') then
			     --(Is_Target_Escaped_From_Radar_Zone = '0') : means that the target could not escape from the radar Zone
			       if (Is_Target_Monitored_By_Radar = '1') then
					   --(Is_Target_Monitored_By_Radar = '1') : ensures that the target is exactly monitored by the radar before firing a rocket
					     if (s14 = '1') then nxt <= T15;
						                      Are_All_Rockets_Fired<='0';
						    --(if (s14 = '1') then nxt <= T15;) : means that if the steady state for rocket14 is equal 1 , then 
							--rocket14 is immediatly fired and rocket15 reserves it's turn to be fired next
						    --Are_All_Rockets_Fired<='0'; means that There are still rockets ready to be fired when ordered
						  else               nxt <= T14;
						                     Are_All_Rockets_Fired<='0';
						    -- else : rocket14 still waits for its turn to be fired 
						  end if;
						end if;
					end if;
			when T15 => RocketsFired <= "1000000000000000";
                --(T15 => T <= "1000000000000000";) : means that the Rocket14 has it's turn to be ready to be fired
			    if (Is_Target_Escaped_From_Radar_Zone = '0') then
			     --(Is_Target_Escaped_From_Radar_Zone = '0') : means that the target could not escape from the radar Zone
			       if (Is_Target_Monitored_By_Radar = '1') then
					   --(Is_Target_Monitored_By_Radar = '1') : ensures that the target is exactly monitored by the radar before firing a rocket
					     if (s15 = '1') then nxt <= T0;
						                      Are_All_Rockets_Fired<='1';
						    --(if (s15 = '1') then nxt <= T10;) : means that if the steady state for rocket15 is equal 1 , then rocket15 is immediatly fired
                      --and The sequence of Rockets to be fired starts again from rocket 0
							 -- (Are_All_Rockets_Fired<='1';) : means that No more Rockets are existing to be fired and Rocket_launcher needed to be fullfilled
                               --							 again 
						  else               nxt <= T15;
						                     Are_All_Rockets_Fired<='0';
						    -- else : rocket15 still waits for its turn to be fired 
						  end if;
						end if;
					end if;			
        end case;
		end process comb;
end Behavioral;
