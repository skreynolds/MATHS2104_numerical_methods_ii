%   Monte Carlo minimisation of SLL
%   Shane Reynolds 1092389 20/08/2012

clear
clc

%   Set the number of aj in the minimisation
N = 10;
%   Set parameters for the SLL function
kd = pi;
nphi = 20;
phib = 0.3*pi/2;

%   Set the number of montecarlo sample points
n = 600;
nKeep = 200;
nNew = n - nKeep;

x = rand(N-1,n) - 0.5;
f = sidelobelevel(x,kd,nphi,phib);

for generation = 1:80
    [f, i] = sort(f);
    x = x(:,i);
    
    j = ceil(nKeep*rand(nNew,1));
    k = ceil(nKeep*rand(nNew,1));
    l = ceil(nKeep*rand(nNew,1));
    
    xNew = (2*x(:,j) + 2*x(:,k) - x(:,l))/3;
    x(:,nKeep+1:n) = xNew;
    f(:,nKeep+1:n) = sidelobelevel(xNew,kd,nphi,phib);
    
end

[fMin,i] = min(f);
xMin = x(:,i);


fMin
xMin
aj = [(1 - sum(xMin));xMin]

phi = linspace(0,pi,10000)';
af = absarrayfactor(aj,phi,kd);
plot(phi,af)
axis([0 pi 0 1]);