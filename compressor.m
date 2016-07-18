function [To3, Po3] = compressor(To2, Po2)
    % Same for turbojet, turbofan
    Po3 = Po2 * Prc;
    To3 = To2 * (1 + (1 / N) * (Prc ^ ((y - 1) / y) - 1));
end