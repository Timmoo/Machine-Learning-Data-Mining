function Visualize(X, Y, w)

%get the minimum and maximum of the data
maxX1 = max(X(2,:)); minX1 = min(X(2,:));
maxX2 = max(X(3,:)); minX2 = min(X(3,:));
posIdx = find(Y==1);
negIdx = find(Y==-1);
figure(1); clf; axis([minX1 maxX1 minX2 maxX2]); hold on; 
if w(2)~=0
minVal = - (w(3) * minX2 + w(1)) / w(2);
maxVal = - (w(3) * maxX2 + w(1)) / w(2);
plot([minVal, maxVal],[minX2, maxX2],'Linewidth',2,'Color','r');
elseif w(3)~=0
minVal = - (w(2) * minX1 + w(1)) / w(3);
maxVal = - (w(2) * maxX1 + w(1)) / w(3);
plot([minX1, maxX1],[minVal, maxVal],'Linewidth',2,'Color','r');
end
legend('PLA');
plot(X(2,posIdx), X(3,posIdx), 'o', 'Linewidth', 2, 'Markersize', 10, 'Color', 'm'); 
plot(X(2,negIdx), X(3,negIdx), 'x', 'Linewidth', 2, 'Markersize', 10, 'Color', 'c'); 
drawnow;

end