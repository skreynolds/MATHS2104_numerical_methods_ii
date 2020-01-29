% This script compares the error between the actual integral value and
% the numericall computated one - a plot of the log to the base 10 of the
% absolute error is 

% Shane Reynolds 07/09/2012

% actual values of the integrals in parts a) and b)
actint_a = -2*pi;
actint_b = 4/5;

% create functions as objects that can be passed into itrap
func_a = @(x) x.*sin(x);
func_b = @(x) (1 - x).^(1/4);

% prepopulate the results tabulation for the for loop to increase code
% execution speed
err_table = zeros(10,3);

% iterate through increasing number of subintervals
for i = 1:10

    n = 2^i;
    err_table(i,1) = log10((2*pi - 0)/(n - 1));
    err_table(i,2) = log10(abs(actint_a - itrap(func_a,0,2*pi,n)));
    
    err_table(i,3) = log10((1 - 0)/(n - 1));
    err_table(i,4) = log10(abs(actint_b - itrap(func_b,0,1,n)));
   
end 

% subplot(1,2,1);
% plot(err_table(:,1),err_table(:,2));
% xlabel('log10(h)');
% ylabel('log10(|e|)');
% title('Part (a) integral of xsinx over [0,2*pi]');

% subplot(1,2,2);
% plot(err_table(:,3),err_table(:,4),'r');
% xlabel('log10(h)');
% ylabel('log10(|e|)');
% title('Part (a) integral of (1 - x)^(1/4) over [0,1]');

% plot log10(h) versus log10(|e|) for parts a) and b)
plot(err_table(:,1),err_table(:,2),'ob',...
        err_table(:,3),err_table(:,4),'or');
ylabel('log10(|e|)');
xlabel('log10(h)');
legend('xsinx','(1 - x)^.^2^5');