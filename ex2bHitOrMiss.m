clear
format long

a = [1, 2, 3, 2, 1; 1, 2, 3, 4, 4]';
c = (1/10)*[1, 1, 3, 4, 2]';

g = @(x,y) (1/1./(((x-a(1,1)).^2) + ((y-a(1,2)).^2) + c(1))) + ...
    (1./(((x-a(2,1)).^2) + ((y-a(2,2)).^2) + c(2))) + ...
    (1./(((x-a(3,1)).^2) + ((y-a(3,2)).^2) + c(3))) + ...
    (1./(((x-a(4,1)).^2) + ((y-a(4,2)).^2) + c(4))) + ...
    (1./(((x-a(5,1)).^2) + ((y-a(5,2)).^2) + c(5)));

throws = 10000;

I = hitOrMiss(g, throws);
disp(I);

function I = hitOrMiss(g, throws)
    count = 0;

    for i = 1:throws
        [x, y, z] = randomThrow();
        zFunc = g(x, y);
        
        if z < zFunc
            count = count + 1;
        end
    end

    I = 300*count/throws;
end

function [x, y, z] = randomThrow()
    x = rand*5;
    y = rand*5;
    z = rand*12;
end