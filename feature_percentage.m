function ret=feature_percentage(s,WindowSize)
%�����·�λ��
n=size(s,1);
s=[s(1:WindowSize);s];
for i=1:n
    t=s(i:i+WindowSize-1);
    ret(i)=sum(t>s(WindowSize+i))/WindowSize;
end

ret=ret';
