function [Po7, To7] = nozzleMixer(To7, To6, To5, B)

%used for combined nozzle (not separate core/fan nozzles); not reversible

ynm = 1.44 - ((1.39e-4)*To7) + ((3.57e-8)*To7^2);

Prnm = 0.8;

Po7rev = Po6 * (1 + ((To7/To6) - 1))^ (ynm / (ynm - 1)); 

Po7 = Po7rev * Prnm;

To7 = (B * (To5 - To6)) + To6;

end
