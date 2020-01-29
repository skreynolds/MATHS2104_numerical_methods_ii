function [y dy d2y] = cubicsplinefit(x,xj,fj,t)
    
N = length(xj);
M = length(t);
[tj X] = meshgrid(t(2:M-1),xj);
A = [ones(N,1) xj abs(X - tj).^3 ];

abc = A\fj;

[tj X] = meshgrid(t(2:M-1),x);
y = abc(1) + abc(2)*x + abs(X - tj).^3*abc(3:N);
dy = abc(2) + 3*abs(X - tj).^2*abc(3:N);
d2y = 6*abs(X - tj)*abc(3:N);

end