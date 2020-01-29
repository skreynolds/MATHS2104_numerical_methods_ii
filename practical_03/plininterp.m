
% data points - typically in a problem these would be given and the
% underlying function unknown or difficult to calculate - in this
% instance we are simply genereating them to motivate an example
xj = linspace(0,2*pi,8);
fj = sin(xj);

% these are the interpolant points that is the point that are fed into
% the interpolant that is generated from the known points above - this
% operation yields estimates of the function for all the points x (note
% that where x = xj : f = fj)
x = linspace(0,2*pi,100);
f = linearinterp(x,xj,fj);

f_actual = sin(x);

error = abs(f_actual - f);
plot(x,error);
xlabel('x');
ylabel('Error');

ind = error > 10^-1;

sum(ind)