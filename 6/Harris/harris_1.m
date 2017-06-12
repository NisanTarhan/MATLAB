clc;
clear;
I = checkerboard; % Bir satranç tahtasý oluþturur.
corners = detectHarrisFeatures(I); % Köþelerin belirlenmesi
imshow(I); 
hold on; % Resim Gösterme
plot(corners.selectStrongest(50)); 
% Bulunan köþeleri çizdirmek / Sayý arttýkça gösterilen köþe de artar.
