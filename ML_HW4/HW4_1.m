close all; clear all; clc;

% 1. Nonlinear transform and overfitting
load('RegressionData1.mat', 'x', 'y', 'fx');  % x:N*1, y:N*1

% (1) Choose Q=10, estimate W_poly, and compute the squared error cost. Plot the N sample points along with the estimated curve 
Q1 = 10;
N = length(x);
Z1 = ones(N, (Q1 + 1));

for i = 1:(Q1 + 1)
    Z1(:,i) = x .^ (i - 1);
end

W_poly1 = (Z1' * Z1) \ (Z1' * y);   % linear regression algorithm
err_sqr1 = sum((Z1 * W_poly1 - y) .^ 2);   % the squared error cost

g1 = Z1 * W_poly1;
Visualize(x, y, fx, g1);

% Choose Q =2 and repeat the above steps.
Q2 = 2;
N = length(x);
Z2 = ones(N, (Q2 + 1));

for i = 1:(Q2 + 1)
    Z2(:,i) = x .^ (i - 1);
end

W_poly2 = (Z2' * Z2) \ (Z2' * y);   % linear regression algorithm
err_sqr2 = sum((Z2 * W_poly2 - y) .^ 2);   % the squared error cost

g2 = Z2 * W_poly2;
Visualize(x, y, fx, g2);