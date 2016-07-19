function [To5m, Po5m] = turbineMixer(To51, To3, Po51, b)
    To5m = (To3 * b) + (To51 * (1-b));
    Po5m = Po51;
end