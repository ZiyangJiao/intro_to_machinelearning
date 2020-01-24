function [train_err, test_err] = test(X_tr, y_tr, X_te, y_te, numTrees)
% AdaBoost: Implement AdaBoost with decision stumps as the weak learners. 
%           (hint: read the "Name-Value Pair Arguments" part of the "fitctree" documentation)
%   Inputs:
%           X_tr: Training data
%           y_tr: Training labels
%           X_te: Testing data
%           y_te: Testing labels
%           numTrees: The number of trees to use
%  Outputs: 
%           train_err: Classification error of the learned ensemble on the training data
%           test_err: Classification error of the learned ensemble on test data
% 
% You may use "fitctree" but not any inbuilt boosting function

%calculate the size of training set
s = size(X_tr);
n = s(1);
T = s(2);

%pB = y_te./y_te - 1;
type = mean(y_tr);
yht = zeros(length(y_tr),T);
At = zeros(1,T);

%initialize w
w = ones(1,n) * 1/n;

if type<3
    y_tr(y_tr == 1) = -1;
    y_tr(y_tr == 3) = 1;
elseif type>3
    y_tr(y_tr == 3) = -1;
    y_tr(y_tr == 5) = 1;
end

for t = 1:numTrees
    %use the t column feature to build ht
    ht = fitctree(X_tr, y_tr, 'MinParentSize',n,'Weights',w');
    yh = predict(ht,X_tr);
    yht(:,t) = yh;
    yh(yh ~= y_tr) = 1;
    yh(yh == y_tr) = 0;
    
    et = w * yh;
    at = 1/2 * log((1-et)/et);
    At(1,t) = at;
    
    yh(yh == 1) = -1;
    yh(yh == 0) = 1;
    Z = 2 * sqrt(et*(1-et));
    w = w/Z .*(exp(-at .* yht(:,t).*y_tr));
   
    %w = (w .* exp(-at * (yht(:,t).*y_tr)')) / (2 * sqrt(et*(1-et)));
end

result = At .* yht;
r = sum(result,2);

if type<3
    a = 1;
    b = 3;
elseif type>3
    a = 3;
    b = 5;
end

%h_tr
h_tr = sum(At .* yht, 2);
h_tr(h_tr<((a+b)/2)) = a;
h_tr(h_tr>=((a+b)/2)) = b;

train_err = sum(h_tr ~= y_tr) / length(y_tr)

    
    
end