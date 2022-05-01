a = 0.8109; b = 6.575;

for TI = [0.001, 0.01, 0.1, 1, 10]
    G = tf([TI 1], [TI 0]) * tf([a], [1 b]);

    rlocus(G);
    xlim([-25, 5]);
    title("Root Locus (TI = " + TI + ")");

    K = rlocfind(G);

    fprintf("(TI, K) values:\n");
    TI
    K

    pause;
end
