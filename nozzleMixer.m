function [Po7] = nozzleMixer(To7)

%used for combined nozzle (not separate core/fan nozzles); not reversible

ynm = 1.44 - ((1.39e-4)*To7) + ((3.57e-8)*To7^2);

Prnm = 0.8;

Po7rev = Po6 * (1 + ((1/Nn) * ((To7/To6) - 1)))^ (ynm / (ynm - 1)); %check this equation; which efficiency?

Po7 = Po7rev * Prnm;

end
