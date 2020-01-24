x1range = 0:.01:8;
x2range = 0:.01:7;
mdl = fitcknn(x,y,'NumNeighbors',2,'DistanceWeight','equal');
xx1 = meshgrid(x1range);
XGrid = [xx1(:)];
predictedspecies = predict(mdl,XGrid);
gscatter(xx1(:), predictedspecies);

x1 = 0:0.01:2.5;
x1_l = abs(x1-1);
x1_r = abs(x1-3);
y = (1./x1_l)./(1./x1_l+1./x1_r)*1 + (1./x1_r)./(1./x1_l+1./x1_r)*4;
plot(x1,y);