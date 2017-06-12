clc;    
clear;
    
I1 = imread('cameraman.tif');
%Eðer hücre boyutu dýþarýdan verilirse aþaðýdaki gibi kullanýlýr.
%32x32 boyut için 256/32 = 8 erli gurup olarak segmentlere ayrýlýr.
[hog1, visualization] = extractHOGFeatures(I1,'CellSize',[32 32]);
subplot(1,2,1); imshow(I1);
subplot(1,2,2); plot(visualization);