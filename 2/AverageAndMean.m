% Mean/Average Filtresi
I=imread('zebra.jpg'); 
I=im2double(I); 
%3x3lük maske oluþturuluyor
Maske=fspecial('average',3); 
%Average filtresi uygulanýyor
Filtre=imfilter(I,Maske,'replicate');
figure; 
subplot(1,2,1); imshow(I); title('Orjinal Görüntü');
subplot(1,2,2);imshow(Filtre,[]);title('Filtreli Görüntü');