close all; clear all; clc;

%generate data
% load features.train %7291 * 257
% Y = features(:,1);
% X = features(:,[2 3])';
[X, Y] = DataToXY('features.train');

% N = length(Y);  %number of samples
% D = length(X(:,1)); %dimension of features
[D,N] = size(X);

T = 1000; %maximum iterations
w = zeros(D,1); %w is a D * 1 vector, initialized as 0
wg = w; %wg is the optimal solution of w

%generate the error
error = test(X,Y,wg);
tic
for t = 1:T
    
    %     R = randperm(size([1:N],2));
    for i = 1:N
        %         %draw the data and hyperplane
        %         figure(1); clf; axis([minX1 maxX1 minX2 maxX2]); hold on;
        %         plot(X(2,posIdx), X(3,posIdx), 'o', 'Linewidth', 2, 'Markersize', 10, 'Color', 'b');
        %         plot(X(2,negIdx), X(3,negIdx), 'x', 'Linewidth', 2, 'Markersize', 10, 'Color', 'r');
        %         if wg(2)~=0
        %             minVal = - (wg(3) * minX2 + wg(1)) / wg(2);
        %             maxVal = - (wg(3) * maxX2 + wg(1)) / wg(2);
        %             plot([minVal, maxVal],[minX2, maxX2],'Linewidth',2,'Color','r');
        %         elseif wg(3)~=0
        %             minVal = - (wg(2) * minX1 + wg(1)) / wg(3);
        %             maxVal = - (wg(2) * maxX1 + wg(1)) / wg(3);
        %             plot([minX1, maxX1],[minVal, maxVal],'Linewidth',2,'Color','r');
        %         end
        %         drawnow;
        
        %         i = R(n);
        if (Y(i) * X(:,i)' * w <= 0)
            %            w = w + 1 * (Y(i) - w' * X(:,i)) * X(:,i);
            w = w + Y(i) * X(:,i);
            e = test(X,Y,w);
            if (e < error)
                error = e;
                wg = w;
            end
            %            %draw the error data
            %            if Y(i)==1
            %                plot(X(2,i),X(3,i),'+', 'Linewidth', 2, 'Markersize', 10, 'Color', 'k');
            %            else
            %                plot(X(2,i),X(3,i),'+', 'Linewidth', 2, 'Markersize', 10, 'Color', 'k');
            %            end
            %            drawnow;
            
        end
        
        %if there is no more mistakes
        if error==0
            break;
        end
        
    end
    
    %if there is no more mistakes
    if error==0
        break;
    end
    
end
toc
% save('train_wg.mat','wg');

error_rate_train = test(X,Y,wg)/N
%generate data
% load features.test %7291 * 257
% Y = features(:,1);
% X = features(:,[2 3])';
[X, Y] = DataToXY('features.test');
N = length(Y);  %number of samples
error_rate_test = test(X,Y,wg)/N

