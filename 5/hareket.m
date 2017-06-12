clc;
clear;
A=im2bw(imread('imL.png'));
B=im2bw(imread('imR.png'));
C=B-A;
subplot(1,3,1);imshow(A)
subplot(1,3,2);imshow(B)
subplot(1,3,3);imshow(C)
