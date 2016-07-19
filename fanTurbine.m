function [To7, Po7, wft] = fanTurbine(To6, R, f, B, yft)

cpft = R * (yft / (yft - 1));

To7 = To6 - ((cpft * (To3 - To2) * (1 + B)) / ((cpft) * (1 + f)));

Po7 = Po6 * ((1/Nt) * ((To7/To6) - 1))^(yft/(yft - 1));

wft = (R * (yf/(yf - 1))) * (To7 - To6);

end