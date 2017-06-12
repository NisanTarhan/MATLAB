%Siyah beyaza manuel �evirilmi� g�r�nt�de
clc;
clear;
I = imread('cameraman.tif'); 
% Cameraman.tif resim matrisi I de�i�kenine kaydedilir.
C = size(I); % Resim boyutlar� C de�i�kenine yaz�l�r. [x,y]
for x = 1:C(1) % Yatayda t�m pikseller.
	for y = 1:C(2) % Dikeyde t�m pikseller.
	if(I(x,y)<= 128)
% E�er piksel de�eri 128'den k���k ise, 
% Siyah beyaz yapma i�lemi
	I(x,y)=0; % Piksel de�erini 0 yap�l�r.
	else
	I(x,y)=255; % De�ilse 255 yap�l�r.
	end
end
end
C = corner(I,'Harris'); 
% Harris Cornermethodu uygulanarak k��eler bulunur.
figure(),imshow(I);
hold on; plot(C(:,1), C(:,2), 'r*'); 
% K��eler k�rm�z� olarak �izdirilir.
