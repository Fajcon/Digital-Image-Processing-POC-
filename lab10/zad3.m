close all;
clearvars;
clc;

image = imread('shapes.png');

labeled = bwlabel(image,8);

figure;
imshow(labeled)
r = regionprops(labeled, 'Centroid');
for i=1:length(r)
    text(r(i).Centroid(1),r(i).Centroid(2),['\color{magenta}',num2str(i)]);
end
wspolczynniki = obliczWspolczynniki(labeled);

%%
[Y,X] = size(labeled);

for I = 1:Y
    for J = 1:X
        piksel = labeled(I,J);
        if piksel ~= 0 && ~(wspolczynniki(piksel,3) > 4 && wspolczynniki(piksel,3) < 5)
            labeled(I,J) = 0;
        end
    end
end

figure();
subplot(1,2,1); imshow(image,[]);
subplot(1,2,2); imshow(labeled,[]);

%%
close all;
clearvars;
clc;

image = imread('shapesReal.png');

figure;
imshow(image);

image2 = im2bw(image,0.3);

figure;
imshow(image2);

IC = imcomplement(image2);
figure;
imshow(IC)

e = strel('diamond',6);
Ierode = imerode(IC,e);

figure;
imshow(Ierode);

labeled = bwlabel(Ierode,4);

figure;
imshow(labeled);

r = regionprops(labeled, 'Centroid');
for i=1:length(r)
    text(r(i).Centroid(1),r(i).Centroid(2),['\color{magenta}',num2str(i)]);
end
wspolczynniki = obliczWspolczynniki(labeled);

%%
[Y,X] = size(labeled);


for J = 1:Y
    for I = 1:X
        piksel = labeled(J,I);
        if piksel ~= 0 && ~(wspolczynniki(piksel,2) > 0.70 && wspolczynniki(piksel,2) < 0.82)
            labeled(J,I) = 0;
        end
    end
end

figure;
subplot(1,2,1); imshow(image,[]);
subplot(1,2,2); imshow(labeled,[]);