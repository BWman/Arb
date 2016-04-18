function ret=feature_percentage(s)
%计算下分位数
n=size(s,1);
WindowSize=60;
s=[s(1:WindowSize);s];
for i=1:n
    t=s(i+1:i+WindowSize-1);
    t2=t(~isnan(t));
    u=s(i+WindowSize);
    t3=(t2>u);
    t3=t3(~isnan(t3));
    t3=t3(t3>0);
    ret(i)=size(t3,1)/size(t2,1);
end
for i=1:WindowSize
    ret(i)=NaN;
end
ret=ret';
