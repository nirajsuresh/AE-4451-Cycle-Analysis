%ramjet doesn't have a burner
%turbojet & turbofan
function [Po4, To4] = burner(yb, Po3, To3, f, Nb, hr, R, Prb, b)

    cpb = R * (yb / (yb-1));
    
    To4 = ((Nb * f * hr) + ((1 - b) * To3 * cpb)) / ((1 - b + f) * cpb);

    Po4 = Po3 * Prb;
end




