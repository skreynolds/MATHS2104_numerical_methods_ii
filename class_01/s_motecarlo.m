n = 1000;
x = rand(2,n);

% these are used to build index references 
nKeep = n/2;
nNew = n - nKeep;

f = testfunction(x);

for iteration = 1:10
    % sorts the function evaluations and creates a reference index
    [f,i] = sort(f);
    % display the minimised values
    disp(f(1));
    disp(x(:,1));
    % sorts the variable values into the order of ascending f
    x = x(:,i);
    % the rand part generates nNew random numbers and then we multiply by
    % nKeep which is some integer - this gives us a double which we then
    % round up - these j,k,l are then used as index references to
    % generate xNew
    j = ceil(nKeep*rand(nNew,1));
    k = ceil(nKeep*rand(nNew,1));
    l = ceil(nKeep*rand(nNew,1));
    % roberts trisexual formula is used to generate the new points
    xNew = (2*x(:,j) + 2*x(:,k) - x(:,l))/3;
    
    % replace the discarded values with the new values - note that both
    % the action of discarding and replacement occurs here simultaneously
    % "overwrite" is the word that best fits here
    x(:,nKeep+1:n) = xNew;
    % evaluate only the new entries for f wrt xNew
    f(:,nKeep+1:n) = testfunction(xNew);
end