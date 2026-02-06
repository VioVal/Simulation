clear
format long

diffBetweenPoints = zeros(1, 10000);

for i = 1:10000

    numberOfThrows = 10000;
    
    totalDifference = 0;
    
    for j = 1:numberOfThrows
        x1 = rand;
        y1 = rand;
        x2 = rand;
        y2 = rand;
    
        totalDifference = totalDifference + sqrt((x2 - x1)^2 + (y2 - y1)^2);
    end
    
    diffBetweenPoints(i) = totalDifference/numberOfThrows;

end

histogram(diffBetweenPoints);
xlabel(' Distance ')
ylabel(' N ')
title(' Length Between Points in Box')
disp(mean(diffBetweenPoints));