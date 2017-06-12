clc;
clear all;
I=rgb2gray(imread('bozukparalar.jpg')); 
I2 = im2bw(I, graythresh(I));
bw=imcomplement(I2);
bw2=imfill(bw,'holes');%Resimde çukur diye nitelendirilen yerleri dolduruyoruz.
se=strel('disk',11); 
bw3=imerode(bw2,se); %görüntü þýndýrýldý
bw4 = bwareaopen(bw3,30);%30px den daha az sayýda olan nesneler kaldýrýlýyor. 
[B,L] = bwboundaries(bw4);  % length(B) ile para adetini ogrendik ve etiket atadik
sayi = length(B);

subplot(3,3,2); imshow(I); title('Orjinal Görüntü');
subplot(3,3,4); imshow(I2); title('Binary Görüntü');
subplot(3,3,5); imshow(bw); title('Binary görüntü komplementi');
subplot(3,3,6); imshow(bw2); title('Ýçi doldurulmuþ görüntü');
subplot(3,3,7); imshow(bw3); title('Aþýndýrýlmýþ Görüntü');
subplot(3,3,8); imshow(bw4); title('Temizlenmiþ Görüntü');
subplot(3,3,9); imshow(bw4); title(['Bulunan Nesne Sayýsý = ',num2str(sayi)]);