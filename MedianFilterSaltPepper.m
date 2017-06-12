I = imread('eight.tif');
J = imnoise(I,'salt & pepper',0.02);
L = medfilt2(J,[3 3]);
h=figure;
subplot(1,3,1),imshow(I),title('Orjinal Görüntü');
subplot(1,3,2),imshow(J),title('Gürültülü Görüntü');
subplot(1,3,3),imshow(L),title('Filtreli Görüntü');
