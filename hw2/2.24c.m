
x1 = 2*rand(1,1000)-1;
x2 = 2*rand(1,1000)-1;
y1 = x1.^2;
y2 = x2.^2;
a = x1 + x2;
b = -x1 .* x2;
x = linspace(-1,1,1000);
y = x.^2;

g = zeros(1000,1000);
for i=1:1000
    for j=1:1000
        g(i,j) = a(i) * x(j) + b(i);
    end
end


Ea = sum(a')/1000;
Eb = sum(b')/1000;
Ey = Ea .* x + Eb;

bias = sum((Ey - y).^2,2)/1000;

var = 0;
for i=1:1000
    var = var + sum((g(i,:) - Ey).^2,2)/1000;
end

var = var/1000;




% for i=1:1000
%     plot(x,g(i,:),'color','g','LineWidth',1);
%     hold on;
% end
Egx = plot(x,Ey,'color','r','LineWidth',2);
m=[-1 1];
n=[0 0];
%Egx=plot(m,n,'color','r','LineWidth',5);
axis([-1 1,-0.2 1]);
xlabel('X belong to [-1,1]');
ylabel('Y');
% legend(Egx,'Eg(x)');
hold on;
fx = plot(x,x.^2,'color','g','LineWidth',2);
legend('Eg(x)','f(x)');

mean = 0;
s = linspace(-1,1,10000);
for p = 1:1000
    out = 0;
    for q = 1:10000
        out = out + (a(p)*s(q) + b(p) - s(q)^2)^2;
    end
    out = out / 10000;
    mean = mean + out;
end

mean = mean / 1000;
