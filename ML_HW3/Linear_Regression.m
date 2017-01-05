close all; clear all; clc;

load('RegressionData.mat');
X = X'; % X = matrix with N * (d + 1)
Y = Y'; % Y = matrix with N * 1

% X is invertible
% W_lin = inv(X' * X) * X' * Y;

% X is singular
W_lin = pinv(X) * Y;

Visualize(X', Y', W_lin);

err_sqr = sum((X * W_lin - Y) .^ 2);    % error measure
err_rate = GetRate(X', Y', W_lin);  % error rate