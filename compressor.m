function [To3, Po3, wc] = compressor(To2, Po2, yc, Prc, NPc, R)
    % Same for turbojet, turbofan
    Po3 = Po2 * Prc;
    Nc = (Prc ^ ((yc - 1)/yc) - 1)/(Prc ^ ((yc - 1)/(yc * NPc)) - 1);
    
    To3 = To2 * (1 + ((1 / Nc) * ((Prc ^ ((yc - 1) / yc)) - 1)));

    wc = (R * (yc/(yc - 1))) * (To3 - To2);
end