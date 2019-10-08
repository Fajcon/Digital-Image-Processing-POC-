clearvars;
close all;
clc;

image = imread('lena.bmp'); 
I = imresize(image, 0.25);

gray1 = imadjust(image, [0,1], [0, 31/255]);
gray2 = imadjust(image, [0,1], [0, 15/255]);
gray3 = imadjust(image, [0,1], [0, 7/255]);
gray4= imadjust(image, [0,1], [0, 3/255]);
gray5 = imadjust(image, [0,1], [0, 1/255]);

subplot(2,3,1);
imshow(image);

subplot(2,3,2);
imshow(gray1, [])

subplot(2,3,3);
imshow(gray2, [])

subplot(2,3,4);
imshow(gray3, [])

subplot(2,3,5);
imshow(gray4, [])

subplot(2,3,6);
imshow(gray5, [])

