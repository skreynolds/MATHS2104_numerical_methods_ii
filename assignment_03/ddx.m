function dfdx = ddx(fj, h)
% Shane Reynolds 01/10/2012
% Function computes numerical derivative using second order expressions
% for interval boundries and fourth order experssion for the inner
% interval values

% Set the length of the input
n = length(fj);

% Calculate the numerical derivatives
dfdx = [(-fj(3) + 4*fj(2) - 3*fj(1))/(2*h) ...
            (fj(3) - fj(1))/(2*h) ...
                (-fj(5:n) + 8*fj(4:n-1) - 8*fj(2:n-3) + fj(1:n-4))/(12*h) ...
                    (fj(n) - fj(n-2))/(2*h) ...
                        (3*fj(n) - 4*fj(n-1) + fj(n-2))/(2*h)];
                     
end