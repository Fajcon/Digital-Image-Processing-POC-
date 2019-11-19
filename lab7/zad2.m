close all;
clearvars;
clc;

image = imread('fingerprint.bmp');

image2 = bwmorph(image,'thin');
image3 = bwmorph(image2,'thin');
imageInf = bwmorph(image,'thin',Inf);

figure();
subplot(2,2,1); imshow(image); title('oryginał');
subplot(2,2,2); imshow(image2); title('jednokrotne');
subplot(2,2,3); imshow(image3); title('dwukrotne');
subplot(2,2,4); imshow(imageInf); title('Inf');

%% 
image = imread('kosc.bmp');

image2 = bwmorph(image,'skel',Inf);

figure();
subplot(1,2,1); imshow(image); title('oryginał');
subplot(1,2,2); imshow(image2); title('skel');

%% 
image = imread('text.bmp');

SE = ones(51,1);

image2 = imopen(image,SE);
image3 = imreconstruct(image2,image);

figure();
subplot(1,3,1); imshow(image); title('oryginał');
subplot(1,3,2); imshow(image2); title('imopen');
subplot(1,3,3); imshow(image3); title('imreconstruct');

%% 
image = imread('text.bmp');

figure();
subplot(1,2,1); imshow(image); title('oryginał');
subplot(1,2,2); imshow(imfill(image,'holes')); title('imfill holes');
%% 
image = imread('text.bmp');

figure();
subplot(1,2,1); imshow(image); title('oryginał');
subplot(1,2,2); imshow(imclearborder(image)); title('imclearborder');