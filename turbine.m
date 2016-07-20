%turbojet, ramjet, & turbofan

function [To5, Po5] = turbine(To4, To3, To2, Po4, f, yt, NPt)
To5 = To4 - ((To3 - To2) / (1 + f));
Tr = To5 / To4;
Nt = (Tr - 1) / (Tr ^ (1 / NPt) - 1);

Po5 = Po4 * (1 + (1/Nt)*((To5/To4) - 1))^(yt/(yt-1));
end

