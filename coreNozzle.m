function [ue, Te, specT, TSFC, Np, Nth, No] = coreNozzle(To6, Po6, yn, Nn, R, f, M, Ta, Pa, hr)

 cpn = R*((yn - 1)/yn);
 T7s = To6 * (Pa/Po6)^((yn - 1)/yn);
 Te = To6 * (1 + Nn*(1 - (T7s/To6)));
 
 ue = sqrt(2*cpn*To6*(1 - (Te/To6)));
 
 uinfinity = M*sqrt(1.4*R*Ta);
 specT = ((1 + f)*ue - uinfinity);
 TSFC = f / specT;
 
 Np = specT * (uinfinity / (((1+f)*(ue^2)/2)) - (uinfinity^2/2));
 Nth = ((1+f)*(((ue^2)/2)-((uinfinity^2)/2)))/(f*hr);
 No = Np*Nth;
    
end