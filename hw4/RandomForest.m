function [oob_err, test_err] = RandomForest(X_tr, y_tr, X_te, y_te, numBags, m)
% RandomForest: Learns an ensemble of numBags CART decision trees using a random subset of
%               the features at each split on the input dataset and also plots the 
%               out-of-bag error as a function of the number of bags
%       Inputs:
%               X_tr: Training data
%               y_tr: Training labels
%               X_te: Testing data
%               y_te: Testing labels
%               numBags: Number of trees to learn in the ensemble
% 				m: Number of randomly selected features to consider at each split
% 				   (hint: read the "Name-Value Pair Arguments" part of the fitctree documentation)
%      Outputs: 
%	            oob_err: Out-of-bag classification error of the final learned ensemble
%               test_err: Classification error of the final learned ensemble on test data
%
% You may use "fitctree" but not "TreeBagger" or any other inbuilt bagging function

%%'NumVariablesToSample',3

%%get the specific data set: 1 and 3
data_1and3 = X_tr; %Find the logical OR of two matrices
label_1and3 = y_tr;
oob_err_log = zeros(numBags,length(label_1and3));
error = zeros(numBags,1);

xtest_1and3 = X_te; %Find the logical OR of two matrices
ytest_1and3 = y_te;
test_err = zeros(numBags,length(ytest_1and3));

sum_unpicked = [];
for i = 1:numBags
    index = randsample(length(label_1and3),length(label_1and3),1);
    unpicked_index = setdiff(1:length(label_1and3),unique(index));
    %display(size(unpicked_index));
    tree = fitctree(data_1and3(index,:),label_1and3(index,:),'NumVariablesToSample',m);
    sum_unpicked = unique([sum_unpicked; unpicked_index']);
    oob_err_log(i,unpicked_index) = predict(tree,data_1and3(unpicked_index,:)); 
    tmp = oob_err_log(1:i,:);
    if y_tr(1)==1||y_tr(2)==1||y_tr(3)==1||y_tr(4)==1||y_tr(5)==1
    tmp(tmp==1) = 1;
    tmp(tmp==3) = -1;
    end
    if y_tr(1)==5||y_tr(2)==5||y_tr(3)==5||y_tr(4)==5||y_tr(5)==5
    tmp(tmp==3) = 1;
    tmp(tmp==5) = -1;
    end
    vote = sum(tmp,1);
    if y_tr(1)==1||y_tr(2)==1||y_tr(3)==1||y_tr(4)==1||y_tr(5)==1
    vote(vote>=0) = 1;
    vote(vote<0) = 3;
    end
    if y_tr(1)==5||y_tr(2)==5||y_tr(3)==5||y_tr(4)==5||y_tr(5)==5
    vote(vote>=0) = 3;
    vote(vote<0) = 5;
    end
    vote = vote';
%     display(size(tmp))
%     display(size(vote))
%     display(size(label_1and3))
    error(i) = sum(vote(sum_unpicked) ~= label_1and3(sum_unpicked))/size(sum_unpicked,1);
    
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
title("Random Forests");
legend("1vs3");
hold on;
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
title("Random Forests");
legend("3vs5");

end
% figure;
% plot(error);
% xlabel('number of bags');
% ylabel("out-of-bag error");
% title("Random Forests");
% hold on;
    
    
end
