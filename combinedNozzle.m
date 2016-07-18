function [Te, Pe, ue, spThrust] = combinedNozzle(T, Ta, y, Minf, R, f)
    % 
    ue = sqrt(T/Ta) * (1 + ((y - 1) / 2) * Minf ^ 2) ^ -0.5 * sqrt(y * R * Ta) * Minf;
    uinf = sqrt(y * R * Ta) * Minf;
    spThrust = (1 + f) * ue - uinf;
end