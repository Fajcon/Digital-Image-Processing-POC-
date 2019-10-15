clearvars;
close all;
clc;

kolo = boolean(imread('kolo.bmp'));
kwadrat = boolean(imread('kwadrat.bmp'));

figure(1)
imshow(~kolo);

figure(2)
imshow(kolo&kwadrat);

figure(3)
imshow(kolo|kwadrat);

figure(4)
imshow(xor(kolo,kwadrat));