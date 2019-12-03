close all;
clearvars;
clc;

image1 = imread('lab112.png');

figure();
imshow(image1);

%%
image2 = im2bw(image1,0.3);
figure();
imshow(image2);
%%
image3 = imcomplement(image2);
figure();
imshow(image3);
%%
SE = strel('octagon', 15);
image4 = imerode(image3, SE);
figure();
imshow(image4);
%%
image5 = imreconstruct(image4,image3);
figure();
imshow(image5);
%%
result = edge(image5,'Prewitt');
figure();
imshow(result);
%%
figure();
[H,theta,rho] = hough(result,'RhoResolution',1,'ThetaResolution',1);
peaks = houghpeaks(H,13);

imshow(H,[]);
hold on;
plot(peaks(:,2),peaks(:,1),'ro');

%%
figure();

lines = houghlines(result,theta,rho,peaks);
imshow(imread('lab112.png')); 
hold on;

%%przykładowy kod z pomocy houghlines



max_len = 0;
for k = 1:length(lines)
   xy = [lines(k).point1; lines(k).point2];
   plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green'); hold on

   % Plot beginnings and ends of lines
   plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','yellow'); hold on
   plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','red'); hold on

   % Determine the endpoints of the longest line segment
   len = norm(lines(k).point1 - lines(k).point2);
   if ( len > max_len)
      max_len = len;
      xy_long = xy;
   end
end
hold off;
