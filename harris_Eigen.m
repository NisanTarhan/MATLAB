%Harris k��e bulma algoritmas�
%Eigen metodu kullan�larak
clear;
clc;
close all;
%I = checkerboard;
I = imread('cameraman.tif');
koseler = detectMinEigenFeatures(I);
imshow(I); 
hold on;
plot(koseler.selectStrongest(50));