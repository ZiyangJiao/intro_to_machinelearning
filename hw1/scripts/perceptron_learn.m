function [w, iterations] = perceptron_learn(data_in)
% perceptron_learn: Run PLA on the input data
% Inputs:  data_in is a matrix with each row representing an (x,y) pair;
%                 the x vector is augmented with a leading 1,
%                 the label, y, is in the last column
% Outputs: w is the learned weight vector; 
%            it should linearly separate the data if it is linearly separable
%          iterations is the number of iterations the algorithm ran for


iterations = 0;
columns = length(data_in(1,:));
w = zeros(1,columns-1); %row vector
label = data_in(:,columns); %column vector
data  = data_in(:,1:columns-1);
label_tmp = sign(w * data');

while norm(label_tmp - label')
%when compare matrix, use isequal;otherwise,'~=' return a set of logical
%value, but the matlab use the first one to measure while
    iterations = iterations + 1;
    res = find(label_tmp ~= label',1,'first');
    w = w + label(res,1) * data(res,:);    
    label_tmp = sign(w * data');
end
end