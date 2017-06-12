clc;
clear all;
I=rgb2gray(imread('bozukparalar2.jpg')); 
I2 = im2bw(I, graythresh(I));
bw=imcomplement(I2);
bw2=imfill(bw,'holes');%Resimde �ukur diye nitelendirilen yerleri dolduruyoruz.
se=strel('disk',11); 
bw3=imerode(bw2,se); %g�r�nt� ��nd�r�ld�
bw4 = bwareaopen(bw3,30);%30px den daha az say�da olan nesneler kald�r�l�yor. 
[B,L] = bwboundaries(bw4);  % length(B) ile para adetini ogrendik ve etiket atadik
sayi = length(B);

%tutar� hesaplama i�lemi
stats = regionprops(bw4, 'Area','Centroid');
 toplam = 0;
    for n=1:length(B)
        a=stats(n).Area;  % Her paran�n alan�n� ��rendik. Boyutlara g�re hesaplama yapt�k. 
        centroid=stats(n).Centroid;
            if a> 2435
                 toplam = toplam + 1;
            elseif a >2300 &&  a < 2430
                toplam = toplam + 0.5;
            elseif a >1500 &&  a < 1750
                toplam = toplam + 0.25;
            elseif a > 1250 &&  a < 1300
                toplam = toplam + 0.10;
            elseif a > 900 &&  a < 999
                 toplam = toplam + 0.05;
            else 
                 toplam = toplam + 0.01;              
        end
    end
    
subplot(3,3,2); imshow(I); title('Orjinal G�r�nt�');
subplot(3,3,4); imshow(I2); title('Binary G�r�nt�');
subplot(3,3,5); imshow(bw); title('Binary g�r�nt� komplementi');
subplot(3,3,6); imshow(bw2); title('��i doldurulmu� g�r�nt�');
subplot(3,3,7); imshow(bw3); title('A��nd�r�lm�� G�r�nt�');
subplot(3,3,8); imshow(bw4); title('Temizlenmi� G�r�nt�');
subplot(3,3,9); imshow(bw4); title(['Bulunan Nesne Say�s� = ',num2str(sayi)]);