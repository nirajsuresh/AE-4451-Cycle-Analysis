function [ue, T7, specT, TSFC, Np, Nth, No] = coreNozzle(To6, Po6, yn, Nn, R, f, M, Ta)

 cpn = R*((yn - 1)/yn);
 T7s = To6 * (P7/Po6)^((yn - 1)/yn);
 T7 = To * (1 + Nn*(1 - (T7s/To6)));
 
 ue = sqrt(2*cpn*To6*(1 - (T7/To6)));
 
 uinfinity = M*sqrt(yf*R*Ta);
 specT = ((1 + f)*ue - uinfinity) + (((Pe - Pa)/mdota)*Ae);
 TSFC = f / specT;
 
 Np = specT * (uinfinity / (((1+f)*(ue^2)/2)) - (uinfinity^2/2));
 Nth = ((1+f)*(((ue^2)/2)-((uinfinity^2)/2)))/(f*hr);
 No = Np*Nth;
    
end