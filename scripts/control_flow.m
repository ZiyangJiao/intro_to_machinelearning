% The if statement analyzes the condition that is given to it. 
% If the if condition is true then the code within the if "block" will be executed. 
% Otherwise, that code will be skipped:

w = 5;
x = 0;
y = -12;
z = 27;

if x > z
    disp('In if #1')
end

if x*w && y+z
    disp('In if #2')
end

if y && ~(~w || x) || ~(y+z)
    disp('In if # 3')
end

% else acts as a catch-all after the if statement. 
% If the if condition is false then the else block gets executed:

if x > 1
    disp('In the if')
else
    disp('In the else')
end

if x ~= (w && y)
    disp('In the if')
else
    disp('In the else')
end

% elseif statements specify multiple conditions within the same block 
% (only one block is executed)

x = 10;
if x > 1
    disp('In the if')
elseif x > 5
    disp('In the elseif x > 5') % <- this will NEVER be executed
elseif x < 1
    disp('In the elseif')
else
    disp('In the else')
end

if w && ~x
    disp('In the if')
elseif z > w
    disp('In the elseif')
else
    disp('In the else')
end

% use a switch statement to compare the input and a set of variables only one of the cases is run, like an if statement

team = 'Patriots';

switch team
    case 'Patriots'
        wins = 12;
    case 'Jets'
        wins = 4;
    case 'Bills'
        wins = 3;
    case 'Dolphins'
        wins = 8;
    otherwise                                       % nothing matches, similar to an else statment
        disp('WARNING: no known team specified!')   % display error message
        wins = [];
end
wins

% Nested if statements
if w && ~x
    disp('In if')
    if z > w
        disp('In nested if')
    elseif x+w > z
        disp('In nested elseif')
    else
        disp('In the nested else')
    end
elseif x > 1
    disp('In elseif')
else
    disp('In the else')
end

% If you want to execute the same pice of code multiple times you can do so using a loop. 
for i = 1:10
    disp(i)
end

for i = 10:-2:1
    disp(i)
end

a = [5 -2 -9 10 100]

for i = a
    disp(i)
end

for i = 1:length(a)
    j(i) = a(i)^2 + 3*a(i) - 12
end
k = a.^2 + 3.*a - 12

% This is a good example of what loops are capable of, but in general
% the element-by-element operations of MATLAB are faster and should
% be used when possible.

clear w
clear x
clear y 
clear z

x = randn(1e7,1);
y = zeros(1e7,1);
tic;
for i = 1:1e7
    y(i) = sin(x(i)^2)+log(x(i)^4)-3;
end
toc

tic;
z = sin(x.^2)+log(x.^4)-3;
toc

y = zeros(1e7,1);
tic;
for i = 1:1e7
    w = pi * (i / 4);
    x = (i / 2) + 1;
    y(i) = sin(w^2)+log(x^4)-3;
end
toc

tic;
z = sin(1.5:0.5:5000001)+log(pi/4:pi/4:2500000*pi)-3;
toc

% while loops are a combination between if statements and for loops: 
% use a conditional expression to set the number of loops:
i = 0;
while i < 10
    disp(i)
    i = i + 1;
end

% Nested for loops
a = [1 2 3; 4 5 6; 7 8 9]
for i = 1:3
    for j = 1:3
        b(i,j) = a(i,j)^3 + (1/2) * a(i,j) - 6
    end
end
b = a.^3 + (1/2).*a - 6;
