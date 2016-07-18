%ramjet doesn't have a burner
%turbojet & turbofan
function [Po4, f] = burner(yb, Po3, To3, To4, Nb, hr, R, Prb)

    cpb = R * (yb / yb-1);
    
    f = ((To4/To3) - 1) / ((Nb*hr / cpb*To3) - (To4/To3));

    Po4 = Po3 * Prb;
end




