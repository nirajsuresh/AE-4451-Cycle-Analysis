function [To52, Po52, wft] = fanTurbine(To5m, R, f, B, yft)

cpft = R * (yft / (yft - 1));

To52 = To6 - ((cpft * (To3 - To2) * (1 + B)) / ((cpft) * (1 + f)));

Po52 = Po6 * ((1/Nt) * ((To52/To6) - 1))^(yft/(yft - 1));

wft = (R * (yf/(yf - 1))) * (To52 - To5m);

end