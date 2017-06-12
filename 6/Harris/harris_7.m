%Siyah beyaza manuel çevirilmiþ görüntüde
clc;
clear;
I = imread('cameraman.tif'); 
% Cameraman.tif resim matrisi I deðiþkenine kaydedilir.
C = size(I); % Resim boyutlarý C deðiþkenine yazýlýr. [x,y]
for x = 1:C(1) % Yatayda tüm pikseller.
	for y = 1:C(2) % Dikeyde tüm pikseller.
	if(I(x,y)<= 128)
% Eðer piksel deðeri 128'den küçük ise, 
% Siyah beyaz yapma iþlemi
	I(x,y)=0; % Piksel deðerini 0 yapýlýr.
	else
	I(x,y)=255; % Deðilse 255 yapýlýr.
	end
end
end
C = corner(I,'Harris'); 
% Harris Cornermethodu uygulanarak köþeler bulunur.
figure(),imshow(I);
hold on; plot(C(:,1), C(:,2), 'r*'); 
% Köþeler kýrmýzý olarak çizdirilir.
