dat = load('bacteria.txt');

t = linspace(0,2,100);
y = 10*exp(2.386*t);

subplot(1,2,1) 
plot(dat(:,1),dat(:,2)), title('experimental')

subplot(1,2,2)
plot(t, y), title('modelled')

