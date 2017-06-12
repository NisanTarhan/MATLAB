ResimOrjinal=imread('eight.tif');
imshow(ResimOrjinal);
title('Resmin Orjinal Hali');
cannyFiltresi=edge(ResimOrjinal,'canny');
figure;imshow(cannyFiltresi);
title('Canny Filtresi');
