function f = linearinterp(x,xj,fj)
% calculates the linear interpolant through 
% discrete points (xj,fj) at the points in x

N = length(xj);
[ignore j] = histc(x,xj);
j(x < xj(1)) = 1;
j(x >= xj(N)) = N-1;
f = (fj(j).*(xj(j+1) - x) + fj(j+1).*(x - xj(j)))./(xj(j+1) - xj(j));
