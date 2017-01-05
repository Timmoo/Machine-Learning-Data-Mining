close all; clear all; clc;

% 2. Regularization
load('RegressionData2.mat', 'x', 'y', 'fx');    % x:N*1, y:N*1

% (1) Choose Q=15 and r = 0, estimate W_reg, compute the squared error cost. Plot the N sample points along with the estimated curve
Q = 15;
r1 = 0;
N = length(x);
Z = ones(N, (Q + 1));

for i = 1:(Q + 1)
    Z(:,i) = x .^ (i - 1);
end

% W_reg1 = (Z' * Z + r1 * eye(Q + 1)) \ Z' * y;
W_reg1 = Z \ y;
err_sqr1 = sum((Z * W_reg1 - y) .^ 2);   % the squared error cost

g1 = Z * W_reg1;
Visualize(x, y, fx, g1);


% Choose Q =15 and r = 0.001, repeat the above steps.
r2 = 0.001;

W_reg2 = (Z' * Z + r2 * eye(Q + 1)) \ Z' * y;
err_sqr2 = sum((Z * W_reg2 - y) .^ 2);   % the squared error cost

g2 = Z * W_reg2;
Visualize(x, y, fx, g2);
