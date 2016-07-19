function [Wnorm] = fuelPump(Np, f)

deltaPinj = 55e4; %Pascals

rhof = 780; %kg/m^3

Pf1 = 104e3; %Pascals

Pf2 = Pcc + deltaPinj;

deltaPpump = Pf2 - Pf1;

Wnorm = (f*deltaPpump) /(Np * rhof);

end