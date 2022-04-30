%% Question 2 Part A

fprintf("Part A\n");

A = [7 2 -3; 4 6 -4; 5 2 -1];
fprintf("Eigenvectors and Eigenvavlues of A:");
[V, D] = eig(A)

%% Question 2 Part B

fprintf("Part B\n");

[V_nb, D_nb] = eig(A, 'nobalance')

fprintf("Integer eigenvector associated with eigenvalue %f:", D_nb(1, 1));
v1 = round(V_nb(:, 1) * sqrt(14))
fprintf("Integer eigenvector associated with eigenvalue %f:", D_nb(2, 2));
v2 = round(V_nb(:, 2) * sqrt(3))
fprintf("Integer eigenvector associated with eigenvalue %f:", D_nb(3, 3));
v3 = round(V_nb(:, 3) * sqrt(2))

%% Question 2 Part C

fprintf("Part C\n");

fprintf("Characteristic polynomial of A:");
p = poly(A)
fprintf("Solutions (i.e. eigenvalues of A):");
r = roots(p)
% The roots match the eigenvalues found in Part A.

%% Question 2 Part D

fprintf("Part D\n");

fprintf("Difference norm:");
format long
n = norm(A * V - V * D)

fprintf("Exact values of eigenvectors and eigenvalues:");
V_e = [v1 v2 v3]
D_e = round(D)
fprintf("Difference norm:");
n_e = norm(A * V_e - V_e * D_e)  % <=> A V_e - V_e D_e = 0

%% Question 2 Part E

fprintf("Part E\n");

fprintf("Diagonalization:");
D_diag = V \ A * V

%% Question 2 Part F
% By hand, it is calculated that the eigenvalue of A is 1 and the only
% linearly independent corresponding eigenvector is [1 0].

fprintf("Part F\n");

A = [1 1; 0 1];
fprintf("Eigenvectors and Eigenvavlues of A:");
[V, D] = eig(A)

fprintf("Difference norm:");
n = norm(A * V - V * D)  % AV = VD satisfied

% V has a zero row. <=> V is not invertible <=> det V = 0
fprintf("Determinant of V:");
V_det = det(V)

%% Question 2 Part G

fprintf("Part G\n");

A = [0 4 3; 0 20 16; 0 -25 -20];

fprintf("Jordan Form:");
J = jordan(A)
