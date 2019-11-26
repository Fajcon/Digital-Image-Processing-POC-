close all;
clearvars;
clc;

image1 = imread('lab112.png');

figure();
imshow(image1);

%%
image2 = im2bw(image1,0.4);
figure();
imshow(image2);
%%
image3 = imcomplement(image2);
figure();
imshow(image3);
%%
SEsquare = strel('square', 10);
image4 = imerode(image3, SEsquare);
figure();
imshow(image4);