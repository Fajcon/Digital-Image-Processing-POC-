clearvars;
close all;
clc;

coins = imread("coins.png");
figure();
subplot(1, 2, 1);
imshow(coins);
subplot(1, 2, 2);
imhist(coins);
%%
coinsbw = im2bw(coins, 82/255);
figure();
imshow(coinsbw);
%%
figura = imread("figura.png");
figure();
subplot(1, 2, 1);
imshow(figura);
subplot(1, 2, 2);
imhist(figura);
%%
figura2 = imread("figura2.png");
figure();
subplot(1, 2, 1);
imshow(figura2);
subplot(1, 2, 2);
imhist(figura2);
%%
figura3 = imread("figura3.png");
figure();
subplot(1, 2, 1);
imshow(figura3);
subplot(1, 2, 2);
imhist(figura3);
%%
figura4 = imread("figura4.png");
figure();
subplot(1, 2, 1);
imshow(figura4);
subplot(1, 2, 2);
imhist(figura4);
%%
coinsgray = im2bw(coins, graythresh(coins));
coinsKittler = im2bw(coins, clusterKittler(coins)/255);
coinsYen = im2bw(coins, entropyYen(coins)/255);
%%
img = imread("coins.png");
prog = 82;
figure();
subplot(3, 2, 1);
imshow(img);
title("oryginał");

subplot(3, 2, 2);
imhist(img);
title("histogram");

subplot(3, 2, 3);
imshow(im2bw(img, prog/255));
title("reczny, p= "+num2str(prog));

subplot(3, 2, 4);
prog = graythresh(img);
imshow(im2bw(img, prog));
title("Osu, p= "+num2str(prog*255));
    
subplot(3, 2, 5);
prog = clusterKittler(img)
imshow(im2bw(img, prog/255));
title("Kittler, p= "+num2str(prog));

subplot(3, 2, 6);
prog = entropyYen(img);
imshow(im2bw(img, prog/255));
title("Yen, p= "+num2str(prog));