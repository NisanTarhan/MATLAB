%Döndürme
%Þekil oluþturuluyor
S=[1 -1 -1 1; 1 1 -1 -1; 1 1 1 1]
x=S(1,:); y=S(2,:);
subplot(1,2,1)
patch(x,y,'r')
grid on
axis([-2 2 -2 2])
title('Orjinal Görüntü');
%Döndürme
theta=pi./4; 
T_R=[cos(theta) sin(theta) 0; -sin(theta) cos(theta) 0; 0 0 1]
M=T_R*S; 
subplot(1,2,2)
patch(M(1,:),M(2,:),'r')
grid on
axis([-2 2 -2 2]);
title('45 Derece Döndürme');
