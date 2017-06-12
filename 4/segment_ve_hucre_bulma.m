%segmentasyon yardýmý ile hücreyi bulma
clc;
clear;
I = imread('cell.tif');


[~, threshold] = edge(I, 'sobel');
etki_faktoru = .5;
kenar = edge(I,'sobel', threshold * etki_faktoru);
%küçük noktalar için yayma iþlemi uygulandý
se90 = strel('line', 3, 90); %3x3 matris ve 90 derece ile yay
se0 = strel('line', 3, 0);
yayilmisgoruntu = imdilate(kenar, [se90 se0]);

%boþ bölgelerin içi dolduruluyor
dolugoruntu = imfill(yayilmisgoruntu, 'holes');

%imclearborder resmin sýnýrlarýna dokunan bileþenleri yok eder
siniryoket = imclearborder(dolugoruntu, 4);

%Aþýndýrma iþlemi 
seD = strel('diamond',1);
finalresmi = imerode(siniryoket,seD);
BWfinal = imerode(finalresmi,seD);

%Kenarlar çizilir. bwperim binary bir görüntüdeki nesnelerin çevrelerini
%bulur
DisBolge = bwperim(BWfinal);
Segment = I;
Segment(DisBolge) = 255;

subplot(3,3,2); imshow(I), title('orjinal görüntü');
subplot(3,3,4); imshow(kenar), title('binary kenar görüntüsü');
subplot(3,3,5); imshow(yayilmisgoruntu), title('Yayýlmýþ Görüntü');
subplot(3,3,6); imshow(dolugoruntu); title('içi dolu görüntü');
subplot(3,3,7); imshow(siniryoket), title('Kenarlarý temizlenmiþ görüntü');
subplot(3,3,8); imshow(BWfinal), title('Segmentlenmiþ Görüntü');
subplot(3,3,9); imshow(Segment), title('Dýþý çizilmiþ orjinal görüntü');