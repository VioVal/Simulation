clear
format long

N = 10000;
iterations = 1000;

xMax = 5;
xMin = 0;
yMax = 5;
yMin = 0;
xLength = xMax - xMin;
yLength = yMax - yMin;
area = xLength*yLength;

a = [1, 2, 3, 2, 1; 1, 2, 3, 4, 4]';
c = (1/10)*[1, 1, 3, 4, 2]';

g = @(x,y) (1/1./(((x-a(1,1)).^2) + ((y-a(1,2)).^2) + c(1))) + ...
    (1./(((x-a(2,1)).^2) + ((y-a(2,2)).^2) + c(2))) + ...
    (1./(((x-a(3,1)).^2) + ((y-a(3,2)).^2) + c(3))) + ...
    (1./(((x-a(4,1)).^2) + ((y-a(4,2)).^2) + c(4))) + ...
    (1./(((x-a(5,1)).^2) + ((y-a(5,2)).^2) + c(5)));

arrayI = zeros(1, iterations);

for i = 1:iterations
    x = rand(1, N);
    y = rand(1, N);
    x = (x.*xLength) + xMin;
    y = (y.*yLength) + yMin;
    
    gVal = g(x,y);
    
    I = area*(sum(gVal)/N);
    arrayI(i) = I;
end

iVar = var(arrayI);
meanI = mean(arrayI);
confidenceInt = 1.96*sqrt(iVar)/sqrt(iterations);

fprintf("I = %1.8d =/- %1.8d\n", meanI, confidenceInt);
fprintf("Var = %1.8d\n\n", iVar);

q = integral2(g, xMin, xMax, yMin, yMax);
disp(q);

disp(abs(meanI-q));

%plot(x,y,'.r',MarkerSize=0.1)
%hold on
%xp = linspace(xMin,xMax,200);
%yp = linspace(yMin,yMax,200);
%[X,Y] = meshgrid(xp,yp);
%zp = g(X,Y);
%contour(X,Y,zp,20,'blue')
%xlabel('x')
%ylabel('y')
%title('Monte Carlo Direct Sampling')
%grid on
%axis([xMin xMax yMin yMax])