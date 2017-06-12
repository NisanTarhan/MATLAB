S=[1 -1 -1 1; 1 1 -1 -1; 1 1 1 1]
x=S(1,:); y=S(2,:);
subplot(2,3,1)
patch(x,y,'r')
grid on
axis([-2 2 -2 2])
title('Orjinal');
 
%�teleme
T_tr=[1 0 0.5; 0 1 0.5; 0 0 1];
M=T_tr*S; 
subplot(2,3,2)
patch(M(1,:),M(2,:),'r')
grid on
axis([-2 2 -2 2]); 
title('�teleme');
 
%�l�ekleme
T_sc=0.5.*eye(3); 
M=T_sc*S; 
subplot(2,3,3)
patch(M(1,:),M(2,:),'r')
grid on
axis([-2 2 -2 2]);
title('�l�ekleme');
 
%D�nd�rme
theta=pi./4; 
T_R=[cos(theta) sin(theta) 0; -sin(theta) cos(theta) 0; 0 0 1]
M=T_R*S; 
subplot(2,3,4)
patch(M(1,:),M(2,:),'r')
grid on
axis([-2 2 -2 2]);
title('D�nd�rme');
 
%X Y�n�nde B�kme
T_sh=[1 0.5 0; 0 1 0; 0 0 1]
M=T_sh*S; 
subplot(2,3,5)
patch(M(1,:),M(2,:),'r')
grid on
axis([-2 2 -2 2]);
title('X Y�n�nde B�kme')
 
%Y Y�n�nde B�kme
T_sh=[1 0 0; 0.5 1 0; 0 0 1]
M=T_sh*S; 
subplot(2,3,6)
patch(M(1,:),M(2,:),'r')
grid on
axis([-2 2 -2 2]);
title('X Y�n�nde B�kme')
