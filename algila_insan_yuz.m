% on temizlik
clear;
clf;

resim = imread('4.jpg');
%cascade metotlar�

yuzAlgilayici = vision.CascadeObjectDetector;%y�z alg�lama
%yuzAlgilayici = vision.CascadeObjectDetector('Nose'); %Burun alg�lama
%yuzAlgilayici = vision.CascadeObjectDetector('UpperBody'); %G�vde ve �st�
%yuzAlgilayici = vision.CascadeObjectDetector('EyePairBig');%G�zler
%yuzAlgilayici = vision.CascadeObjectDetector('LeftEye');%Sol G�z
%yuzAlgilayici = vision.CascadeObjectDetector('RightEye');%Sa� G�z
%yuzAlgilayici = vision.CascadeObjectDetector('Mouth');%A��z
kutucuklar = step(yuzAlgilayici, resim);

res = insertObjectAnnotation(resim,'rectangle',kutucuklar,'bulunan');
imshow(res);

