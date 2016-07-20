
function [wfp, Pexit] = fuelPump(Np, f, Po4, Pf)

    deltaPinj = 55e4; %Pascals

    rhof = 780; %kg/m^3

    Pf1 = 104e3; %Pascals

    Pf2 = Po4 + deltaPinj;

    deltaPpump = Pf2 - Pf1;

    wfp = ((f+fab)*(deltaPpump)) /(Np * rhof);

    Pexit = Pf + deltaPinj;

end