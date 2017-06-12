clc;
clear;
A = imread('cameraman.tif');
B = imrotate(A,5,'bicubic','crop');
imshowpair(A,B,'diff');
figure;
imshowpair(A,B,'blend','Scaling','joint');