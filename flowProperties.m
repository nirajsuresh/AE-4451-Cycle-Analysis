function [gammas, MWs, aEff, rd, pEff, cEff, Prs, hr, rhof, deld, Prnm] = flowProperties(M)
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
   yd = 1.4;
   yf = 1.4;
   yc = 1.4;
   yp = 1.4;
   yb = 1.4;
   yt = 1.4;
   yft = 1.4;
   yab = 1.4;
   yn = 1.4;
   yfn = 1.4;
   ycn = 1.4;
   gammas = [yd, yf, yc, yp, yb, yt, yft, yab, yn, yfn, ycn];
% molecular weights
   Md = 28;
   Mf = 28;
   Mc = 28;
   Mp = 28;
   Mt = 28;
   Mft = 28;
   Mab = 28;
   Mn = 28;
   Mfn = 28;
   Mcn = 28;
   MWs = [Md, Mf, Mc, Mp, Mt, Mft, Mab, Mn, Mfn, Mcn];
% adiabatic efficiencies
   Nn = 0.9;
   Nfn = 0.9;
   Ncn = 0.9;
   Nd = 0.9;
   Np = 0.9;
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
   NPt = 0.9;
   NPft = 0.9;
   pEff = [NPf, NPc, NPt, NPft];
% combustion efficiencies
   Nb = 0.9;
   Nab = 0.9;
   cEff = [Nb, Nab];
% stagnation pressure ratios
   Prb = 10;
   Prab = 10;
   Prs = [Prb, Prab];
% fuel heating value
   hr = 1000;
% fuel density
   rhof = 1;
% specific drag loss
   deld = 1;
% pressure loss for nozzle mixer
   Prnm = 1;
   
end