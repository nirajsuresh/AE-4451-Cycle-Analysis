function [outputs, Tis, Pis] = ramjet(inputs)
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
    bma = inputs(13);
    compressorBleed = inputs(14);
    afterburner = inputs(15);
    combinedNozzle = inputs(16);
    
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
    Nd = aEff(4);
    [To1, Po1] = diffuser(Ta, Pa, yd, Ma, Nd);
    Nb = cEff(1);
    
    cpb = R * (yb / (yb-1));
    
    fmax = ((Tmax/To1) - (1 + ((yb - 1) / 2) * Ma ^ 2)) / (((Nb * hr) / (cpb * To1)) - (Tmax/To1));
    
    Prb = Prs(1);
    [Po4, To4] = burner(yb, Po1, To1, f, Nb, hr, R, Prb);
    
    Nn = aEff(1);
    [ue, Te, specT, TSFC, np, nth, no] = coreNozzle(Tmax, Po4, yn, Nn, R, f, Ma, Ta, Pa, hr);

    
    %outputs = [specT, fmax, fmaxab, ue, uef, uec, TSFC, np, nth, no, u, wf, wc, wt, wft, wp];
    outputs = [specT, fmax, 0, ue, 0, 0, TSFC, np, nth, no, u, 0, 0, 0, 0, 0];
    Tis = [To1, 0, 0, To4, 0, 0, 0, 0, Te, 0, 0, 0];
    Pis = [Po1, 0, 0, Po4, 0, 0, 0, 0, Pa, 0, 0, 0, 0];
    
    
end