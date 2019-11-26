close all;
clearvars;
clc;


image = imread('dom.png');
krawedzie = edge(image,'log');
krawedzieRecznie = edge(image, 'log', 27, 0.1);

figure();
subplot(1,3,1); imshow(image); title('oryginal');
subplot(1,3,2); imshow(krawedzie); title('LoG');
subplot(1,3,3); imshow(krawedzieRecznie); title('LoG ręczne parametry');

%%
T1T2 = [0.3 0.4];
sigma = 0.07;
krawedzie = edge(image,'Canny');
krawedzieRecznie = edge(image,'canny',T1T2,sigma);


figure();
subplot(1,3,1); imshow(image); title('oryginal');
subplot(1,3,2); imshow(krawedzie); title('Canny');
subplot(1,3,3); imshow(krawedzieRecznie); title('Canny ręczne parametry');

%%
tresh = 0.15;
krawedzie = edge(image,'sobel');
krawedzieRecznie = edge(image,'sobel',tresh);

figure();
subplot(1,3,1); imshow(image); title('oryginal');
subplot(1,3,2); imshow(krawedzie); title('Sobel');
subplot(1,3,3); imshow(krawedzieRecznie); title('Sobel ręczne parametry');