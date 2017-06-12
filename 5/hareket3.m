clc;
clear;
A = imread('cameraman.tif');
B = imrotate(A,5,'bicubic','crop');
C=A-B;
imshow(C)