I = imread('circuit.tif');
imshow(I);
BW1 = edge(I,'roberts');
figure, imshow(BW1);
