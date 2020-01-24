function [plus_4, minus_4] = exampleMultipleArgs(x, y)
    plus_4 = [helperFunction(x), helperFunction(y)];
    minus_4 = [x-4, y-4];
end

function y = helperFunction(x)
    y = x + 4;
end