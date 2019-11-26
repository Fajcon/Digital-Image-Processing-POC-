close all;
clearvars;
clc;

image = imread('ertka.bmp');

SEsquare = strel('square', 3);
SEdiamond = strel('diamond', 3);
SEoctagon = strel('octagon', 3);

image1 = imerode(image,SEsquare);
image2 = imerode(image1,SEsquare);
image3 = imerode(image2,SEsquare);

figure();
subplot(2,2,1); imshow(image); title('oryginał');
subplot(2,2,2); imshow(image1); title('erozja');
subplot(2,2,3); imshow(image2); title('2x erozja');
subplot(2,2,4); imshow(image3); title('3x erozja');

%%
image1 = imerode(image,SEdiamond);
image2 = imerode(image1,SEdiamond);
image3 = imerode(image2,SEdiamond);

figure();
subplot(2,2,1); imshow(image); title('oryginał');
subplot(2,2,2); imshow(image1); title('erozja');
subplot(2,2,3); imshow(image2); title('2x erozja');
subplot(2,2,4); imshow(image3); title('3x erozja');

%%

image1 = imerode(image,SEoctagon);
image2 = imerode(image1,SEoctagon);
image3 = imerode(image2,SEoctagon);

figure();
subplot(2,2,1); imshow(image); title('oryginał');
subplot(2,2,2); imshow(image1); title('erozja');
subplot(2,2,3); imshow(image2); title('2x erozja');
subplot(2,2,4); imshow(image3); title('3x erozja');

%% usuwa wlosy lewoskosne
image = imread('buzka.bmp');
SE = strel('arbitrary',[1 0 ; 0 1]);
SE2 = strel('arbitrary',[ 0 1;1 0]);
imageEroded = imerode(image,SE);
imageEroded2 = imerode(image,SE2);

figure();
subplot(1,3,1); imshow(image);          title('oryginał');
subplot(1,3,2); imshow(imageEroded);    title('bez wlosow prawych');
subplot(1,3,3); imshow(imageEroded2);    title('bez wlosow lewych');


%% 
image = imread('ertka.bmp');

SE = strel('square',3);

imageDilatated = imdilate(image,SE);

figure();
subplot(1,2,1); imshow(image); title('oryginał');
subplot(1,2,2); imshow(imageDilatated); title('dylatacja');

%%
%image = imread('ertka.bmp');
%image = imread('wyspa.bmp');
image = imread('kolka.bmp');

SE = strel('square',3);

figure();
subplot(2,3,1); imshow(image); title('oryginał');
subplot(2,3,2); imshow(imerode(image,SE)); title('erozja');
subplot(2,3,3); imshow(imdilate(image,SE)); title('dylatacja');
subplot(2,3,4); imshow(imopen(image,SE)); title('otwarcie');
subplot(2,3,5); imshow(imclose(image,SE)); title('zamknięcie');

%%
image = imread('ertka.bmp');

SE = strel('square',3);
image = imclose(image,SE);
image = imopen(image,SE);

figure(5);
imshow(image);

%%
image = imread('hom.bmp');

SE1 = [0 1 0; 1 1 1; 0 1 0];
SE2 = [1 0 1; 0 0 0; 1 0 1];

figure();
subplot(1,2,1); imshow(image); title('oryginał');
subplot(1,2,2); imshow(bwhitmiss(image,SE1,SE2)); title('trafi, nie trafi');

