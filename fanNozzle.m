function [uefn, Tefn] = fanNozzle(To2, Po2, yfn, Nfn, R, Pa)

    cpfn = R * (yfn / (yfn - 1));
    Tes = To2 * (Pa / Po2)^ ((yfn - 1) / yfn);
    Tefn = To2 * (1 - (Nfn * (1 - (Tes / To2))));

    uefn = sqrt(2 * cpfn * To2 * (1 - (Tefn / To2)));
    
end