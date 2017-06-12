clc;
clear;
I = imread('peppers.png'); % Biberler resmi matrisi I deðiþkenine kaydedilir.
%I1 = imread('cameraman.tif'); % Cameraman.tif resim matrisi I1 deðiþkenine kaydedilir.
R = I(:,:,1); % Red Katmaný
G = I(:,:,2); % Green Katmaný
B = I(:,:,3); % Blue Katmaný
C1 = corner(R,'Harris'); % Kýrmýzý katmanda köþelerin bulunmasý
C2 = corner(G,'Harris'); % Yeþil katmanda köþelerin bulunmasý
C3 = corner(B,'Harris'); % Mavi katmanda köþelerin bulunmasý

subplot(1,3,1),imshow(R); % Resmi görüntüleme
hold on; 
plot(C1(:,1), C1(:,2), 'r*'); % Köþeleri kýrmýzý olarak gösterir.
subplot(1,3,2),imshow(G); % Resmi görüntüleme
hold on; 
plot(C2(:,1), C2(:,2), 'g*'); % Köþeleri yeþil olarak gösterir.
subplot(1,3,3),imshow(B); % Resmi görüntüleme
hold on; plot(C3(:,1), C3(:,2), 'b*'); % Köþeleri mavi olarak gösterir.
