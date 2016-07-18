%ramjet doesn't have a burner
%turbojet & turbofan
function [To4, Po4, f] = burner(yb, Po3, To3, Nb, hr, R, Prb)

    cpb = R * (yb / yb-1);

    To4 = (To3 + ((Nb*f*hr) / cpb)) * (1 / (1+f));
    
    f = ((To4/To3) - 1) / ((Nb*hr / cpb*To3) - (To4/To3));

    Po4 = Po3 * Prb;
end




