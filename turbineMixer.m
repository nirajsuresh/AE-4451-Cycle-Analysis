function [To5m, Po5m] = turbineMixer(To51, To3, Po51, b, R, ym, f)
    cptm = R * (ym / (ym - 1));
    To5m = (1 + f - b) / (1 + f) * (To51 - To3) + To3;
    Po5m = Po51 * ((To5m / To3) ^ (cptm / R) * (To3 / To51) ^ ((1 + f - b) / (1 + f) * (ym / (ym - 1))));
end