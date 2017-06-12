% baslangic temizligi
clear;
clf;

% ornek: http://www.mathworks.com/help/vision/ref/vision.peopledetector-class.html?requestedDomain=www.mathworks.com

resim_algilayici = vision.PeopleDetector;
resim = imread('2.jpg');

[bboxes,scores] = step(resim_algilayici, resim);

res = insertObjectAnnotation(resim,'rectangle',bboxes,scores);
imshow(res);
title('Ýnsan Algýlama ve Cerceve Cizimi');

%res