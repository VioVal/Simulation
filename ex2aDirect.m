clear
format long

N = 10000;
iterations = 1000;

xMax = 1;
xMin = -1;
yMax = 1;
yMin = -1;
xLength = xMax - xMin;
yLength = yMax - yMin;
area = xLength*yLength;

g = @(x,y) 0.5.*exp(-90.*((x-0.5).^2)-45.*((y+0.1).^2)) +...
    exp(-45.*((x+0.4).^2)-60.*((y-0.5).^2));

arrayI = zeros(1, iterations);

for i = 1:iterations
    x = rand(1, N);
    y = rand(1, N);
    x = (x.*xLength) + xMin;
    y = (y.*yLength) + yMin;
    
    gVal = g(x,y);
    
    arrayI(i) = area*(sum(gVal)/N);
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