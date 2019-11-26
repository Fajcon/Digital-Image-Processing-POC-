clearvars;
close all;
clc;

image = imread('kwadraty.png');
krawedzie = edge(image,'canny');

figure();
subplot(1,2,1); imshow(image);
subplot(1,2,2); imshow(krawedzie);

[H,theta,rho] = hough(krawedzie,'RhoResolution',1,'ThetaResolution',1);

figure();
imshow(H,[]);

%%
peaks = houghpeaks(H,8);

figure
imshow(H,[]);
hold on;
plot(peaks(:,2),peaks(:,1),'o');
hold off;

%%
lines = houghlines(krawedzie,theta,rho,peaks, 'FillGap',5,'MinLength',7);
figure, imshow(image), hold on
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