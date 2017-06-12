clc;
clear;
close all;
resim=imread('sample1.png');
bw=im2bw(resim);
BOX=regionprops(bw,'BoundingBox');
imshow(resim);
hold on;
for m=1:length(BOX)
   F = BOX(m).BoundingBox;
   rectangle('Position',F,'EdgeColor','g','LineWidth',2);
end