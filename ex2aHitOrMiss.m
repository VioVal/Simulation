clear
format long

g = @(x,y) 0.5.*exp(-90.*((x-0.5).^2)-45.*((y+0.1).^2)) +...
    exp(-45.*((x+0.4).^2)-60.*((y-0.5).^2));

throws = 10000;
iterations = 100;

I = hitOrMiss(g, throws);
disp(I);

%function I = meanHitOrMiss(g, throws, iterations)
%    I = 0;
%
%    for j = 1:iterations
%        I = I + hitOrMiss(g, throws);
%    end
%
%    I = I/iterations;
%end

function I = hitOrMiss(g, throws)
    count = 0;

    for i = 1:throws
        [x, y, z] = randomThrow();
        zFunc = g(x, y);
        
        if z < zFunc
            count = count + 1;
        end
    end

    I = 4*count/throws;
end

function [x, y, z] = randomThrow()
    x = rand*2 - 1;
    y = rand*2 - 1;
    z = rand;
end