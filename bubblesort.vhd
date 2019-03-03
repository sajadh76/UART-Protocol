---------------------------------------
---------------------------------------
--  bubble sort algorithm with VHDL  --
--  Engineer: Sajad Hamzenejadi      --
--  2018                             --
---------------------------------------
---------------------------------------


library ieee;
use ieee.std_logic_1164.all;

package array_type is
type bubble is array (0 to 7) of std_logic_vector(7 downto 0);
end package;

library ieee;
use ieee.std_logic_1164.all;
use work.array_type.all;

entity bubblesort is
    port (
        signal clk:             in  std_logic;
        signal reset:           in  std_logic;
        signal in_array:        in  bubble;
        signal sorted_array:    out bubble 
    );
end entity;
architecture Behavioral of bubblesort is
    use ieee.numeric_std.all;
begin

BSORT:
    process (clk)
        variable temp:      std_logic_vector (7 downto 0);
        variable var_array:     bubble;        
    begin
        var_array := in_array;
        if rising_edge(clk) then
            for j in bubble'LEFT to bubble'RIGHT - 1 loop 
                for i in bubble'LEFT to bubble'RIGHT - 1 - j loop 
                    if unsigned(var_array(i)) > unsigned(var_array(i + 1)) then
                        temp := var_array(i);
                        var_array(i) := var_array(i + 1);
                        var_array(i + 1) := temp;
                    end if;
                end loop;
            end loop;
            sorted_array <= var_array;
        end if;
    end process;
end architecture Behavioral;