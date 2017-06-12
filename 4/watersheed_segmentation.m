clc;
clear;
rgb = imread('pears.png');

I = rgb2gray(rgb);

%Kenarlarý belirlenmiþ görüntü elde ediliyor. Fakat edge ile deðil bir
%filtre gibi çalýþtýrýlmaktadýr.
hy = fspecial('sobel');
hx = hy'; %%filtre matrisleri elde edildi
Iy = imfilter(double(I), hy, 'replicate');
Ix = imfilter(double(I), hx, 'replicate');
egim = sqrt(Ix.^2 + Iy.^2);

%Özellik noktasý olabilecek noktalar bulunur ve iþaretlenir.
L = watershed(egim);
Lrgb = label2rgb(L);

se = strel('disk', 20);
Io = imopen(I, se);

%görüntüyü aþýndýrma iþlemi
Ie = imerode(I, se);
% imreconstruct, Ýkili veya gri tonlu resmi yeniden yapýlandýrmak için kullanýlýr.
Iobr = imreconstruct(Ie, I);

%Kapama iþlemi
Ioc = imclose(Io, se);

%yayma iþlemi
Iobrd = imdilate(Iobr, se);
Iobrcbr = imreconstruct(imcomplement(Iobrd), imcomplement(Iobr));
Iobrcbr = imcomplement(Iobrcbr);

%Ýkili veya gri tondaki resimde bölgesel maksimum noktalarý bulur buralar 1 olup diðer yerleri sýfýrlar.
fgm = imregionalmax(Iobrcbr);

I2 = I;
I2(fgm) = 255;

se2 = strel(ones(5,5));
fgm2 = imclose(fgm, se2);
fgm3 = imerode(fgm2, se2);

%beareaopen ile 20 pixelden daha az sayýda pixele sahip olan nesneler kaldýrýlýyor.
fgm4 = bwareaopen(fgm3, 20);
I3 = I;
I3(fgm4) = 255;

bw = im2bw(Iobrcbr, graythresh(Iobrcbr));

%Binary görüntü üzerindeki nesneler arasýndaki mesafeler
D = bwdist(bw);
DL = watershed(D);
bgm = DL == 0;

%Modifiye edilmiþ görüntüde watershed bölgeleri arasýnda minimum olanlarý
%bulur
egim2 = imimposemin(egim, bgm | fgm4);
L = watershed(egim2);

I4 = I;
I4(imdilate(L == 0, ones(3, 3)) | bgm | fgm4) = 255;

Lrgb = label2rgb(L, 'jet', 'w', 'shuffle');


subplot(3,5,1);imshow(I); title('Orjinal Görüntü');
subplot(3,5,2);imshow(egim,[]); title('Eðime göre kenarlarý elde edilmiþ görüntü');
subplot(3,5,3);imshow(Lrgb); title('Watershed transform');
subplot(3,5,4);imshow(Io); title('Görüntüyü açma iþlemi');
subplot(3,5,5);imshow(Iobr); title('yeniden inþa edilmiþ görüntü');
subplot(3,5,6);imshow(Ioc); title('Kapalý görüntü');
subplot(3,5,7);imshow(Iobrcbr); title('Yayýlmýþ görüntünün yeniden inþa edilmesi');
subplot(3,5,8);imshow(fgm); title('Maksimum olan noktalar');
subplot(3,5,9);imshow(I2); title('Regional maxima superimposed on original image (I2)');
subplot(3,5,10);imshow(I3);title('Modifiye edilmiþ görüntü');
subplot(3,5,11);imshow(bw); title('Yayýlmýþ görüntünün binary hali');
subplot(3,5,12);imshow(bgm); title('Watershed çizgileri');
subplot(3,5,13);imshow(I4);title('Etrafý çizilmiþ objeler');
subplot(3,5,14);imshow(Lrgb);title('Renklendirilmiþ watershed matrisi');


