imgRGB = imread('peppers.png');
imgR= imgRGB(:,:,1);%RED
imgG= imgRGB(:,:,2);%GREEN
imgB= imgRGB(:,:,3);%BLUE
figure;
subplot(2,2,1),imshow(imgRGB), title ('RGB görüntü');
subplot(2,2,2),imhist(imgR), title ('RED Histogram');
subplot(2,2,3),imhist(imgG), title ('GREEN Histogram');
subplot(2,2,4),imhist(imgB), title ('BLUE Histogram'); 