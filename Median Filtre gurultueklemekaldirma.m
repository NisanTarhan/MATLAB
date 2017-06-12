A=imread('peppers.png');
B=rgb2gray(A);
siyah=3;
beyaz=253;
%Adjust the values in 'black' and 'white' to increase the noise.
gurultulu_resim = B;
    RandomMatris = randint(size(B,1),size(B,2),[0,255]);
    gurultulu_resim(RandomMatris <= siyah) = 0;
    gurultulu_resim(RandomMatris >= beyaz) = 255;
    RandomResim=medfilt2(gurultulu_resim);
    figure,subplot(1,3,1),imshow(A),title('Orjinal Görüntü');
    subplot(1,3,2),imshow(gurultulu_resim),title('Gürültülü Görüntü');
    subplot(1,3,3),imshow(RandomResim),title('Filtrelenmiþ Görüntü');