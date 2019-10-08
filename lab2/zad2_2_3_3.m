clearvars;
close all;
clc;

image = imread('parrot.bmp'); 
figure();
imshow(image);

imagex2 = imresize(image, 6, 'bicubic'); 
figure();
imshow(imagex2);

imagex1_3 = imresize(image, 6.3, 'bicubic'); 
figure();
imshow(imagex1_3);

image = imread('chessboard.bmp'); 
figure();
imshow(image);

imagex2 = imresize(image, 6, 'bicubic'); 
figure();
imshow(imagex2);

imagex1_3 = imresize(image, 6.3, 'bicubic'); 
figure();
imshow(imagex1_3);

image = imread('clock.bmp'); 
figure();
imshow(image);

imagex2 = imresize(image, 6, 'bicubic'); 
figure();
imshow(imagex2);

imagex1_3 = imresize(image, 6.3, 'bicubic'); 
figure();
imshow(imagex1_3);