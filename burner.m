%ramjet doesn't have a burner

%turbojet & turbofan
function [T04, P04] = burner(yb, T04, T03, Nb, hr)
R = 8314 / mw;

cpb = R * (yb / yb-1);

f = ((T04/T03) - 1) / ((Nb*hr / cpb*T03) - (T04/T03));

T04 = (T03 + ((Nb*f*hr) / cpb)) * (1 / (1+f));

P04 = P03 * (P04/P03);
end




