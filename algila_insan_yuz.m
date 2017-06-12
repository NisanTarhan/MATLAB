% on temizlik
clear;
clf;

resim = imread('4.jpg');
%cascade metotlarý

yuzAlgilayici = vision.CascadeObjectDetector;%yüz algýlama
%yuzAlgilayici = vision.CascadeObjectDetector('Nose'); %Burun algýlama
%yuzAlgilayici = vision.CascadeObjectDetector('UpperBody'); %Gövde ve üstü
%yuzAlgilayici = vision.CascadeObjectDetector('EyePairBig');%Gözler
%yuzAlgilayici = vision.CascadeObjectDetector('LeftEye');%Sol Göz
%yuzAlgilayici = vision.CascadeObjectDetector('RightEye');%Sað Göz
%yuzAlgilayici = vision.CascadeObjectDetector('Mouth');%Aðýz
kutucuklar = step(yuzAlgilayici, resim);

res = insertObjectAnnotation(resim,'rectangle',kutucuklar,'bulunan');
imshow(res);

