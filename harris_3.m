clc;
clear;
I = imread('peppers.png'); % Biberler resmi matrisi I de�i�kenine kaydedilir.
%I1 = imread('cameraman.tif'); % Cameraman.tif resim matrisi I1 de�i�kenine kaydedilir.
R = I(:,:,1); % Red Katman�
G = I(:,:,2); % Green Katman�
B = I(:,:,3); % Blue Katman�
C1 = corner(R,'Harris'); % K�rm�z� katmanda k��elerin bulunmas�
C2 = corner(G,'Harris'); % Ye�il katmanda k��elerin bulunmas�
C3 = corner(B,'Harris'); % Mavi katmanda k��elerin bulunmas�

subplot(1,3,1),imshow(R); % Resmi g�r�nt�leme
hold on; 
plot(C1(:,1), C1(:,2), 'r*'); % K��eleri k�rm�z� olarak g�sterir.
subplot(1,3,2),imshow(G); % Resmi g�r�nt�leme
hold on; 
plot(C2(:,1), C2(:,2), 'g*'); % K��eleri ye�il olarak g�sterir.
subplot(1,3,3),imshow(B); % Resmi g�r�nt�leme
hold on; plot(C3(:,1), C3(:,2), 'b*'); % K��eleri mavi olarak g�sterir.
