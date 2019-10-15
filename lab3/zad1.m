clearvars;
close all;
clc;

load funkcjeLUT;

image = imread('jet.bmp');

figure('Name','kwadratowa');
LUT(image, kwadratowa);

figure('Name','log');
LUT(image, log);

figure('Name','odwlog');
LUT(image, odwlog);

figure('Name','odwrotna');
LUT(image, odwrotna);

figure('Name','pierwiastkowa');
LUT(image, pierwiastkowa);

figure('Name','pila');
LUT(image, pila);

figure('Name','wykladnicza');
LUT(image, wykladnicza);

