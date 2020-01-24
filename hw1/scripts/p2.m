[iterations,diff] = perceptron_experiment(100,10,1000);

% Create figure
figure;
% Create histogram
histogram(iterations);
% Create xlabel
xlabel('the number of iterations');
% Create title
title('the number of iterations the PLA takes to learn a linear separator');

% Create figure
figure;
% Create histogram
histogram(log(diff));
% Create xlabel
xlabel('log(theoratical boundd - actual iterations)');
% Create title
title('the difference between actual iterations and log(theoratical bounds)');