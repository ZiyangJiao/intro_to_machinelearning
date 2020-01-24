% Writing your own MATLAB Functions

% Functions can be defined inline if you can express them as a single line
inlineFunction = @(x) x + 4;

inlineFunction(5)
% You can also use variables as function inputs:
a = 9.5;
inlineFunction(a)

% If you wish to store the result of the function to a variable then include
% that variable in your statement:
result = inlineFunction(7)

% Functions can also be defined in separate .m files
exampleFunction(-1)
hiddenFunction(-1)

% If your function has multiple outputs then you must use a vector to store
% the output variables (dimensions must match!):
[plus_4, minus_4] = exampleMultipleArgs(3,a)