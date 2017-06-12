I = imread('circuit.tif');
BW1 = edge(I,'prewitt');
imshow(I);
figure, imshow(BW1)