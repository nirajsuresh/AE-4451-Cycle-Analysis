function [uef, Tef] = fanNozzle(To3, Nf, Pa, yfn, R)

Pef = Pa;

cpf = R * (yf / (yf - 1));

Tef = To3 * (1 - Nf*(1 - (Pef/Po3)^((yfn - 1) / yfn)));

uef = sqrt(2*cpf*(To3 - Tef));

end