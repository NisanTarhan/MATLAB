clc;
clear all;
I=imread('bozukparalar2.jpg'); 
I1=rgb2gray(I);
I2 = im2bw(I1, graythresh(I1));
bw1=imcomplement(I2);
bw2=imfill(bw1,'holes');
SE=strel('disk',5); 
bw3=imerode(bw2,SE);
bw4 = bwareaopen(bw3,30);
cevre=bwperim(bw4);
[i,j]=find(cevre);                     
subplot(2,3,1), imshow(I)
subplot(2,3,2), imshow(bw1);   
subplot(2,3,3),imshow(bw2);  
subplot(2,3,4), imshow(bw3);
subplot(2,3,5), imshow(bw4); hold on; plot(j,i,'b.'); % b blue 
subplot(2,3,6), imshow(I); hold on; plot(j,i,'r.'); % r red 


