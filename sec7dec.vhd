library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_arith.all;
use IEEE.numeric_std.all;
entity sec7dec is
    port ( DIN : in std_logic_vector(3 downto 0);
    HEX : out std_logic_vector(6 downto 0));
   end entity sec7dec;
   ------------------------------------------------------------
   architecture RTL of sec7dec is
    begin
    process (DIN)
    begin
    case DIN is
   when "0000" => HEX <= "1000000"; --"0" on ssd
   when "0001" => HEX <= "1111001"; --"1" on ssd
   when "0010" => HEX <= "0100100"; --"2" on ssd
   when "0011" => HEX <= "0110000"; --"3" on ssd
   when "0100" => HEX <= "0011001"; --"4" on ssd
   when "0101" => HEX <= "0010010"; --"5" on ssd
   when "0110" => HEX <= "0000010"; --"6" on ssd
   when "0111" => HEX <= "1111000"; --"7" on ssd
   when "1000" => HEX <= "0000000"; --"8" on ssd
   when "1001" => HEX <= "0011000"; --"9" on ssd
   when "1010" => HEX <= "0001000"; --"a" on ssd
   when "1011" => HEX <= "0000011"; --"b" on ssd
   when "1100" => HEX <= "1000110"; --"c" on ssd
   when "1101" => HEX <= "0100001"; --"d" on ssd
   when "1110" => HEX <= "0000110"; --"e" on ssd
   when others => HEX <= "0001110"; --"f" on ssd
    end case;
   end process;
   end architecture RTL;