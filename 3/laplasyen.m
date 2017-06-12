     ResimOrjinal=imread('eight.tif');
     LaplaceFiltresi=fspecial('laplacian');
     ResimOrjinal=im2double(ResimOrjinal);
     laplaceFiltresi=imfilter(ResimOrjinal, LaplaceFiltresi,'replicate');
     imshow(ResimOrjinal);
     title('Orjinal Resim');
     figure;imshow(laplaceFiltresi);
     title('Laplace Filtresi');
