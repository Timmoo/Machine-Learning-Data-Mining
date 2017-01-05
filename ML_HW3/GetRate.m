function err_rate = GetRate(X, Y, W)

Y_prediction = sign(W' * X);
error = sum(Y_prediction ~= Y);
err_rate = error / length(Y);

end