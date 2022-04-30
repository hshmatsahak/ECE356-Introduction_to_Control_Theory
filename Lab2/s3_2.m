%% Part 1

fprintf("Part 1\n\n");

g = 9.8;
M = 1;
R = 3;
L = 1;

syms y yy i u;

x = [y; yy; i];
f = [yy; g - i ^ 2 / (M * y ^ 2); 1 / L * u - R / L * i];
h = [y];

[yy0, i0, u0] = solve(f, [yy i u]);

y0 = 1;
yy0 = double(subs(yy0(2), y, y0));
i0 = double(subs(i0(2), y, y0));
u0 = double(subs(u0(2), y, y0));
x0 = [y0; yy0; i0];

fprintf("Matrices A and B:");
A = double(subs(jacobian(f, x), x, x0))
B = double(subs(jacobian(f, u), u, u0))
C = double(subs(jacobian(h, x), x, x0));
D = double(subs(jacobian(h, u), u, u0));

%% Part 2

fprintf("Part 2\n\n");

[V, ~] = eig(A);

fprintf("Eigenvalues of A:");
eigenvalues = diag(V)

if any(eigenvalues > 0)
    fprintf("Unstable (At least one eigenvalue with positive real part)\n");
else
    fprintf("Stable (No eigenvalue with positive real part)\n");
end

% Since at least one of the eigenvalues have a positive real part, there
% exists state vector that diverges from zero as t increases, hence the
% instability.

[b, a] = ss2tf(A, B, C, D);

fprintf("Transfer function G(s):");
G = tf(b, a)

fprintf("Zeros (z) and poles (p) of G(s):");
[z, p, ~] = tf2zp(b, a)

%% Part 3

fprintf("Part 3\n\n");

fprintf("States array:");
[~, ~, states] = magball

fprintf("Matrices A, B, C, and D:");
[A, B, C, D] = linmod('magball', x0, u0)

%% Part 4

fprintf("Part 4\n\n");

sys = ss(A, B, C, D);
[y, t] = impulse(sys);

plot(t, y);
xlim([0 2]);
title('Impulse Response of the System');
xlabel('Time');
ylabel('y');

%% Part 5

fprintf("Part 5\n\n");

[y, t] = step(sys);

plot(t, y);
xlim([0 2]);
title('Step Response of the System');
xlabel('Time');
ylabel('y');
