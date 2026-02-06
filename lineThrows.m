clear

numberOfThrows = 100000;

totalDifference = zeros(1, numberOfThrows);

for i = 1:numberOfThrows
    totalDifference(i) = abs(rand - rand);
end

disp(mean(totalDifference));
disp(var(totalDifference));