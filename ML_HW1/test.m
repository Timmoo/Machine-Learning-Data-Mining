function error = test(X,Y,w)

% error = 0;
% for i = 1:N
%     if (Y(i) * X(:,i)' * w <= 0)
%         error = error+1;
%     end
% end
Y_prediction = sign(w'*X);
error = sum(Y_prediction~=Y);
end