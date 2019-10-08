%%
%1. info
clearvars;
close all;

info1 = imfinfo('lena.bmp');
info2 = imfinfo('lena.jpg');
%%
%6. wczytanie i wyświetlanie
lena_bmp = imread('lena.bmp');
lena_jpg = imread('lena.jpg');

figure
imshow(lena_bmp);
figure
imshow(lena_jpg);

%%
%7. konwersja do grey
lena_bmp_grey = rgb2gray(lena_bmp);
lena_jpg_grey = rgb2gray(lena_jpg);

figure
imshow(lena_bmp_grey);

%%
%8. zapisywanie
imwrite(lena_bmp_grey, 'lena_gray.bmp');

%%
%9. 
figure
colormap gray;
mesh(lena_bmp_grey);

%%
%9. przekrój
figure
plot(lena_bmp_grey(10,:));
figure
plot(lena_bmp_grey(:,10));
