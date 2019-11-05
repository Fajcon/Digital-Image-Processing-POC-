clearvars;
close all;
clc;

moon = imread("moon.bmp");

M = [0 1 0; 1 -4 1; 0 1 0];

M = M/9;

moon_laplacian = uint8(conv2(moon, M, 'same'));

moon_norm1 = moon_laplacian + 128;
moon_norm2 = abs(moon_laplacian);

figure();
subplot(2, 2, 1);
imshow(moon_norm1, []);
subplot(2, 2, 2);
imshow(moon_norm2, []);
subplot(2, 2, 3);
imshow(moon_norm1 + moon, []);
subplot(2, 2, 4);
imshow(moon_norm2 + moon, []);

%%

laplacianFilter = fspecial('laplacian');
moon_laplacian = uint8(conv2(moon, laplacianFilter, 'same'));

moon_norm1 = moon_laplacian + 128;
moon_norm2 = abs(moon_laplacian);

figure();
subplot(2, 2, 1);
imshow(moon_norm1, []);
subplot(2, 2, 2);
imshow(moon_norm2, []);
subplot(2, 2, 3);
imshow(moon_norm1 + moon, []);
subplot(2, 2, 4);
imshow(moon_norm2 + moon, []);

