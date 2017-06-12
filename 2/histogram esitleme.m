pout = imread('pout.tif');
tire = imread('tire.tif');
[X map] = imread('shadow.tif');
shadow = ind2rgb(X,map); % convert to truecolor
width = 210;
images = {pout, tire, shadow};

for k = 1:3
  dim = size(images{k});
  images{k} = imresize(images{k},[width*dim(1)/dim(2) width],'bicubic');
end

pout = images{1};
tire = images{2};
shadow = images{3};
pout_imadjust = imadjust(pout);
pout_histeq = histeq(pout);
pout_adapthisteq = adapthisteq(pout);

imshow(pout);
title('Original');

figure, imshow(pout_imadjust);
title('Imadjust');
figure, imshow(pout_histeq);
title('Histeq');

figure, imshow(pout_adapthisteq);
title('Adapthisteq');
tire_imadjust = imadjust(tire);
tire_histeq = histeq(tire);
tire_adapthisteq = adapthisteq(tire);

figure, imshow(tire);
title('Original');

figure, imshow(tire_imadjust);
title('Imadjust');
figure, imshow(tire_histeq);
title('Histeq');

figure, imshow(tire_adapthisteq);
title('Adapthisteq');
figure, imhist(pout), title('pout.tif');
figure, imhist(tire), title('tire.tif');