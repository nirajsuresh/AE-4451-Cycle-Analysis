
function [wfp, Pexit] = fuelPump(Np, f, fab, Po3)

    deltaPinj = 55e4; %Pascals

    rhof = 780; %kg/m^3

    Pf1 = 104e3; %Pascals

    Pf2 = Po3 + deltaPinj;

    deltaPpump = Pf2 - Pf1;

    wfp = ((f+fab)*(deltaPpump)) /(Np * rhof);

    Pexit = Po3 + Pf1 + deltaPinj;

end