function [Po7, To7] = nozzleMixer(Po6, Po2, To6, To2, B, f, fab, R)
if fab == 0
%used for combined nozzle (not separate core/fan nozzles); not reversible
    To7 = To2 * (B / (B + 1 + f)) + To6 * ((1 + f) / (B + 1 + f));

    ynm = 1.44 - ((1.39e-4)*To7) + ((3.57e-8)*To7^2);

    Prnm = 0.8;

    Po7 = (Po2*(Po6/Po2)^((1+f)/(1+f+B))*(To7/To2)^(R*(ynm/(ynm-1))/R)*(To2/To6)^((R*(ynm/(ynm-1))/R)*(1+f)/(1+B+f)))*Prnm;
else
    To7 = To2 * (B / (B + 1 + f + fab)) + To6 * ((1 + f + fab) / (B + 1 + f + fab));

    ynm = 1.44 - ((1.39e-4)*To7) + ((3.57e-8)*To7^2);

    Prnm = 0.8;

    Po7 = (Po2*(Po6/Po2)^((1+f+fab)/(1+f+fab+B))*(To7/To2)^(R*(ynm/(ynm-1))/R)*(To2/To6)^((R*(ynm/(ynm-1))/R)*(1+f+fab)/(1+B+f+fab)))*Prnm;
    
end
