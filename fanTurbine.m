function [To52, Po52, wft] = fanTurbine(To5m, Po5m, To2, To1, R, f, yft, NPft)
    
To52 = To5m - ((To2 - To1) / (1 + f));
Tr = To52 / To5m;
Nft = (Tr - 1) / (Tr ^ (1 / NPft) - 1);

Po52 = Po5m * (1 + (1/Nft)*((To52/To5m) - 1))^(yft/(yft-1));

wft = (R * (yft/(yft - 1))) * (To52 - To5m);

end