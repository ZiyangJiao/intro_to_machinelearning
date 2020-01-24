function [t, w, e_in] = logistic_reg(X, y, w_init, max_its, eta)

% logistic_reg: learn a logistic regression model using gradient descent
%  Inputs:
%       X:       data matrix (without an initial column of 1s)
%       y:       data labels (plus or minus 1)
%       w_init:  initial value of the w vector (d+1 dimensional)
%       max_its: maximum number of iterations to run for
%       eta:     learning rate
%     
%  Outputs:
%        t:    the number of iterations gradient descent ran for
%        w:    learned weight vector
%        e_in: in-sample (cross-entropy) error 

if (max_its <= 0)
    mean_x = mean(X);
    std_x = std(X);
    X = zscore(X);
    [row, col] = size(X);
    for i = 1 : col
        for j = 1 : row
            y(j,i) = (y(j,i) - mean_x(i)) / std_x(i);
        end
    end
end

[row, col] = size(X);
X = [ones(row,1),X];
t = 0;
w = w_init;
max_element = 1;

tic %start timer
while t < max_its && max_element > 0.001
    gradient = zeros(row,col+1);
    for i = 1:row
        gradient(i,:) = (-y(i).* X(i,:)) / (1 + exp(y(i)*(X(i,:)*w)));
        %disp(size(X(i,:)*w));
    end
    gradient_mean = mean(gradient);
    w = w - eta*gradient_mean';
    t = t + 1;
   
    %compute the max element in gradient
    max_element = max(abs(gradient_mean));
end
disp(toc) %show time
e_in = mean(log(1 + exp(-y.*(X*w))));
end

