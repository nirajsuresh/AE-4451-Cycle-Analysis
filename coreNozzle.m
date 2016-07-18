function [ue, T7] = coreNozzle(To6, Po6, yn, Nn, R)

 cpn = R*((yn - 1)/yn);
 T7s = To6 * (P7/Po6)^((yn - 1)/yn);
 T7 = To * (1 + Nn*(1 - (T7s/To6)));
 ue = sqrt(2*cpn*To6*(1 - (T7/To6)));
    
end