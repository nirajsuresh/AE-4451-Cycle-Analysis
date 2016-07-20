function [uecn, Tecn] = coreNozzle(To6, Po6, ycn, Ncn, R, Pa)

    cpcn = R * (ycn / (ycn - 1));
    Tes = To6 * (Pa / Po6)^ ((ycn - 1) / ycn);
    Tecn = To6 * (1 - (Ncn * (1 - (Tes / To6))));

    uecn = sqrt(2 * cpcn * To6 * (1 - (Tecn / To6)));
    
end