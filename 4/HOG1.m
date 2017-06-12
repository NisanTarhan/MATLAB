clc;
clear;
I2 = imread('peppers.png');    
Koseler   = detectFASTFeatures(rgb2gray(I2));
strongest = selectStrongest(Koseler,3);
[hog2, validPoints, ptVis] = extractHOGFeatures(I2,strongest);
figure;
imshow(I2); hold on;
plot(ptVis,'Color','green');