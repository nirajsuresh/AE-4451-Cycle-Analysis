function [outputs, Tis, Pis] = turbofan(inputs)
    % Get inputs
    Ta = inputs(1);
    Pa = inputs(2);
    Pf = inputs(3);
    Ma = inputs(4);
    Prc = inputs(5);
    B = inputs(6);
    b = inputs(7);
    Prf = inputs(8);
    f = inputs(9);
    fab = inputs(10);
    Tmax = inputs(11);
    Tmaxab = inputs(12);
    bmax = inputs(13);
    compressorBleedCheck = inputs(14);
    afterburnerCheck = inputs(15);
    combinedNozzleCheck = inputs(16);
    
    % Get flow properties
    [Runiv, gammas, mw, aEff, rd, pEff, cEff, Prs, hr, rhof, deld, Prnm] = flowProperties(Ma);
    yd = gammas(1);
    yf = gammas(2);
    yc = gammas(3);
    yp = gammas(4);
    yb = gammas(5);
    yt = gammas(6);
    yft = gammas(7);
    yab = gammas(8);
    yn = gammas(9);
    yfn = gammas(10);
    ycn = gammas(11);
    R = Runiv / mw;
    u = Ma * sqrt(1.4 * R * Ta);
    
    
    % DO STUFF
    % Diffuser
    Nd = aEff(4);
    [To1, Po1] = diffuser(Ta, Pa, yd, Ma, Nd);
    % Bypass fan
    [To2, Po2, wf] = bypassFan(Po1, To1, Prf, R, yf);
    % Compressor
    NPc = pEff(2);
    [To3, Po3, wc] = compressor(To2, Po2, yc, Prc, NPc, R);
    % Burner
    Nb = cEff(1);
    Prb = Prs(1);
    [Po4, To4] = burner(yb, Po3, To3, f, Nb, hr, R, Prb);
    % fmax calculation
    cpb = R * (yb / (yb-1));
    TmaxFINAL = Tmax + 700 * sqrt(b/bmax);
    fmax = ((TmaxFINAL/To3) - (1 + ((yb - 1) / 2) * Ma ^ 2)) / (((Nb * hr) / (cpb * To3)) - (TmaxFINAL/To3));
    % Turbine
    NPt = pEff(3);
    [To51, Po51, wt] = turbine(To4, To3, To2, f, yt, NPt, R);
    % Turbine Mixer
    [To5m, Po5m] = turbineMixer(To51, To3, Po51, b);
    % Fan Turbine
    [To52, Po52, wft] = fanTurbine(To5m, R, f, B, yft);
    % Afterburner
    if afterburnerCheck == 1
        Prab = Prs(2);
        Nab = cEff(2);
        [To6, Po6] = afterburner(f, fab, R, yab, Nab, To52, Prab);
    else
        To6 = To52;
        Po6 = Po52;
    end
    TmaxabFINAL = Tmaxab + 245 * sqrt(b/bmax);
    fmaxab = ((TmaxabFINAL/To52) - (1 + ((yb - 1) / 2) * Ma ^ 2)) / (((Nb * hr) / (cpb * To52)) - (TmaxabFINAL/To52));
    % Nozzles
    Nn = aEff(1);
    ue = 0;
    uef = 0;
    uec = 0;
    Te = 0; 
    Tef = 0;
    Tec = 0;
    Pe = 0;
    Pef = 0;
    Pec = 0;
    if combinedNozzleCheck == 0
        % Core Nozzle & Fan Nozzle
        [ue, Te, specTCore, TSFCCore, np, nth, no] = coreNozzle(To6, Po6, yn, Nn, R, f, M, Ta, Pa, hr);
    else
        % Combined Nozzle Mixer & Combined Nozzle
        [Po7, To7] = nozzleMixer(Po6, To6, To2, B);
        [uec, Tec, specT, TSFC, np, nth, no] = combinedNozzle(To7, Po7, yn, Nn, R, f, M, Ta, Pa, hr);
        Pec = Pa;
    end
        
    % Fuel Pump
    Np = aEff(5);
    [wp, Pexit] = fuelPump(Np, f);
        

 
    %outputs = [specT, fmax, fmaxab, ue, uef, uec, TSFC, np, nth, no, u, wf, wc, wt, wft, wp];
    outputs = [specT, fmax, fmaxab, ue, uef, uec, TSFC, np, nth, no, u, wf, wc, wt, wft, wp];
    Tis = [To1, To2, To3, To4, To51, To5m, To52, To6, Te, Tef, T7, Tec];
    Pis = [Po1, Po2, Po3, Po4, Po51, Po5m, Po52, Po6, Pe, Pef, P7, Pec, Pexit];
    
    
end