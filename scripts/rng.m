% Generate a number between 0 and 1:
rand
% Generating vectors of numbers between 0 and 1:
rand(2, 3)
% Generating a random square matrix:
rand(4)
% 5 random numbers from -10 to 15:
25*rand(1,5) - 10

% randi generates random integers:
randi([2 10])         % give a range of numbers
randi(100)            % limit the maximum number
randi([50 100], 4, 5) % generate a 4-by-5 matrix

% randn generates a normal distribution with mean of 0 and std of 1. Used just like rand:
randn(2, 4)
randn(3)
% std of 5, mean of -50:
5*randn(1,5) - 50