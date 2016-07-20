function [Po7, To7] = nozzleMixer(Po6, To6, To2, B, f, fab)

%used for combined nozzle (not separate core/fan nozzles); not reversible
To7 = To2 * (B / (B + 1 + f + fab)) + To6 * ((1 + f + fab) / (B + 1 + f + fab));

ynm = 1.44 - ((1.39e-4)*To7) + ((3.57e-8)*To7^2);

Prnm = 0.8;

Po7rev = Po6 * (1 + (1 - (To7/To6))^ (ynm / (ynm - 1))); 

Po7 = Po7rev * Prnm;

end
