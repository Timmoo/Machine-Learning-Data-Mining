close all; clear all; clc;

% 3. Leave-one-out cross validation
load('RegressionData2.mat', 'x', 'y', 'fx');
Q = 15;
r = [0.00001 0.0001 0.001 0.01 0.1 1];

N = length(x);
n = length(r);
Z = ones(N, (Q + 1));

for i = 1:(Q + 1)
    Z(:,i) = x .^ (i - 1);
end

E_loocv = zeros(1, n);
for j = 1:n
    en = zeros(1, N);
    for i = 1:N
        Z_train = [Z(1:(i-1),:); Z((i+1):N,:)];
        y_train = [y(1:(i-1),:); y((i+1):N,:)];
        Z_test = Z(i,:);
        y_test = y(i,:);
        W_reg = (Z_train' * Z_train + r(j) * eye(Q + 1)) \ Z_train' * y_train;
        en(i) = (Z_test * W_reg - y_test) ^ 2;
    end
    E_loocv(j) = mean(en);
end

r_best = r(find(E_loocv == min(E_loocv)));