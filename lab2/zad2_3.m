clearvars;
close all;
clc;

image = imread('lena.bmp');
figure(1);
imshow(image);

hImage = imresize(image, 0.5);
figure(2);
imshow(hImage,'InitialMagnification',200);

qImage = imresize(image, 0.25);
figure(3);
imshow(qImage,'InitialMagnification',400);

wImage = imresize(image, 0.125);
figure(4);
imshow(qImage,'InitialMagnification',800);