close all;
clearvars;
clc;

image = imread('ccl2.png');
image2 = bwlabel(image,4);
image3 = bwlabel(image,8);

figure();
subplot(1,3,1); imshow(image,[]);
subplot(1,3,2); imshow(image2,[]);
subplot(1,3,3); imshow(image3,[]);