function U = chainenergy(x)
    
    n = size(x,2);
    y = [10*ones(1,n); x; 15*ones(1,n)];
    
    U = 9.8*sum(y) + 14*sum(diff(y).^2);

end