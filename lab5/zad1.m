clearvars;
close all;
clc;

img = imread("plansza.bmp");

%%

avg = uint8(conv2(img, fspecial('average'), 'same'));

figure();
subplot(1, 3, 1);
imshow(img);
subplot(1, 3, 2);
imshow(avg);
subplot(1, 3, 3);
imshow(imabsdiff(img, avg),[]);

%%

figure();
subplot(2, 3, 1);
imshow(img);
subplot(2, 3, 2);
imshow(uint8(conv2(img, fspecial('average', 3), 'same')));
subplot(2, 3, 3);
imshow(uint8(conv2(img, fspecial('average', 5), 'same')));
subplot(2, 3, 4);
imshow(uint8(conv2(img, fspecial('average', 9), 'same')));
subplot(2, 3, 5);
imshow(uint8(conv2(img, fspecial('average', 15), 'same')));
subplot(2, 3, 6);
imshow(uint8(conv2(img, fspecial('average', 35), 'same')));

%% 

img2 = imread("lena.bmp");
figure();
subplot(2, 3, 1);
imshow(img2);
subplot(2, 3, 2);
imshow(uint8(conv2(img2, fspecial('average', 3), 'same')));
subplot(2, 3, 3);
imshow(uint8(conv2(img2, fspecial('average', 5), 'same')));
subplot(2, 3, 4);
imshow(uint8(conv2(img2, fspecial('average', 9), 'same')));
subplot(2, 3, 5);
imshow(uint8(conv2(img2, fspecial('average', 15), 'same')));
subplot(2, 3, 6);
imshow(uint8(conv2(img2, fspecial('average', 35), 'same')));

%%

M = [1 2 1; 2 4 2; 1 2 1];

M = M/sum(sum(M));

img_mask = uint8(conv2(img, M, 'same'));

figure();
subplot(1, 3, 1);
imshow(img);
subplot(1, 3, 2);
imshow(img_mask);
subplot(1, 3, 3);
imshow(imabsdiff(img, img_mask),[]);

%%


gaus05 = fspecial('gaussian', 5, 0.5);
gaus09 = fspecial('gaussian', 5, 0.9);
gaus12 = fspecial('gaussian', 5, 1.2);

figure();
subplot(1, 3, 1)
mesh(gaus05);
subplot(1, 3, 2)
mesh(gaus09);
subplot(1, 3, 3)
mesh(gaus12);
%%

figure();
subplot(2, 2, 1);
imshow(img);
subplot(2, 2, 2);
imshow(uint8(conv2(img, gaus05, 'same')));
subplot(2, 2, 3);
imshow(uint8(conv2(img, gaus09, 'same')));
subplot(2, 2, 4);
imshow(uint8(conv2(img, gaus12, 'same')));