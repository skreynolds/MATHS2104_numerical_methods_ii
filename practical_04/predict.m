data = textread('data.txt');

format short

newPed = [475;880];

newArea = [800;550];

u = rbfspline2d(newPed, newArea, data(:,1),data(:,2),data(:,3));

disp(u);

nMesh = 40;

pedVec = linspace(300, 1200, nMesh);
areaVec = linspace(400, 800, nMesh);

[pedArray areaArray] = meshgrid(pedVec, areaVec);

P = pedArray(:);
A = areaArray(:);

intSalesVal = rbfspline2d(P,A,data(:,1),data(:,2),data(:,3));

S = zeros(size(pedArray));

S(:) = intSalesVal;

surf(pedArray,areaArray,S);

xlabel('pedestrians'); ylabel('floor area'); zlabel('sales');