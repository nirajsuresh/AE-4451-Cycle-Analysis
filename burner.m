%ramjet doesn't have a burner
%turbojet & turbofan
function [Po4, To4] = burner(yb, Po3, To3, f, Nb, hr, R, Prb)

    cpb = R * (yb / (yb-1));
    
    To4 = (To3 + ((Nb * f * hr) / cpb)) * (1 / (1 + f));

    Po4 = Po3 * Prb;
end




