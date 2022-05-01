a = 0.8109; b = 6.575; theta = 0; TI = 0.0835625; VMAX_UPM = 11.75;
G = tf([TI 1], [TI 0]) * tf([a], [1 b]);

rlocus(G);
xlim([-25, 5]);
title("Root Locus (TI = " + TI + ")");

K = rlocfind(G);

fprintf("(TI, K) values:\n");
Ti = TI
K

% (Ti = 0.0836, K = 41.2197)
