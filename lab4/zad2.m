clearvars;
close all;
clc;

obraz = imread("rice.png");

obrazBW = obraz;
[X, Y] = size(obraz);

W2 = 8;
for i = 1:X
    for j = 1:Y
        m = meanLT(i,j,W2,obraz,X,Y);
        if(obraz(i,j)<m)
            obrazBW(i,j) = 0;
        else
            obrazBW(i,j) = 255;
        end
    end
end
 
figure(1);
subplot(1,2,1);
imshow(obraz);
title('Oryginał');
 
subplot(1,2,2);
imshow(obrazBW);
title('Binaryzacja lokalna');

%%
obraz = imread("katalog.bmp");

obraz_bw = obraz;
window_size = 12;
[X, Y] = size(obraz);

W2 = 8;
for i = 1:X
    for j = 1:Y
        m = meanLT(i,j,W2,obraz,X,Y);
        if(obraz(i,j)<m)
            obrazBW(i,j) = 0;
        else
            obrazBW(i,j) = 255;
        end
    end
end
 
figure(1);
subplot(1,2,1);
imshow(obraz);
title('Oryginał');
 
subplot(1,2,2);
imshow(obrazBW);
title('Binaryzacja lokalna');
%%
obraz = imread("rice.png");
R=128;
k=0.15;
obrazBW = obraz;
 
for i = 1:X
    for j = 1:Y
        m = meanLT(i,j,W2,obraz,X,Y);
        odchStd = stddevLT(i,j,W2,obraz,m,X,Y);
        T = m*(1-k*(odchStd/R-1));
        if(obraz(i,j)<T)
            obrazBW(i,j) = 0;
        else
            obrazBW(i,j) = 255;
        end
    end
end
 
imshow(obrazBW);
title('Binearyzacja Sauvoli');
%%
obraz = imread("katalog.bmp");
R=128;
k=0.15;
obrazBW = obraz;
 
for i = 1:X
    for j = 1:Y
        m = meanLT(i,j,W2,obraz,X,Y);
        odchStd = stddevLT(i,j,W2,obraz,m,X,Y);
        T = m*(1+k*(odchStd/R-1));
        if(obraz(i,j)<T)
            obrazBW(i,j) = 0;
        else
            obrazBW(i,j) = 255;
        end
    end
end
 
imshow(obrazBW);
title('Binearyzacja Sauvoli');