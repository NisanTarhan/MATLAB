clc;
clear;
close all;
resim=imread('sample1.png');
bw=im2bw(resim);
CENTER=regionprops(bw,'Centroid');
figure,imshow(bw);
for n=1:length(CENTER)
    POS = CENTER(n).Centroid;
    text(POS(1),POS(2),num2str(n),'fontsize', 14, ...
        'fontweight', 'b', 'color', [1 0 0])
    pause(1)
end

bbox = regionprops(bw, 'BoundingBox');
L = length(bbox);
RL = sqrt(L);
RL = ceil(RL);
figure
for m = 1:length(bbox)
   BND = bbox(m).BoundingBox;
   BND = round(BND);
   NP{m} = bw(BND(2):BND(2)+BND(4), ...
       BND(1): BND(1)+ BND(3));
   subplot(RL,RL,m)
   imshow(NP{m})
   title(['Nesne: ' num2str(m)])
   pause(1);
end