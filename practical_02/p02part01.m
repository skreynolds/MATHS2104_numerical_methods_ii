% compare scalar and vector code
feature accel off
n=90000;
a=rand(n,1);
b=rand(n,1);
% addition
tic; c=a+b; tvec=toc();
tic; for i=1:n,c(i)=a(i)+b(i);end; tsca=toc();
addSpeedup=[tvec tsca tsca/tvec]

% vector sum
feature accel off
tic; d=sum(b); tvec=toc();
tic; d=0;for i=1:n,d=d+b(i);end; tsca=toc();
sumSpeedup=[tvec tsca tsca/tvec]

% find the index of the 1% of 'small' numbers
feature accel off
tic; j=find(a<0.01); tvec=toc();
tic; j=[]; % empties j
for i=1:n
if a(i)<0.01,j=[j,i];end % concatenates i
end
tsca=toc();
findSpeedup=[tvec tsca tsca/tvec]