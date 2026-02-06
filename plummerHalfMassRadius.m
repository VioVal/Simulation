clear

numberOfRounds = 100000;
halfMassRadii = zeros(1, numberOfRounds);

for i = 1:numberOfRounds

    numberOfPlanets = 500;
    rs = zeros(1, numberOfPlanets);
    
    for j = 1:numberOfPlanets
        rs(j) = ((1/(rand^(2/3))) - 1)^-0.5;
    end
    
    sortedRs = sort(rs);
    halfMassRadius = sortedRs(ceil(numberOfPlanets/2));
    halfMassRadii(i) = halfMassRadius;

end

histogram(halfMassRadii);
xlabel(' Half Mass Radius')
ylabel(' N ')
title(' Finding the Half Mass Radius')
disp(mean(halfMassRadius));