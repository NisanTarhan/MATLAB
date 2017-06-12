% Mean/Average Filtresi
I=imread('zebra.jpg'); 
I=im2double(I); 
%3x3l�k maske olu�turuluyor
Maske=fspecial('average',3); 
%Average filtresi uygulan�yor
Filtre=imfilter(I,Maske,'replicate');
figure; 
subplot(1,2,1); imshow(I); title('Orjinal G�r�nt�');
subplot(1,2,2);imshow(Filtre,[]);title('Filtreli G�r�nt�');