clc;
clear;
I = checkerboard; % Bir satran� tahtas� olu�turur.
corners = detectHarrisFeatures(I); % K��elerin belirlenmesi
imshow(I); 
hold on; % Resim G�sterme
plot(corners.selectStrongest(50)); 
% Bulunan k��eleri �izdirmek / Say� artt�k�a g�sterilen k��e de artar.
