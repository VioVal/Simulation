clear
clf

numberOfIterations = 200;
rs = 0;
a = 5;

for i = 1:numberOfIterations
    rs = a*((1/(rand^(2/3))) - 1)^-0.5;

    if rs/a < 10
        theta = acos((rand*2) -1);
        phi = rand*2*pi;

        x = rs*sin(theta)*cos(phi);
        y = rs*sin(theta)*sin(phi);
        z = rs*cos(theta);
    end

    scatter3(x, y, z);
    hold on
end