n = 100; 
d = rand(1,n)*30;

%non vectorised code
velocity=[];
for k=1:n
    if d(k) <= 10
        velocity(k) = 0.143+0.00525*d(k)^2;
    else
        velocity(k) = -0.458+0.12*d(k)-0.00075*d(k)^2;
    end
end

% disp(velocity);

%vectorised code
velocity=[];
velocity = zeros(1,n);
velocity(d<10) = 0.143+0.00525*d(d<10).^2;
velocity(d>=10) = -0.458+0.12*d(d>=10)-0.00075*d(d>=10).^2;

% disp(velocity);

[velocity i] = sort(velocity);
plot(d(i),velocity);