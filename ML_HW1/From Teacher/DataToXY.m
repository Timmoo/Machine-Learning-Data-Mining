function [X, Y] = DataToXY(DataFileName)

Data = load(DataFileName); % N rows of (label + sample description)
posidx = find(Data(:,1)==1); %positive index in Data
negidx = find(Data(:,1)==5); %negative index in Data

possample = Data(posidx,2:end); %positive samples, N_pos*D 
negsample = Data(negidx,2:end); %negtive samples, N_neg*D

N_pos = size(possample,1);
N_neg = size(negsample,1);

X = [possample', negsample']; %D*N, D*(N_pos+N_neg)
X = [X; ones(1,N_pos+N_neg)]; %D*N, D <-- D+1
Y = [ones(1,N_pos), -ones(1,N_neg)];


