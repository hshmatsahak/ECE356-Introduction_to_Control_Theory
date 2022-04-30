%% Question 1 Part A

fprintf("Part A\n");

n = 500;
Q = orth(randn(n, n));
d = logspace(0, -10, n);
A = Q * diag(d) * Q';
x = randn(n, 1);
b = A * x;
tic, y = inv(A) * b; toc
err = norm(y - x)
res = norm(A * y - b)
pause
tic, z = A \ b; toc
err = norm(z - x)
res = norm(A * z - b)

%% Question 1 Part B
% We cannot compare the calculated inverse of A since we do not know what
% the correct value is. Therefore, the only way we calculate the accuracy
% of each method is by using the relations I = A A^-1 = A^-1 A. By
% calculating how close the yielded values of A A^-1 and A^-1 A are to I,
% we will be able to calculate their accuracies.

fprintf("Part B\n");

n = 4;
A = rand(n, n);

fprintf("Method 1: Using inv\n");
A_inv = inv(A);
err1 = norm(eye(n) - A * A_inv)
err2 = norm(eye(n) - A_inv * A)

fprintf("Method 2: Using mldivide\n");
A_inv = A \ eye(n);
err1 = norm(eye(n) - A * A_inv)
err2 = norm(eye(n) - A_inv * A)

fprintf("Method 3: Using mrdivide\n");
A_inv = eye(n) / A;
err1 = norm(eye(n) - A * A_inv)
err2 = norm(eye(n) - A_inv * A)
