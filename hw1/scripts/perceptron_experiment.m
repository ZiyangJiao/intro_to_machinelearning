function [num_iters, bounds_minus_ni] = perceptron_experiment(N, d, num_samples)
% perceptron_experiment: Code for running the perceptron experiment in HW1
% Inputs:  N is the number of training examples
%          d is the dimensionality of each example (before adding the 1)
%          num_samples is the number of times to repeat the experiment
% Outputs: num_iters is the # of iterations PLA takes for each sample
%          bound_minus_ni is the difference between the theoretical bound
%                         and the actual number of iterations
%          (both the outputs should be num_samples long)

bounds_minus_ni = zeros(1,num_samples);
num_iters       = zeros(1,num_samples);
n = 1;
while n <= num_samples
    w_label = rand(1,d+1); %set w* of d+1 dimension; row vector
    w_label(1,1) = 0; % set first dimension to 0
    
    n_training = 1;
    data_in = zeros(N,d+2);
    data  = ones(N,d+1);
    label = zeros(N,1);
    while n_training <= N 
        tmp_x = 2 * rand(1,d) - 1;
        data(n_training,2:d+1) = tmp_x(1,:);
        tmp_y = sign(w_label * data(n_training,:)');
        label(n_training,1) = tmp_y;
        n_training = n_training + 1;
    end
    data_in(:,1:d+1) = data(:,:);
    data_in(:,d+2)   = label(:,1);
    [w,iterations] = perceptron_learn(data_in);
    %compute the theoretical bounds
    r_r = max(sum(data'.* data')); % sum(each column):sum([m,n])=[1,n]
    w_w = sum(w_label' .* w_label');
    rou = min(label' .* (w_label * data')); 
    %rou1=rou^2;
    %rou2=rou*rou;
    bounds_minus_ni(1,n) = (r_r * w_w / (rou*rou)) - iterations;
    num_iters(1,n) = iterations;
    n = n+1;
        
end