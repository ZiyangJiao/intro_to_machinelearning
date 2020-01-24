
train = csvread('cleveland_train.csv',1,0);
train_x = train(:,1:13);
train_y =  train(:,14);
%convert y label from 0,1 to -1,+1
train_y = 2*train_y-1;

test = csvread('cleveland_test.csv',1,0);
test_x = test(:,1:13);
test_y = test(:,14);
%convert y label from 0,1 to -1,+1
test_y = 2*test_y-1;

w_init = zeros(14,1);

[iter_10k,w_10k,e_10k] = logistic_reg(train_x,train_y,w_init,10000,0.00001);
train_error_10k = find_test_error(w_10k,train_x,train_y);

[iter_100k,w_100k,e_100k] = logistic_reg(train_x,train_y,w_init,100000,0.00001);
[iter_1m,w_1m,e_1m] = logistic_reg(train_x,train_y,w_init,1000000,0.00001);

train_error_10k = find_test_error(w_10k,train_x,train_y);
test_error_10k = find_test_error(w_10k,test_x,test_y);

train_error_100k = find_test_error(w_100k,train_x,train_y);
test_error_100k = find_test_error(w_100k,test_x,test_y);

train_error_1m = find_test_error(w_1m,train_x,train_y);
test_error_1m = find_test_error(w_1m,test_x,test_y);

%part(2): scaling x to zscore(x), different eta and tolerance = 10^-6. Run
%until each element in gradient below tolerance
% Z_train = zscore(train_x);
% Z_test = zscore(test_x);
% [iter_unlimited,w_unlimited,e_unlimited] = unlimited_logistic_reg(train_x,train_y,w_init,0,0.00001);
% train_error_unlimited = find_test_error(w_unlimited,Z_train,train_y);
% test_error_unlimited = find_test_error(w_unlimited,Z_test,test_y);
