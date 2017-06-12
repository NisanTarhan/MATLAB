clc;
clear;
I = checkerboard(50,2,2); % Bir satranç tahtasý oluþturur.
C = corner(I,'Harris'); 
% Harris corner yöntemiyle köþeler belirlenir.
imshow(I); % Orjinal resim gösterilir. / Satranç tahtasý.
hold on; plot(C(:,1), C(:,2), 'r*'); 
% Kýrmýzý olarak köþeler gösterilir.
