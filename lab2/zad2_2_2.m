 
for ii = 0:nYY-1
    for jj = 0:nXX-1
        x1 = floor(jj * xStep);
        y1 = floor(ii * yStep);    
        y2 = y1 +1;
        x2 = x1 +1;
       
        xn = rem(ii,1);
        yn  = rem(jj,1);
        if(x2 > XX-1)
            x2 = XX -1;
        end
       
        if(y2 > YY-1)
            y2 = YY-1;
        end
 
         
        fa = double(I(y1+1,x1+1));
        fb = double(I(y1+1,x2+1));
        fc = double(I(y2+1,x2+1));
        fd = double(I(y2+1,x1+1));
         
        nI(ii+1, jj+1) = [1-xn xn] *[fa fd; fb fc]* [1-yn; yn];
    end
end
 
figure(3);
imshow(uint8(nI));