%Negatifi alýnmýþ görüntü üzerinde
clc;
clear;
I = imread('cameraman.tif'); 
% Cameraman.tif resim matrisi I deðiþkenine kaydedilir.
A = imcomplement(I); % Resmin negatifi alýnýr.
C = corner(A,'Harris'); 
% Harris Corner köþe bulma methodu uygulanýr.
figure(),imshow(A); % Negatif resim gösterilir.
hold on; plot(C(:,1), C(:,2), 'r*'); 
% Negatif resimde bulunan köþeler kýrmýzý olarak çizdirilir.
C1 = corner(I,'Harris'); 
% Orjinal resimde ayný þekilde köþeler bulunur.
figure(),imshow(I); % Orjinal resim gösterilir.
hold on; plot(C1(:,1), C1(:,2), 'r*'); 
% Orjinal resimdeki köþeler kýrmýzý olarak çizdirilir.
