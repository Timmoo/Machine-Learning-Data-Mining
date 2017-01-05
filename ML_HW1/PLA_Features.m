close all; clear all; clc;
tic

%generate data
% load features.train  
% Y = features(:,1);
% X = features(:,[2 3])';
[X, Y] = DataToXY('features.train');

% N = length(Y);  %number of samples
% D = length(X(:,1)); %dimension of features
[D,N] = size(X);

T = 1000; %maximum iterations
w = zeros(D,1); %w is a D * 1 vector, initialized as 0
tic
for t = 1:T       
    error = 0;
    for n = 1:N     
        
        %find a misktake of w and correct it
        if (Y(n) * X(:,n)' * w <= 0)
%            w = w + 1 * (Y(n) - w' * X(:,n)) * X(:,n);
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

error_rate_train = test(X,Y,w)/N
%generate data
% load features.test 
% Y = features(:,1);
% X = features(:,[2 3])';

[X, Y] = DataToXY('features.test');
N = length(Y);  %number of samples
error_rate_test = test(X,Y,w)/N