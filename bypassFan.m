function [To2, Po2, wf] = bypassFan(Po1, To1, Prf, R, yf, NPf)
   % Only for turbofan

   Po2 = Po1 * Prf;
   Nf = (Prf ^ ((yf - 1)/yf) - 1)/(Prf ^ ((yf - 1)/(yf * NPf)) - 1);
   
   To2S = To1 * Prf ^ ((yf - 1) / yf); 
   
   To2 = To1 + (1 / Nf) * (To2S - To1);
   
   wf = (R * (yf/(yf - 1))) * (To2 - To1);
   
end