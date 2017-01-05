close all; clear all; clc;

load('LinearSeparable.mat', 'X', 'Y');  % X:D*N Y:N*1
n = size(X, 2);
d = size(X, 1);

H = (Y * Y') .* (X' * X);
f = -ones(n, 1);
A = [];
b = [];
Aeq = Y';
beq = zeros(1, 1);
LB = zeros(n, 1);
UB = [];

x = quadprog(H, f, A, b, Aeq, beq, LB, UB);

w = zeros(2, 1);
for i = 1:n
    w = x(i) * Y(i) * X(:,i) + w;
end
b = 0;
for i = 1:n
    b = Y(n) - w' * X(:,i) + b;
end


visualizeSVM(X, Y, w, b, [1:n]);