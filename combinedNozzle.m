function [ue, Te] = combinedNozzle(To6, Po6, yn, Nn, R, Pa)

 cpn = R*(yn/(yn-1));
 T7s = To6 * (Pa/Po6)^((yn - 1)/yn);
 Te = To6 * (1 - (Nn*(1 - (T7s/To6))));
 
 ue = sqrt(2*cpn*To6*(1 - (Te/To6)));
end