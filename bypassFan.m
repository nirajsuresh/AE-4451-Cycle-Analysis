function [To2, Po2] = bypassFan(Po1, To1, Prf)
   % Only for turbofan

   Po2 = Po1 * Prf;
   
   To2 = To1 * Prf ^ ((y - 1) / y); 
   
end