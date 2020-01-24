random_matrix = [];
svm_matrix = [];
for i = 1:1000000
    x2_up = rand(3,1);
    x1_up = -1 + 2*rand(3,1);
    x2_low = -1*rand(3,1);
    x1_low = -1 + 2*rand(3,1);

    x1 = [x1_up;x1_low];
    x2 = [x2_up;x2_low];
    points = [x1,x2];

    % axis([-1 1 -1 1]);
%     plot(x1,x2,'r*');
%     hold on;
    min_up = min(x2_up);
    max_low = max(x2_low);

    random = max_low + (min_up-max_low)*rand(1);
    svm = max_low + (min_up-max_low)/2;

%     plot([-1 1],[random,random]);
%     plot([-1 1],[svm,svm]);
%     axis([-1 1 -1 1]);
% 
%     legend('points','g-random','g-svm');
    
    random_matrix(i) = random;
    svm_matrix(i) = svm;
end


x = linspace(-1,1,1000);
random_bias = 0;
random_var = 0;
svm_bias = 0;
svm_var = 0;

% %     random
% random_bias = sum((sign(x-mean(random_matrix))-sign(x)).^2) / length(x);
random_bias = (mean(random_matrix)-0).^2;
    
% %     svm
% svm_bias = sum((sign(x-mean(svm_matrix))-sign(x)).^2) / length(x);
svm_bias = (mean(svm_matrix)-0).^2;

% for i = 1:1000000
% % %     random
% %     random_var = random_var + sum((sign(x-random_matrix(i))).^2 - (sign(x-mean(random_matrix))).^2)/length(x);
%     random_var = random_var + (random_matrix(i).^2 - mean(random_matrix).^2)
%     
% % %     svm
% %     svm_var = svm_var + sum((sign(x-svm_matrix(i))).^2 - (sign(x-mean(svm_matrix))).^2)/length(x);
%     random_var = random_var + (svm_matrix(i).^2 - mean(svm_matrix).^2)
% end

res_random_bias = random_bias;
% res_random_var = random_var/1000000;
res_random_var = var(random_matrix);
res_svm_bias = svm_bias;
% res_svm_var = svm_var/1000000;
res_svm_var = var(svm_matrix);
    