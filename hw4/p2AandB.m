train = csvread('zip_train.csv',1,0);
[N,d] = size(train);
train_x = train(:,2:d);
train_y = train(:,1);

test = csvread('zip_test.csv',1,0);
[N1,d1] = size(test);
test_x = test(:,2:d1);
test_y = test(:,1);


%%get the specific data set: 1 and 3
%%change label from [1,3] to [-1,+1]!
% data_1and3 = train_x(train_y(:,1)==1 | train_y(:,1)==3 , :); %Find the logical OR of two matrices
% label_1and3 = train_y(train_y(:,1)==1 | train_y(:,1)==3 , :);
% label_1and3(label_1and3==1)=1;
% label_1and3(label_1and3==3)=-1;
% 
% xtest_1and3 = test_x(test_y(:,1)==1 | test_y(:,1)==3 , :); %Find the logical OR of two matrices
% ytest_1and3 = test_y(test_y(:,1)==1 | test_y(:,1)==3 , :);
% ytest_1and3(ytest_1and3==1)=1;
% ytest_1and3(ytest_1and3==3)=-1;

numTrees = 200;

% test_err=zeros(numTrees,1);
% train_err=zeros(numTrees,1);
% for i = 1 : numTrees
%     [train_err(i), test_err(i)] = AdaBoost(data_1and3, label_1and3, xtest_1and3, ytest_1and3, i);
% end
% 
% figure;
% plot(test_err);
% hold on;
% plot(train_err);
% legend('test_err','train_err');
% xlabel('number of Trees');
% ylabel("error");
% title("AdaBoost 1-3");

% % for 3 vs 5
data_1and3 = train_x(train_y(:,1)==3 | train_y(:,1)==5 , :); %Find the logical OR of two matrices
label_1and3 = train_y(train_y(:,1)==3 | train_y(:,1)==5 , :);
label_1and3(label_1and3==3)=1;
label_1and3(label_1and3==5)=-1;

xtest_1and3 = test_x(test_y(:,1)==3 | test_y(:,1)==5 , :); %Find the logical OR of two matrices
ytest_1and3 = test_y(test_y(:,1)==3 | test_y(:,1)==5 , :);
ytest_1and3(ytest_1and3==3)=1;
ytest_1and3(ytest_1and3==5)=-1;

test_err=zeros(numTrees,1);
train_err=zeros(numTrees,1);
for i = 1 : numTrees
    [train_err(i), test_err(i)] = AdaBoost(data_1and3, label_1and3, xtest_1and3, ytest_1and3, i);
end

figure;
plot(test_err);
hold on;
plot(train_err);
legend('test_err','train_err');
xlabel('number of Trees');
ylabel("error");
title("AdaBoost 3-5");