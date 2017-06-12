clc;
clear;
I = imread('circuit.tif'); % Devre resmi I de�i�kenine kaydedilir. Siyah beyaz resim.
imshow(I); % I resmi g�sterilir.
BW1 = edge(I,'prewitt'); 
% Prewitt y�ntemiyle kenarlar bulunur.
figure(),imshow(BW1); % Bulunan kenarlar g�sterilir.
C = corner(BW1,'Harris'); % Elde edilen kenarlardan Harris Corner y�ntemiyle k��eler bulunur.
figure(),imshow(BW1); % Bulunan k��eler g�sterilir.
hold on; plot(C(:,1), C(:,2), 'r*'); 
% K��eleri k�rm�z� olarak �izdirir.
C1 = corner(I,'Harris'); 
% Orjinal resimde i�lem yap�lmadan bulunan k��eler.
figure(),imshow(I); % Orjinal resmi g�sterir.
hold on; plot(C1(:,1), C1(:,2), 'g*'); 
% K��eleri ye�il olarak �izer. Orjinal resimde i�lem yap�lmadan bulunan k��eleri g�sterir.
