close all;
clearvars;
clc;

image1 = imread('lab112.png');

figure();
imshow(image1);

%%
image2 = im2bw(image1,0.4);
figure();
imshow(image2);
%%
image3 = imcomplement(image2);
figure();
imshow(image3);
%%
SEsquare = strel('square', 10);
image4 = imerode(image3, SEsquare);
figure();
imshow(image4);
%%
image = imcomplement(image);

subplot(1,3,2); imshow(image);

image = edge(image,'canny', 0.8, 0.01);

subplot(1,3,3); imshow(image);

%%
figure();
[H,theta,rho] = hough(image,'RhoResolution',1,'ThetaResolution',1);
peaks = houghpeaks(H,13);



imshow(H,[]);
hold on;
plot(peaks(:,2),peaks(:,1),'ro');

%%
figure();

lines = houghlines(image,theta,rho,peaks);
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