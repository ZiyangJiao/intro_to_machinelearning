x2_up = rand(3,1);
x1_up = -1 + 2*rand(3,1);
x2_low = -1*rand(3,1);
x1_low = -1 + 2*rand(3,1);

x1 = [x1_up;x1_low];
x2 = [x2_up;x2_low];
points = [x1,x2];

% axis([-1 1 -1 1]);
plot(x1,x2,'r*');
hold on;
min_up = min(x2_up);
max_low = max(x2_low);

random = max_low + (min_up-max_low)*rand(1);
svm = max_low + (min_up-max_low)/2;

plot([-1 1],[random,random]);
plot([-1 1],[svm,svm]);
axis([-1 1 -1 1]);

legend('points','g-random','g-svm');