clear

numberOfLoops = 10000;
numberOfThrows = zeros(1, numberOfLoops);

for i = 1:numberOfLoops
    numberOfThrows(i) = findThrowsForPrecision();
end

histogram(numberOfThrows);
xlabel(' Number of Throws ')
ylabel(' N ')
title(' Distance Between Points on Line ')
disp(mean(numberOfThrows));

function mean = calculateMean(numberOfThrows)
    totalDifference = 0;

    for i = 1:numberOfThrows
        totalDifference = totalDifference + abs(rand - rand);
    end

    mean = totalDifference/numberOfThrows;
end

function counter = findThrowsForPrecision()
    counter = 0;
    precision = 1;

    while precision > 0.005
        counter = counter + 1;
        mean = calculateMean(counter);
        precision = abs(mean - 1/3);
    end
end