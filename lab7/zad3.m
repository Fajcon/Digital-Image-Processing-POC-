close all;
clearvars;
clc;

image = imread('ferrari.bmp');

SE = strel('square',3);

imageEroded = imerode(image,SE);
imageDilatated = imdilate(image,SE);
diff = imabsdiff(imageEroded,imageDilatated);

figure();
subplot(2,2,1); imshow(image); title('oryginał');
subplot(2,2,2); imshow(imageEroded); title('erozja');
subplot(2,2,3); imshow(imageDilatated); title('dylatacja');
subplot(2,2,4); imshow(diff); title('roznica');

%%
imageOpened = imopen(image,SE);
imageClosed = imclose(image,SE);

figure();
subplot(1,3,1); imshow(image); title('oryginał');
subplot(1,3,2); imshow(imageOpened); title('otwarcie');
subplot(1,3,3); imshow(imageClosed); title('zamknięcie');

%%
imageTopHat = imtophat(image,SE);
imageBottomHat = imbothat(image,SE);

figure();
subplot(1,3,1); imshow(image); title('oryginał');
subplot(1,3,2); imshow(imageTopHat); title('topHat');
subplot(1,3,3); imshow(imageBottomHat); title('bottomHat');

%%
image2 = imread('rice.png');

SE2 = strel('disk',10);
image2tophat = imtophat(image2,SE2);

figure();
subplot(1,2,1); imshow(image2);             title('oryginal');
subplot(1,2,2); imshow(image2tophat);       title('tophat');