function I = imidpoint(func,a,b,n)

h = (b-a)/n;

% the generated data points - these would be computationally expensive
% to compute for example - thus we would only do a small number
xj = a + ((1:n) - .5).*h;
fj = func(xj);

I = h*sum(fj);

end