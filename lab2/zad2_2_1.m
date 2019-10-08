clearvars;
close all;
clc;

%image = 'parrot.bmp';
%image = 'chessboard.bmp';
image = 'clock.bmp';

I = imread(image);
figure(1);
imshow(I);

xReScale = 5;
yReScale = 5;

[YY,XX] = size(I);

nYY = floor(YY * yReScale);

nXX = floor(XX * xReScale);

nI = uint8(zeros(nYY,nXX));

xStep = XX/nXX;
yStep = YY/nYY;

for ii = 0:1:nYY-1
    for jj = 0:1:nXX - 1
        i = round(ii * yStep);
        j = round(jj * xStep);
        
        if(i > YY - 1)
            i = YY - 1;
        end
        
        if( j > XX -1)
            j = XX -1;        
        end        
   
        nI(ii + 1, jj + 1) = I(i + 1, j + 1);
        
    end
end

figure(2);
imshow(nI);