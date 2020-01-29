function f = quadinterp(x,xj,fj)

% Shane Reynolds 04/09/2012

% calculates the quadratic interpolant through 
% discrete points (xj,fj) at the points in x

[xj i] = sort(xj);
fj = fj(i);

N = length(xj);
[num, j] = histc(x,xj(1:2:N));
j = 2*j - 1;
j(x < xj(1)) = 1;
j(x >= xj(N-1)) = N-2;

f = fj(j).*((x - xj(j+1))./(xj(j) - xj(j+1))) ...
        .*((x - xj(j+2))./(xj(j) - xj(j+2))) ...            
            + fj(j+1).*((x - xj(j))./(xj(j+1) - xj(j))) ...
                .*((x - xj(j+2))./(xj(j+1) - xj(j+2))) ...                
                    + fj(j+2).*((x - xj(j))./(xj(j+2) - xj(j))) ...
                        .*((x - xj(j+1))./(xj(j+2) - xj(j+1)));

end
