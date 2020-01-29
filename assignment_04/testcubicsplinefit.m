M = 3;

% generate random data points which the cubic interpolant will calculated
% from
xj = 2*pi*rand(200,1);
fj = sin(xj) + 0.2*randn(200,1);
t = linspace(0,2*pi,M)';

% actual points at which we want to calculate the interpolant
x = linspace(0,2*pi,200);

% inputing data points and the points at which we want the interpolant
% to be calculated
[y dy d2y] = cubicsplinefit(x,xj,fj,t);

figure
plot(x,y);

figure
plot(x,dy);

figure
plot(x,d2y);