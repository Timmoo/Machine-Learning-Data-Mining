function Visualize(x, y, fx, y_pred)

figure; hold on;
plot(x, fx, 'k');
plot(x, y, 'ko');
plot(x, y_pred, 'r'); 
legend('fx', 'y', 'y_pred');
hold off;

end