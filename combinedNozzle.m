function [ue, Te] = combinedNozzle(To7, Po7, yn, Nn, R, Pa)

    cpn = R * (yn / (yn - 1));
    
    Tes = To7 * (Pa / Po7)^ ((yn - 1) / yn);
    Te = To7 * (1 - Nn * (1 - (Tes / To7)));
    temp = Nn * (1 - (Pa / Po7) ^ ((yn - 1) / yn));
    ue = sqrt(2 * cpn * To7 * temp);
    
end