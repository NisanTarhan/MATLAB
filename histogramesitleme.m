I = imread('tire.tif');
J = histeq(I);
figure;
subplot(2,2,1),imshow(I), title ('Orjinal G�r�nt�');
subplot(2,2,2),imhist(I), title ('Histogram');
subplot(2,2,3),imshow(J), title ('E�itlenmi� G�r�nt�');
subplot(2,2,4),imhist(J), title ('Histogram'); 