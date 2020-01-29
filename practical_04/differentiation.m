n = 20;

x = linspace(0,2*pi,n);

f = sin(x);

h = 2*pi / (n - 1);

dfdx = zeros(size(x));

dfdx = [(-f(3) + 4*f(2) - 3*f(1))/(2*h) ...
            (f(3:n) - f(1:n-2))/(2*h) ...
                (3*f(n) - 4*f(n-1) + f(n-2))/(2*h)];

dfdxExact = cos(x);

plot(x,dfdx,'ob',x,dfdxExact,'r');