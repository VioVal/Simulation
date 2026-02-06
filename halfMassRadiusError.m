clear
format long

%precision = 0.005;
precision = 0.00005;

realValue = 1.3054;

timesToRunSimutation = 1000;
totalNumberOfPointsPlaced = zeros(1, timesToRunSimutation);
totalHalfMassRadii = zeros(1, timesToRunSimutation);

for i = 1:timesToRunSimutation

    numberOfIterations = 0;
    rs = 0;
    halfMassRadius = 0;

    while abs(halfMassRadius - realValue) > precision
        numberOfIterations = numberOfIterations + 1;

        for j = 1:numberOfIterations
            rs(j) = ((1/(rand^(2/3))) - 1)^-0.5;
        end

        sortedRs = sort(rs);
        halfMassRadius = sortedRs(ceil(numberOfIterations/2));
    end

    totalHalfMassRadii(i) =  halfMassRadius;
    totalNumberOfPointsPlaced(i) = j;
end

figure(1);
histogram(totalHalfMassRadii);
xlabel(' Half Mass Radius')
ylabel(' N ')
title(' Half Mass Radius')
disp(mean(totalHalfMassRadii));

figure(2);
histogram(totalNumberOfPointsPlaced);
xlabel(' Number of Planets')
ylabel(' N ')
title(' Number of Planets Needed')
disp(mean(totalNumberOfPointsPlaced));