function ret=feature_volatility(s)
n=size(s,1);
s=[s(1:240);s];
for i=1:n
    t=s(i:i+240);
    ret(i)=std(t(~isnan(t)));
end
ret=ret';

