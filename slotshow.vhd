library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_arith.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;
--------------------------------------
entity slotshow is
    Port ( CLK : in std_logic;
      btn_stop	: in std_logic;
		btn_show : in std_logic;
		src0	: in std_logic_vector(3 downto 0);
		src1	: in std_logic_vector(3 downto 0);
		src2	: in std_logic_vector(3 downto 0);
		src3	: in std_logic_vector(3 downto 0);
		src4	: in std_logic_vector(3 downto 0);
		src5	: in std_logic_vector(3 downto 0);
		scr0	: out std_logic_vector(3 downto 0);
		scr1	: out std_logic_vector(3 downto 0);
		scr2	: out std_logic_vector(3 downto 0);
		scr3	: out std_logic_vector(3 downto 0);
		scr4	: out std_logic_vector(3 downto 0);
		scr5	: out std_logic_vector(3 downto 0)
	 );
end entity slotshow;

architecture RTL of slotshow is
	signal cnt:std_logic_vector(3 downto 0);
	signal randscr: std_logic_vector(3 downto 0 );
	signal display:std_logic_vector(2 downto 0);
	begin
	
 process (btn_stop, btn_show)
 begin
	if (btn_show /= '0') then
		if (rising_edge(CLK)) then
			if (cnt=5) then cnt <= (others=>'0');
			else cnt <= cnt +1;
			end if;
		end if;
	end if;
	if (btn_show = '0') then
		if (rising_edge(btn_show)) then
			if (display=6) then display <= (others=>'0');
			else display <= display +1;
			end if;
		end if;
	end if;
	if (btn_stop = '0') then
		-- if (rising_edge(btn_stop)) then
			display <= "000";
		-- end if;
	end if;
	
	randscr <= cnt + 10;
	
	if (display = 0) then
		scr0 <= randscr;
		scr1 <= randscr;
		scr2 <= randscr;
		scr3 <= randscr;
		scr4 <= randscr;
		scr5 <= randscr;
	elsif (display = 1) then
		scr0 <= src0;
		scr1 <= randscr;
		scr2 <= randscr;
		scr3 <= randscr;
		scr4 <= randscr;
		scr5 <= randscr;
	elsif (display = 2) then
		scr0 <= src0;
		scr1 <= src1;
		scr2 <= randscr;
		scr3 <= randscr;
		scr4 <= randscr;
		scr5 <= randscr;
	elsif (display = 3) then
		scr0 <= src0;
		scr1 <= src1;
		scr2 <= src2;
		scr3 <= randscr;
		scr4 <= randscr;
		scr5 <= randscr;
	elsif (display = 4) then
		scr0 <= src0;
		scr1 <= src1;
		scr2 <= src2;
		scr3 <= src3;
		scr4 <= randscr;
		scr5 <= randscr;
	elsif (display = 5) then
		scr0 <= src0;
		scr1 <= src1;
		scr2 <= src2;
		scr3 <= src3;
		scr4 <= src4;
		scr5 <= randscr;
	elsif (display = 6) then
		scr0 <= src0;
		scr1 <= src1;
		scr2 <= src2;
		scr3 <= src3;
		scr4 <= src4;
		scr5 <= src5;
	end if;
end process;
end architecture RTL;
-------------------------------------