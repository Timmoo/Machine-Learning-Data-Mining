function [X,Y] = generateData(N, D)

%generate data samples
X = rand(D,N);
X = [ones(1,N); X]; %append 1 to features
%save('PLA_X.mat','X');

%assign the labels to samples
Y = (X(2,:) > X(3,:)) * 2 - 1;
