close all; clear all; clc;

load('LinearSeparable.mat', 'X', 'Y');  % X:D*N Y:N*1
n = size(X, 2);
d = size(X, 1);

H = diag([ones(1, d) 0]);
f = zeros(1, d + 1);
A = -diag(Y) * [X' ones(n, 1)];
b = -ones(n, 1);
x = quadprog(H, f, A, b);

w = x(1:d);
b = x(d + 1);

margin = 1 / norm(w);

visualizeSVM(X, Y, w, b, [1:n]);
