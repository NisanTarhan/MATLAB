Resim_rgb=imread('agac.jpg');   %RGB resim okunuyor
Resim_red = Resim_rgb(:,:,1);   %Red kanalý
Resim_green = Resim_rgb(:,:,2); %Green kanalý
Resim_blue = Resim_rgb(:,:,3); %Blue kanalý

%red
xr = double(Resim_red);  
mr = mean(xr(:));  
sr = std(xr(:));
xr = (xr - mr) / sr;   %Red kanalýn normalizasyonu

%green
xg = double(Resim_green);  
mg = mean(xg(:));  
sg = std(xg(:));
xg = (xg - mg) / sg;   %Green kanalýn normalizasyonu

%blue
xb = double(Resim_blue);  
mb = mean(xb(:));  
sb = std(xb(:));
xb = (xb - mb) / sb;   %Blue kanalýn normalizasyonu

norm(:,:,1) = xr(:,:);
norm(:,:,2) = xg(:,:);
norm(:,:,3) = xb(:,:);

h=figure;
subplot(1,2,1),imshow(Resim_rgb),title('Orjinal Görüntü');
subplot(1,2,2),imshow(norm),title('Normalize RGB');