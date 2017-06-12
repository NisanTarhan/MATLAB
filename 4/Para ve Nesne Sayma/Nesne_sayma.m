clc;
clear all;
I=imread('circles.png'); 

%bw=imfill(I,'holes');%Resimde �ukur diye nitelendirilen yerleri dolduruyoruz.
%bw = bwareaopen(I,30);%30px den daha az say�da olan nesneler kald�r�l�yor. 

se=strel('disk',13); 
bw2=imerode(I,se);

[B,L] = bwboundaries(bw2);  % length(B) ile para adetini ogrendik ve etiket atadik
sayi = length(B);
subplot(1,2,1); imshow(I); title('Orjinal G�r�nt�');
subplot(1,2,2); imshow(bw2); title(['Bulunan Nesne Say�s� = ',num2str(sayi)]);