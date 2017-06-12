I= imread('peppers.png');
I2= imnoise(I,'salt & pepper',0.5);
h=figure;
subplot(1,2,1),imshow(I),title('Orjinal Görüntü');
subplot(1,2,2),imshow(I2),title('Gürültülü Görüntü');
