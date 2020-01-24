% plot(x, y) where x and y are vectors
x = (-5:5);
y = 3.*x.^2 + 10.*x - 4; 
plot(x,y)

plot(x,y,'k-*') % Black dashed line with asterisk markers
plot(x,y,'r:p') % Red dotted line with star markers
plot(x,y,'mo')  % No line with magenta circle markers

% plot is an example of a Matlab function that takes in Name, Value pairs
plot(x,y,'LineWidth',10)      % thicker line
plot(x,y,'Color','g')         % green line
plot(x,y,'Color',[.4 .6 .1])  % R, G, B values must be in range [0 1]
plot(x,y,'*','MarkerSize',10) % larger markers

% Strange plot
plot(x,y,':r^','LineWidth',10,'MarkerSize',20,'MarkerEdgeColor','m','MarkerFaceColor','b')

% figure initializes a figure window, the next thing you plot will go here.
figure; 
% Poorly defined plot
x = -3 * pi: pi / 2 : 3 * pi;
y = sin(x);
plot(x,y)
% Versus
figure;
x = linspace(-3 * pi, 3 * pi, 100);
y = sin(x);
plot(x,y)

% Create your first plot and then use the hold command. This will keep the
% plots on the figure until it is cleared:

x2 = (-3:4);
z = exp(x2);
w = 10*ones(11,1);

plot(x,y)  % first graph
hold on
plot(x2,z) % add second graph
plot(x,w)  % add third graph
hold off   % use hold off to reset the figure to the default behavior

plot(x,y,':*')  % first graph and formatting
hold on
plot(x2,z,'om') % add second graph and formatting
plot(x,w,'-.s') % add third graph and formatting
hold off        % use hold off to reset the figure to the default behavior

% The legend command allows you to name your data sets:
legend('y','z','w')
legend('y','z','w','Location','Best')
% names are assigned in the same order as the lines were added to the plots.

% Vector argument: xmin, xmax, ymin, ymax
axis([-3,4,0,20])
% equal axes
axis equal
% close fit to the data
axis tight

%A grid can be displayed with the grid command:
grid on
grid off

x = -3*pi:pi/8:3*pi;
y = sin(x);
z = cos(x);
w = sin(x).^2 + cos(x);

% The following command creates the three plots:
subplot(3,1,1)
plot(x,y)
% Switch to the next plot:
subplot(3,1,2)
plot(x2,z)
% And the final plot:
subplot(3,1,3)
plot(x,w)

% Single plot in new figure
figure()
plot(x,y)
% Create another figure
figure()
plot(x2,z)
% Create a third figure
figure()
plot(x,w)

figure(2)
plot(x,y) % writes over the second figure

% The clf command clears a figure:
clf    % clears the current figure
clf(1) % clears Figure 1
% The close command closes a figure:
close    % close the current figure
close(3) % close Figure 3
% Close all figures:
close all

% Labels: xlabel, ylabel, title:
plot(x,y)
xlabel('Units')
ylabel('Other Units')
title('Hello World!')

% Logarithmic axis
x = 0:10;
y = exp(x);
plot(x,y)
% Plots with a log scale on the y axis:
semilogy(x,y)
% Plots with a log scale on the x axis:
semilogx(x,y)
% Plots with a log scale for both axes:
loglog(x,y)