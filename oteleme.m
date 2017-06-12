%Öteleme
%Þekil oluþturuluyor
S=[1 -1 -1 1; 1 1 -1 -1; 1 1 1 1]
x=S(1,:); y=S(2,:);
subplot(1,2,1)
patch(x,y,'r')
grid on
axis([-2 2 -2 2])
title('Orjinal Görüntü');
%Öteleme
T_tr=[1 0 0.5; 0 1 0.5; 0 0 1];
M=T_tr*S; 
subplot(1,2,2)
patch(M(1,:),M(2,:),'r')
grid on
axis([-2 2 -2 2]); 
title('Ötelenmiþ Görüntü');
