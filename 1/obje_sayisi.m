clear;
clc;
I = imread('rice.png');
BW = im2bw(I, graythresh(I));
B = bwboundaries(BW);
figure; imshow(BW);
text(10,10,strcat('\color{red}bulunan sýnýrlar:',num2str(length(B))))
hold on;
for k = 1:length(B)
    boundary = B{k};
    plot(boundary(:,2), boundary(:,1), 'g', 'LineWidth', 1)
end