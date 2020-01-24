function [p] = pe(e)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    if e == 0
        p = 1;
    elseif (e > 0) && (e <= 1/6)
        p = 0.9023;
    elseif (e > 1/6) && (e <= 2/6)
        p = 0.3896;
    elseif (e > 2/6) && (e <= 3/6)
        p = 0.0615;
    else
        p = 0;
    end
end

