clc;
clear;
I2 = imread('peppers.png');  
%detectFASTFeatures komutu FAST algoritmas�n� kullanarak k��e olabilecek
%noktalar�n bulunmas�n� sa�lar.
Koseler   = detectFASTFeatures(rgb2gray(I2));
%selectStrongest komutu birbirirlerine en yak�n olan ve belirtilen say�da
%k��enin tespit edilmesi ve etraf�n�n �izilmesini sa�lar.
bulunan = selectStrongest(Koseler,3); %3 adet i�aretlensin
[hog2, gecerlinoktalar, hogGorseli] = extractHOGFeatures(I2,bulunan);
figure;
imshow(I2); 
hold on;
plot(hogGorseli,'Color','green');