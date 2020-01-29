% Generates and plots the information containing flight
% path angles and coefficients of lift.
% Adapted from Etter, 1993, p.42
anglelift=[
-4 -0.202
0 0.108
4 0.421
8 0.727
12 1.027
14 1.150
15 1.195
16 1.225
17 1.244
18 1.250
19 1.245
20 1.221
21 1.177
]
angle=anglelift(:,1) % copy first column into a vector
lift=anglelift(:,2) % copy second column into a vector
plot(angle,lift,'o-') % plot with lines and circles
title('Wind tunnel data on lift')
xlabel('flight path angle (degrees)')
ylabel('Coefficient of lift')
grid