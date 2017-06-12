originalImage = imread('peppers.png');
 
%show original image
figure;
imshow(originalImage)
title('Original Image');
 
contrastImage = imadjust(originalImage, [0 0.8], [0 1]);
 
%show contrast image
figure;
imshow(contrastImage)
title('Contrast Image');