clc;
clear;
rgb = imread('pears.png');

I = rgb2gray(rgb);

%Kenarlar� belirlenmi� g�r�nt� elde ediliyor. Fakat edge ile de�il bir
%filtre gibi �al��t�r�lmaktad�r.
hy = fspecial('sobel');
hx = hy'; %%filtre matrisleri elde edildi
Iy = imfilter(double(I), hy, 'replicate');
Ix = imfilter(double(I), hx, 'replicate');
egim = sqrt(Ix.^2 + Iy.^2);

%�zellik noktas� olabilecek noktalar bulunur ve i�aretlenir.
L = watershed(egim);
Lrgb = label2rgb(L);

se = strel('disk', 20);
Io = imopen(I, se);

%g�r�nt�y� a��nd�rma i�lemi
Ie = imerode(I, se);
% imreconstruct, �kili veya gri tonlu resmi yeniden yap�land�rmak i�in kullan�l�r.
Iobr = imreconstruct(Ie, I);

%Kapama i�lemi
Ioc = imclose(Io, se);

%yayma i�lemi
Iobrd = imdilate(Iobr, se);
Iobrcbr = imreconstruct(imcomplement(Iobrd), imcomplement(Iobr));
Iobrcbr = imcomplement(Iobrcbr);

%�kili veya gri tondaki resimde b�lgesel maksimum noktalar� bulur buralar 1 olup di�er yerleri s�f�rlar.
fgm = imregionalmax(Iobrcbr);

I2 = I;
I2(fgm) = 255;

se2 = strel(ones(5,5));
fgm2 = imclose(fgm, se2);
fgm3 = imerode(fgm2, se2);

%beareaopen ile 20 pixelden daha az say�da pixele sahip olan nesneler kald�r�l�yor.
fgm4 = bwareaopen(fgm3, 20);
I3 = I;
I3(fgm4) = 255;

bw = im2bw(Iobrcbr, graythresh(Iobrcbr));

%Binary g�r�nt� �zerindeki nesneler aras�ndaki mesafeler
D = bwdist(bw);
DL = watershed(D);
bgm = DL == 0;

%Modifiye edilmi� g�r�nt�de watershed b�lgeleri aras�nda minimum olanlar�
%bulur
egim2 = imimposemin(egim, bgm | fgm4);
L = watershed(egim2);

I4 = I;
I4(imdilate(L == 0, ones(3, 3)) | bgm | fgm4) = 255;

Lrgb = label2rgb(L, 'jet', 'w', 'shuffle');


subplot(3,5,1);imshow(I); title('Orjinal G�r�nt�');
subplot(3,5,2);imshow(egim,[]); title('E�ime g�re kenarlar� elde edilmi� g�r�nt�');
subplot(3,5,3);imshow(Lrgb); title('Watershed transform');
subplot(3,5,4);imshow(Io); title('G�r�nt�y� a�ma i�lemi');
subplot(3,5,5);imshow(Iobr); title('yeniden in�a edilmi� g�r�nt�');
subplot(3,5,6);imshow(Ioc); title('Kapal� g�r�nt�');
subplot(3,5,7);imshow(Iobrcbr); title('Yay�lm�� g�r�nt�n�n yeniden in�a edilmesi');
subplot(3,5,8);imshow(fgm); title('Maksimum olan noktalar');
subplot(3,5,9);imshow(I2); title('Regional maxima superimposed on original image (I2)');
subplot(3,5,10);imshow(I3);title('Modifiye edilmi� g�r�nt�');
subplot(3,5,11);imshow(bw); title('Yay�lm�� g�r�nt�n�n binary hali');
subplot(3,5,12);imshow(bgm); title('Watershed �izgileri');
subplot(3,5,13);imshow(I4);title('Etraf� �izilmi� objeler');
subplot(3,5,14);imshow(Lrgb);title('Renklendirilmi� watershed matrisi');


