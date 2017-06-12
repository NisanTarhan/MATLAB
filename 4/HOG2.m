clc;    
clear;
    
I1 = imread('cameraman.tif');
%E�er h�cre boyutu d��ar�dan verilirse a�a��daki gibi kullan�l�r.
%32x32 boyut i�in 256/32 = 8 erli gurup olarak segmentlere ayr�l�r.
[hog1, visualization] = extractHOGFeatures(I1,'CellSize',[32 32]);
subplot(1,2,1); imshow(I1);
subplot(1,2,2); plot(visualization);