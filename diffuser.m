function [To1, Po1] = diffuser(Ta, Pa, yd, Ma, Nd)
    % To be determined: To1 and Po1 
    % Same for each engine
    To1 = Ta * (1 + ((yd - 1) / 2) * Ma ^ 2);
    Po1 = Pa * (1 + Nd * ((yd - 1) / 2) * Ma ^ 2) ^ (yd / (yd - 1));
end