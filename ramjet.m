function outputs = ramjet(inputs)
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
    [gammas, mw, aEff, rd, pEff, cEff, Prs, hr, rhof, deld, Prnm] = flowProperties(Ma);
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
    % DO STUFF
    [To1, Po1] = diffuser(Ta, Pa, yd, Ma);
    
    
end