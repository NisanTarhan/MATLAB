clc;
clear;
I = checkerboard(50,2,2); % Bir satran� tahtas� olu�turur.
C = corner(I,'Harris'); 
% Harris corner y�ntemiyle k��eler belirlenir.
imshow(I); % Orjinal resim g�sterilir. / Satran� tahtas�.
hold on; plot(C(:,1), C(:,2), 'r*'); 
% K�rm�z� olarak k��eler g�sterilir.
