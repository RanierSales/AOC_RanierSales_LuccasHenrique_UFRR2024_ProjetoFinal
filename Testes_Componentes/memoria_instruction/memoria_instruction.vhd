library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Entidade que representa a memória de instruções de 8 bits
entity memoria_instruction is
    Port (
        -- Entrada do endereço da instrução
        address : in STD_LOGIC_VECTOR (7 downto 0);
        -- Saída com o conteúdo da instrução (8 bits)
        instr : out STD_LOGIC_VECTOR (7 downto 0)
    );
end memoria_instruction;

-- Arquitetura principal da memória de instruções
architecture main of memoria_instruction is
    -- Memória de instruções simulada como uma array
    type mem_array is array (0 to 255) of STD_LOGIC_VECTOR(7 downto 0);
    signal memory : mem_array := (
    0  => "10101010", -- Instrução no endereço 0 apenas pra teste
    1  => "11001100", -- Instrução no endereço 1 apenas pra teste
    2  => "11110000", -- Instrução no endereço 2 apenas pra teste
    others => "00000000" -- Outros endereços inicializados com 0 apenas pra teste
);

begin
    -- Lê a instrução da memória com base no endereço fornecido
    instr <= memory(to_integer(unsigned(address)));
end main;