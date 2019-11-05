clc;
close all;
clearvars;

figure(1);
obraz = imread("tekstReczny.png");
imshow(obraz);
n = 20;
a = 0.5;

obraz_bw = obraz;
[X, Y] = size(obraz);
z = zeros(1,n);
%%
for i = 1:X
    for j = 1:Y
        m = sum(z)/n;
        for k = 1:n-1
           z(k) = z(k+1); 
        end
        z(20) = obraz(i,j);
        zNew = m + 1/n*(z(20) - z(1));
        if(obraz(i,j)<m)
            obrazBW(i,j) = 0;
        else
            obrazBW(i,j) = 255;
        end
    end
end

figure(2);
imshow(obrazBW);
