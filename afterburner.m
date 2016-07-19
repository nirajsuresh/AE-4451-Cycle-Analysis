function [To6, Po6] = afterburner(f, fab, R, yab, Nab, To5, Prab)

cpab = (yab / (yab - 1)) * R;

To6 = (((1 + f)*To5) + ((Nab*fab*hr) / cpab)) * (1 / (1+f+fab));

Po6 = Po5 * Prab;

end