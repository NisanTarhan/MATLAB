function y=diff_moravec(x,n) 
x=double(x);
[m_index,n_index]=size(x);
if(n==3)
for(i=1:n_index)
    temp=x(:,i);
    v1=(temp(5)-temp(2))^2+(temp(5)-temp(8))^2;
    v2=(temp(5)-temp(4))^2+(temp(5)-temp(6))^2;
    v3=(temp(5)-temp(1))^2+(temp(5)-temp(9))^2;
    v4=(temp(5)-temp(3))^2+(temp(5)-temp(7))^2;
    y(i)=min([v1,v2,v3,v4]);
end
elseif(n==5)
    for(i=1:n_index)
        temp=x(:,i);
        v1=(temp(13)-temp(1))^2+(temp(13)-temp(7))^2+(temp(13)-temp(19))^2+(temp(13)-temp(25))^2;
        v2=(temp(13)-temp(3))^2+(temp(13)-temp(8))^2+(temp(13)-temp(18))^2+(temp(13)-temp(23))^2;
        v3=(temp(13)-temp(11))^2+(temp(13)-temp(12))^2+(temp(13)-temp(14))^2+(temp(13)-temp(15))^2;
        v4=(temp(13)-temp(5))^2+(temp(13)-temp(9))^2+(temp(13)-temp(17))^2+(temp(13)-temp(21))^2;
        y(i)=min([v1,v2,v3,v4]);
    end
end



    
    
