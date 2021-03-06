%PLA algorithm. @Zhaozheng Yin, Fall 2016

clc; 

%generate data
N = 20; %number of samples
D = 2; %dimension of features
[X,Y] = generateData(N, D); %X: (D+1) by N; Y: 1 by N

%find the positive and negative data
posIdx = find(Y==1);
negIdx = find(Y==-1);

%get the minimum and maximum of the data
maxX1 = max(X(2,:)); minX1 = min(X(2,:));
maxX2 = max(X(3,:)); minX2 = min(X(3,:));

T = 1000; %maximum iterations
w = zeros(D+1,1); %w is a 3* 1 vector, initialized as 0
for t = 1:T       
    
    error = 0;
    for n=1:N
        %draw the data and hyperplane
        figure(1); clf; axis([minX1 maxX1 minX2 maxX2]); hold on;
        plot(X(2,posIdx), X(3,posIdx), 'o', 'Linewidth', 2, 'Markersize', 10, 'Color', 'b');
        plot(X(2,negIdx), X(3,negIdx), 'x', 'Linewidth', 2, 'Markersize', 10, 'Color', 'r');
        if w(2)~=0
            minVal = - (w(3) * minX2 + w(1)) / w(2);
            maxVal = - (w(3) * maxX2 + w(1)) / w(2);
            plot([minVal, maxVal],[minX2, maxX2],'Linewidth',2,'Color','r');        
        elseif w(3)~=0
            minVal = - (w(2) * minX1 + w(1)) / w(3);
            maxVal = - (w(2) * maxX1 + w(1)) / w(3);
            plot([minX1, maxX1],[minVal, maxVal],'Linewidth',2,'Color','r');                    
        end
        drawnow;        
        
        %find a misktake of w and correct it
        if (Y(n) * X(:,n)' * w <= 0)                      
           w = w + Y(n) * X(:,n);
           error = error + 1;
                      
           %draw the error data
           if Y(n)==1
               plot(X(2,n),X(3,n),'+', 'Linewidth', 2, 'Markersize', 10, 'Color', 'k');           
           else
               plot(X(2,n),X(3,n),'+', 'Linewidth', 2, 'Markersize', 10, 'Color', 'k');
           end
           drawnow;
        end        
%         pause(.1);        
    end       
    
    %if there is no more mistakes
    if error ==0
        break;
    end
end
