clearvars;
close all;
clc;
%%

load('MR_data.mat');

%%
%draw(I_noisefree, 0,6) ;
draw(I_noisy1, 20) ;
draw(I_noisy2, 50) ;
draw(I_noisy3, 8) ;
draw(I_noisy4, 6) ;


function draw(image, sigma)
    figure();
    subplot(1,3,1);
    imshow (image,[]);
    title('oryginał');
    subplot(1,3,2);
    conv = convolution(image,[5 5]);
    imshow(conv,[]);
    title('convoution');
    subplot(1,3,3);
    bil = bilateral(image,[5 5], sigma);
    imshow(bil,[]);
    title('bilateral');
end

%%

function data_filtered = convolution(data, local_window)
    FUNCTION = @(data_, local_window_)convolution_local(data_, local_window_);
    data_filtered = colfilt(data, local_window, 'sliding', FUNCTION, local_window);
end

function data_filtered = convolution_local(data, local_window)
    Nx = size(data,2);
    h = fspecial('gaussian', local_window, 25);
    for i=1:Nx
        %lokalny blok
        patch = reshape(data(:,i),local_window);
        data_filtered(i) = sum(sum(patch .* h)) ;
    end
end

function data_filtered = bilateral(data,local_window, sigma)
    FUNCTION = @(data_,local_window_)bilateral_local(data_,local_window_, sigma);
    data_filtered = colfilt(data,local_window, 'sliding', FUNCTION,local_window);
end

function data_filtered = bilateral_local(data,local_window, sigma)
Nx = size(data,2);
Ncy = ceil(local_window(1)/2);
Ncx = ceil(local_window(2)/2);
h = fspecial('gaussian',local_window,25);
    for i=1:Nx   
        window = reshape(data(:,i),local_window);
    
        [rows, cols] = find(window == window);
        rows = reshape(rows, local_window);
        cols = reshape(cols,local_window);
        dist = sqrt((Ncy - rows).^2 + (Ncx - cols).^2);
        psi = dist .* h;
        abs_val = abs(window - window(Ncy,Ncx));

        gamma = exp((-1)*((abs_val).^2)/(2*(sigma)^2));

        data_filtered(i) = sum(sum(dist .* gamma .* window)) / sum(sum(psi .* gamma));
    end
end
        