clc;
close all;
clearvars;

obraz = imread("bart.bmp");
figure();
subplot(1, 3, 1);
imshow(obraz);
subplot(1, 3, 2);
imhist(obraz);
progDolny = 188;
progGorny = 208;

obrazBW = obraz > progDolny & obraz < progGorny;

subplot(1, 3, 3);
imshow(obrazBW);