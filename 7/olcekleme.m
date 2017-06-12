%�l�ekleme
%�ekil olu�turuluyor
S=[1 -1 -1 1; 1 1 -1 -1; 1 1 1 1]
x=S(1,:); y=S(2,:);
subplot(2,2,1)
patch(x,y,'r')
grid on
axis([-2 2 -2 2])
title('Orjinal g�r�nt�');
 
%�l�ekleme
T_sc=0.5.*eye(3); 
M=T_sc*S; 
subplot(2,2,2)
patch(M(1,:),M(2,:),'r')
grid on
axis([-2 2 -2 2]);
title('�l�eklenmi� g�r�nt�');
