function E_in = Gradient(W, X, Y)

[D N] = size(X);
E_in = 0;
for i = 1:N
    E_in = E_in + Sigmoid(-Y(i) * W' * X(:,i)) * (-Y(i) * X(:,i));
end
E_in = E_in / N;

end