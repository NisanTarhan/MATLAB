clc;
clear;
I2 = imread('peppers.png');  
%detectFASTFeatures komutu FAST algoritmasýný kullanarak köþe olabilecek
%noktalarýn bulunmasýný saðlar.
Koseler   = detectFASTFeatures(rgb2gray(I2));
%selectStrongest komutu birbirirlerine en yakýn olan ve belirtilen sayýda
%köþenin tespit edilmesi ve etrafýnýn çizilmesini saðlar.
bulunan = selectStrongest(Koseler,3); %3 adet iþaretlensin
[hog2, gecerlinoktalar, hogGorseli] = extractHOGFeatures(I2,bulunan);
figure;
imshow(I2); 
hold on;
plot(hogGorseli,'Color','green');