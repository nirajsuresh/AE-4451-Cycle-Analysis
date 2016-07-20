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
    Po1 = Po1 * rd;
    % Bypass fan
    NPf = pEff(1);
    [To2, Po2, wf] = bypassFan(Po1, To1, Prf, R, yf, NPf, B);
    % Compressor
    NPc = pEff(2);
    [To3, Po3, wc] = compressor(To2, Po2, yc, Prc, NPc, R);
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
    [To51, Po51] = turbine(To4, To3, To2, Po4, f, yt, NPt);
    wt = -wc;
    % Turbine Mixer
    [To5m, Po5m] = turbineMixer(To51, To3, Po51, b);
    % Fan Turbine
    NPft = pEff(4);
    [To52, Po52] = fanTurbine(To5m, Po5m, f, yft, NPft, wf, R);
    wft = -wf;
    % Afterburner
    if afterburnerCheck == 1
        Prab = Prs(2);
        Nab = cEff(2);
        [To6, Po6] = afterburner(f, fab, R, yab, Nab, To52, Po52, Prab, hr);
    else
        To6 = To52;
        Po6 = Po52;
    end
    cpab = R * (yab / (yab - 1));
    fmaxab = (cpab * (Tmaxab - To52)) / ((Nab * hr) - (cpab * Tmaxab));
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
    
    deld = 245 * Ma ^ 2 * (Pa/101325) * (B ^ 1.5);
    u = Ma * sqrt(1.4 * R * Ta);
    if combinedNozzleCheck == 0
        % Core Nozzle & Fan Nozzle
        [uecn, Te] = coreNozzle(To6, Po6, ycn, Ncn, R, Pa);
        [uefn, Tef] = fanNozzle(To2, Po2, yfn, Nfn, R, Pa);
        Pe = Pa;
        Pef = Pa;
        if afterburnerCheck == 0
            specTCore = ((1 + f) * uecn) - u;
            specTFan = (B * uefn) - Bu;
            specT = specTCore + specTFan - deld;
            KECore = (((1 + f) * uecn ^ 2) - (u ^ 2)) / 2;
            KEFan = (B * (uefn ^ 2 - u ^ 2)) / 2;
            nth = (KECore + KEFan) / (f * hr);
            np = (specT * u) / (KECore + KEFan);
            TSFC = f / specT;
        else
            specTCore = ((1 + f + fab) * uecn) - u;
            specTFan = B * (uefn - u);
            specT = specTCore + specTFan - deld;
            KECore = (((1 + f + fab) * uecn ^ 2) - (u ^ 2)) / 2;
            KEFan = (B * (uefn ^ 2 - u ^ 2)) / 2;
            nth = (KECore + KEFan) / ((f + fab) * hr);
            np = (specT * u) / (KECore + KEFan);
            TSFC = (f + fab) / specT;
        end
    else
        % Combined Nozzle Mixer & Combined Nozzle
        [Po7, To7] = nozzleMixer(Po6, To6, To2, B, f, fab);
        [uec, Tec] = combinedNozzle(To7, Po7, yn, Nn, R, Pa);
        Pec = Pa;
        if afterburnerCheck == 0
            specT = (((1 + f + B) * uec) - (B + 1) * u) - deld;
            nth = (((1 + f + B) * (uec ^ 2) / 2) - ((B + 1) * (u ^ 2) / 2)) / (f * hr);
            np = specT * u / (((1 + f + B) * (uec ^ 2) / 2) - ((B + 1) * (u ^ 2) / 2));
            TSFC = f / specT;
        else
            specT = (((1 + f + fab + B) * uec) - (B + 1) * u) - deld;
            nth = (((1 + f + fab + B) * (uec ^ 2) / 2) - ((B + 1) * (u ^ 2) / 2)) / ((f + fab) * hr);
            np = specT * u / (((1 + f + fab + B) * (uec ^ 2) / 2) - ((B + 1) * (u ^ 2) / 2));
            TSFC = (f + fab) / specT;
        end
    end  
    no = np * nth;
    
    % Fuel Pump
    Np = aEff(5);
    [wp, Pexit] = fuelPump(Np, f, fab, Po4, Pf);
        

 
    %outputs = [specT, fmax, fmaxab, ue, uef, uec, TSFC, np, nth, no, u, wf, wc, wt, wft, wp];
    outputs = [specT, fmax, fmaxab, ue, uef, uec, TSFC, np, nth, no, u, wf / 1000, wc / 1000, wt / 1000, wft / 1000, wp / 1000];
    Tis = [To1, To2, To3, To4, To51, To5m, To52, To6, Te, Tef, To7, Tec];
    Pis = [Po1, Po2, Po3, Po4, Po51, Po5m, Po52, Po6, Pe, Pef, Po7, Pec, Pexit] ./ 1000;
    
    
end