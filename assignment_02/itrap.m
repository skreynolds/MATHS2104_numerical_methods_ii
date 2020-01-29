function I = itrap(func,a,b,n)

% Shane Reynolds 04/09/2012

% set spacing h, and generate equispaced data points based on the
% interval over which the integral is to be calculated
h = (b-a)/(n-1);
xj = a + ((1:n) - 1)*h;
fj = func(xj);


% Calculates the global integral for by summing the local integral
% over all the sub intervals (formula simplified)
I = h*(.5*fj(1) + sum(fj(2:(n-1))) + .5*fj(n));

end