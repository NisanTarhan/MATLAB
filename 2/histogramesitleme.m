I = imread('tire.tif');
J = histeq(I);
figure;
subplot(2,2,1),imshow(I), title ('Orjinal Görüntü');
subplot(2,2,2),imhist(I), title ('Histogram');
subplot(2,2,3),imshow(J), title ('Eþitlenmiþ Görüntü');
subplot(2,2,4),imhist(J), title ('Histogram'); 