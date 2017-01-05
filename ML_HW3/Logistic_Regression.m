close all; clear all; clc;

load('RegressionData.mat');
% X = matrix with (d + 1) * N
% Y = matrix with 1 * N
n = 1;

[D N] = size(X);
W_log = zeros(D, 1);
% W_log = pinv(X') * Y';

% for i = 1:N
%     W_log = W_log + 1 * ((sign(W_log' * X(:,i)) ~= Y(i)) * (Y(i) * X(:,i)));
% end

tmp = 0;
for t = 1:3000
    % Visualize(X, Y, W_log);
    G_Ein = Gradient(W_log, X, Y);
    W_log = W_log - n * G_Ein;
    if norm(G_Ein) == 0.00001 | norm(G_Ein) == tmp
        break;
    end
    tmp = norm(G_Ein);
end
% Visualize(X, Y, W_log);

err_ce = 0;
for i = 1:N
    err_ce = err_ce + log(1 + exp(-Y(i) * W_log' * X(:,i)));
end

err_rate = GetRate(X, Y, W_log);    % When w initial with 0, t = 2313, err_rate = 0; when w initial with linear regression, t = 1887, err_rate = 0