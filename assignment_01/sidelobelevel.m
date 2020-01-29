function sll = sidelobelevel(x,kd,nphi,phib)
%   Shane Reynolds 1092389 20/08/2012

%   Setting N equal to the dimensions of the Nxn matrix x (where
%   N is the number of coefficients aj and n is the number of
%   montecarlo sample points)
N = size(x);

%   Prepopulate the column vector sll with zeros to increase speed of
%   code
sll = zeros(1,N(2));

%   The sum of the coefficients must be equal to zero - hence we populate
%   the aN with 1 minus the rest of the aj
x = [1 - sum(x);x];

phi = linspace(pi/2 + phib,pi,nphi)';

%   Evaluate absarrayfactor for each montecarlo point and assign the
%   max value from absarrayfactor for each montecarlo point to the row
%   vector sll
    for i = 1:N(2)
        af = absarrayfactor(x(:,i),phi,kd);
        sll(i) = max(af);
    end
end