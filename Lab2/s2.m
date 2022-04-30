%% Part 1

fprintf("Part 1\n\n");

% Constants
g = 9.8;
M = 1;
R = 3;
L = 1;

syms y yy i u;

x = [y; yy; i];

fprintf("State model: x_dot = f(x, u), y = h(x, u):");
f = [yy; g - i ^ 2 / (M * y ^ 2); 1 / L * u - R / L * i]
h = [y]

%% Part 2

fprintf("Part 2\n\n");

[yy0, i0, u0] = solve(f, [yy i u]);

fprintf("yy0, i0, and u0:");
yy0 = yy0(2)
i0 = i0(2)
u0 = u0(2)
x0 = [y; yy0; i0];

fprintf("Matrices A, B, C, and D:");
A = subs(jacobian(f, x), x, x0)
B = subs(jacobian(f, u), u, u0)
C = subs(jacobian(h, x), x, x0)
D = subs(jacobian(h, u), u, u0)

%% Part 3

fprintf("Part 3\n\n");

y0 = 1;
x0 = [y0; yy0; i0];

A = subs(A, y, y0);
B = subs(B, y, y0);
C = subs(C, y, y0);
D = subs(D, y, y0);

syms s;

fprintf("Open loop transfer function G(s):");
G = C * inv(s * eye(3) - A) * B + D

%% Part 4

fprintf("Part 4\n\n");

fprintf("Impulse-response function g(t):");
g = ilaplace(G)

fplot(g);
xlim([0 2]);
title('g(t) versus t');
xlabel('Time');
ylabel('g(t)');
