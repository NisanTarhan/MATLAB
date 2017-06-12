clc;
clear;
I = imread('circuit.tif'); % Devre resmi I deðiþkenine kaydedilir. Siyah beyaz resim.
imshow(I); % I resmi gösterilir.
BW1 = edge(I,'prewitt'); 
% Prewitt yöntemiyle kenarlar bulunur.
figure(),imshow(BW1); % Bulunan kenarlar gösterilir.
C = corner(BW1,'Harris'); % Elde edilen kenarlardan Harris Corner yöntemiyle köþeler bulunur.
figure(),imshow(BW1); % Bulunan köþeler gösterilir.
hold on; plot(C(:,1), C(:,2), 'r*'); 
% Köþeleri kýrmýzý olarak çizdirir.
C1 = corner(I,'Harris'); 
% Orjinal resimde iþlem yapýlmadan bulunan köþeler.
figure(),imshow(I); % Orjinal resmi gösterir.
hold on; plot(C1(:,1), C1(:,2), 'g*'); 
% Köþeleri yeþil olarak çizer. Orjinal resimde iþlem yapýlmadan bulunan köþeleri gösterir.
