function [wfp, Pexit] = fuelPump(Np, f)

deltaPinj = 55e4; %Pascals

rhof = 780; %kg/m^3

Pf1 = 104e3; %Pascals

Pf2 = Pcc + deltaPinj;

deltaPpump = Pf2 - Pf1;

wfp = (f*deltaPpump) /(Np * rhof);

Pexit = Po4 + deltaPinj;

end