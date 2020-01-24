function [train_err, test_err] = AdaBoost(X_tr, y_tr, X_te, y_te, numTrees)
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

row_tr = size(X_tr,1); %the number of data samples
row_te = size(X_te,1);
record_tr = zeros(numTrees,row_tr); %record each trees' prediction on train
record_te = zeros(numTrees,row_te); %record each trees' prediction on test
alpha = zeros(numTrees,1);
w = ones(row_tr,1)/row_tr;

for i = 1:numTrees
    %'MinParentSize' - Minimum number of branch node observations => stump
    %Split criterion - 'gdi' (Gini's diversity index), 'twoing' for the twoing rule, or 'deviance' for maximum deviance reduction (also known as cross entropy).
    tree = fitctree(X_tr,y_tr,'MinParentSize',row_tr,'SplitCriterion','deviance','prune','off','mergeleaves','off','Weights',w);
    %tree = fitctree(X_tr,y_tr,'MinParentSize',row_tr,'Weights',w);
%     view(tree);
    %record predict results
    record_tr(i,:) = predict(tree,X_tr);
    record_te(i,:) = predict(tree,X_te);
    
    %compute epsilon
    record = transpose(record_tr(i,:));
    %display(record ~= tmp);
    epsilon = sum(w .* (record ~= y_tr),1);
%     display(sum(record ~= y_tr,1));
    %epsilon = w' .* sum((record_tr(i,:) ~= y_tr'),2);
    if(epsilon > 0.5)
        break
    end
    
    %record alpha
    alpha(i) = 0.5*log((1-epsilon)/epsilon);
    
    %update Z,w
    Z = 2 * sqrt(epsilon*(1-epsilon));
    w = w/Z .* (exp(-alpha(i) .* y_tr .* transpose(record_tr(i,:)))) ;
%     display(sum(w))
    
    
 
end

train_res = sign(sum(alpha .* record_tr,1));
train_err = sum(train_res ~= y_tr')/length(y_tr);

test_res = sign(sum(alpha .* record_te,1));
test_err = sum(test_res ~= y_te')/length(y_te);

    
    
    
    
    
    
end