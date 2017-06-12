resimdata = imread('peppers.png');
Red = resimdata(:,:,1);
Green = resimdata(:,:,2);
Blue = resimdata(:,:,3);
yeni_resim = cat(3,Red,Green,Blue);
isequal(resimdata,yeni_resim);
imshow(yeni_resim); 