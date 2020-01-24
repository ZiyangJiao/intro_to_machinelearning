X = [2,0;5,2;6,3;0,1;2,3;4,4];
y = [1;1;1;-1;-1;-1];
classifier{1} = fitcknn(X,y);
X2 = [2,0;5,10;6,15;0,5;2,15;4,20];

classifier{2} = fitcknn(X2,y);
classifier_name = {'Nearest Neighbor-(a)','Nearest Neighbor-(b)'};
x1range = min(X(:,1)):.01:max(X(:,1));
x2range = min(X(:,2)):.01:max(X(:,2));
[xx1, xx2] = meshgrid(x1range,x2range);
XGrid = [xx1(:) xx2(:)];

for i = 1
   predictedspecies = predict(classifier{i},XGrid);

   subplot(1,2,i);
   gscatter(xx1(:), xx2(:), predictedspecies,'yg');

   title(classifier_name{i})
   legend off, axis tight
end

x1range = min(X2(:,1)):.01:max(X2(:,1));
x2range = min(X2(:,2)):.01:max(X2(:,2));
[xx1, xx2] = meshgrid(x1range,x2range);
XGrid = [xx1(:) xx2(:)];
for i = 2
   predictedspecies = predict(classifier{i},XGrid);

   subplot(1,2,i);
   gscatter(xx1(:), xx2(:), predictedspecies,'yg');

   title(classifier_name{i})
   legend off, axis tight
end

