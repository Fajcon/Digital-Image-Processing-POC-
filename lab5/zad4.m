clear;
clc;
close all;

load('maskiPP.mat');

image = imread('kw.bmp');
imshow(image);
conv(image, R1);
conv(image, R2);
conv(image, P1);
conv(image, P2);
conv(image, S1);
conv(image, S2);

%% 
OW = sqrt((conv2(image, S1, 'same')).^2 + (conv2(image, S2, 'same')).^2);

OW2 = abs((conv2(image, S1, 'same'))) + abs((conv2(image, S2, 'same')));

figure;
imshow(OW);

figure;
imshow(OW2);

%% 
image = imread('jet.bmp');

imshow(image);
conv(image, R1);
conv(image, R2);
conv(image, P1);
conv(image, P2);
conv(image, S1);
conv(image, S2);

%% 
OW = sqrt((conv2(image, S1, 'same')).^2 + (conv2(image, S2, 'same')).^2);

OW2 = abs((conv2(image, S1, 'same')).^2) + abs((conv2(image, S2, 'same')).^2);

figure;
imshow(OW, []);

figure;
imshow(OW2, []);



function conv(image, x)
    image_conv = uint8(conv2(image, x, 'same'));

    image_norm1 = image_conv + 128;
    image_norm2 = abs(image_conv);

    figure();
    subplot(2, 2, 1);
    imshow(image_norm1, []);
    title('image + 128');
    subplot(2, 2, 2);
    imshow(image_norm2, []);
    title('image abs');
    subplot(2, 2, 3);
    imshow(image_norm1 + image, []);
    subplot(2, 2, 4);
    imshow(image_norm2 + image, []);
end
