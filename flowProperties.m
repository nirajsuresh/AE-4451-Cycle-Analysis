function [Runiv, gammas, mw, aEff, rd, pEff, cEff, Prs, hr, rhof, deld, Prnm] = flowProperties(M)

% THIS FILE CONTAINS ALL OF THE FLOW PROPERTIES THAT ARE NOT USER INPUTS
    
% diffuser (d)
% bypass fan (f)
% compressor (c)
% fuel pump (p)
% main combustor/burner (b)
% turbine (t): runs compressor and fuel pump
% fan turbine (ft): to run the fan afterburner (ab)
% core nozzle (n)
% fan nozzle (fn)
% combined nozzle (cn) [replaces core and fan nozzles]
% specific heat ratios
   Runiv = 8314;
   yd = 1.4;
   yf = 1.4;
   yc = 1.38;
   yp = 1.4;
   yb = 1.33;
   yt = 1.33;
   yft = 1.33;
   yab = 1.32;
   yn = 1.35;
   yfn = 1.4;
   ycn = 1.37;
   ytm = 1.34;
   gammas = [yd, yf, yc, yp, yb, yt, yft, yab, yn, yfn, ycn, ytm];
% molecular weights
   mw = 28.8;
% adiabatic efficiencies
   Nn = 0.95;
   Nfn = 0.97;
   Ncn = 0.95;
   Nd = 0.92;
   Np = 0.35;
   aEff = [Nn, Nfn, Ncn, Nd, Np];
% ram pressure recovery
   if M < 1 
      rd = 1;
   else
      rd = 1 - 0.075 * (M - 1) ^ 1.35;
   end  
% polytropic efficiencies
   NPf = 0.9;
   NPc = 0.9;
   NPt = 0.92;
   NPft = 0.92;
   pEff = [NPf, NPc, NPt, NPft];
% combustion efficiencies
   Nb = 0.99;
   Nab = 0.96;
   cEff = [Nb, Nab];
% stagnation pressure ratios
   Prb = 0.98;
   Prab = 0.97;
   Prs = [Prb, Prab];
% fuel heating value
   hr = 43.15 * 10 ^ 6;
% fuel density
   rhof = 1;
% specific drag loss
   deld = 1;
% pressure loss for nozzle mixer
   Prnm = 1;
   
end