function outputs = turbofan(inputs)
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
    [gammas, MWs, aEff, rd, pEff, cEff, Prs, hr, rhof, deld, Prnm] = flowProperties(Ma);
    
    
    % DO STUFF
    % Do more stuff
    
Tmaxo = 1300; %Kelvin
bmax = 0.12;
cb1 = 700; %Kelvin

Tmax = Tmaxo + (cb1 * sqrt(b/bmax));

specTeff = specT - deld;

end