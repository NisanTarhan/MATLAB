clc;
clear;
I = imread('cameraman.tif'); 
% Cameraman.tif resim matrisi I deðiþkenine kaydedilir.
C = corner(I,'Harris'); % Harris yöntemi ile köþeler bulunur.
%C = corner(I,'Harris',5); % Harris yöntemi ile N adet köþeler bulunur.
imshow(I); % Resim gösterilir
hold on; plot(C(:,1), C(:,2), 'r*'); 
% Bulunan köþeler kýrmýzý olarak çizdirilir.
