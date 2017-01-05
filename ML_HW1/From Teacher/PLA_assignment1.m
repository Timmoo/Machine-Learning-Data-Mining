load('LinearSeparable.mat','X','Y'); %X: D*N; Y: 1*N
[D,N] = size(X); 
T = 1000; %maximum iterations
w = zeros(D,1); %w is a D*1 vector, initialized as 0
for t = 1:T       
    error = false;
    for n=1:N
        %find a misktake of w and correct it
        if (Y(n) * X(:,n)' * w <= 0)                      
           w = w + Y(n) * X(:,n);
           error = true;                                 
        end            
    end              
    if ~error, break; end %if there is no more mistakes
end
Y_prediction = sign(w'*X);
error_rate = sum(Y_prediction~=Y)/N
        