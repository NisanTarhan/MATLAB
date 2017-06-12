clc;
clear;
I=imread('cameraman.tif');
J=imrotate(I,35,'bilinear');
subplot(1,2,1); imshowpair(I,J);
subplot(1,2,2);imshowpair(I,J,'montage');