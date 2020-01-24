
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
mean_x = mean(train_x);
std_x = std(train_x);

Z_train = zscore(train_x);
Z_test = zscore(test_x);
[row, col] = size(test_x);
for i = 1 : col
    for j = 1 : row
        Z_test(j,i) = (test_x(j,i) - mean_x(i)) / std_x(i);
    end
end
    

%eta = 0.01
[iter_unlimited1,w_unlimited1,e_unlimited1] = unlimited_logistic_reg(Z_train,train_y,w_init,0,0.01);
train_error_unlimited1 = find_test_error(w_unlimited1,Z_train,train_y);
test_error_unlimited1 = find_test_error(w_unlimited1,Z_test,test_y);

%eta = 0.1
[iter_unlimited2,w_unlimited2,e_unlimited2] = unlimited_logistic_reg(Z_train,train_y,w_init,0,0.1);
train_error_unlimited2 = find_test_error(w_unlimited2,Z_train,train_y);
test_error_unlimited2 = find_test_error(w_unlimited2,Z_test,test_y);

%eta = 1
[iter_unlimited3,w_unlimited3,e_unlimited3] = unlimited_logistic_reg(Z_train,train_y,w_init,0,1);
train_error_unlimited3 = find_test_error(w_unlimited3,Z_train,train_y);
test_error_unlimited3 = find_test_error(w_unlimited3,Z_test,test_y);

%eta = 4
[iter_unlimited4,w_unlimited4,e_unlimited4] = unlimited_logistic_reg(Z_train,train_y,w_init,0,4);
train_error_unlimited4 = find_test_error(w_unlimited4,Z_train,train_y);
test_error_unlimited4 = find_test_error(w_unlimited4,Z_test,test_y);


%eta = 5
[iter_unlimited5,w_unlimited5,e_unlimited5] = unlimited_logistic_reg(Z_train,train_y,w_init,0,5);
train_error_unlimited5 = find_test_error(w_unlimited5,Z_train,train_y);
test_error_unlimited5 = find_test_error(w_unlimited5,Z_test,test_y);


%eta = 6
[iter_unlimited6,w_unlimited6,e_unlimited6] = unlimited_logistic_reg(Z_train,train_y,w_init,0,6);
train_error_unlimited6 = find_test_error(w_unlimited6,Z_train,train_y);
test_error_unlimited6 = find_test_error(w_unlimited6,Z_test,test_y);


%eta = 7
[iter_unlimited7,w_unlimited7,e_unlimited7] = unlimited_logistic_reg(Z_train,train_y,w_init,0,7);
train_error_unlimited7 = find_test_error(w_unlimited7,Z_train,train_y);
test_error_unlimited7 = find_test_error(w_unlimited7,Z_test,test_y);

%eta = 7.5
[iter_unlimited8,w_unlimited8,e_unlimited8] = unlimited_logistic_reg(Z_train,train_y,w_init,0,7.5);
train_error_unlimited8 = find_test_error(w_unlimited8,Z_train,train_y);
test_error_unlimited8 = find_test_error(w_unlimited8,Z_test,test_y);

%eta = 7.6
[iter_unlimited9,w_unlimited9,e_unlimited9] = unlimited_logistic_reg(Z_train,train_y,w_init,0,7.6);
train_error_unlimited9 = find_test_error(w_unlimited9,Z_train,train_y);
test_error_unlimited9 = find_test_error(w_unlimited9,Z_test,test_y);

%eta = 7.7
[iter_unlimited10,w_unlimited10,e_unlimited10] = unlimited_logistic_reg(Z_train,train_y,w_init,0,7.7);
train_error_unlimited10 = find_test_error(w_unlimited10,Z_train,train_y);
test_error_unlimited10 = find_test_error(w_unlimited10,Z_test,test_y);