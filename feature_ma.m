function ret=feature_ma(s,w)
n=size(s,1);
WindowSize=w;
s=[s(1:WindowSize);s];
for i=1:n
    t=s(i:i+WindowSize);
    ret(i)=mean(t(~isnan(t)));
end
ret=ret';
