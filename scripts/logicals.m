% The result of these operations will be either 1 or 0, 1 is true and 0 is false:
8 >= 0
4 == 3
4 ~= 3
9 * -4 == 12 - 48 % Note that the arithmetic operations happened before the comparison.

x = 1:10
y = [4 1 9 3 8 5 7 10 6 2]
x >= y
y == x

% Comparing a scalar to a vector acts as an element by element operation:
x == 6
s = y <= 4
% These result vectors can be useful: plug them back in as an address and you have
% all of the values that match the comparison:
t = y(s)

% There's a special name for these vectors: they are called logical vectors.
% They are not the same as a normal vector with 1s and 0s. For example:
s2 = [1 1 0 1 0 0 0 0 0 1];
t = y(s2)

% When using scalars with the logical operators, everything besides zero is considered to be "true"
3 && 7
-2 && 100
0 && 4
0 || -11
~75
~(34 * 45 * 0)

% find returns the indices of nonzero numbers. 
% It can be used with relational or logical operators to find the location of values that fit a certain criteria:

y = 1:10;
find(y)
y(3:6) = [0 0 0 0];
find(y)
s = find(y > 4)
y(s)

strcmp('Henry','Henry')
strcmp('Henry','Chai')
strcmp('Henry','henry')   % case matters!
x = 'Henry';
y = 'Henry';
strcmp(x,y)