function [fab, To6] = afterburner(f, R, yab, Nab, To5)

To6 = 2200; %Kelvin
%To6 = (((1 + f)*To5) + ((Nab*fab*hr) / cpab)) * (1 / (1+f+fab)); ...?

cpab = (yab / (yab - 1)) * R;

fab = ((1 + f) * (To6/To5) - 1) / (((Nab*hr) / (cpab*To5)) - (To6/To5)); 


end