clear
format long

N = 100;
iterations = 1000;
m = 11;

xMax = 1;
xMin = -1;
yMax = 1;
yMin = -1;

x = [];
y = [];

arrayI = zeros(1, iterations);

g = @(x,y) 0.5.*exp(-90.*((x-0.5).^2)-45.*((y+0.1).^2)) +...
    exp(-45.*((x+0.4).^2)-60.*((y-0.5).^2));

for j = 1:iterations
    xs = linspace(xMin, xMax, m);
    ys = linspace(yMin, yMax, m);
    
    I = 0;
    
    for xi = 1:(m-1)
        xiLength = xs(xi+1) - xs(xi);
        for yi = 1:(m-1)
            yiLength = ys(yi+1) - ys(yi);
            area = xiLength*yiLength;
    
            xRand = rand(1, N);
            yRand = rand(1, N);
            xRand = (xRand*xiLength) + xs(xi);
            yRand = (yRand*yiLength) + ys(yi);

            %x = [x xRand];
            %y = [y yRand];
    
            localG = g(xRand, yRand);
            I = I + area*sum(localG)/N;
        end
    end
    
    arrayI(j) = I;
end

meanI = mean(arrayI);
iVar = var(arrayI);
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
%title('Monte Carlo Systematic Sampling')
%grid on
%axis([xMin xMax yMin yMax])