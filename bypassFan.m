function [To2, Po2, wf] = bypassFan(Po1, To1, Prf, R, yf)
   % Only for turbofan

   Po2 = Po1 * Prf;
   
   To2 = To1 * Prf ^ ((yf - 1) / yf); 
   
   wf = (R * (yf/(yf - 1))) * (To2 - To1);
   
end