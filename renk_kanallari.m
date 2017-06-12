clear all;

im=imread('peppers.png');
im_red = im;
im_green = im;
im_blue = im;

% Red 
im_red(:,:,2) = 0; 
im_red(:,:,3) = 0; 
figure, imshow(im_red);

% Green
im_green(:,:,1) = 0; 
im_green(:,:,3) = 0; 
figure, imshow(im_green);

% Blue
im_blue(:,:,1) = 0; 
im_blue(:,:,2) = 0; 
figure, imshow(im_blue);