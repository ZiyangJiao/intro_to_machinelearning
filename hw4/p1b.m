train = csvread('zip_train.csv',1,0);
[N,d] = size(train);
train_x = train(:,2:d);
train_y = train(:,1);

test = csvread('zip_test.csv',1,0);
[N1,d1] = size(test);
test_x = test(:,2:d1);
test_y = test(:,1);

numBags=200;
error1 = zeros(numBags,1);
error2 = zeros(numBags,1);
figure;

train_x1 = train_x(train_y(:,1)==1 | train_y(:,1)==3,:);
train_y1 = train_y(train_y(:,1)==1 | train_y(:,1)==3,:);
test_x1 = test_x(test_y(:,1)==1 | test_y(:,1)==3,:);
test_y1 = test_y(test_y(:,1)==1 | test_y(:,1)==3,:);
[error1,oob_err, test_err] = RandomForest(train_x1, train_y1, test_x1, test_y1, numBags,200);

train_x = train_x(train_y(:,1)==5 | train_y(:,1)==3,:);
train_y = train_y(train_y(:,1)==5 | train_y(:,1)==3,:);
test_x = test_x(test_y(:,1)==5 | test_y(:,1)==3,:);
test_y = test_y(test_y(:,1)==5 | test_y(:,1)==3,:);
[error2,oob_err, test_err] = RandomForest(train_x, train_y, test_x, test_y, numBags,200);

xlabel('number of bags');
ylabel("out-of-bag error");
title("Random Forests");
legend("1vs3","3vs5");