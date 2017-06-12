clear;
clc;
close all;
%I = checkerboard(40,2,2);
I = imread('cameraman.tif');
C = corner(I,10);
%C = corner(I,5); % 5 adet köþe belirle
subplot(1,2,1);
imshow(I);
hold on
plot(C(:,1), C(:,2), '+', 'Color', 'r')
hold off
