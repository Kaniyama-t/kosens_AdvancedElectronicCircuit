library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_arith.all;
use IEEE.numeric_std.all;
--------------------------------------
entity slot is
    Port ( CLK : in std_logic;
      btn_stop	: in std_logic;
      btn_show	: in std_logic;
		scr0	: out std_logic_vector(6 downto 0);
		scr1	: out std_logic_vector(6 downto 0);
		scr2	: out std_logic_vector(6 downto 0);
		scr3	: out std_logic_vector(6 downto 0);
		scr4	: out std_logic_vector(6 downto 0);
		scr5	: out std_logic_vector(6 downto 0)
	 );
end entity slot;

architecture RTL of slot is
  component slotword is
    Port ( CLK : in std_logic;
      btn	: in std_logic;
		scr0	: out std_logic_vector(3 downto 0);
		scr1	: out std_logic_vector(3 downto 0);
		scr2	: out std_logic_vector(3 downto 0);
		scr3	: out std_logic_vector(3 downto 0);
		scr4	: out std_logic_vector(3 downto 0);
		scr5	: out std_logic_vector(3 downto 0)
	 );
	end component slotword;
	
	component slotshow is
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
	end component slotshow;
	
	component sec7dec is
    port ( DIN : in std_logic_vector(3 downto 0);
    HEX : out std_logic_vector(6 downto 0));
	end component sec7dec;
	
	signal btn_stop_sig : std_logic;
	signal scr_sig0 : std_logic_vector(3 downto 0);
	signal scr_sig1 : std_logic_vector(3 downto 0);
	signal scr_sig2 : std_logic_vector(3 downto 0);
	signal scr_sig3 : std_logic_vector(3 downto 0);
	signal scr_sig4 : std_logic_vector(3 downto 0);
	signal scr_sig5 : std_logic_vector(3 downto 0);
	signal scr_sig0_ret : std_logic_vector(3 downto 0);
	signal scr_sig1_ret : std_logic_vector(3 downto 0);
	signal scr_sig2_ret : std_logic_vector(3 downto 0);
	signal scr_sig3_ret : std_logic_vector(3 downto 0);
	signal scr_sig4_ret : std_logic_vector(3 downto 0);
	signal scr_sig5_ret : std_logic_vector(3 downto 0);
	begin
		btn_stop_sig <= btn_stop;
		controller : slotword port map(
			CLK=>CLK,
			btn=>btn_stop_sig,
			scr0=>scr_sig0,
			scr1=>scr_sig1,
			scr2=>scr_sig2,
			scr3=>scr_sig3,
			scr4=>scr_sig4,
			scr5=>scr_sig5
		);
		showcontroller : slotshow port map(
			CLK=>CLK,
			btn_stop=>btn_stop_sig,
			btn_show=>btn_show,
			src0=>scr_sig0,
			src1=>scr_sig1,
			src2=>scr_sig2,
			src3=>scr_sig3,
			src4=>scr_sig4,
			src5=>scr_sig5,
			scr0=>scr_sig0_ret,
			scr1=>scr_sig1_ret,
			scr2=>scr_sig2_ret,
			scr3=>scr_sig3_ret,
			scr4=>scr_sig4_ret,
			scr5=>scr_sig5_ret
		);
		DecodeA : sec7dec port map(DIN=>scr_sig0_ret,HEX=>scr0);
		DecodeB : sec7dec port map(DIN=>scr_sig1_ret,HEX=>scr1);
		DecodeC : sec7dec port map(DIN=>scr_sig2_ret,HEX=>scr2);
		DecodeD : sec7dec port map(DIN=>scr_sig3_ret,HEX=>scr3);
		DecodeE : sec7dec port map(DIN=>scr_sig4_ret,HEX=>scr4);
		DecodeF : sec7dec port map(DIN=>scr_sig5_ret,HEX=>scr5);
end architecture RTL;
-------------------------------------