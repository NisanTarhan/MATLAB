I = imread('circuit.tif');
imshow(I);
BW1 = edge(I,'sobel');
figure, imshow(BW1);
