view wave 
wave clipboard store
wave create -driver freeze -pattern counter -startvalue 0000 -endvalue 1111 -type Range -direction Up -period 100ns -step 1 -repeat forever -range 3 0 -starttime 0ns -endtime 10000ns sim:/unidade_controle/opcode 
WaveExpandAll -1
WaveCollapseAll -1
wave clipboard restore
