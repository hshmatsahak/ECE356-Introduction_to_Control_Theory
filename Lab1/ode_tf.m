%% Section 4 Part A
% System: y'' + 2y' + 4y = 4u

fprintf("Part A\n");

A = [0 1; -4 -2];
B = [0; 4];
C = [1 0];
D = 0;

sys = ss(A, B, C, D)  % System

%% Section 4 Part B

fprintf("Part B\n");

[Y, T, X] = step(sys);

plot(T, X);

%% Section 4 Part C

fprintf("Part C\n");

sys_init = ss(A, zeros(size(B)), C, 0);
x0 = [0; 1];
[Y, T, X] = initial(sys_init, x0);

plot(T, X);
title('Part C: State versus Time');
xlabel('Time');
ylabel('State');
legend('x_1', 'x_2');

%% Section 4 Part D

fprintf("Part D\n");

t = 0:0.01:20;
u = sin(t);

[Y, t, X] = lsim(sys, u, t, x0);

plot(t, X);
title('Part D: State versus Time');
xlabel('Time');
ylabel('State');
legend('x_1', 'x_2');

%% Section 4 Part E

fprintf("Part E\n");

[b, a] = ss2tf(A, B, C, D);

fprintf("Transfer function:");
f = tf(b, a)
