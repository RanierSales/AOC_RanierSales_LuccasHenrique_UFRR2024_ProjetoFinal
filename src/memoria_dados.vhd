library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity memoria_dados is
    Port (
        clk 			  : in STD_LOGIC;								-- Entrada do clock
        we 				  : in STD_LOGIC;								-- Sinal de controle de leitura e escrita
        address 		: in STD_LOGIC_VECTOR (7 downto 0);		-- Endereço de memória
        data_in 		: in STD_LOGIC_VECTOR (7 downto 0);		-- Entrada de dados para escrita
        data_out 		: out STD_LOGIC_VECTOR (7 downto 0)		-- Saída de dados para leitura
    );
end memoria_dados;


architecture main of memoria_dados is
	 
    type mem_array is array (0 to 255) of STD_LOGIC_VECTOR(7 downto 0);		-- Memória de dados simulada como uma array
    signal memory : mem_array := (others => (others => '0'));
	 

begin
    process(clk)
    begin
        if rising_edge(clk) then
            if we = '1' then
                memory(to_integer(unsigned(address))) <= data_in;				-- Escreve na memória se we (write enable) estiver ativado
            end if;
        end if;
    end process;

    data_out <= memory(to_integer(unsigned(address)));	  						-- Lê o valor da memória
end main;
