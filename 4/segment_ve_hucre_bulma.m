%segmentasyon yard�m� ile h�creyi bulma
clc;
clear;
I = imread('cell.tif');


[~, threshold] = edge(I, 'sobel');
etki_faktoru = .5;
kenar = edge(I,'sobel', threshold * etki_faktoru);
%k���k noktalar i�in yayma i�lemi uyguland�
se90 = strel('line', 3, 90); %3x3 matris ve 90 derece ile yay
se0 = strel('line', 3, 0);
yayilmisgoruntu = imdilate(kenar, [se90 se0]);

%bo� b�lgelerin i�i dolduruluyor
dolugoruntu = imfill(yayilmisgoruntu, 'holes');

%imclearborder resmin s�n�rlar�na dokunan bile�enleri yok eder
siniryoket = imclearborder(dolugoruntu, 4);

%A��nd�rma i�lemi 
seD = strel('diamond',1);
finalresmi = imerode(siniryoket,seD);
BWfinal = imerode(finalresmi,seD);

%Kenarlar �izilir. bwperim binary bir g�r�nt�deki nesnelerin �evrelerini
%bulur
DisBolge = bwperim(BWfinal);
Segment = I;
Segment(DisBolge) = 255;

subplot(3,3,2); imshow(I), title('orjinal g�r�nt�');
subplot(3,3,4); imshow(kenar), title('binary kenar g�r�nt�s�');
subplot(3,3,5); imshow(yayilmisgoruntu), title('Yay�lm�� G�r�nt�');
subplot(3,3,6); imshow(dolugoruntu); title('i�i dolu g�r�nt�');
subplot(3,3,7); imshow(siniryoket), title('Kenarlar� temizlenmi� g�r�nt�');
subplot(3,3,8); imshow(BWfinal), title('Segmentlenmi� G�r�nt�');
subplot(3,3,9); imshow(Segment), title('D��� �izilmi� orjinal g�r�nt�');