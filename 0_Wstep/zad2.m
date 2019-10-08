close all;
clear all;

lena_gray_bmp = imread('lena_gray.bmp');

[lena_gray_ind, lena_map]= gray2ind(lena_gray_bmp, 256);


figure(1)
imshow(lena_gray_ind,lena_map);


figure(2)
imshow(lena_gray_ind,lena_map);
colormap(summer);