% Shane Reynolds 01/10/2012

% Script analysing the error in the ddx.m function for numerically 
% approximating derivatives

% Preallocate memory for results of script to be stored in
resultsTable = zeros(10,2);

% Loop over differnt values of n (the number of intervals)
for i = 1:10

    n = 2^i + 3;
    h = 2*pi/(n-1);
    x = linspace(0,2*pi,n);
    fj = sin(x);
    
    % Calculate approximate derivaties using ddx.m and exact derivatives
    fjPrimeApprox = ddx(fj,h);
    fjPrimeExact = cos(x);
    
    % Calculate the absolute error between the exact and numerical
    % approximations
    e = max(abs(fjPrimeApprox(3:n-2) - fjPrimeExact(3:n-2)));
    
    % Store log10 of the interval length and the log10 of the error
    % in the results table
    resultsTable(i,:) = [log10(h) log10(e)];
    
end

% Display results table
disp(resultsTable)

% Plot the log10 interval width vs the log10 error
plot(resultsTable(:,1),resultsTable(:,2));
xlabel('Log10(h)');
ylabel('Log10(e)');
title('Log10(h) vs Log10(e)');