function [outputs, Tis, Pis] = turbojet(inputs)
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
    ytm = gammas(12);
    R = Runiv / mw;
    u = Ma * sqrt(1.4 * R * Ta);
    
    
    % DO STUFF
    % Diffuser
    Nd = aEff(4);
    [To1, Po1] = diffuser(Ta, Pa, yd, Ma, Nd);
    Po1 = Po1 * rd;
    % Compressor
    NPc = pEff(2);
    [To3, Po3, wc] = compressor(To1, Po1, yc, Prc, NPc, R);
    % Burner
    Nb = cEff(1);
    Prb = Prs(1);
    [Po4, To4] = burner(yb, Po3, To3, f, Nb, hr, R, Prb, b);
    % fmax calculation
    cpb = R * (yb / (yb-1));
    TmaxFINAL = Tmax + (700 * sqrt(b/bmax));
    fmax = ((1 - b) * cpb * (TmaxFINAL - To3)) / ((Nb * hr) - (cpb * TmaxFINAL));
    % Turbine
    NPt = pEff(3);
    [To51, Po51] = turbine(To4, R, wc, Po4, f, yt, NPt, b);
    wt = -wc;
    % Turbine Mixer
    [To5m, Po5m] = turbineMixer(To51, To3, Po51, b, R, ytm, f);
    % Fan Turbine
    wft = 0;
    % Afterburner
    fmaxab = 0;
    cpab = R * (yab / (yab - 1));
    if afterburnerCheck == 1
        Prab = Prs(2);
        Nab = cEff(2);
        [To6, Po6] = afterburner(f, fab, R, yab, Nab, To5m, Po5m, Prab, hr);
        fmaxab = (cpab * (Tmaxab - To5m)) / ((Nab * hr) - (cpab * Tmaxab));
    else
        To6 = To5m;
        Po6 = Po5m;
    end
    Nn = aEff(1);
    Nfn = aEff(2);
    Ncn = aEff(3);
    ue = 0;
    uef = 0;
    uec = 0;
    Te = 0; 
    Tef = 0;
    Tec = 0;
    To7 = 0;
    Pe = 0;
    Pef = 0;
    Pec = 0;
    Po7 = 0;
    
    u = Ma * sqrt(1.4 * R * Ta);
    
    % Combined Nozzle Mixer & Combined Nozzle
    [uec, Tec] = combinedNozzle(To6, Po6, ycn, Nn, R, Pa);
    Pec = Pa;
    if afterburnerCheck == 0
        specT = (((1 + f) * uec) - (1) * u);
        nth = (((1 + f) * (uec ^ 2) / 2) - ((1) * (u ^ 2) / 2)) / (f * hr);
        np = specT * u / (((1 + f) * (uec ^ 2) / 2) - ((1) * (u ^ 2) / 2));
        TSFC = f / specT;
    else
        specT = (((1 + f + fab) * uec) - (1) * u);
        nth = (((1 + f + fab) * (uec ^ 2) / 2) - ((1) * (u ^ 2) / 2)) / ((f + fab) * hr);
        np = specT * u / (((1 + f + fab) * (uec ^ 2) / 2) - ((1) * (u ^ 2) / 2));
        TSFC = (f + fab) / specT;
    end
    no = np * nth;
    
    % Fuel Pump
    Np = aEff(5);
    [wp, Pexit] = fuelPump(Np, f, fab, Po3);
        

 
    %outputs = [specT, fmax, fmaxab, ue, uef, uec, TSFC, np, nth, no, u, wf, wc, wt, wft, wp];
    outputs = [specT / 1000, fmax, fmaxab, 0, 0, uec, TSFC * 1000, np, nth, no, u, 0, wc / 1000, wt / 1000, 0, wp / 1000];
    Tis = [To1, 0, To3, To4, To51, To5m, 0, To6, 0, 0, 0, Tec];
    Pis = [Po1, 0, Po3, Po4, Po51, Po5m, 0, Po6, 0, 0, 0, Pec, Pexit] ./ 1000;
    
    
end