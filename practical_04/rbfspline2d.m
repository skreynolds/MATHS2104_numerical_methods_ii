function u = rbfspline2d(x,y,xj,yj,fj)
% rbfspline2d calculates rbf interpolant for two-dimensional data.
% xj, yj and fj are column vectors containing the data.
% x and y are column vectors containing the interpolation points.
% Numerical Methods
% Aug 2012

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
u = abc(1) + abc(2)*x + abc(3)*y + dist*abc(4:N+3);


end