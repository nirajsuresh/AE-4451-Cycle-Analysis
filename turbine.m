%turbojet, ramjet, & turbofan

function [T05, P05] = turbine(T04, T03, T02, f, yt, Nt)
T05 = T04 - ((T03 - T02) / (1 + f));

P05 = P04 * (1 + (1/Nt)*((T05/T04) - 1))^(yt/(yt-1));
end

