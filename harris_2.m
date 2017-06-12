clc;
clear;
I = imread('cameraman.tif'); 
% Cameraman.tif resim matrisi I de�i�kenine kaydedilir.
C = corner(I,'Harris'); % Harris y�ntemi ile k��eler bulunur.
%C = corner(I,'Harris',5); % Harris y�ntemi ile N adet k��eler bulunur.
imshow(I); % Resim g�sterilir
hold on; plot(C(:,1), C(:,2), 'r*'); 
% Bulunan k��eler k�rm�z� olarak �izdirilir.
