library ieee;
use ieee.std_logic_1164.all;

entity digital_clock is
port(clk_in,load : in std_logic;
  in_sec,in_min  : in integer range 0 to 59;
  in_hr : in integer range 0 to 23;
  sec,min  : inout integer range 0 to 59 ;
  hr : inout integer range 0 to 23 );
end entity;

architecture beh of digital_clock is

begin
 
-- Functionality of Digital Clock.
digital : process (clk_in)
 begin
  if (rising_edge(clk_in)) then
  if (load='1') then
	sec <= in_sec;
	min <= in_min;
   hr <= in_hr;
	else
   if (sec = 59) then
    sec <= 0;
    if (min = 59) then
     min <= 0;
     if (hr = 23) then
      hr <= 0;
     else
      hr <= hr + 1;
     end if;
    else
     min <= min + 1;
    end if;
   else
    sec <= sec + 1;
   end if;
  end if;
  end if;
 end process;
 end beh;
