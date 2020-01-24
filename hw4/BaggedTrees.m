function [oob_err, test_err] = BaggedTrees(X_tr, y_tr, X_te, y_te, numBags)
% BaggedTrees: Learns an ensemble of numBags CART decision trees on the input dataset 
%              and also plots the out-of-bag error as a function of the number of bags
%      Inputs:
%              X_tr: Training data
%              y_tr: Training labels
%              X_te: Testing data
%              y_te: Testing labels
%              numBags: Number of trees to learn in the ensemble
%     Outputs: 
%	           oob_err: Out-of-bag classification error of the final learned ensemble
%              test_err: Classification error of the final learned ensemble on test data
%
% You may use "fitctree" but not "TreeBagger" or any other inbuilt bagging function


[row,col] = size(X_tr);
%%get the specific data set: 1 and 3
% data_1and3 = X_tr(y_tr(:,1)==1 | y_tr(:,1)==3 , :); %Find the logical OR of two matrices
% label_1and3 = y_tr(y_tr(:,1)==1 | y_tr(:,1)==3 , :);
data_1and3 = X_tr; %Find the logical OR of two matrices
label_1and3 = y_tr;

[subrow,subcol] = size(data_1and3);
 y_ensemple = zeros(subrow,1);
sum_unpicked_index = [];
error = zeros(numBags,1);

% xtest_1and3 = X_te(y_te(:,1)==1 | y_te(:,1)==3 , :); %Find the logical OR of two matrices
% ytest_1and3 = y_te(y_te(:,1)==1 | y_te(:,1)==3 , :);
xtest_1and3 = X_te; %Find the logical OR of two matrices
ytest_1and3 = y_te;
test_err = zeros(numBags,length(ytest_1and3));


%%do numBags times of resample and learn
for i=1:numBags
    %resample #subrow data
    resample_index = randsample(subrow,subrow,1); %parameter: source,data_number,replacement
    resample_x = data_1and3(resample_index,:);
    resample_y = label_1and3(resample_index,:);
    
    %train using resampled data
    tree = fitctree(resample_x,resample_y);
    
    %pick out out-of-sample data
    picked_index = unique(resample_index);
    intact_index = linspace(1,subrow,subrow)';
    unpicked_index = setdiff(intact_index,picked_index);
    x_unpicked = data_1and3(unpicked_index,:);
    y_unpicked = label_1and3(unpicked_index,1);
    sum_unpicked_index = [sum_unpicked_index;unpicked_index];
    sum_unpicked_index = unique(sum_unpicked_index);
    y_sum_unpicked = label_1and3(sum_unpicked_index,1);
    
    %make validation (accumulatively bagged)
    y_val = predict(tree,x_unpicked);
    if y_tr(1)==1||y_tr(2)==1||y_tr(3)==1||y_tr(4)==1||y_tr(5)==1
        y_val(y_val==1) = 1;
        y_val(y_val==3) = -1;
    end
    if y_tr(1)==5||y_tr(2)==5||y_tr(3)==5||y_tr(4)==5||y_tr(5)==5
        y_val(y_val==3) = 1;
        y_val(y_val==5) = -1;
    end
    %vote
    y_ensemple(unpicked_index) = y_ensemple(unpicked_index) + y_val;
    %compute error(accumulatively)
    y_oob = y_ensemple(sum_unpicked_index);
    if y_tr(1)==1||y_tr(2)==1||y_tr(3)==1||y_tr(4)==1||y_tr(5)==1
    y_oob(y_oob>=0) = 1;
    y_oob(y_oob<0) = 3;
    end
    if y_tr(1)==5||y_tr(2)==5||y_tr(3)==5||y_tr(4)==5||y_tr(5)==5
    y_oob(y_oob>=0) = 3;
    y_oob(y_oob<0) = 5;
    end
    error(i) = sum(y_oob ~= y_sum_unpicked)/size(sum_unpicked_index,1);
    
    %%test set
    test_err(i,:) = predict(tree,xtest_1and3);
end

oob_err = error(numBags);

%compute test error
if y_tr(1)==1||y_tr(2)==1||y_tr(3)==1||y_tr(4)==1||y_tr(5)==1
    test_err(test_err==1) = 1;
    test_err(test_err==3) = -1;
    vote_test = sum(test_err);
    same = find(~vote_test);
    vote_test(same) = datasample([-1,1],length(same));
    vote_test(vote_test>=0) = 1;
    vote_test(vote_test<0) = 3;
    test_err = sum(vote_test' ~= ytest_1and3)/size(ytest_1and3,1);
    
    plot(error);
    xlabel('number of bags');
    ylabel("out-of-bag error");
    title("Bagged Trees");
end
if y_tr(1)==5||y_tr(2)==5||y_tr(3)==5||y_tr(4)==5||y_tr(5)==5
    test_err(test_err==3) = 1;
    test_err(test_err==5) = -1;
    vote_test = sum(test_err);
    same = find(~vote_test);
    vote_test(same) = datasample([-1,1],length(same));
    vote_test(vote_test>=0) = 3;
    vote_test(vote_test<0) = 5;
    test_err = sum(vote_test' ~= ytest_1and3)/size(ytest_1and3,1);
    
    plot(error);
    xlabel('number of bags');
    ylabel("out-of-bag error");
    title("Bagged Trees");
    legend("1vs3","3vs5");
    hold off;
end
% 
% plot(error);
% xlabel('number of bags');
% ylabel("out-of-bag error");
% title("Bagged Trees");
% hold on;
end
