
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

% part(b): scaling x to zscore(x), different eta and tolerance = 10^-6. Run
% until each element in gradient below tolerance
Z_train = zscore(train_x);
Z_test = zscore(test_x);

%eta = 0.01
[iter_unlimited1,w_unlimited1,e_unlimited1] = unlimited_logistic_reg(Z_train,train_y,w_init,0,0.01);
train_error_unlimited1 = find_test_error(w_unlimited1,Z_train,train_y);
test_error_unlimited1 = find_test_error(w_unlimited1,Z_test,test_y);