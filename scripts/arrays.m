% MATLAB loves arrays. Arrays can represent vectors or matrices.
% Arrays are MATLAB's standard way of representing things; 
% even scalars (e.g. a = 1) and strings are represented by arrays.

% Row vector: value separated by commas
rowVector = [27, 972, -198273, 0, 712]
% Column vector: values separated by semi-colons
columnVector = [27; 972; -198273; 0; 712]

% In colon notation, the first number represents the starting value,
% the middle number represents the spacing, and the last number
% represents the ending value:
newVector = 2:2:10
newVector = 2:2:11
newVector = 2:0.2:10
newVector = 10:-2:2
% Linspace is useful if you don't know what the spacing should be:
newVector1 = linspace(2,9,7)
newVector2 = linspace(-1,3,7)

% You can combine two vectors into a larger vector:
vector12 = [newVector1 newVector2]

% Separate columns by comma and rows by semi-colon:
newMatrix = [4, 2, 9; 1, 0, 3; 1, 9, 9]
% Can also be done using multiple lines:
newMatrix = [4 2 9
                1 0 3
                1 9 9]

% You can use variables and expressions to create matrices / vectors:
x = -2 * pi : pi / 2 : 2 * pi
trigMatrix = [sin(x)
                 cos(x)]

% You can use a combination of colon notation, linspace, and vector variables:
newMatrix = [2:4:22; linspace(-3, 9, 6)]

% When creating a Matrix, you must ensure that each row has the same number of columns:
newMatrix = [1 2
                3 4 5] % <- this will lead to an ERROR
            
v = [18 -20 25 4 -1]
A = [18 -20 2; 9 11 -14; 1 -1 100; 4 12 5]

v(3)
A(3, 2)
% Use this to change individual values within a matrix or vector:
v(5) = 100
A(1, 2) = 100

% Colon notation can be used to select more than one value within a
% vector or matrix:
v(2:4)
A(1:2, 2:3)
% A colon by itself selects all of the rows or columns:
A(:, 2:3)
A(1:3, :)
% As before, you can replace sections of a matrix or vector using this
% notation:
v(2:4) = [-11 999 0]
A(:, 1:2) = [55 66; 88 99; 10000 -10000; 9 99]

% Vectors and Matrices can be increased in size using this method as well:
v(10) = 100000
A(7, 8) = -999
% Note that if the values aren't specified they are automatically
% filled in with zeroes. Sometimes it's better to go ahead and specify
% a whole new row or column:

B = [1 2 3 4; 5 6 7 8; 9 10 11 12; 13 14 15 16]
B(5,:) = (17:20)
B(:,5) = (1:5)

% You can delete sections of vectors and matrices by using [] (empty vector):
v(1:3) = [] % erases first three entires
B(:,3) = [] % erases third column

% When deleting items from a matrix, you must delete an entire row or
% column. 
B(2,3) = []     % <- this will lead to an ERROR

% To 'flatten' your matrix to a vector use (:)
a = A(:)  

% Other ways to initialize commonly used matrices
zeros(3), zeros(3,4)    % all zero matrix
ones(2), ones(3,2)      % all ones matrix
eye(3)                  % identity matrix

v = [18 -20 25 4 -1]
A = [18 -20 2; 9 11 -14; 1 -1 100; 4 12 5]

v_transposed = v'
A_transposed = A'

% compare the sizes
length(v), size(v)
length(v_transposed), size(v_transposed)
size(A), size(A_transposed)

max(v)              % max entry in v
max(A(:))           % max entry in A
max(A)              % max entry in each column (same: max(A,[],1))
max(A,[],1)
max(A,[],2)         % max entry in each row (same: max(A'))
[m,idx] = max(A)    % max entry in each column (m) and their indices (idx)

A = [18 -20 2; 9 11 -14; 1 -1 100]

det(A)                  % determinant of a matrix
inv(A)                  % inverse of a matrix
diag(A)                 % diagonal elements
trace(A)                % trace or sum of the diagonal elements

A = [4 -10 11 -23; 9 14 -12 7]
B = [-2 1 15 -11; 10 7 4 2]

C = A + B
C = A - B

% Adding or subtracting a scalar will apply the operation to each element in
% the array
A + 12
B - 9

A * B       % <- this will lead to an ERROR
A * B'

squareA = [18 -20 2; 9 11 -14; 1 -1 100]
squareB = [-12 73 22; -10 -11 0; 85 2 90]

% Left division
squareA \ squareB
inv(squareA) * squareB

% Right division
squareB / squareA
squareB * inv(squareA)

A / 2

A = [4 -10 11 -23; 9 14 -12 7]
B = [-2 1 15 -11; 10 7 4 2]

A .* B  % element-wise multiplication
A ./ B  % element-wise division
A .^ B  % element-wise power

% + and - are already element by element:
A + B
A - B

% Operations involving scalars are typically element-by-element by default:
A * 5
B - 10

% Built-in Matlab functions for scalars can generally be applied to arrays:
cos(A)

% Element by element operations are useful for computing the result
% of a function for many different inputs:
x = [-3:3]
y = (x.^2 + 10.*x) ./ (-2.*x.^3 - 5)

newString = 'Hello World!'
%The addressing/indexing rules for arrays also apply to strings:
newString(3)
newString(7:11)
newString(7:11) = 'Class'   % replacement

% What if I want to replace my name with a name of a different length?
newString(7:11) = 'CSE417'          % <- this will lead to an ERROR
newString = [newString(1:6) 'CSE417' newstring(12)] % Correct way (create a new vector
                                                    % using pieces of the old one):
length(newString)           % vector functions also work with strings
newString = char('Name:', 'Henry', 'Job:', 'Code Monkey')

% For example say we have the following 2D arrays:
x = [1:3;4:6]
y = 10 * x;
z = 10 * y;
w = 10 * z;

% We could create a 3D array as follows:
threeD(:,:,1) = x;
threeD(:,:,2) = y;
threeD(:,:,3) = z;
threeD(:,:,4) = w;

% We now have an additional index to worry about.
threeD(1, 2, 3)
threeD(2, :, 2)
threeD(1, :, :)
threeD(:, :, 2)