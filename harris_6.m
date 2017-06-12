%Negatifi al�nm�� g�r�nt� �zerinde
clc;
clear;
I = imread('cameraman.tif'); 
% Cameraman.tif resim matrisi I de�i�kenine kaydedilir.
A = imcomplement(I); % Resmin negatifi al�n�r.
C = corner(A,'Harris'); 
% Harris Corner k��e bulma methodu uygulan�r.
figure(),imshow(A); % Negatif resim g�sterilir.
hold on; plot(C(:,1), C(:,2), 'r*'); 
% Negatif resimde bulunan k��eler k�rm�z� olarak �izdirilir.
C1 = corner(I,'Harris'); 
% Orjinal resimde ayn� �ekilde k��eler bulunur.
figure(),imshow(I); % Orjinal resim g�sterilir.
hold on; plot(C1(:,1), C1(:,2), 'r*'); 
% Orjinal resimdeki k��eler k�rm�z� olarak �izdirilir.
