close all; clear all; clc;

load('RegressionData.mat');    %X: D*N; Y: 1*N

%generate data
[D, N] = size(X);

T = 10000; %maximum iterations
% w = zeros(D,1); %w is a 3* 1 vector, initialized as 0
w = pinv(X') * Y';
tic
for t = 1:T
    
    error = 0;
    for n = 1:N
        %find a misktake of w and correct it
        if (Y(n) * X(:,n)' * w <= 0)
            w = w + Y(n) * X(:,n);
            error = error + 1;            
        end
    end
    
    %if there is no more mistakes
    if error ==0
        break;
    end
end
toc

Visualize(X, Y, w);

error_rate = GetRate(X, Y, w);