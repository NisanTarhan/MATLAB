%HOG (Histogram Of Oriented Gradients) algoritmasý
%Renkli ve Gri Resim Üzerinde objelerin kenar eðimleri bulunabilir
clear;
clc;
close all;
%img = imread('peppers.png');
img = imread('cameraman.tif');
[ozellikvektoru, hogGorseli] = extractHOGFeatures(img);
figure;
imshow(img); 
hold on;
plot(hogGorseli);
