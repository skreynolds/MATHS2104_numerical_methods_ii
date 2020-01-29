function u = rbfspline2d(x,y,xj,yj,fj)
% rbfspline2d calculates rbf interpolant for two-dimensional data.
% xj, yj and fj are column vectors containing the data.
% x and y are matrices containing the interpolation points.
% Numerical Methods
% Shane Reynolds 01 Oct 2012

% Obtain the matrix dimensions to fit the column vecotr output to
matdim = size(x);

% fit matrices x and y to column vectors
x = x(:);
y = y(:);

N = length(fj);

% set up matrix and solve for coefficients
[Xj X] = meshgrid(xj,xj);
[Yj Y] = meshgrid(yj,yj);
dist = sqrt((X-Xj).^2 + (Y-Yj).^2);
A = [zeros(3,3) [ones(N,1) xj yj]'
     ones(N,1) xj yj dist];
abc = A\[zeros(3,1); fj];

% evaluate interpolant
[Xj X] = meshgrid(xj,x);
[Yj Y] = meshgrid(yj,y);
dist = sqrt((X-Xj).^2 + (Y-Yj).^2);

% set up output matrix to feed column vector into
u = zeros(matdim);
% output matrix of evaluations made at interpolant points from x & y
u(:) = abc(1) + abc(2)*x + abc(3)*y + dist*abc(4:N+3);

end