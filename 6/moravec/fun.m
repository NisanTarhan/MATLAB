function y=fun(x)
[m_index,n_index]=size(x);
for i=1:n_index
    temp=x(:,i);
    y(:,i)=temp>=max(temp);
end