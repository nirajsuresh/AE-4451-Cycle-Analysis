%turbojet, ramjet, & turbofan

function [To5, Po5] = turbine(To4, R, wc, Po4, f, yt, NPt, b)
    cpt = R * (yt / (yt - 1));
    To5 = To4 - (wc / ((1 + f - b) * cpt));
    Tr = To5 / To4;
    Nt = (Tr - 1) / (Tr ^ (1 / NPt) - 1);
    To5S = To4 * (1 + (1 / Nt) * (Tr - 1));
    Po5 = Po4 * (To5S / To4) ^ (yt / (yt - 1));
end

