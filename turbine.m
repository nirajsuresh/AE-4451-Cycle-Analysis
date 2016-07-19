%turbojet, ramjet, & turbofan

function [To5, Po5, wt] = turbine(To4, To3, To2, f, yt, NPt)
To5 = To4 - ((To3 - To2) / (1 + f));

Po5 = Po4 * (1 + (1/NPt)*((To5/To4) - 1))^(yt/(yt-1));

deltaPt = Po5 - Po4;

wt = (f*deltaPt) /(Nt * rho);
end

