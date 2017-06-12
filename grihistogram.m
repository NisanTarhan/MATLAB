I = imread('peppers.png');
I2=rgb2gray(I);
h=figure;
subplot(1,2,1),imshow(I2),title('Orjinal Görüntü');
subplot(1,2,2),imhist(I2),title('Görüntü Histogramý');
