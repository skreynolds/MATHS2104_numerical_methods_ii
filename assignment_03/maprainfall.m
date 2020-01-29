% Load station data, where first column is the longitudinal data, the
% second column is the latiudinal data and the thrid colum is the
% rainfall data in mm
station_data = load('stations.dat');

coastline_data = load('coastline.dat');

% Create points at which we want to calculate the interpolant at.
% Additionally these matrices will be used for plotting.
npoints = 100;
x = linspace(110,155,npoints); %longitudinal interpolant points
y = linspace(-45,-10,npoints); %lattudinal interpolant points

% Create meshgrid of data points that can be fed into rbfspline2d
[X Y] = meshgrid(x,y);

% Call rbfspline to evaluate the interpolant points calculated from the
% actual data points which we loaded in as station_data

Z = tpspline2d(X,Y,station_data(:,1),station_data(:,2),station_data(:,3));

% Plot the contour funciton to the specified contour levels
IN = inpolygon(X,Y,coastline_data(1:end-1,1),coastline_data(1:end-1,2));
Z(~IN) = NaN;
contourlvls = [0 2 10 25 50 100 200 300 400 600 800 1200];
contourf(X,Y,Z,contourlvls);
colorbar;
title(colorbar, 'Rainfall (mm)');
hold on;
plot(coastline_data(:,1),coastline_data(:,2),'k','LineWidth',2);