%Harris köþe bulma algoritmasý
%Eigen metodu kullanýlarak
clear;
clc;
close all;
%I = checkerboard;
I = imread('cameraman.tif');
koseler = detectMinEigenFeatures(I);
imshow(I); 
hold on;
plot(koseler.selectStrongest(50));