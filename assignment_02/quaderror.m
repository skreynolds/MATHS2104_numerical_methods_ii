% Quadratic Interpolation Error example
% Shane Reynolds 03/09/2012

% the min number of actual data points such that the quadratic
% interpolation error will be less than 10^-2
Nmin = 36;

% generating Nmin equispaced data points
xj = linspace(0,2*pi,Nmin);
fj = cos(3*xj);

% generate 1000 equispaced interpolation points in the interval [0,2pi]
x = linspace(0,2*pi,1000);

% generate 1000 estimations of f with a quadratic interpolant forced
% through 35 actual data points
pNmin = quadinterp(x,xj,fj);

% calculate 1000 actual data points for the fucntion
f_actual = cos(3*x);

% calculate 1000 absolute errors to plot
error = abs(f_actual - pNmin);

% plot the absolute error over the interval 0 to 2*pi
plot(x,error);
xlabel('x');
ylabel('Absolute Error');