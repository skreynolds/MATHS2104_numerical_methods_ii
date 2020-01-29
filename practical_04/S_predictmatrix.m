data = textread('data.txt');

format short

newPed = [475;880];

newArea = [800;550];

u = rbfsplinematrix2d(newPed, newArea, data(:,1),data(:,2),data(:,3));

disp(u);

nMesh = 40;

pedVec = linspace(300, 1200, nMesh);
areaVec = linspace(400, 800, nMesh);

[pedArray areaArray] = meshgrid(pedVec, areaVec);

intSalesVal = rbfsplinematrix2d(pedArray,areaArray,data(:,1),data(:,2),data(:,3));

surf(pedArray,areaArray,intSalesVal);

xlabel('pedestrians'); ylabel('floor area'); zlabel('sales');