function [To6, Po6] = afterburner(f, fab, R, yab, Nab, To52, Po52, Prab, hr)

cpab = (yab / (yab - 1)) * R;

To6 = (((1 + f)*To52) + ((Nab*fab*hr) / cpab)) * (1 / (1+f+fab));

Po6 = Po52 * Prab;

end