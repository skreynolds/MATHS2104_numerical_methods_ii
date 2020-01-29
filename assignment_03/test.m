
w = 1;
x = linspace(0,2*pi,33);
fj = sin(w*x);

h = 2*pi/33;

fjprimeexact = cos(w*x) * w;
fjprimeapprox = ddx(fj,h);

plot(x,fjprimeexact,'r');
hold on;
plot(x,fjprimeapprox,'bo');
