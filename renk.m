I = imread('peppers.png');
%Red 
R = I(:,:,1);
image(R), colormap([[0:1/255:1]', zeros(256,1), zeros(256,1)]), colorbar;

%Green 
G = I(:,:,2);
figure;
image(G), colormap([zeros(256,1),[0:1/255:1]', zeros(256,1)]), colorbar;

%Blue 
B = I(:,:,3);
figure;
image(B), colormap([zeros(256,1), zeros(256,1), [0:1/255:1]']), colorbar;