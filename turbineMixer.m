function [Tmax] = turbineMixer(Tmaxo)

Tmaxo = 1300; %Kelvin
bmax = 0.12;
cb1 = 700; %Kelvin

Tmax = Tmaxo + (cb1 * sqrt(b/bmax));

end