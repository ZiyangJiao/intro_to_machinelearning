x = linspace(0,1,1000);
y(i) = pe(x(i));
for i = 1:1000
y(i) = pe(x(i));
end
plot(x,y,"k-*");
xlabel('epsilon');
ylabel('P(max|v1-v2|)>epsilon');


p = @(a)2*2*exp(-2*6*a*a);
hold on;
fplot(p,[0,1],"r:p");
legend('compute bounds','Hoffding bounds')