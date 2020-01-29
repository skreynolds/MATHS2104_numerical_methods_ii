% Monte Carlo minimisation of a function for 0 < x,y < 1.
% Numerical Methods
% 26 July 2012

n = 10000;
nKeep = floor(n/4);
nNew = n - nKeep;

x = rand(8,n)*15;
f = chainenergy(x);

for generation = 1:10
    [f, i] = sort(f);
    x = x(:,i);
    
    j = ceil(nKeep*rand(nNew,1));
    k = ceil(nKeep*rand(nNew,1));
    l = ceil(nKeep*rand(nNew,1));
    
    xNew = (2*x(:,j) + 2*x(:,k) - x(:,l))/3;
    x(:,nKeep+1:n) = xNew;
    f(:,nKeep+1:n) = chainenergy(xNew);
    
end
[fMin,i] = min(f);
xMin = x(:,i);

xMin
fMin

plot((1:10)', [10; xMin; 15], 'o-');