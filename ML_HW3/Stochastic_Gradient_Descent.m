close all; clear all; clc;

load('RegressionData.mat');
% X = matrix with (d + 1) * N
% Y = matrix with 1 * N
n = 0.5;    % step size

[D N] = size(X);
% W_log = zeros(D, 1);
W_log = pinv(X') * Y';

M = 5;  % The number of Datasets we get from one time
for t = 1:8000
    r = randperm(N, M);
    for i = 1:M
        % Visualize(X, Y, W_log);
        W_log = W_log + n * Sigmoid(-Y(r(i)) * W_log' * X(:,r(i))) * (Y(r(i)) * X(:,r(i)));
    end
end
Visualize(X, Y, W_log);

err_sce = 0;    % error measure
for i = 1:N
    err_sce = err_sce + log2(1 + exp(-Y(i) * W_log' * X(:,i)));
end

err_rate = GetRate(X, Y, W_log);    % error rate