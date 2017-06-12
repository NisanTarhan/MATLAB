%HOG (Histogram Of Oriented Gradients) algoritmas�
%Renkli ve Gri Resim �zerinde objelerin kenar e�imleri bulunabilir
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
