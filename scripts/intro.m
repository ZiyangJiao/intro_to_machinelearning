% Everything after a % will be ignored.

9 / 2
% Semicolons surpress output
9 / 2;

2 + 3 * 10 ^ 4 - 1
(2 + 3) * 10 ^ (4 - 1)

x = 3
3 = x  % <- this will lead to an ERROR

% Observe the changes to x in the workspace window:
x^2 + 3*x
x = 5
x^2 + 3*x

% Variables can also be used to define other variables, or even to redefine themselves:
y = x / 3
x = 8*x + 5

pi
pi = 3; % NO error
pi      % <- this can be dangerous!

% Variable names - must begin with a letter
%                - can contain letters, digits, _
%                - case sensitive
%                - cannot contain punctuation or spaces
%                - cannot be a reserved keyword (such as 'if', 'return', 'end', ...)
if = 5 % <- this will lead to an ERROR
       % Note: the blue color indicates that 'if' is sth special!
       
sqrt(81)    % square root
abs(-53.2)  % absolute value
log(1000)   % natural log
log10(1000) % log base 10
log2(1000)  % log base 2

% Trigonometric functions (radians and degrees):
sin(pi / 2)
sind(90)    % <- this should be the same as sin(pi / 2)!!!
cos(pi / 2)

% CAUTION: using a function as variable name can be dangerous:
sin = 10    % that works (NO error)
sin(pi / 2) % <- observe the different ERROR messages
sin(3)      % <- observe the different ERROR messages
sin(1)      % <- why does this work?
which sin   % what is going on with sin?

% How do I get back my sin() function?
clear sin
which sin   % check again
sin(pi / 2), sin(1) % NOTE: a comma separates multiple commands

help sin
doc sin

save mydata x y % filename and then list the variables
clear x         % deletes a variable
clear           % deletes all your variables
clc             % cleans your command window
load mydata     % load a saved datafile (.mat)