clearvars;
close all;
clc;

lena = imread('lena.bmp');
jet = imread('jet.bmp');

sum = imadd(lena,jet);

figure(1);
imshow(sum);

sum2 = imadd(lena,jet,'uint16');

figure(2);
imshow(sum2, []);

comb = imlincomb(4, lena, 2, jet,'uint16');
figure(3);
imshow(comb, []);

lena16 = int16(lena);
jet16 = int16(jet);
diff = imsubtract(lena16,jet16);
figure(4);
imshow(diff, []);

absdiff = imabsdiff(lena, jet);
figure(5);
imshow(absdiff);

%%
%mnożenie
clearvars;
close all;
clc;

lena = imread('lena.bmp');
jet = imread('jet.bmp');

figure(1);
imshow(immultiply(lena, jet));

figure(2);
imshow(lena*2);

figure(3);
imshow(lena*1/2);

maska = boolean(imread('kolo.bmp'));


figure(4)
imshow(immultiply(lena, maska));

%%
%Negatyw

load funkcjeLUT;
imshow(intlut(lena, odwrotna));

