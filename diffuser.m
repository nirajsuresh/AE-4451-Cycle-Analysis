function [To1, Po1] = diffuser(Ta, Pa, yd, Ma)
    To1 = Ta * (1 + ((yd - 1) / 2) * Ma ^ 2);
    Po1 = Pa * (To1 / Ta) ^ (yd / (yd - 1));
end