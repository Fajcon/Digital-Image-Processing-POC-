close all;
clearvars;
clc;

image = imread('umbrealla.png');
figure();
imshow(image);

image = double(rgb2hsv(image));
imageH = image(:,:,1);
[Y, X] = size(imageH);

%%
global sTh window_min_size segRes MRes index;
sTh = 0.05;
window_min_size = 4;
segRes = zeros(Y,X);
MRes = zeros(Y,X);
index = 0;


%%
split(imageH,1,1,Y,X);

i = 0;

while i < index
    IB = segRes == i;
    if sum(IB(:)) == 0 
       i = i + 1;
       continue;
    end
    [yF, xF] = find(IB,1,'first');
    dilate = imdilate(IB,strel('square',3));
    diff = imabsdiff(dilate,IB);
    mult = diff.* segRes;
    nonZeros = nonzeros(mult);
    uniques = unique(nonZeros);
    joined = 0;
    for k = 1:numel(uniques)
        IBS = segRes == uniques(k);
        [yFS, xFS] = find(IBS,1,'first');        
        color_difference = abs(MRes(yF,xF) - MRes(yFS, xFS));
        if color_difference < (5/255)
            segRes(IBS) = i;
            joined = 1;
        end
    end
    if joined == 0
        i = i+1;
    end
end

U = unique(segRes);
for i = 1:numel(U)
    c = segRes == U(i);
    if sum(c) < 10
        segRes(c) = 0;
    end
end

U = unique(segRes);
for i = 1:numel(U)
    c = segRes == U(i);
    segRes(c) = i;
end


figure();
imshow(label2rgb(segRes));


function split(I,y1,x1,y2,x2)
    global sTh window_min_size segRes MRes index;

    part = I(y1:y2,x1:x2);
    meanH = mean(part(:));
    stdH = std(part(:));
    
    if (y2-y1 <= window_min_size) || (x2-x1 <= window_min_size) || (stdH < sTh) 
        segRes(y1:y2,x1:x2) = index;
        index = index + 1;
        MRes(y1:y2,x1:x2) = meanH;
    else
        polowaX = x1 + floor((x2-x1) / 2);
        polowaY = y1 + floor((y2-y1) / 2);
        split(I,y1,x1,polowaY,polowaX);
        split(I,y1,polowaX,polowaY,x2);
        split(I,polowaY+1,x1,y2,polowaX);
        split(I,polowaY+1,polowaX+1,y2,x2);
    end        
end