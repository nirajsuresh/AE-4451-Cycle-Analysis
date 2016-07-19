function [To3, Po3, wc] = compressor(To2, Po2, yc, Prc, NPc)
    % Same for turbojet, turbofan
    Po3 = Po2 * Prc;
    
    To3 = To2 * (1 + (1 / NPc) * (Prc ^ ((yc - 1) / yc) - 1));
    
    deltaPc = Po3 - Po2;

    wc = (f*deltaPc) /(Nc * rho);
end