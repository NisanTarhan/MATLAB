clc;
clear;
A = imread('cameraman.tif');
B = imrotate(A,5,'bicubic','crop');
hassasiyet=188;
[m n] = size(A);
for i=1:m
    for j=1:n
      fark = abs(A(i,j) - B(i,j));
      if (fark >= hassasiyet)
          C(i,j)=1;
      else
          C(i,j)=0;
      end
    end
end
imshow(C);


imshow(C)