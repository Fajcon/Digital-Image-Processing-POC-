close all;
clearvars;
clc;

image = imread('ccl1.png');

[YY,XX] = size(image);
L = 1;
image2 = zeros(YY,XX);

N = 100;
id = zeros(N);
for I = 1:N
    id(I) = I;
end


for I = 2:YY
    for J = 2:XX-1
        if(image(I,J) ~= 0)
            sasiedzi = [image2(I-1,J-1),image2(I-1,J),image2(I-1,J+1),image2(I,J-1)];
            if sum(sasiedzi) == 0 
                image2(I,J) = L;
                L = L+1;
            else
                sasiedzi2 = nonzeros(sasiedzi);
                minimum = min(sasiedzi2);
                maximum = max(sasiedzi2);

                if(minimum == maximum)
                    image2(I,J) = maximum;
                else
                    id = union(minimum,maximum,id);
                    image2(I,J) = minimum;
                end
            end 
        end
     end
end

figure(1);
subplot(1,2,1); imshow(image);
subplot(1,2,2); imshow(label2rgb(image2),[]);
%%

lut = zeros(N);
for I = 1:N
   lut(I) = root(id(I),id); 
end

image3 = zeros(YY, XX);

for J = 1:YY
    for I = 1:XX
        if (image2(J,I) ~= 0)
           image3(J,I) = lut(image2(J,I)); 
        end
    end
end

figure
imshow(label2rgb(image3),[]);


function root_indeks = root(indeks,tablica)
    root_indeks = indeks;
    while tablica(root_indeks) ~= root_indeks
        root_indeks = tablica(root_indeks);
    end
end


function nTablica = union(p,q,tablica)
    nTablica = tablica;
    nTablica(root(p,tablica)) = root(q,tablica);
end